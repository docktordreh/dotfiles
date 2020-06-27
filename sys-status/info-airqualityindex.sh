#!/bin/sh

TOKEN="0e0e18127e62d2f28481071712d7eb45b99c4dda"
CITY="freiburg"

API="https://api.waqi.info/feed"

if [ -n "$CITY" ]; then
    aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        aqi=$(curl -sf "$API/geo:$location_lat;$location_lon/?token=$TOKEN")
    fi
fi

if [ -n "$aqi" ]; then
    if [ "$(echo "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(echo "$aqi" | jq '.data.aqi')

        if [ "$aqi" -lt 50 ]; then
            aqi_cl="%{F009966}滑 ""$aqi""%{Ff1f1f1}"
        elif [ "$aqi" -lt 100 ]; then
        aqi_cl="%{Fffde33}滑 ""$aqi""%{Ff1f1f1}"
        elif [ "$aqi" -lt 150 ]; then
        aqi_cl="%{Fff9933}滑 ""$aqi""%{Ff1f1f1}"
        elif [ "$aqi" -lt 200 ]; then
        aqi_cl="%{Fcc0033}滑 ""$aqi""%{Ff1f1f1}"
        elif [ "$aqi" -lt 300 ]; then
        aqi_cl="%{F660099}滑 ""$aqi""%{Ff1f1f1}"
        else
        aqi_cl="%{F7e0023}滑 ""$aqi""%{Ff1f1f1}"
        fi
    echo "$aqi_cl"
    else
        echo "$aqi" | jq -r '.data'
    fi
fi
