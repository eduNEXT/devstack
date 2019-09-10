#!/usr/bin/env bash

set -e
set -o pipefail

# Use variables of file repo_defaults
. repo_defaults

# Script for Git repos housing edX services. These repos are mounted as
# data volumes into their corresponding Docker containers to facilitate development.
# Repos are cloned to/removed from the directory above the one housing this file.

if [ -z "$DEVSTACK_WORKSPACE" ]; then
    echo "need to set workspace dir"
    exit 1
elif [ -d "$DEVSTACK_WORKSPACE" ]; then
    cd $DEVSTACK_WORKSPACE
else
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

repos=(${LIST_OF_REPOS_TO_CLONE[@]})

private_repos=(
    # Needed to run whitelabel tests.
    "https://github.com/edx/edx-themes.git"
)

volumes=(${VOLUMES_TO_CREATE[@]})

_checkout ()
{
    repos_to_clone=("$@")

    if [ -z "$OPENEDX_RELEASE" ]; then
        branch="master"
    else
        branch="open-release/${OPENEDX_RELEASE}"
    fi

    for np in ${LIST_OF_NAME_PATTERNS[@]}
    do
      name_pattern=".*$np/(.*).git"

      for repo in "${repos_to_clone[@]}"
      do
        clone=1

        for repo_not_checkout in "${LIST_OF_REPO_NOT_CHECKOUT[@]}"
        do
          rnc=".*$repo_not_checkout.*"

          if [[ $repo =~ $rnc ]]; then
            clone=0
            break
          fi
        done

        if [[ $clone == 1 ]]; then
          if [[ $repo =~ $name_pattern ]]; then
            name="${BASH_REMATCH[1]}"
            echo "$BASH_REMATCH"
            # If a directory exists and it is nonempty, assume the repo has been cloned.
            if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
                cd $name
                echo "Checking out branch $branch of $name"
                git pull
                git checkout "$branch"
                cd ..
            fi
          fi
        fi
      done
    done
}

checkout ()
{
    _checkout "${repos[@]}"
}

_clone ()
{
    # for repo in ${repos[*]}
    repos_to_clone=("$@")

    for np in ${LIST_OF_NAME_PATTERNS[@]}
    do
      name_pattern=".*$np/(.*).git"

      for repo in "${LIST_OF_REPOS_TO_CLONE[@]}"
      do
        if [[ $repo =~ $name_pattern ]]; then
          name="${BASH_REMATCH[1]}"

          if [[ -n $name ]]; then
            # If a directory exists and it is nonempty, assume the repo has been checked out.
            if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
                printf "The [%s] repo is already checked out. Continuing.\n" $name
            else
              if [ "${SHALLOW_CLONE}" == "1" ]; then
                  git clone --depth=1 $repo
              else
                  git clone $repo
              fi
            fi
          fi
        fi
      done
    done
    cd - &> /dev/null
}


_clone_theme ()
{
    if [[ ! -d "${DEVSTACK_WORKSPACE}/openedx-themes" ]]; then
        mkdir -p "${DEVSTACK_WORKSPACE}/openedx-themes";
    fi

    cd "${DEVSTACK_WORKSPACE}/openedx-themes"

    if [[ $THEME_REPO != "" ]]; then
      name_pattern=".*$NAME_PATTERN_THEME/(.*).git"

      [[ $THEME_REPO =~ $name_pattern ]]
      name="${BASH_REMATCH[1]}"

      if [[ $FOLDER_REPO_THEME != "" ]]; then
        name=$FOLDER_REPO_THEME
      fi

      if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
          printf "The [%s] theme repo is already checked out. Continuing.\n" $name
      else
          printf "Clone [$THEME_REPO] branch [$BRANCH_REPO_THEME]"
          git clone $BRANCH_REPO_THEME $THEME_REPO $FOLDER_REPO_THEME
      fi
    fi
}

_create_volumes ()
{
    if [[ ! -d "${DEVSTACK_WORKSPACE}/volumes" ]]; then
        mkdir "${DEVSTACK_WORKSPACE}/volumes";
    fi

    cd "${DEVSTACK_WORKSPACE}/volumes"

    for vol in "${volumes[@]}"
    do
        if [[ ! -d "${DEVSTACK_WORKSPACE}/volumes/${vol}" ]]; then
            mkdir "${DEVSTACK_WORKSPACE}/volumes/${vol}";
        fi
    done
}

clone ()
{
    _clone "${repos[@]}"
    _create_volumes
    _clone_theme
}

clone_private ()
{
    _clone "${private_repos[@]}"
}

reset ()
{
    currDir=$(pwd)
    for repo in ${repos[*]}
    do
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        if [ -d "$name" ]; then
            cd $name;git reset --hard HEAD;git checkout master;git reset --hard origin/master;git pull;cd "$currDir"
        else
            printf "The [%s] repo is not cloned. Continuing.\n" $name
        fi
    done
    cd - &> /dev/null
}

status ()
{
    currDir=$(pwd)
    for repo in ${repos[*]}
    do
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        if [ -d "$name" ]; then
            printf "\nGit status for [%s]:\n" $name
            cd $name;git status;cd "$currDir"
        else
            printf "The [%s] repo is not cloned. Continuing.\n" $name
        fi
    done
    cd - &> /dev/null
}

if [ "$1" == "checkout" ]; then
    checkout
elif [ "$1" == "clone" ]; then
    clone
elif [ "$1" == "whitelabel" ]; then
    clone_private
elif [ "$1" == "reset" ]; then
    read -p "This will override any uncommited changes in your local git checkouts. Would you like to proceed? [y/n] " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        reset
    fi
elif [ "$1" == "status" ]; then
    status
fi
