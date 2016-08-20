#!/bin/bash

headset=$( cat /proc/asound/cards | grep Headset | head -n1 | awk '{print $1}')

if [[ $headset ]]
then
  amixer -c $headset -q sset Headphone,0 toggle
else
  amixer -c 0 -q sset Master,0 toggle
fi
