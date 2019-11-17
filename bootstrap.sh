#!/bin/bash

# This script bootstraps the application

set -e
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

### define functions
# shellcheck source=scripts/bootstrap/functions.sh
. "$SRC_DIR"/scripts/bootstrap/functions.sh

# set_defaults
#
# sets up the defaults to be used later
#
# example usage: set_defaults
set_defaults() {
  environment=development
}

# gather_options
#
# gathers the options provided by the user
# based off of http://linuxcommand.org/lc3_wss0120.php
#
# example usage: gather_options "$@"
gather_options() {
  while [ "$1" != "" ]; do
    case $1 in
      -e)
        environment=$2
        shift
      ;;
    esac
    shift
  done
}
### define functions:end

set_defaults
gather_options "$@"

case $environment in
  'development')
    echo "Clearing out old containers"
    teardown_containers "$environment"
    echo "Setting up $environment containers"
    setup_containers "$environment"
  ;;
esac
