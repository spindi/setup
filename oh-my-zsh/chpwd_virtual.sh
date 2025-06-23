BASE="/Users/conor.boyd/Documents/Repo"

function chpwd() {
  PWD=$(pwd)
  DIRNAME=$(dirname $PWD)
  BASENAME=$(basename $PWD)

  # make sure we are in repo
  if [[ $DIRNAME = $BASE ]];
  then
    # dir specific actions
    if [[ $BASENAME =~ "^(pz-tracking-cache-binlog|pz-tracking-data-generator|pz-tracking)$" ]]; 
    then
      source "${BASE}/${BASENAME}/.venv/bin/activate"
    fi
  else
    # not in repo, if still active, deactivate
    if [[ $VIRTUAL_ENV_PROMPT != "" ]];
    then
      deactivate
    fi
  fi
}
