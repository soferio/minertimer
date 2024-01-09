#!/bin/zsh

###
# Script to place the minertimer files where they belong and to give appropriate permissions etc
# The script needs to be run from an Administrator account with Administrator privileges using SUDO
# Copyright Soferio Pty Ltd
###

# Step 1: Remove Minertime script w

rm /Users/Shared/minertimer/minertimer.sh

# Step 2: Remove PLIST file 

rm /Library/LaunchDaemons/com.soferio.minertimer_daily_timer.plist

# Step 3: Unregister the minertimer as a background task

launchctl bootout system/com.soferio.minertimer_daily_timer

# Step 4: Remove log file
rm /var/lib/minertimer/minertimer_playtime.log




# TO CHECK IF SCRIPT IS RUNNING:
# sudo launchctl list | grep soferio

