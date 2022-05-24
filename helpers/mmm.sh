#!/bin/bash
CURRENT_BRANCH=$(git branch --show-current | xargs)

LOOP="plan development stage production"
if [ "$CURRENT_BRANCH" == "plan" ]; then
  LOOP="development stage production"
elif [ "$CURRENT_BRANCH" == "development" ]; then
  LOOP="stage production"
fi

for environment in $LOOP
do
  banner $environment
  gh pr create --base $environment --title "Merge $(git branch --show-current | xargs)" --body "Merge $(git branch --show-current | xargs)"
  if [ $? -eq 0 ]; then
    # pr created
    ~/Setup/helpers/mwg.sh && \
    git switch $environment && \
    git fetch && git pull
  else
    # pr likely already exists
    gh pr list
    exit 1
  fi
done
