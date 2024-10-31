set REPO_BASE "/home/$USER/Documents/Repo"

function auto_activate_virtual --on-variable PWD --description 'Activate virtual environment'
  status --is-command-substitution; and return

  function _deactivate
    if set -q CONDA_PREFIX
      conda deactivate
    end
    if set -q VIRTUAL_ENV
      deactivate
    end
    # nodeenv
    if set -q NODE_VIRTUAL_ENV
      deactivate_node
    end
  end

  function _conda_swap
    _deactivate
    conda activate $argv
  end

  if string match -r "^$REPO_BASE/pv_matcher" $PWD 1>/dev/null
    _conda_swap pv_matcher
    export ALEMBIC_CONFIG="$REPO_BASE/pv_matcher/src/pv_matcher/db/alembic.ini"
  else if string match -r "^$REPO_BASE/vds_s1" $PWD 1>/dev/null
    _conda_swap vds_s1
  else if string match -r "^$REPO_BASE/vds_s2" $PWD 1>/dev/null
    _conda_swap vds_s2
  else if string match -r "^$REPO_BASE/OneSat" $PWD 1>/dev/null
    _conda_swap onesat
  else if string match -r "^$REPO_BASE/DamSat" $PWD 1>/dev/null
    _conda_swap damsat
    export ALEMBIC_CONFIG="$REPO_BASE/DamSat/src/damsat/alembic.ini"
  else if string match -r "^$REPO_BASE/LibSat" $PWD 1>/dev/null
    _conda_swap libsat
  else if string match -r "^$REPO_BASE/VdSDB" $PWD 1>/dev/null
    _conda_swap vdsdb
  else if string match -r "^$REPO_BASE/vds_sm_nrt" $PWD 1>/dev/null
    _conda_swap vds_sm_nrt
  else if string match -r "^$REPO_BASE/planet-grafana-cloud-users" $PWD 1>/dev/null
    _deactivate
    source $REPO_BASE/planet-grafana-cloud-users/venv/bin/activate.fish
  else if string match -r "^$REPO_BASE/planet-grafana-cloud" $PWD 1>/dev/null
    _deactivate
  else if string match -r "^$REPO_BASE/sentinel_chaperon" $PWD 1>/dev/null
    _conda_swap sentinel_chaperon
  else if string match -r "^$REPO_BASE/vds_processing_monitor" $PWD 1>/dev/null
    _conda_swap vds_processing_monitor
  else if string match -r "^$REPO_BASE/lst_quality_monitoring" $PWD 1>/dev/null
    _conda_swap lst_quality_monitoring
  else if string match -r "^$REPO_BASE/lst-validation-app" $PWD 1>/dev/null
    _conda_swap lst_validation_app
  else if string match -r "^$REPO_BASE/vds_io" $PWD 1>/dev/null
    _conda_swap vds_io
  else if string match -r "^$REPO_BASE/00062-Satdata-30" $PWD 1>/dev/null
    _conda_swap 00062-Satdata-30
  else if string match -r "^$REPO_BASE/vds_backend_security" $PWD 1>/dev/null
    _conda_swap vds_backend_security
  else if string match -r "^$REPO_BASE/vds_smap" $PWD 1>/dev/null
    _conda_swap vds_smap
  else if string match -r "^$REPO_BASE/vds_amsr" $PWD 1>/dev/null
    _conda_swap vds_amsr
  else if string match -r "^$REPO_BASE/vds_gmi" $PWD 1>/dev/null
    _conda_swap vds_gmi
  else if string match -r "^$REPO_BASE/vds_base_cli" $PWD 1>/dev/null
    _conda_swap vds_base_cli
  else if string match -r "^$REPO_BASE/pv_stac" $PWD 1>/dev/null
    _conda_swap pv_stac
  else if string match -r "^$REPO_BASE/pv_stac" $PWD 1>/dev/null
    _conda_swap pv_stac
  else if string match -r "^$REPO_BASE/delta-vessel-detection" $PWD 1>/dev/null
    _deactivate
    source $REPO_BASE/delta-vessel-detection/.venv/bin/activate.fish
  #else if string match -r "^$REPO_BASE/stac-storage" $PWD 1>/dev/null
  #  # poetry
  #  source /home/$USER/.cache/pypoetry/virtualenvs/stac-storage-_yzA6wEw-py3.11/bin/activate.fish
  else if string match -r "^$REPO_BASE/Trading" $PWD 1>/dev/null
    _deactivate
    source $REPO_BASE/Trading/.venv/bin/activate.fish
  else if string match -r "^$REPO_BASE/Temporal" $PWD 1>/dev/null
    _deactivate
    source $REPO_BASE/Temporal/.venv/bin/activate.fish
  else # if string match -r "^$REPO_BASE" $PWD 1>/dev/null
    _deactivate
  end
end
