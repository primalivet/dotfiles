diskusage=$(df --human-readable / | tail --lines=1)
diskusage_used=$(echo $diskusage | awk '{print $3}')
diskusage_avail=$(echo $diskusage | awk '{print $4}')
diskusage_formatted=$(echo DISK:$diskusage_used\/$diskusage_avail)

memusage=$(free --human | grep Mem)
memusage_used=$(echo $memusage | awk '{print $3}')
memusage_avail=$(echo $memusage | awk '{print $2}')
memusage_formatted=$(echo MEM:$memusage_used\/$memusage_avail)

cpu_load=$(uptime | awk -F'load average:' '{print $2}' | sed 's/^ *//')
cpu_cores=$(nproc)
cpu_formatted=$(echo CPU:$cpu_cores[$cpu_load])

uptime_formatted=UP:$(uptime | cut -d ',' -f1  | cut -d ' ' -f5,6)
date_formatted=$(date "+%X")
echo $cpu_formatted $uptime_formatted $diskusage_formatted $memusage_formatted $date_formatted 

