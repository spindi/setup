#!/home/linuxbrew/.linuxbrew/bin/fish

for mimetype in (cat /usr/share/applications/firefox.desktop | grep ^MimeType | sed -e 's/^MimeType=//' | sed -e 's/;$//' | tr \; " ")
  echo "Setting Firefox as default for $mimetype"
  xdg-mime default firefox.desktop $mimetype
end
