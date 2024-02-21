#!/bin/bash
#
export CLIPCAT_VERSION=$(basename $(curl -s -w %{redirect_url} https://github.com/xrelkd/clipcat/releases/latest))

curl -s -L -O https://github.com/xrelkd/clipcat/releases/download/${CLIPCAT_VERSION}/clipcat_${CLIPCAT_VERSION#v}_amd64.deb
sudo apt install ./clipcat_${CLIPCAT_VERSION#v}_amd64.deb
