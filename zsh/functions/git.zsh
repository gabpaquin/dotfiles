function git_man(){
  echo "Git checkout new remote branch to local repository"
  echo "Update remote branch"
  echo "git remote show origin"
  echo "git remote update"
  echo "git fetch"
  echo "git checkout -b local-name origin/remote-name"
  echo ""
  echo "Git undo things"
  echo 'git reset --soft "HEAD^" if you care about the changes'
  echo 'git reset --hard "HEAD^" if you dont care about the changes'
  echo 'git commit --ammend combine the current staging with the last commit'
  echo 'git revert <commit> if you want to undo a commit and append a new commit with the resulting content'
}