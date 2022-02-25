#!/usr/bin/bash

# $1 = service_id
# $2 = timestamp (h can be used to get last 120 seconds)
curl -s -H "Fastly-Key:$FASTLY_API_KEY" "https://rt.fastly.com/v1/channel/$1/ts/$2"
