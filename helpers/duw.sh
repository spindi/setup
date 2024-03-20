#!/home/linuxbrew/.linuxbrew/bin/fish

# repeat something till it works
while true
  echo '['(date +%T)'] ...checking...'
  $argv
  if test $status -eq 0
    break
  else
    sleep 10 
  end
end
