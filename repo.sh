#!/usr/bin/env bash

set -e
set -o pipefail

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

if [ -n "${OPENEDX_RELEASE}" ]; then
    OPENEDX_GIT_BRANCH=open-release/${OPENEDX_RELEASE}
else
    OPENEDX_GIT_BRANCH=open-release/ironwood.master
fi

if [ -n "${CAMR_GIT_BRANCH}" ]; then
     echo "Using ${CAMR_GIT_BRANCH} as branch for camr repositories"
else
     CAMR_GIT_BRANCH='camrom/ironwood+campus'
fi


repos=(
    "https://github.com/edx/course-discovery"
    "https://github.com/edx/credentials"
    "https://github.com/edx/cs_comments_service"
    "https://github.com/edx/edx-e2e-tests"
    "https://github.com/edx/edx-notes-api"
    "https://github.com/edx/xqueue"
    "https://github.com/edx/edx-analytics-pipeline"
    "https://github.com/edx/gradebook"
)

repos_camr=(
    "https://github.com/edunext/edx-platform"
    "https://github.com/eduNEXT/ecommerce"
)

private_repos=(
    "https://github.com/eduNEXT/campusromero-openedx-extensions"
)



volumes=(
    "edxapp_studio_assets"
    "edxapp_lms_assets"
    "discovery_assets"
    "mysql_data"
    "mongo_data"
    "elasticsearch_data"
)

theme_repos=(
    "git@bitbucket.org:edunext/campusromero-theme"
    )

name_pattern=".*/(.*)"

_checkout ()
{
    repos_to_checkout=("$@")

    for repo in "${repos_to_checkout[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        # If a directory exists and it is nonempty, assume the repo has been cloned.
        if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
            echo "Checking out branch ${OPENEDX_GIT_BRANCH} of $name"
            cd $name
            _checkout_and_update_branch
            cd ..
        fi
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
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"
        # If a directory exists and it is nonempty, assume the repo has been checked out
        # and only make sure it's on the required branch
        if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
            printf "The [%s] repo is already checked out. Checking for updates.\n" $name
            cd ${DEVSTACK_WORKSPACE}/${name}
            _checkout_and_update_branch
            cd ..
        else
            if [ "${SHALLOW_CLONE}" == "1" ]; then
                git clone  -b ${OPENEDX_GIT_BRANCH} -c core.symlinks=true --depth=1 ${repo}
            else
                git clone  -b ${OPENEDX_GIT_BRANCH} -c core.symlinks=true ${repo}
            fi
        fi
    done
    cd - &> /dev/null
}

_clone_camr()
{

    cd $DEVSTACK_WORKSPACE
    # for repo in ${repos[*]}
    repos_to_clone=("$@")
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"
        # If a directory exists and it is nonempty, assume the repo has been checked out
        # and only make sure it's on the required branch
        if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
            printf "The [%s] repo is already checked out. Checking for updates.\n" $name
            cd ${DEVSTACK_WORKSPACE}/${name}
            _checkout_and_update_branch_camr
            cd ..
        else
            if [ "${SHALLOW_CLONE}" == "1" ]; then
                git clone  -b ${CAMR_GIT_BRANCH} -c core.symlinks=true --depth=1 ${repo}
            else
                git clone  -b ${CAMR_GIT_BRANCH} -c core.symlinks=true ${repo}
            fi
        fi
    done
    cd - &> /dev/null
}

_checkout_and_update_branch ()
{
    GIT_SYMBOLIC_REF="$(git symbolic-ref HEAD 2>/dev/null)"
    BRANCH_NAME=${GIT_SYMBOLIC_REF##refs/heads/}
    if [ "${BRANCH_NAME}" == "${OPENEDX_GIT_BRANCH}" ]; then
        git pull origin ${OPENEDX_GIT_BRANCH}
    else
        git fetch origin ${OPENEDX_GIT_BRANCH}:${OPENEDX_GIT_BRANCH}
        git checkout ${OPENEDX_GIT_BRANCH}
    fi
    sudo find . -name '*.pyc' -not -path './.git/*' -delete 
}

_checkout_and_update_branch_camr ()
{
    GIT_SYMBOLIC_REF="$(git symbolic-ref HEAD 2>/dev/null)"
    BRANCH_NAME=${GIT_SYMBOLIC_REF##refs/heads/}
    if [ "${BRANCH_NAME}" == "${CAMR_GIT_BRANCH}" ]; then
        git pull origin ${CAMR_GIT_BRANCH}
    else
        git fetch origin ${CAMR_GIT_BRANCH}:${CAMR_GIT_BRANCH}
        git checkout ${CAMR_GIT_BRANCH}
    fi
    find . -name '*.pyc' -not -path './.git/*' -delete 
}

_clone_src ()
{
    sudo mkdir -p $DEVSTACK_WORKSPACE/src/edxapp
    u="$USER"
    sudo chown $u:$u $DEVSTACK_WORKSPACE/src/edxapp
    cd $DEVSTACK_WORKSPACE/src/edxapp
    # for repo in ${repos[*]}
    repos_to_clone=("$@")
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"
        echo $name
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
    done
    cd - &> /dev/null
}

_clone_themes ()
{
    sudo mkdir -p $DEVSTACK_WORKSPACE/themes
    u="$USER"
    sudo chown $u:$u $DEVSTACK_WORKSPACE/themes
    cd $DEVSTACK_WORKSPACE/themes
    # for repo in ${repos[*]}
    repos_to_clone=("$@")
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"
        echo $name
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
    done
    cd - &> /dev/null
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
    _clone_camr "${repos_camr[@]}"
    _clone_themes "${theme_repos[@]}"
    _clone_src "${private_repos[@]}"
    _create_volumes
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
elif [ "$1" == "reset" ]; then
    read -p "This will override any uncommited changes in your local git checkouts. Would you like to proceed? [y/n] " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        reset
    fi
elif [ "$1" == "status" ]; then
    status
fi
