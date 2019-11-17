#!/bin/bash

# This script lints the application

shellcheck -- *.sh scripts/*.sh scripts/bootstrap/*.sh
