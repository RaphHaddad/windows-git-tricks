# Git Tricks

These trick assumes you have a remote named 'origin'

[Website version with 'copy to clipboard' buttons](https://gittricks.raph.ws/)

## Mac/Linux Tricks

### Delete all remote branches that are not main

    git fetch --prune | git branch -r | grep -v 'main' | sed 's/origin\///' | sed 's/^[ \t]*//;s/[ \t]*$//' | xargs -L1 git push origin --delete

### On Delete all local branches that are not main

    git branch | grep -v 'main' | xargs -L1 git branch -D

### Find all branches (in remotes and local) that I have created

Replace 'raph' with your name here

    git for-each-ref --format=' %(authorname),%(refname)' | grep -i 'raph'

### Delete all branches in remote that have the pattern `feature/deployable/`

    git branch -r | grep 'origin/feature/deployable' | sed 's/origin\///' | xargs -I {} git push origin --delete {}

## Windows Tricks

### Initialise git in working directory with latest Visual Studio .gitignore

    git init; (Invoke-WebRequest https://raw.githubusercontent.com/github/gitignore/main/VisualStudio.gitignore -UseBasicParsing).Content | Out-File -FilePath .gitignore -Encoding utf8; git add -A

### Delete all local branches that have been merged into main

    git branch --merged origin/main | Where-Object {  !$_.Contains('main') } | ForEach-Object { git branch -d $_.trim() }

### Delete all local branches that are not main

    git branch | Where-Object { !$_.Contains('main') } | ForEach-Object { git branch -D $_.Trim() }

### Copy current branch to clipboard

    (git branch | Where-Object { $_.Contains('*') } | Select-Object -First 1).Trim('*').Trim() | Set-Clipboard

### Delete remote branches with filter

    git fetch --prune --all; git branch -r | where-object {$_.Contains('add a filter here')} | ForEach-Object { git push origin --delete $_.Split('/')[1] }

### Find all branches (in remotes and local) that I have created

Just replace 'Raph' with your name here

    git for-each-ref --format=' %(authorname),%(refname)' | where-object { $_.Split(',')[0].Trim() -eq 'Raph' } | select-object { $_.Split(',')[1] }

### Stage all files for commit except those that are *.config at any level within your git repo

    git status | Where-Object {$_.Contains('modified') -and !$_.Contains('.config')} | ForEach-Object { git add $_.Replace('modified:','').Trim() }

### Delete all remote branches that are not main

    git fetch --prune; git branch -r | Where-Object {  !$_.Contains('main') } | ForEach-Object { git push origin --delete $_.Split('/')[1] }

### Delete all remote branches that have been merged into main

    git fetch --prune; git branch -r --merged origin/main | Where-Object {  !$_.Contains('main') } | ForEach-Object { git push origin --delete $_.Split('/')[1] }

### Pull multiple repositories in child folders (a.k.a. I'm back from a leave script)

    gci -Directory | foreach {Push-Location $_.Name; git fetch --all; git add .; git stash; git checkout main; git pull; Pop-Location} 
