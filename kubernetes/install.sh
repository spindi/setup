#!/usr/local/bin/bash
brew install kubernetes-cli
brew install stern 

DIR=/usr/local/bin
ln -f -s ~/Setup/kubernetes/ks ${DIR}/ks       # shell
ln -f -s ~/Setup/kubernetes/kdp ${DIR}/kdp     # describe pod 
ln -f -s ~/Setup/kubernetes/kge ${DIR}/kgd     # get deployment 
ln -f -s ~/Setup/kubernetes/kge ${DIR}/kge     # get endpoints 
ln -f -s ~/Setup/kubernetes/kgi ${DIR}/kgi     # get ingress
ln -f -s ~/Setup/kubernetes/kgp ${DIR}/kgp     # get pods
ln -f -s ~/Setup/kubernetes/kgp ${DIR}/kgr     # get replicaset
ln -f -s ~/Setup/kubernetes/kgs ${DIR}/kgs     # get service
ln -f -s ~/Setup/kubernetes/kl ${DIR}/kl       # log
ln -f -s ~/Setup/kubernetes/klt ${DIR}/klt     # log tail
ln -f -s ~/Setup/kubernetes/klta ${DIR}/klta   # log tail all
