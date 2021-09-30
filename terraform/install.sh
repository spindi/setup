#!/bin/bash
# Trust the HashiCorp key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
# Add HashiCorp repo
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# Install terraform
sudo apt install terraform
