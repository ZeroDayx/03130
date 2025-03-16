#!/bin/bash

# Path to your XMRig executable
XMRIG_PATH="./x"  # Adjust this path if necessary
CONFIG_FILE="config.json"  # Your XMRig config file

# Function to start XMRig
start_xmrig() {
    echo "Starting XMRig..."
    $XMRIG_PATH --config $CONFIG_FILE --background
}

# Start XMRig for the first time
start_xmrig

# Infinite loop to monitor XMRig
while true; do
    # Check if XMRig is running
    if ! pgrep -x "xmrig" > /dev/null; then
        echo "XMRig has stopped. Restarting..."
        start_xmrig
    else
        echo "XMRig is running."
    fi
    # Wait for a few seconds before checking again
    sleep 5
done