#!/bin/bash
# iostat -d -k 1 2 runs twice (1 second apart).
# We use awk to grab ONLY the second output block (live data).

iostat -d -k 1 2 | awk '
# Function to convert KB into dynamically scaled K, M, or G
function format_size(kb) {
    if (kb >= 1048576) {
        return sprintf("%.1fG", kb / 1048576)
    } else if (kb >= 1024) {
        return sprintf("%.1fM", kb / 1024)
    } else {
        return sprintf("%.0fK", kb)
    }
}

BEGIN { read=0; write=0; block=0 }
/^Device/ { block++ }
/^[a-zA-Z0-9]/ {
    # Only process the second block of output, ignore loops/cd-roms
    if (block == 2 && $1 != "Device" && $1 !~ /^loop/ && $1 !~ /^sr/) {
        read += $3
        write += $4
    }
}
END {
    # Define Catppuccin Mocha Mauve styling directly
    prefix = "#[fg=#cba6f7,bg=default]#[fg=#11111b,bg=#cba6f7]󰋊 #[fg=#cdd6f4,bg=#313244] "
    suffix = " #[bg=default]"

    # Print with styling
    printf "%sR: %s W: %s%s\n", prefix, format_size(read), format_size(write), suffix
}'
