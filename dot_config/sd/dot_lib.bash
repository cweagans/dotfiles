#!/usr/bin/env bash

# Configuration values.
LOCK_ROOT="$HOME/.local/lock"

# Make sure sd can be called from inside other sd scripts.
sd() {
    $HOME/.config/zsh/zgenom/sources/ianthehenry/sd/___/sd $@
}

# Common functions
format_heading() {
    echo
    echo -e "${BPurple}==> ${1}${Color_Off}"
    echo
}

format_message() {
    echo "${BCyan}====> ${1}${Color_Off}"
}

format_detail() {
    echo "${BCyan}    > ${1}${Color_Off}"
}

format_error() {
    echo -e "${BRed}[!]${Color_Off} ${*}"
    return 1
}

require_program() {
    if ! type "$1" > /dev/null 2>&1; then
        format_error "Program $1 is required. Please install it and try again."
    fi
}

require_arg() {
    if [ -z "$2" ]; then
        format_error "Arg $1 is required."
    fi
}

check_connection() {
    ping -q -c 1 -W 1 example.com &> /dev/null
    return $?
}

acquire_lock() {
    # Ensure a lock dir exists.
    [ -d "$LOCK_ROOT" ] || mkdir -p "$LOCK_ROOT"

    # See if the lock already exists.
    [ ! -e "$LOCK_ROOT/$1.lock" ] || format_error "Cannot acquire lock for $1"

    # Touch the file to acquire the lock.
    touch "$LOCK_ROOT/$1.lock"
}

clear_lock() {
    # See if the lock already exists.
    [ -e "$LOCK_ROOT/$1.lock" ] || format_error "Lock for $1 does not exist"

    # Clear the lock.
    rm "$LOCK_ROOT/$1.lock"
}




##########################################################
# Colors
#
# yoinked from: https://github.com/amrox/sd-scripts/commit/c7d9f2d8178d5698db8751511623f34bbad68cdc
##########################################################

# Reset
export Color_Off='\033[0m'       # Text Reset

# Regular Colors
export Black='\033[0;30m'        # Black
export Red='\033[0;31m'          # Red
export Green='\033[0;32m'        # Green
export Yellow='\033[0;33m'       # Yellow
export Blue='\033[0;34m'         # Blue
export Purple='\033[0;35m'       # Purple
export Cyan='\033[0;36m'         # Cyan
export White='\033[0;37m'        # White

# Bold
export BBlack='\033[1;30m'       # Black
export BRed='\033[1;31m'         # Red
export BGreen='\033[1;32m'       # Green
export BYellow='\033[1;33m'      # Yellow
export BBlue='\033[1;34m'        # Blue
export BPurple='\033[1;35m'      # Purple
export BCyan='\033[1;36m'        # Cyan
export BWhite='\033[1;37m'       # White

# Underline
export UBlack='\033[4;30m'       # Black
export URed='\033[4;31m'         # Red
export UGreen='\033[4;32m'       # Green
export UYellow='\033[4;33m'      # Yellow
export UBlue='\033[4;34m'        # Blue
export UPurple='\033[4;35m'      # Purple
export UCyan='\033[4;36m'        # Cyan
export UWhite='\033[4;37m'       # White

# Background
export On_Black='\033[40m'       # Black
export On_Red='\033[41m'         # Red
export On_Green='\033[42m'       # Green
export On_Yellow='\033[43m'      # Yellow
export On_Blue='\033[44m'        # Blue
export On_Purple='\033[45m'      # Purple
export On_Cyan='\033[46m'        # Cyan
export On_White='\033[47m'       # White

# High Intensity
export IBlack='\033[0;90m'       # Black
export IRed='\033[0;91m'         # Red
export IGreen='\033[0;92m'       # Green
export IYellow='\033[0;93m'      # Yellow
export IBlue='\033[0;94m'        # Blue
export IPurple='\033[0;95m'      # Purple
export ICyan='\033[0;96m'        # Cyan
export IWhite='\033[0;97m'       # White

# Bold High Intensity
export BIBlack='\033[1;90m'      # Black
export BIRed='\033[1;91m'        # Red
export BIGreen='\033[1;92m'      # Green
export BIYellow='\033[1;93m'     # Yellow
export BIBlue='\033[1;94m'       # Blue
export BIPurple='\033[1;95m'     # Purple
export BICyan='\033[1;96m'       # Cyan
export BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
export On_IBlack='\033[0;100m'   # Black
export On_IRed='\033[0;101m'     # Red
export On_IGreen='\033[0;102m'   # Green
export On_IYellow='\033[0;103m'  # Yellow
export On_IBlue='\033[0;104m'    # Blue
export On_IPurple='\033[0;105m'  # Purple
export On_ICyan='\033[0;106m'    # Cyan
export On_IWhite='\033[0;107m'   # White
