#!/bin/bash

# Simple MountEFI script
echo "-----------------------------------"
echo "    MountEFI Utility for macOS     "
echo "-----------------------------------"

# List all available disks
diskutil list

echo ""
echo "Enter the disk identifier for the EFI you want to mount (e.g., disk0s1):"
read diskID

# Check if input is empty
if [ -z "$diskID" ]; then
    echo "Error: No disk identifier provided."
    exit 1
fi

# Attempt to mount
echo "Attempting to mount /dev/$diskID..."
sudo diskutil mount /dev/$diskID

if [ $? -eq 0 ]; then
    echo "Successfully mounted $diskID!"
    # Open the EFI folder in Finder
    open /Volumes/EFI
else
    echo "Failed to mount $diskID. Check the identifier and try again."
fi
