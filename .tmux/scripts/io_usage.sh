#!/bin/bash
# macOS native iostat does not split Read/Write natively. 
# It provides total throughput in MB/s.
# -w 1 (wait 1s) -c 2 (count twice to skip the historical boot average)

iostat -w 1 -c 2 | awk '
NR == 4 {
    total = 0
    # In macOS iostat, MB/s is always every 3rd column (3, 6, 9...)
    for (i=3; i<=NF; i+=3) {
        total += $i
    }
    printf "IO: %.1f MB/s", total
}'
