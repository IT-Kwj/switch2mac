#!/bin/zsh
# Summary of a host log: frame rate, slow frames (CPU vs GPU), warnings, memory. Usage: tools/porting/perf.sh [log]  (default: the newest log in ~/Library/Logs/nxnative)
L=${1:-$(ls -t ~/Library/Logs/nxnative/*.log | grep -v prev | head -1)}
echo "Log: $L"
grep -o '([0-9.]* fps)' "$L" | tr -d '(fps)' | awk '{s+=$1; n++; if(!mn||$1<mn)mn=$1; if($1>mx)mx=$1} END{if(n) printf "Frame rate: average %.1f fps, lowest %.1f, highest %.1f (%d samples, every 300 frames)\n", s/n, mn, mx, n; else print "Frame rate: no samples yet"}'
grep '\[longframe\]' "$L" | sed -E 's/.*whole frame ([0-9.]+) ms, submit\+present ([0-9.]+) ms, GPU ([0-9.]+) ms.*/\1 \2 \3/' | awk '$1>20 {w+=$1; s+=$2; g+=$3; n++; if($1>mx)mx=$1} END{if(n) printf "Slow frames: %d, average %.1f ms (worst %.1f): CPU submit+present %.1f ms, GPU %.1f ms\n", n, w/n, mx, s/n, g/n}'
grep -o 'CPU [0-9]*% (100 = one core)' "$L" | tail -1 | sed 's/^/Last CPU use: /'
grep -o 'largest so far [0-9]* groups' "$L" | tail -1 | sed 's/^/Mesh draws: /'
printf 'Warnings: %s RED lines, GPU errors: %s\n' "$(grep -c RED "$L")" "$(grep -c 'command buffer execution error\|OutOfMemory' "$L")"
grep -o 'footprint [0-9]* MiB' "$L" | awk '{print $2}' | sort -n | awk '{a[NR]=$1} END{if(NR) printf "Memory (process footprint): median %.1f GB, highest %.1f GB (goal: under 16 GB)\n", a[int((NR+1)/2)]/1024, a[NR]/1024}'
grep -o 'GPU allocated [0-9]* MB' "$L" | awk '{print $3}' | sort -n | tail -1 | awk '{printf "Metal allocations, highest seen: %.1f GB\n", $1/1024}'
