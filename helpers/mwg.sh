#!/home/linuxbrew/.linuxbrew/bin/fish
# mwg - merge when good

# keep checking 
while test ! (gh pr checks $1)
  echo '['(date +%T)'] ...checking...'
  sleep 10 
end

# merge if checks pass
if test (gh pr checks $1)
  banner 'MERGE!'
  echo "gh pr merge -m --admin $1"
end
