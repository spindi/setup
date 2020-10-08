#!/bin/bash
brew install docker docker-machine
# brew services start docker-machine
# docker-machine start
brew cask install virtualbox
docker-machine create default --driver virtualbox
