#!/usr/bin/bash

curl -s -H "Fastly-Key:$FASTLY_API_KEY" "https://api.fastly.com$1"
