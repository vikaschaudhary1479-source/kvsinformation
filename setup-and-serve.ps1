$port = 8000
$localPath = "c:\Users\Dell\OneDrive\Desktop\kvsinformation"
$jsonPath = Join-Path $localPath "json\resources.json"
$downloadsDir = Join-Path $localPath "downloads"

Write-Host "=============================================="
Write-Host "EduVerse India - Setup & Server"
Write-Host "=============================================="
Write-Host ""

# 1. Populate the resources database (native PowerShell JSON generation)
Write-Host "[1/2] Populating resources database..."

$richResources = @(
    # --- Class 10 CBSE ---
    [PSCustomObject]@{
        id = "c10-math-real"
        class = "10"
        subject = "Mathematics"
        chapter = "Real Numbers"
        type = "Notes"
        title = "Real Numbers Concept Notes"
        filename = "Class_10_Maths_Real_Numbers_Notes.pdf"
        size = "1.4 MB"
        pages = 8
        description = "Complete breakdown of Euclid's Division Lemma, Fundamental Theorem of Arithmetic, and irrationality proofs."
    },
    [PSCustomObject]@{
        id = "c10-math-poly-ws"
        class = "10"
        subject = "Mathematics"
        chapter = "Polynomials"
        type = "Worksheets"
        title = "Polynomials Practice Worksheet"
        filename = "Class_10_Maths_Polynomials_Worksheet.pdf"
        size = "850 KB"
        pages = 4
        description = "Class 10 maths practice worksheet covering relationships between zeroes and coefficients of quadratic polynomials."
    },
    [PSCustomObject]@{
        id = "c10-math-quad-prac"
        class = "10"
        subject = "Mathematics"
        chapter = "Quadratic Equations"
        type = "Notes"
        title = "Quadratic Equations Practice Set"
        filename = "Class_10_Maths_Quadratic_Equations_Practice.pdf"
        size = "1.1 MB"
        pages = 6
        description = "Important questions and solving methods for nature of roots and quadratic formula applications."
    },
    [PSCustomObject]@{
        id = "c10-math-trig-form"
        class = "10"
        subject = "Mathematics"
        chapter = "Introduction to Trigonometry"
        type = "Formula Sheets"
        title = "Trigonometry Quick Formula Sheet"
        filename = "Class_10_Maths_Trigonometry_Formulas.pdf"
        size = "500 KB"
        pages = 2
        description = "All trigonometric ratios, identities, and complementary angle formulas summarized."
    },
    [PSCustomObject]@{
        id = "c10-sci-chem"
        class = "10"
        subject = "Science"
        chapter = "Chemical Reactions and Equations"
        type = "Notes"
        title = "Chemical Reactions Revision Notes"
        filename = "Class_10_Science_Chemical_Reactions_Notes.pdf"
        size = "2.1 MB"
        pages = 12
        description = "Covers balancing chemical reactions, types of reactions (combination, decomposition, displacement), oxidation & reduction."
    },
    [PSCustomObject]@{
        id = "c10-sci-acid-ws"
        class = "10"
        subject = "Science"
        chapter = "Acids, Bases and Salts"
        type = "Worksheets"
        title = "Acids Bases & Salts Worksheet"
        filename = "Class_10_Science_Acids_Bases_Salts_Worksheet.pdf"
        size = "950 KB"
        pages = 5
        description = "Comprehensive practice questions on pH scale, chemical properties of acids/bases, and common salts."
    },
    [PSCustomObject]@{
        id = "c10-sci-electricity"
        class = "10"
        subject = "Science"
        chapter = "Electricity"
        type = "Formula Sheets"
        title = "Electricity Formulas & Summary"
        filename = "Class_10_Science_Electricity_Formulas.pdf"
        size = "720 KB"
        pages = 3
        description = "Ohm's Law, resistivity, series/parallel combinations, heating effect, and electric power summary."
    },
    [PSCustomObject]@{
        id = "c10-sst-nationalism"
        class = "10"
        subject = "Social Science"
        chapter = "Rise of Nationalism in Europe"
        type = "Notes"
        title = "Rise of Nationalism in Europe Notes"
        filename = "Class_10_SST_Nationalism_Europe_Notes.pdf"
        size = "1.9 MB"
        pages = 10
        description = "Chronological notes on French Revolution, unification of Italy/Germany, and rise of nationalism."
    },
    [PSCustomObject]@{
        id = "c10-sst-sectors-pyq"
        class = "10"
        subject = "Social Science"
        chapter = "Sectors of Indian Economy"
        type = "PYQs"
        title = "Sectors of Indian Economy Board PYQs"
        filename = "Class_10_SST_Sectors_Economy_PYQs.pdf"
        size = "1.3 MB"
        pages = 8
        description = "Compiled board exam previous year questions for Primary, Secondary, and Tertiary sectors."
    },
    [PSCustomObject]@{
        id = "c10-eng-letter"
        class = "10"
        subject = "English"
        chapter = "Writing Skills"
        type = "Notes"
        title = "Formal Letter Writing Format & Samples"
        filename = "Class_10_English_Letter_Writing.pdf"
        size = "600 KB"
        pages = 4
        description = "Letter to the Editor, Complaint Letters, and Inquiry Letters formatting with solved examples."
    },
    [PSCustomObject]@{
        id = "c10-math-pyq-2024"
        class = "10"
        subject = "Mathematics"
        chapter = "All Chapters"
        type = "CBSE Board Papers"
        title = "CBSE Class 10 Mathematics Standard Question Paper 2024"
        filename = "CBSE_Class_10_Maths_Standard_2024.pdf"
        size = "1.7 MB"
        pages = 16
        description = "Official question paper of the CBSE Class 10 Board exam held in March 2024."
    },
    [PSCustomObject]@{
        id = "c10-math-pyq-2023"
        class = "10"
        subject = "Mathematics"
        chapter = "All Chapters"
        type = "CBSE Board Papers"
        title = "CBSE Class 10 Mathematics Standard Question Paper 2023"
        filename = "CBSE_Class_10_Maths_Standard_2023.pdf"
        size = "1.6 MB"
        pages = 15
        description = "Official question paper of the CBSE Class 10 Board exam held in March 2023."
    },
    [PSCustomObject]@{
        id = "c10-sci-pyq-2024"
        class = "10"
        subject = "Science"
        chapter = "All Chapters"
        type = "CBSE Board Papers"
        title = "CBSE Class 10 Science Question Paper 2024"
        filename = "CBSE_Class_10_Science_2024.pdf"
        size = "2.2 MB"
        pages = 18
        description = "Official question paper of the CBSE Class 10 Science Board exam 2024."
    },

    # --- Class 12 CBSE ---
    [PSCustomObject]@{
        id = "c12-phy-electro"
        class = "12"
        subject = "Physics"
        chapter = "Electrostatics"
        type = "Formula Sheets"
        title = "Electrostatics Formula Sheet"
        filename = "Class_12_Physics_Electrostatics_Formulas.pdf"
        size = "650 KB"
        pages = 2
        description = "Coulomb's Law, Gauss Theorem, Capacitance, Electric Potential, and Field formulas compiled on a single page."
    },
    [PSCustomObject]@{
        id = "c12-phy-current-pyq"
        class = "12"
        subject = "Physics"
        chapter = "Current Electricity"
        type = "PYQs"
        title = "Current Electricity Board PYQs"
        filename = "Class_12_Physics_Current_Electricity_PYQs.pdf"
        size = "1.5 MB"
        pages = 14
        description = "Kirchhoff's Laws, Potentiometer, and Wheatstone Bridge solved previous year board questions."
    },
    [PSCustomObject]@{
        id = "c12-math-matrices-notes"
        class = "12"
        subject = "Mathematics"
        chapter = "Matrices"
        type = "Notes"
        title = "Matrices Concept Map & Notes"
        filename = "Class_12_Maths_Matrices_Notes.pdf"
        size = "1.8 MB"
        pages = 15
        description = "Types of matrices, matrix multiplication, elementary operations, symmetric and skew-symmetric properties."
    },
    [PSCustomObject]@{
        id = "c12-math-integrals-form"
        class = "12"
        subject = "Mathematics"
        chapter = "Integrals"
        type = "Formula Sheets"
        title = "Indefinite & Definite Integrals Formulas"
        filename = "Class_12_Maths_Integrals_Formulas.pdf"
        size = "580 KB"
        pages = 3
        description = "Comprehensive integration formulas, properties of definite integrals, and special integration forms."
    },
    [PSCustomObject]@{
        id = "c12-chem-solutions-pyq"
        class = "12"
        subject = "Chemistry"
        chapter = "Solutions"
        type = "PYQs"
        title = "CBSE Class 12 Solutions 10 Years PYQs"
        filename = "Class_12_Chemistry_Solutions_PYQ.pdf"
        size = "3.2 MB"
        pages = 20
        description = "Topic-wise compiled previous year board questions on Colligative Properties, Raoult's Law, Henry's Law."
    },
    [PSCustomObject]@{
        id = "c12-chem-electro-notes"
        class = "12"
        subject = "Chemistry"
        chapter = "Electrochemistry"
        type = "Notes"
        title = "Electrochemistry Detailed Revision Notes"
        filename = "Class_12_Chemistry_Electrochemistry_Notes.pdf"
        size = "2.4 MB"
        pages = 18
        description = "Nernst equation, conductance, Kohlrausch's law, electrolysis, fuel cells, and corrosion."
    },
    [PSCustomObject]@{
        id = "c12-bio-reproduction-notes"
        class = "12"
        subject = "Biology"
        chapter = "Human Reproduction"
        type = "Notes"
        title = "Human Reproduction NCERT Core Notes"
        filename = "Class_12_Biology_Human_Reproduction_Notes.pdf"
        size = "2.0 MB"
        pages = 16
        description = "Male/Female reproductive systems, gametogenesis, menstrual cycle, fertilization, and embryonic development."
    },
    [PSCustomObject]@{
        id = "c12-bst-principles"
        class = "12"
        subject = "Business Studies"
        chapter = "Principles of Management"
        type = "Notes"
        title = "Fayol & Taylor Principles Summary Notes"
        filename = "Class_12_BST_Principles_Management.pdf"
        size = "1.1 MB"
        pages = 9
        description = "Fayol's 14 principles of management and Taylor's Scientific Management theories summarized."
    },
    [PSCustomObject]@{
        id = "c12-acc-partnership-pyq"
        class = "12"
        subject = "Accountancy"
        chapter = "Partnership Accounts"
        type = "PYQs"
        title = "Partnership Fundamental Accounts PYQs"
        filename = "Class_12_Accountancy_Partnership_PYQs.pdf"
        size = "2.5 MB"
        pages = 22
        description = "Solvency, interest on capital, profit & loss appropriation accounts, past adjustments board questions."
    },
    [PSCustomObject]@{
        id = "c12-eco-national-notes"
        class = "12"
        subject = "Economics"
        chapter = "National Income"
        type = "Notes"
        title = "National Income Accounting Summary Notes"
        filename = "Class_12_Economics_National_Income_Notes.pdf"
        size = "1.7 MB"
        pages = 12
        description = "Circular flow, GDP, national income aggregates, and estimation methods (value added, income, expenditure)."
    },
    [PSCustomObject]@{
        id = "c12-phy-pyq-2024"
        class = "12"
        subject = "Physics"
        chapter = "All Chapters"
        type = "CBSE Board Papers"
        title = "CBSE Class 12 Physics Question Paper 2024"
        filename = "CBSE_Class_12_Physics_2024.pdf"
        size = "2.5 MB"
        pages = 24
        description = "Official question paper of the CBSE Class 12 Physics board exam 2024."
    },
    [PSCustomObject]@{
        id = "c12-math-pyq-2024"
        class = "12"
        subject = "Mathematics"
        chapter = "All Chapters"
        type = "CBSE Board Papers"
        title = "CBSE Class 12 Mathematics Question Paper 2024"
        filename = "CBSE_Class_12_Mathematics_2024.pdf"
        size = "2.0 MB"
        pages = 20
        description = "Official question paper of the CBSE Class 12 Mathematics board exam 2024."
    },

    # --- Classes 1 to 9 Primary/Middle ---
    [PSCustomObject]@{
        id = "c9-math-number"
        class = "9"
        subject = "Mathematics"
        chapter = "Number Systems"
        type = "Notes"
        title = "Number Systems Revision Notes"
        filename = "Class_9_Maths_Number_Systems_Notes.pdf"
        size = "1.2 MB"
        pages = 8
        description = "Rational & irrational numbers, laws of exponents, rationalisation of denominators."
    },
    [PSCustomObject]@{
        id = "c9-sci-matter"
        class = "9"
        subject = "Science"
        chapter = "Matter in Our Surroundings"
        type = "Notes"
        title = "Matter in Our Surroundings Notes"
        filename = "Class_9_Science_Matter_Surroundings_Notes.pdf"
        size = "1.5 MB"
        pages = 9
        description = "Physical nature of matter, states of matter, latent heat of fusion/vaporization, and evaporation."
    },
    [PSCustomObject]@{
        id = "c8-math-rational"
        class = "8"
        subject = "Mathematics"
        chapter = "Rational Numbers"
        type = "Worksheets"
        title = "Rational Numbers Practice Worksheet"
        filename = "Class_8_Maths_Rational_Numbers_Worksheet.pdf"
        size = "800 KB"
        pages = 4
        description = "Properties of rational numbers, representation on number line, and finding rational numbers between two numbers."
    },
    [PSCustomObject]@{
        id = "c7-sci-nutrition"
        class = "7"
        subject = "Science"
        chapter = "Nutrition in Plants"
        type = "Notes"
        title = "Nutrition in Plants Summary notes"
        filename = "Class_7_Science_Nutrition_Plants_Notes.pdf"
        size = "1.0 MB"
        pages = 6
        description = "Autotrophic nutrition, photosynthesis, saprotrophs, symbiosis, and soil nutrient replenishment."
    },
    [PSCustomObject]@{
        id = "c6-math-numbers"
        class = "6"
        subject = "Mathematics"
        chapter = "Knowing Our Numbers"
        type = "Worksheets"
        title = "Knowing Our Numbers Worksheet"
        filename = "Class_6_Maths_Knowing_Numbers_Worksheet.pdf"
        size = "750 KB"
        pages = 4
        description = "Comparing numbers, place value, estimation, Roman numerals, and brackets usage exercises."
    },
    [PSCustomObject]@{
        id = "c5-eng-grammar"
        class = "5"
        subject = "English"
        chapter = "Grammar"
        type = "Notes"
        title = "Nouns, Pronouns & Verbs Grammar Guide"
        filename = "Class_5_English_Grammar_Guide.pdf"
        size = "900 KB"
        pages = 7
        description = "Easy grammar rules with worksheets and sentence exercises for primary students."
    },
    [PSCustomObject]@{
        id = "c4-math-shapes"
        class = "4"
        subject = "Mathematics"
        chapter = "Shapes and Designs"
        type = "Worksheets"
        title = "Basic Geometry Shapes Worksheet"
        filename = "Class_4_Maths_Shapes_Worksheet.pdf"
        size = "650 KB"
        pages = 3
        description = "Fun shape identification, symmetry, and patterns worksheet for Class 4."
    },
    [PSCustomObject]@{
        id = "c3-evs-water"
        class = "3"
        subject = "Environmental Studies"
        chapter = "Water O' Water"
        type = "Notes"
        title = "Water Resources & Importance Notes"
        filename = "Class_3_EVS_Water_Notes.pdf"
        size = "800 KB"
        pages = 4
        description = "Primary concept notes on sources of water, water cycle, and water conservation."
    },
    [PSCustomObject]@{
        id = "c2-math-numbers-ws"
        class = "2"
        subject = "Mathematics"
        chapter = "Numbers 1 to 100"
        type = "Worksheets"
        title = "Two Digit Numbers Practice Worksheet"
        filename = "Class_2_Maths_Numbers_Worksheet.pdf"
        size = "500 KB"
        pages = 3
        description = "Counting, tens/ones sorting, and basic addition worksheet."
    },
    [PSCustomObject]@{
        id = "c1-eng-alphabets"
        class = "1"
        subject = "English"
        chapter = "Alphabets & Phonics"
        type = "Worksheets"
        title = "Phonics Sound & Writing Worksheet"
        filename = "Class_1_English_Phonics_Worksheet.pdf"
        size = "1.1 MB"
        pages = 5
        description = "Fun alphabet tracing and basic phonics sounding sheet for Class 1."
    },

    # --- JEE Main & Advanced ---
    [PSCustomObject]@{
        id = "jee-phy-mech-pyq"
        class = "JEE"
        subject = "Physics"
        chapter = "Mechanics"
        type = "JEE PYQs"
        title = "JEE Main Mechanics 5 Years Compiled PYQs"
        filename = "JEE_Physics_Mechanics_PYQs.pdf"
        size = "4.5 MB"
        pages = 48
        description = "Chapter-wise sorted questions from JEE Main exams (2020-24) with step-by-step solutions."
    },
    [PSCustomObject]@{
        id = "jee-phy-electro-pyq"
        class = "JEE"
        subject = "Physics"
        chapter = "Electrodynamics"
        type = "JEE PYQs"
        title = "JEE Electrodynamics Advanced Level PYQs"
        filename = "JEE_Physics_Electrodynamics_PYQs.pdf"
        size = "3.8 MB"
        pages = 36
        description = "High-level multiple choice and numerical value questions from JEE Advanced electrodynamics chapter."
    },
    [PSCustomObject]@{
        id = "jee-chem-organic-mech"
        class = "JEE"
        subject = "Chemistry"
        chapter = "Organic Chemistry"
        type = "Notes"
        title = "Name Reactions & Mechanisms Booklet"
        filename = "JEE_Chemistry_Organic_Mechanisms.pdf"
        size = "2.8 MB"
        pages = 24
        description = "Complete mechanism sheet for Aldol, Cannizzaro, Grignard, and other key name reactions."
    },
    [PSCustomObject]@{
        id = "jee-math-calculus-pyq"
        class = "JEE"
        subject = "Mathematics"
        chapter = "Calculus"
        type = "JEE PYQs"
        title = "JEE Main Calculus 5 Years Compiled PYQs"
        filename = "JEE_Maths_Calculus_PYQs.pdf"
        size = "4.2 MB"
        pages = 42
        description = "Limits, Continuity, Derivatives, and Integrals PYQs compiled with detailed explanations."
    },
    [PSCustomObject]@{
        id = "jee-math-coordinate-form"
        class = "JEE"
        subject = "Mathematics"
        chapter = "Coordinate Geometry"
        type = "Formula Sheets"
        title = "Coordinate Geometry Ultimate Formula Sheet"
        filename = "JEE_Maths_Coordinate_Formulas.pdf"
        size = "850 KB"
        pages = 4
        description = "Straight Lines, Circles, Parabola, Ellipse, and Hyperbola formulas and properties."
    },

    # --- NEET ---
    [PSCustomObject]@{
        id = "neet-bio-genetics-notes"
        class = "NEET"
        subject = "Biology"
        chapter = "Genetics & Evolution"
        type = "NEET PYQs"
        title = "Genetics & Evolution NCERT High-Yield Notes"
        filename = "NEET_Biology_Genetics_Evolution_HighYield.pdf"
        size = "5.1 MB"
        pages = 36
        description = "Highly structured revision booklet summarizing Mendelism, linkage, mutation, molecular genetics, and evolution."
    },
    [PSCustomObject]@{
        id = "neet-bio-plant-pyq"
        class = "NEET"
        subject = "Biology"
        chapter = "Plant Physiology"
        type = "NEET PYQs"
        title = "NEET Plant Physiology 10 Years PYQs"
        filename = "NEET_Biology_Plant_Physiology_PYQs.pdf"
        size = "3.5 MB"
        pages = 28
        description = "Compiled MCQs from 2015-2024 NEET exams on Photosynthesis, Respiration, and Plant Growth."
    },
    [PSCustomObject]@{
        id = "neet-phy-mechanics-pyq"
        class = "NEET"
        subject = "Physics"
        chapter = "Mechanics"
        type = "NEET PYQs"
        title = "NEET Physics Mechanics Solved PYQs"
        filename = "NEET_Physics_Mechanics_PYQs.pdf"
        size = "2.9 MB"
        pages = 22
        description = "Fully solved basic & conceptual mechanics questions targeting NEET examination style."
    },
    [PSCustomObject]@{
        id = "neet-chem-physical-form"
        class = "NEET"
        subject = "Chemistry"
        chapter = "Physical Chemistry"
        type = "Formula Sheets"
        title = "NEET Physical Chemistry Formula Sheet"
        filename = "NEET_Chemistry_Physical_Formulas.pdf"
        size = "780 KB"
        pages = 3
        description = "Chemical kinetics, solutions, electrochemistry, and thermodynamics formulas compiled for quick review."
    },

    # --- Olympiads ---
    [PSCustomObject]@{
        id = "oly-math-number-theory"
        class = "Olympiads"
        subject = "Mathematics"
        chapter = "Number Theory"
        type = "Notes"
        title = "Olympiad Number Theory Advanced Concepts"
        filename = "Olympiad_Math_Number_Theory_Notes.pdf"
        size = "2.1 MB"
        pages = 16
        description = "Divisibility, modular arithmetic, Fermat's Little Theorem, and Chinese Remainder Theorem proofs and problems."
    },
    [PSCustomObject]@{
        id = "oly-math-geometry"
        class = "Olympiads"
        subject = "Mathematics"
        chapter = "Geometry"
        type = "Worksheets"
        title = "IOQM/RMO Geometry Practice Set"
        filename = "Olympiad_Math_Geometry_Worksheet.pdf"
        size = "1.5 MB"
        pages = 12
        description = "Advanced olympiad geometry problems covering cyclic quadrilaterals, Power of a Point, and trigonometry lemmas."
    },
    [PSCustomObject]@{
        id = "oly-sci-nsejs-pyq"
        class = "Olympiads"
        subject = "Science"
        chapter = "Physics & Chemistry"
        type = "PYQs"
        title = "NSEJS 5 Years Compiled PYQs with Solutions"
        filename = "Olympiad_Science_NSEJS_PYQs.pdf"
        size = "3.6 MB"
        pages = 32
        description = "Topic-wise sorted questions from National Standard Examination in Junior Science with step-by-step answers."
    }
)

