$lines = Get-Content .\README.md


$bodyHtml = ""
$hasStartedNewSnipet = $false
foreach ($line in $lines) {
    if ($line.StartsWith('## ')) {
        $hasStartedNewSnipet = $true
        $line = $line.Trim('## ')
        $bodyHtml += "<div><h2>$line</h2>"
    }

    if (-not $line -and $hasStartedNewSnipet) {
        $bodyHtml += "</div>"
        $hasStartedNewSnipet = $false
    }
}

Write-Host "$bodyHtml"