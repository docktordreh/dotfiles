#!/bin/bash -
#===============================================================================
#
#          FILE: batteryDialog.sh
#
#         USAGE: ./batteryDialog.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/03/2019 02:02:08 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
zenity --question --text "Are you sure you want to shutdown?"; echo $?
