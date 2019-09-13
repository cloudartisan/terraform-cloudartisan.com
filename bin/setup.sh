#!/bin/bash
#
# NOTE: Assumes setup on MacOS

brew unlink terraform
brew install warrensbox/tap/tfswitch
tfswitch

exit 0
