#!/bin/bash
brew install docker docker-machine
# brew services start docker-machine
# docker-machine start
brew install --cask virtualbox
docker-machine create default --driver virtualbox
