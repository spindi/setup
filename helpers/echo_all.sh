#!/bin/bash

LOOP="development stage production"

for environment in $LOOP
do
  echo >> environments/$environment/trigger-conor-priv.tmp
done
