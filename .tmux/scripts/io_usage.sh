#!/bin/bash
# Aggregates read and write stats across all disks.
# Guarantees an output of "R: 0K W: 0K" even when completely idle.

iostat -d -k 1 1 | awk '
BEGIN { read=0; write=0 }
/^[a-zA-Z]/ {
    # Ignore the header and virtual loop/optical drives
    if ($1 != "Device" && $1 !~ /^loop/ && $1 !~ /^sr/) {
        read += $3
        write += $4
    }
}
END {
    # Added spaces for breathing room in the tmux bar
    printf " R: %.0fK W: %.0fK ", read, write
}'

