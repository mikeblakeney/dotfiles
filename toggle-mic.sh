#!/bin/bash

headset=$( cat /proc/asound/cards | grep Headset | head -n1 | awk '{print $1}')

if [[ $headset ]]
then
  amixer -c $headset -q sset Mic toggle
else
  amixer -c 0 -q sset Capture toggle
fi


