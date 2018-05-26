$html = (Get-Content .\README.md) `
                -replace '^## (.+)', '<h2>$1</h2>' `
                -replace '^# (.+)', '<h1>$1</h1>' `
                -replace '    (.+)', '<input type="text" class="code stretch" value="$1" ><button class="copy-button stretch">Copy to clipboard</button>' `
                -replace '<h2>', '<div><h2>' `
                -replace '<h2>', '<div><h2>' `
                -replace '</button>', '</div>'

$page = (Get-Content .\page-template.html).Replace('{{body_html}}', $html)

$page | Out-File -FilePath .\index.html