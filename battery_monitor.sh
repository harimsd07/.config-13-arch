#!/bin/bash

# Set initial "last known" level high so it triggers correctly the first time
LAST_NOTIFIED=100

while true; do
    # Auto-detect battery path (usually BAT0 or BAT1)
    BATTERY_PATH=$(find /sys/class/power_supply/ -name "BAT*" | head -n 1)

    # Get status and capacity
    STATUS=$(cat "$BATTERY_PATH/status")
    CAPACITY=$(cat "$BATTERY_PATH/capacity")

    # Logic: Reset tracker if charging
    if [ "$STATUS" != "Discharging" ]; then
        LAST_NOTIFIED=100
    else
        # Only trigger if battery is 20% or lower
        if [ "$CAPACITY" -le 20 ]; then

            # Trigger at 20%
            if [ "$CAPACITY" -le 20 ] && [ "$LAST_NOTIFIED" -gt 20 ]; then
                notify-send -u critical -t 5000 "⚠️ Low Battery" "Battery is at 20%"
                LAST_NOTIFIED=20

            # Trigger at 15%
            elif [ "$CAPACITY" -le 15 ] && [ "$LAST_NOTIFIED" -gt 15 ]; then
                notify-send -u critical -t 5000 "⚠️ Low Battery" "Battery is at 15%"
                LAST_NOTIFIED=15

            # Trigger at 10%
            elif [ "$CAPACITY" -le 10 ] && [ "$LAST_NOTIFIED" -gt 10 ]; then
                notify-send -u critical -t 7000 "⚠️ Critical Battery" "Battery is at 10%. Find a charger!"
                LAST_NOTIFIED=10

            # Trigger at 5% (Emergency)
            elif [ "$CAPACITY" -le 5 ] && [ "$LAST_NOTIFIED" -gt 5 ]; then
                notify-send -u critical -t 0 "🔥 BATTERY DYING" "System will shut down soon (5%)"
                LAST_NOTIFIED=5
            fi
        fi
    fi

    # Check every 30 seconds
    sleep 30
done
