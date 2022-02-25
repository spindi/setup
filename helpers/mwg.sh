#!/home/linuxbrew/.linuxbrew/bin/fish
# mwg - merge when good

# keep checking 
while true
  echo '['(date +%T)'] ...checking...'
  gh pr checks $1
  if test $status -eq 0
    echo $status
    break
  else
    sleep 10 
  end
end

# merge if checks pass
gh pr checks $1
if test $status -eq 0
  banner 'MERGE!'
  gh pr merge -m --admin
end
