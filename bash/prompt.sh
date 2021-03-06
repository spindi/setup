#!/bin/bash
#
# DESCRIPTION:
#
#   Set the bash prompt according to:
#    * the active virtualenv
#    * the branch/status of the current git repository
#    * the return value of the previous command
#    * the fact you just came from Windows and are used to having newlines in
#      your prompts.
#
# USAGE:
#
#   1. Save this file as ~/.bash_prompt
#   2. Add the following line to the end of your ~/.bashrc or ~/.bash_profile:
#        . ~/.bash_prompt
#
# LINEAGE:
#
#   Based on work by woods
#
#   https://gist.github.com/31967

# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
  # Capture the output of the "git status" command.
  git_status="$(git status 2> /dev/null)"

  # Set color based on clean/staged/dirty.
  if [[ ${git_status} =~ "working directory clean" ]]; then
    state="${GREEN}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${YELLOW}"
  else
    state="${LIGHT_RED}"
  fi

  # Set arrow icon based on status against remote.
  remote_pattern="Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  else
    remote=""
  fi
  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi

  # Get the name of the branch.
  branch_pattern="^On branch ([^${IFS}]*)"
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
  fi

  # Set the final branch string.
  BRANCH="${state}(${branch})${remote}${COLOR_NONE} "
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
  else
      PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
  fi
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      DIR=`dirname ${VIRTUAL_ENV}`

      PYTHON_VIRTUALENV="${BLUE}[V:`basename \"$DIR\"`]${COLOR_NONE} "
  fi
}

# Determine active Python virtualenv details.
function set_docker_machine () {
  if test -z "$DOCKER_MACHINE_NAME" ; then
      DOCKER_MACHINE=""
  else
      DOCKER_MACHINE="${LIGHT_GRAY}[D:${DOCKER_MACHINE_NAME}]${COLOR_NONE} "
  fi
}

# Show that we are in a screen
function set_screen_session () {
  if test -z "$STY" ; then
      SCREEN_SESSION=""
  else
      SCREEN_SESSION="${LIGHT_GRAY}${STY}${COLOR_NONE} "
  fi
}

# Determine active Python conda details.
function set_conda () {
  if test -z "$CONDA_PROMPT_MODIFIER" ; then
      PYTHON_CONDA=""
  else
    CONDA_BASE_TEST="(base) "

    # We don't want to show anything if it is base
    if [ "${CONDA_PROMPT_MODIFIER}" != "${CONDA_BASE_TEST}" ] ; then
      # Take the brackets out and the space at the end
      CONDA_PROMPT_SIMPLE=`echo -n $CONDA_PROMPT_MODIFIER | sed -e 's/(//; s/)//; s/ $//'`

      PYTHON_CONDA="${BLUE}[C:$CONDA_PROMPT_SIMPLE]${COLOR_NONE} "
    else
      PYTHON_CONDA=""
    fi
  fi
}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable
  set_virtualenv

  # Set the DOCKER_MACHINE variable
  set_docker_machine

  # Set the PYTHON_CONDA variable
  set_conda

  # Set the SCREEN_SESSION variable
  set_screen_session

  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
  else
    BRANCH=''
  fi

  # Set the bash prompt variable.
  SCREEN_NULL_TITLE_ESCAPE_SEQUENCE='\[\033k\033\\\]'
  PS1="
${DOCKER_MACHINE}${PYTHON_VIRTUALENV}${PYTHON_CONDA}${GREEN}\u@\A ${SCREEN_SESSION}${YELLOW}\w${COLOR_NONE} ${RED}${BRANCH}${COLOR_NONE}"${SCREEN_NULL_TITLE_ESCAPE_SEQUENCE}"
${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
