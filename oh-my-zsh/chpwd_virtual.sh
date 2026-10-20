#!/bin/zsh

# Auto-activate a repo's .venv when chpwd-ing into it. Works for both repo
# roots: ~/Documents/Repo.Local (local copies) and ~/Documents/Repo
# (symlink -> ProtonDrive, where the other repos still live). The first
# path component under a root must be in VALID_DIRS and have a .venv.
REPO_BASES=("/Users/conor.boyd/Documents/Repo.Local" "/Users/conor.boyd/Documents/Repo")
VALID_DIRS=(systematic_futures_trading advisor trend-following-swing overnight-strategy opencode trackman continuous-disintegration network-quality ai-commissioning python-code-review-interview-exercise pz_search_tokenizer pz-application pz-tracking-cache pz-uar-django-test pz-uar pz-vantagepoint pz-consumer pz-tracking-partitioning-consumer pz-tracking-consumer pz-message pz-impression-processor pz-tracking-cache-binlog pz-tracking-data-generator pz-tracking graphql-strawberry graphql-strawberry-django pz-trackman alpaca pz-druid-indexer pz-druid-consumer)

function chpwd() {
  local root="" name=""
  for base in $REPO_BASES; do
    # exact prefix match ("Repo/*" never matches "Repo.Local/...")
    if [[ $PWD == $base || $PWD == $base/* ]]; then
      root=$base
      name=${PWD#$base/}
      name=${name%%/*}
      break
    fi
  done

  if [[ -n $root ]]; then
    # inside a repo root: activate if it is a valid repo with a venv
    # (nested cds re-source the same venv; that is harmless)
    if (( ${VALID_DIRS[(Ie)$name]} )) && [[ -f $root/$name/.venv/bin/activate ]]; then
      source "$root/$name/.venv/bin/activate"
    fi
  else
    # left both roots: deactivate if a venv is still active
    if [[ $VIRTUAL_ENV_PROMPT != "" ]]; then
      deactivate
    fi
  fi
}
