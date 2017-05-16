# Windows Git Tricks

## Delete all local branches that have been merged into master
git branch --merged origin/master | Where-Object {  !$_.Contains('master') } | ForEach-Object { git branch -d $_.trim()  }