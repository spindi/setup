#!/home/linuxbrew/.linuxbrew/bin/fish

echo Planet...
wget -qO - "https://pypi.prod.planet-labs.com/simple/$argv[2]" | grep -i $argv[1] | sed 's|</b>|-|g' | sed 's|<[^>]*>||g'

set search $argv[1]
if test -n "$argv[2]"
  set search $argv[2]
end
echo Pypi
curl -s "https://pypi.org/search/?q=$search" | grep package-snippet__name | sed 's|</b>|-|g' | sed 's|<[^>]*>||g'
