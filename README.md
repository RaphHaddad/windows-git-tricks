# Windows Git Tricks

## Delete all local branches that have been merged into master
```
git branch --merged origin/master | Where-Object {  !$_.Contains('master') } | ForEach-Object { git branch -d $_.trim() }
```

## Delete remote branches with filter
```
git fetch --prune --all

git branch -r | where-object {$_.Contains('add a filter here')} | ForEach-Object { git push origin --delete $_ }
```