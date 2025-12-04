BASE="/Users/conor.boyd/Documents/Repo"

function chpwd() {
  PWD=$(pwd)
  DIR=$(pwd | sed -e 's/.*Repo\///' | sed -e 's/\/.*//')

  # make sure we are in repo
  if [[ $PWD == *"$BASE"* && $PWD != $BASE ]];
  then
    # dir specific actions
    if [[ $DIR =~ "^(pz-tracking-cache-binlog|pz-tracking-data-generator|pz-tracking|graphql-strawberry|graphql-strawberry-django|pz-trackman|alpaca|pz-druid-indexer|pz-druid-consumer)$" ]]; 
    then
      source "${BASE}/${DIR}/.venv/bin/activate"
    fi
  else
    # not in repo, if still active, deactivate
    if [[ $VIRTUAL_ENV_PROMPT != "" ]];
    then
      deactivate
    fi
  fi
}
