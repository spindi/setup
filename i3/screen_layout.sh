#!/bin/fish
set screen_layout (xrandr | grep ' connected ' | sed -e 's/ .*//' | tr "\n" ' ' | xargs)

switch $screen_layout 
  case "eDP HDMI-A-0"
    echo "HDMI above centre"
    . /home/conor.boyd/.screenlayout/hdmi_above_centre.sh
  case "*"
    echo "Laptop screen only"
    . /home/conor.boyd/.screenlayout/laptop_screen_only.sh
end
