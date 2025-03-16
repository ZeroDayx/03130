#!/bin/bash

# Create a log file
LOGFILE="x_miner.log"

# Function to start the miner
start_miner() {
    echo "Starting x..."
    ./x >> "$LOGFILE" 2>&1
}

# Main loop
while true; do
    start_miner
    echo "x has stopped. Restarting in 5 seconds..." | tee -a "$LOGFILE"
    sleep 5
done
