BASE="/Users/conor.boyd/Documents/Repo"

function chpwd() {
  PWD=$(pwd)
  DIRNAME=$(dirname ${PWD})
  BASENAME=$(basename ${PWD})

  # make sure we are in repo
  if [[ $DIRNAME = $BASE ]];
  then
    # dir specific actions
    if [[ $BASENAME =~ "^(pz-tracking-cache-binlog|pz-data-generator)" ]]; 
    then
      source "${BASE}/${BASENAME}/.venv/bin/activate"
    else
      # deactivate if we are in a virtual
      if [[ $VIRTUAL_ENV_PROMPT != "" ]];
      then
        deactivate
      fi
    fi
  fi
}
