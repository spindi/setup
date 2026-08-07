#!/usr/bin/env bash
set -euo pipefail

git for-each-ref --sort=-creatordate --count=10 --format='%(creatordate:short) %(refname:short) [%(authorname)]' refs/remotes/origin
