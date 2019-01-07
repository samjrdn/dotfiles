#!/bin/bash
#
# An enhanced, colourful bash prompt featuring git branch and status info.

git_info () {
  local branch=''
  local status=''

  # Determine if we're in a git repo
  local branchCheck=$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")
  if [[ ! $branchCheck == '' ]]; then

    # Determine the state of the branch
    local statusCheck=$(git status --porcelain 2> /dev/null)
    if [[ ! $statusCheck == '' ]]; then
      status=$(cecho ○ yellow)
    else
      status=$(cecho ● green)
    fi

    # Don't show the branch name if it's "master"
    if [[ $branchCheck == 'master' ]]; then
      branch=''
    else
      branch=$(cecho "$branchCheck " green)
    fi

    echo -en "$branch$status "
  fi
  return
}

fancy_dir () {
  local pwd=$(pwd)
  # Compact home directory name to "~"
  pwd=$(echo -e $pwd | sed "s|"$HOME"|~|")
  # Split folders into an array
  pwd=$(echo -e $pwd | tr "/" " ")

  cecho "$pwd" light-blue
  return
}

# A shortened path to the current directory
PROMPT_DIRTRIM=2
CURRENT_PATH=$(cecho '\w' light-blue)

# Some colourful chevrons
CHEVRONS='$(cecho ❯ light-red)$(cecho ❯ light-magenta)$(cecho ❯ light-blue)'

export PS1="$CURRENT_PATH \`git_info\`$CHEVRONS "
