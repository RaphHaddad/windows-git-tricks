$lines = Get-Content .\README.md


$bodyHtml = ""
$hasStartedNewSnipet = $false
$hasStartedNewCodeBlock = $false
foreach ($line in $lines) {
    if ($line.StartsWith('## ')) {
        $hasStartedNewSnipet = $true
        $line = $line.Trim('## ')
        $bodyHtml += "<div><h2>$line</h2>"
    } 

    if (-not $line -and $hasStartedNewSnipet -and -not $hasStartedNewCodeBlock) {
        $bodyHtml += "</div>"
        $hasStartedNewSnipet = $false
    }
}

Write-Host "$bodyHtml"