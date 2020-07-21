#!/bin/sh -
#===============================================================================
#
#          FILE: batterystate.sh
#
#         USAGE: ./batterystate.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: valentin_lechner
#  ORGANIZATION:
#       CREATED: 30.10.2018 20:57:28
#      REVISION: 0.4
#===============================================================================

# Treat unset vars as error
set -o nounset


#***  Scriptinfo  ***************************************************************
NAME="batterystate.sh"
VERSION="0.5"
AUTHOR="valentin_lechner"
UPDATED="2020-07-07"
#*******************************************************************************

#***  GlobVars  ****************************************************************

about="
batterystate - Prints battery information

SYNOPSIS
--------

batterystate [-v|-h]

OPTIONS
-------

-v
  Show version and exit.

-h
  Show help and exit.
"
export DISPLAY=:0
export XAUTHORITY="${HOME}/.Xauthority"

#***  Commands  *****************************************************************



send_notification(){
  power=$(eval "$bat" | grep 'percentage' | awk '{print $2}' | awk -F '%' '{print $1}')
  bar=$(seq --separator="─" 0 "$((power / 5))" | sed 's/[0-9]//g')
  /usr/bin/sudo -u "$(whoami)" notify-send -u critical "$bar"
}



#***  FUNCTION  ****************************************************************
#          NAME:  printInfo
#   DESCRIPTION: prints info about script
#    PARAMETERS:
#       RETURNS:
#*******************************************************************************
printInfo(){
    printf '%s' "${about}" | awk 'BEGIN{ind=0}
                                  $0~/^```/{
                                    if(ind!="1"){
                                       ind="1"
                                    }
                                    else{
                                       ind="0"
                                    }
                                    print ""
                                  }
                                  $0!~/^```/{
                                     gsub("[`*]","",$0)
                                     if(ind=="1"){
                                        $0="   " $0
                                     }
                                     print $0
                                  }'
}

#***  FUNCTION  ****************************************************************
#          NAME:  main
#   DESCRIPTION:
#    PARAMETERS:
#       RETURNS:
#*******************************************************************************

main(){
  bat="upower -i $(upower -e | grep BAT) | grep -E \"state|to\ full|percentage\""

  state=$(eval "$bat" |  grep 'state' | awk '{print $2}')

  [ "$state" = "discharging" ] && [ "$power" -le 33 ] && send_notification || exit 0
}


#*******************************************************************************
#            getopts
#*******************************************************************************

while getopts :vh option; do
    case "${option}" in
        v) printf '%s\n' \
                  "$NAME - version: $VERSION" \
                  "updated: $UPDATED by $AUTHOR"
           exit ;;
        h|*) printInfo && exit ;;
    esac
done

main
