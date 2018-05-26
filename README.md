# Windows Git Tricks
These trick assumes you have a remote named 'origin'

## Initialise git in working directory with latest Visual Studio .gitignore
    git init; (Invoke-WebRequest https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore -UseBasicParsing).Content | Out-File -FilePath .gitignore -Encoding utf8; git add -A

## Delete all local branches that have been merged into master
```
git branch --merged origin/master | Where-Object {  !$_.Contains('master') } | ForEach-Object { git branch -d $_.trim() }
```

## Delete all local branches that are not master
```
git branch --no-contains "master" | ForEach-Object { git branch -D $_.Trim() }
```

## Copy current branch to clipboard
```
(git branch | Where-Object { $_.Contains("*") } | Select-Object -First 1).Trim('*').Trim() | Set-Clipboard
```

## Delete remote branches with filter
```
git fetch --prune --all; git branch -r | where-object {$_.Contains('add a filter here')} | ForEach-Object { git push origin --delete $_.Split('/')[1] }
```

## Find all branches (in remotes and local) that I have created
Just replace 'Raph' with your name here
```
git for-each-ref --format=' %(authorname),%(refname)' | where-object { $_.Split(',')[0].Trim() -eq 'Raph' } | select-object { $_.Split(',')[1] }
```

## Stage all files for commit except those that are *.config at any level within your git repo
```
git status | Where-Object {$_.Contains("modified") -and !$_.Contains(".config")} | ForEach-Object { git add $_.Replace('modified:','').Trim() }
```

## Delete all remote branches that have been merged into master
```
git branch -r --merged origin/master | Where-Object {  !$_.Contains('master') } | ForEach-Object { git push origin --delete $_.Split('/')[1] }
```