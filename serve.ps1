$port = 8000
$localPath = Resolve-Path "c:\Users\Dell\OneDrive\Desktop\kvsinformation"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
try {
    $listener.Start()
    Write-Host "Server started successfully on http://localhost:$port/"
    Write-Host "Serving files from $localPath"
} catch {
    Write-Host "Error: Failed to start server. Port $port may already be in use."
    exit
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $req = $context.Request
        $res = $context.Response
        
        $urlPath = $req.Url.LocalPath
        if ($urlPath -eq "/") {
            $urlPath = "/index.html"
        }
        
        $filePath = Join-Path $localPath $urlPath
        if (Test-Path $filePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css" }
                ".js"   { "application/javascript" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".gif"  { "image/gif" }
                ".svg"  { "image/svg+xml" }
                ".json" { "application/json" }
                ".pdf"  { "application/pdf" }
                ".ico"  { "image/x-icon" }
                default { "application/octet-stream" }
            }
            
            $res.ContentType = $contentType
            $res.ContentLength64 = $bytes.Length
            $res.OutputStream.Write($bytes, 0, $bytes.Length)
            Write-Host "200: $urlPath"
        } else {
            $res.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $res.ContentType = "text/plain"
            $res.ContentLength64 = $errBytes.Length
            $res.OutputStream.Write($errBytes, 0, $errBytes.Length)
            Write-Host "404: $urlPath"
        }
        $res.Close()
    } catch {
        Write-Host "Request Error: $_"
    }
}
