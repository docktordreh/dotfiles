#!/bin/bash -
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
VERSION="0.4"
AUTHOR="valentin_lechner"
CREATED="2018-10-30"
UPDATED="2019-09-15"
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

bat='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'

power=$(eval "$bat" | grep 'percentage' | awk '{print $2}' | awk -F '%' '{print $1}')

state=$(eval "$bat" |  grep 'state' | awk '{print $2}')

uid=$(id -u)

uname=$(whoami)

bar=$(seq --separator="─" 0 "$((power / 5))" | sed 's/[0-9]//g')


send_notification(){
  sudo -u "$uname" notify-send -u critical $bar
    
}


write_batterystatus_tofile(){
    sudo -u "$uname" echo "LAST_BATINFO=$power" | tee "$HOME/tmp/batteryinfo"
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

sourceBatteryStatusFile(){
    if [ -f "$HOME/tmp/batteryinfo" ]; then
          source "$HOME/tmp/batteryinfo"
    else
          mkdir -p "$HOME/tmp"
          touch "$HOME/batteryinfo"
    fi
}

#***  FUNCTION  ****************************************************************
#          NAME:  main
#   DESCRIPTION:
#    PARAMETERS:
#       RETURNS:
#*******************************************************************************

main(){
    sourceBatteryStatusFile
    if [ "$state" = "discharging" ] ; then

        # power so low u need notification?
          if [ "$power" -le 33 ] ; then
echo "sending notif"
            # is variable set?
          #      if [ -z ${LAST_BATINFO+x} ]; then
                      send_notification
                      write_batterystatus_tofile
           #     elif [ "$power" -le "$("$LAST_BATINFO" -5)" ]; then
            #          send_notification
             #         write_batterystatus_tofile
              #  fi

          fi

    fi
    echo "battery at $power"
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
