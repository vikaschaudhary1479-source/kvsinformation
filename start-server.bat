@echo off
title EduVerse India Local Server
echo ==============================================
echo EduVerse India - Local Server Launcher
echo ==============================================
echo.

:: Check for Python
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [+] Python detected.
    echo [!] Launching server at http://localhost:8000...
    start http://localhost:8000
    python -m http.server 8000
    goto end
)

:: Check for Py launcher
py --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [+] Python Launcher (py) detected.
    echo [!] Launching server at http://localhost:8000...
    start http://localhost:8000
    py -m http.server 8000
    goto end
)

:: Check for Node.js
node -v >nul 2>&1
if %errorlevel% equ 0 (
    echo [+] Node.js detected.
    echo [!] Launching http-server at http://localhost:8080...
    start http://localhost:8080
    npx http-server -p 8080
    goto end
)

:: Fallback to Native PowerShell HttpListener (requires no installations)
echo [-] No Python or Node.js detected on this machine.
echo [!] Launching native PowerShell web server at http://localhost:8000...
start http://localhost:8000

powershell -NoProfile -ExecutionPolicy Bypass -Command "^
    $listener = New-Object System.Net.HttpListener; ^
    $listener.Prefixes.Add('http://localhost:8000/'); ^
    try { ^
        $listener.Start(); ^
        Write-Host 'PowerShell Web Server started successfully!'; ^
        Write-Host 'Serving files from: ' $PWD; ^
        Write-Host 'Open http://localhost:8000/ in your browser.'; ^
        Write-Host 'Press Ctrl+C in this window to stop.'; ^
    } catch { ^
        Write-Error 'Failed to start. Check if port 8000 is already in use.'; ^
        exit; ^
    } ^
    while ($listener.IsListening) { ^
        $context = $listener.GetContext(); ^
        $req = $context.Request; ^
        $res = $context.Response; ^
        $urlPath = $req.Url.LocalPath; ^
        if ($urlPath -eq '/') { $urlPath = '/index.html' } ^
        $filePath = Join-Path $PWD $urlPath; ^
        if (Test-Path $filePath -PathType Leaf) { ^
            $bytes = [System.IO.File]::ReadAllBytes($filePath); ^
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower(); ^
            $contentType = switch ($ext) { ^
                '.html' { 'text/html; charset=utf-8' } ^
                '.css'  { 'text/css' } ^
                '.js'   { 'application/javascript' } ^
                '.png'  { 'image/png' } ^
                '.jpg'  { 'image/jpeg' } ^
                '.jpeg' { 'image/jpeg' } ^
                '.gif'  { 'image/gif' } ^
                '.svg'  { 'image/svg+xml' } ^
                '.json' { 'application/json' } ^
                default { 'application/octet-stream' } ^
            }; ^
            $res.ContentType = $contentType; ^
            $res.ContentLength64 = $bytes.Length; ^
            $res.OutputStream.Write($bytes, 0, $bytes.Length); ^
        } else { ^
            $res.StatusCode = 404; ^
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes('404 Not Found'); ^
            $res.ContentType = 'text/plain'; ^
            $res.ContentLength64 = $errBytes.Length; ^
            $res.OutputStream.Write($errBytes, 0, $errBytes.Length); ^
        } ^
        $res.Close(); ^
    }"

:end
pause
