set REPO_BASE "/home/conor.boyd/Documents/Repo"

function auto_activate_virtual --on-variable PWD --description 'Activate virtual environment'
  status --is-command-substitution; and return

  function _deactivate
    if set -q CONDA_PREFIX
      conda deactivate
    end
    if set -q VIRTUAL_ENV
      deactivate
    end
  end

  function _conda_swap
    _deactivate
    conda activate $argv
  end

  if string match -r "^$REPO_BASE/pv_matcher" $PWD 1>/dev/null
    _conda_swap pv_matcher
  else if string match -r "^$REPO_BASE/OneSat" $PWD 1>/dev/null
    _conda_swap one
  else if string match -r "^$REPO_BASE/DamSat" $PWD 1>/dev/null
    _conda_swap damsat
  else if string match -r "^$REPO_BASE/LibSat" $PWD 1>/dev/null
    _conda_swap libsat
  else if string match -r "^$REPO_BASE/VdSDB" $PWD 1>/dev/null
    _conda_swap vdsdb
  else if string match -r "^$REPO_BASE/vds_sm_nrt" $PWD 1>/dev/null
    _conda_swap vds_sm_nrt
  else if string match -r "^$REPO_BASE/planet-grafana-cloud-users" $PWD 1>/dev/null
    _deactivate
    source /home/conor.boyd/Documents/Repo/planet-grafana-cloud-users/venv/bin/activate.fish
  else if string match -r "^$REPO_BASE/planet-grafana-cloud" $PWD 1>/dev/null
    _deactivate
  else if string match -r "^$REPO_BASE/sentinel_chaperon" $PWD 1>/dev/null
    _conda_swap sentinel_chaperon
  else if string match -r "^$REPO_BASE/vds_processing_monitor" $PWD 1>/dev/null
    _conda_swap vds_processing_monitor
  else if string match -r "^$REPO_BASE" $PWD 1>/dev/null
    _deactivate
  end
end
