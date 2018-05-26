$file = Get-Content .\README.md

$html = (Get-Content .\README.md) `
                -replace '^## (.+)', '<h2>$1</h2>'

$html = $html -replace '(?ms)```(.*?)', '<code>'


Write-Host "$html"