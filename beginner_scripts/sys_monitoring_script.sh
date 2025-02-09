# creating a log filr to store the output
log_file=system_status.log

# initialize the log file
> "$log_file"

# checking the disk space usage
echo "checking the disk usage....."
df -h >> "$log_file" # using disk fikesystem command and displaying in human readable format -h

# cpu usage
cpu_usage=$(top -b | grep "Cpu(s)") >> "$log_file" # top shows the realtime data
                            # -b is for batch mode (non interactive)
echo "checking the CPU usage..... \n CPU usage is : $cpu_usage"
                            # -n1 is for running the command only once
idle_cpu=$(echo "$cpu_usage" | awk '{print $2}')
# Uses awk to extract:
# User CPU ($2)
# System CPU ($4)
# Idle CPU ($8)
# I/O Wait ($10)
# if id is low, cpu usage is high
# means if id is 79 then cpu usage i low

# memory usage
echo "checking the memory usage....."
free -m >> "$log_file" # -m shows the data in MegaBytes
                       # free shows the RAM usage

# sending an alert to the system if cpu performance goes beyond 80%
if [ idle_cpu < 20 ]; then
        echo "Alert! CPU usage is beyond 80%"
        notify-send "High CPU usage alert ! $cpu_usage"
else
        echo "CPU usage is $cpu_usage, which is normal"
