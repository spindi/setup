#!/bin/bash

function location_match_block {
	echo "      <locationMatch>"
	echo "        <location>"
	echo "          <protocol>http</protocol>"
	echo "          <host>${1}</host>"
	echo "          <port>80</port>"
	echo "        </location>"
	echo "        <enabled>true</enabled>"
	echo "      </locationMatch>"
	echo "      <locationMatch>"
	echo "        <location>"
	echo "          <protocol>https</protocol>"
	echo "          <host>${1}</host>"
	echo "          <port>443</port>"
	echo "        </location>"
	echo "        <enabled>true</enabled>"
	echo "      </locationMatch>"
}

echo "<?xml version='1.0' encoding='UTF-8' ?>"
echo "<?charles serialisation-version='2.0' ?>"
echo "<blacklist>"
echo "  <locations>"
echo "    <locationPatterns>"

for line in $(cat ../block/block_file.txt)
do
  location_match_block ${line}
done

echo "    </locationPatterns>"
echo "  </locations>"
echo "  <toolEnabled>true</toolEnabled>"
echo "  <useSelectedLocations>false</useSelectedLocations>"
echo "  <action>0</action>"
echo "</blacklist>"
