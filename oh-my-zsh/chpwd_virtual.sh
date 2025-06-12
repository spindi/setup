BASE="/Users/conor.boyd/Documents/Repo"

function chpwd() {
  PWD=$(pwd)

  if [[ $PWD = "${BASE}/pz-tracking-cache-binlog" ]]; 
  then
    source "${BASE}/pz-tracking-cache-binlog/.venv/bin/activate"
  else
    # deactivate if we are in a virtual
    if [[ $VIRTUAL_ENV_PROMPT != "" ]];
    then
      deactivate
    fi
  fi
}
