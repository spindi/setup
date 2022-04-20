#!/usr/bin/bash

curl -s -H "X-NSONE-Key:${NS1_API_KEY}" https://api.nsone.net/v1/zones$1
