#!/bin/zsh

BASE="/Users/conor.boyd/Documents/Repo"
VALID_DIRS=(pz-message pz-impression-processor pz-tracking-cache-binlog pz-tracking-data-generator pz-tracking graphql-strawberry graphql-strawberry-django pz-trackman alpaca pz-druid-indexer pz-druid-consumer)

function chpwd() {
  PWD=$(pwd)
  DIR=$(pwd | sed -e 's/.*Repo\///' | sed -e 's/\/.*//')

  # make sure we are in repo
  if [[ $PWD == *"$BASE"* && $PWD != $BASE ]]; then
    # if the dir has an index in valid then source it
    if (( ${VALID_DIRS[(Ie)$DIR]} )); then
      source "${BASE}/${DIR}/.venv/bin/activate"
    fi
  else
    # not in repo, if still active, deactivate
    if [[ $VIRTUAL_ENV_PROMPT != "" ]]; then
      deactivate
    fi
  fi
}
