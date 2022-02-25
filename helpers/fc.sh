#!/usr/bin/bash

# get all service ids for loops
# fc service list -j | jq -r .[].ID

fastly --token $FASTLY_API_KEY $@
