# Windows Git Tricks
These trick assumes you have a remote named 'origin'

## Delete all local branches that have been merged into master
```
git branch --merged origin/master | Where-Object {  !$_.Contains('master') } | ForEach-Object { git branch -d $_.trim() }
```

## Delete all local branches that are not master
```
git branch | where-object {!$_.EndsWith('master')} | foreach-object { git branch -D $_.Trim() }
```

## Delete remote branches with filter
```
git fetch --prune --all

git branch -r | where-object {$_.Contains('add a filter here')} | ForEach-Object { git push origin --delete $_.Split('/')[1] }
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