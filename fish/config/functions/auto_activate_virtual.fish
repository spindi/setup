set REPO_BASE "/home/conor.boyd/Documents/Repo"

function auto_activate_virtual --on-variable PWD --description 'Activate virtual environment'
  status --is-command-substitution; and return

  function _conda_deactivate
    if set -q CONDA_PREFIX
      conda deactivate
    end
  end

  function _conda_swap
    _conda_deactivate
    conda activate $argv
  end

  if string match -r "^$REPO_BASE/pv_matcher" $PWD 1>/dev/null
    _conda_swap pv_matcher
  else if string match -r "^$REPO_BASE/DamSat" $PWD 1>/dev/null
    _conda_swap damsat
  else if string match -r "^$REPO_BASE/LibSat" $PWD 1>/dev/null
    _conda_swap libsat
  else if string match -r "^$REPO_BASE/VdSDB" $PWD 1>/dev/null
    _conda_swap vdsdb
  else if string match -r "^$REPO_BASE/vds_sm_nrt" $PWD 1>/dev/null
    _conda_swap vds_sm_nrt
  end
end
