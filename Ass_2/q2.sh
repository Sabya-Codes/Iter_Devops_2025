#!/bin/bash
echo "Write a Bash script to print the name of the the person who last logged into thesystem. From the home folder find out (if any) files for which this person is the
owner. Can you find the total login time of this user"

var1=$(who | awk '{print $1}')
echo "User $var1"
login_time=$(who | awk '{print $4}')
echo "$login_time"
# Extract hours and minutes from login_time
login_hour=${login_time%:*}
login_min=${login_time#*:}

# Get current time hours and minutes
current_hour=$(date +%H)
current_min=$(date +%M)

# Convert both times to total minutes from midnight
login_total_min=$((10#$login_hour * 60 + 10#$login_min))
current_total_min=$((10#$current_hour * 60 + 10#$current_min))

# Calculate difference in minutes
diff_min=$((current_total_min - login_total_min))

# Handle negative difference (crossing midnight)
if (( diff_min < 0 )); then
  diff_min=$((diff_min + 24*60))
fi

# Convert difference back to HH:MM
diff_hours=$((diff_min / 60))
diff_minutes=$((diff_min % 60))

printf "User has been logged in for: %02d:%02d (HH:MM)\n" "$diff_hours" "$diff_minutes"