# Load existing JSON database to preserve other keys
if (Test-Path $jsonPath) {
    $db = Get-Content $jsonPath -Raw | ConvertFrom-Json
} else {
    $db = [PSCustomObject]@{
        links = @()
        fee_payment = [PSCustomObject]@{ circulars = @(); faqs = @() }
        infographics = @()
    }
}

# Update resources
$db.resources = $richResources

# Convert and save
$jsonOut = ConvertTo-Json $db -Depth 10
Set-Content $jsonPath -Value $jsonOut
Write-Host "Successfully populated resources in resources.json."

# Write PDF dummy files
$pdfBytes = [System.Text.Encoding]::UTF8.GetBytes(@"
%PDF-1.4
1 0 obj <</Type/Catalog/Pages 2 0 R>> endobj
2 0 obj <</Type/Pages/Kids[3 0 R]/Count 1>> endobj
3 0 obj <</Type/Page/Parent 2 0 R/MediaBox[0 0 612 792]/Resources<<>>/Contents 4 0 R>> endobj
4 0 obj <</Length 42>> stream
BT /F1 24 Tf 100 700 Td (EduVerse India Verified Study File) Tj ET
endstream
endobj
xref
0 5
0000000000 65535 f 
0000000009 00000 n 
0000000054 00000 n 
0000000109 00000 n 
0000000212 00000 n 
trailer <</Size 5/Root 1 0 R>>
startxref
303
%%EOF
"@)

if (!(Test-Path $downloadsDir)) {
    New-Item -ItemType Directory -Path $downloadsDir -Force | Out-Null
}

$createdCount = 0
foreach ($res in $db.resources) {
    $filePath = Join-Path $downloadsDir $res.filename
    [System.IO.File]::WriteAllBytes($filePath, $pdfBytes)
    $createdCount++
}

if ($db.fee_payment -and $db.fee_payment.circulars) {
    foreach ($circ in $db.fee_payment.circulars) {
        $filePath = Join-Path $downloadsDir $circ.url
        [System.IO.File]::WriteAllBytes($filePath, $pdfBytes)
        $createdCount++
    }
}

Write-Host "Successfully generated $createdCount PDF files in downloads/ directory."
Write-Host ""

# 2. Launch HTTP server
Write-Host "Starting Web Server on http://localhost:$port/..."
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "Native PowerShell server started successfully on http://localhost:$port/"
    Write-Host "Serving files from $localPath"
    Write-Host "Open http://localhost:$port/ in your browser."
    Write-Host "Press Ctrl+C in this window to stop the server."
} catch {
    Write-Error "Failed to start server. Port $port may already be in use."
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
