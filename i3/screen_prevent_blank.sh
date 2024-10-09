#!/home/linuxbrew/.linuxbrew/bin/fish

# prevent the x11 screensaver if there are specific windows open
while true
  i3-msg -t get_tree | jq | grep title | sed -e 's/^ *"title": //' | \
    grep -e "Zoom Meeting"

  if test $status -eq 0
    echo "screensaver off"
    xset s off -dpms
  else
    echo "screensaver on"
    xset s 600 600 +dpms
  end

  sleep 120
end

