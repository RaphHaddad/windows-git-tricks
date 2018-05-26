$html = (Get-Content .\README.md) `
                -replace '^## (.+)', '<h2>$1</h2>'

$html = $html -replace '^# (.+)', '<h1>$1</h1>'

$html = $html -replace '    (.+)', '<input type="text" class="code stretch" value="$1" ><button class="copy-button stretch">Copy to clipboard</button>'

$html = $html -replace '<h2>', '<div><h2>'
$html = $html -replace '<h2>', '<div><h2>'
$html = $html -replace '</button>', '</div>'

Write-Host "$html"