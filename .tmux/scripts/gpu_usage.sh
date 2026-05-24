#!/bin/bash

# 1. Exit silently if nvidia-smi fails or is unavailable
if ! nvidia-smi > /dev/null 2>&1; then
    exit 0
fi

# 2. Fetch GPU stats
stats=$(nvidia-smi --query-gpu=index,utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits 2>/dev/null)

if [ -z "$stats" ]; then
    exit 0
fi

# Count how many GPUs are present
gpu_count=$(echo "$stats" | grep -c "^")

total_util=0
total_mem_used=0
total_mem_total=0
individual_output=""

while IFS=',' read -r idx util mem_used mem_total; do
    idx=$(echo "$idx" | xargs)
    util=$(echo "$util" | xargs)
    mem_used=$(echo "$mem_used" | xargs)
    mem_total=$(echo "$mem_total" | xargs)

    if ! [[ "$util" =~ ^[0-9]+$ ]]; then util=0; fi

    total_util=$((total_util + util))
    total_mem_used=$((total_mem_used + mem_used))
    total_mem_total=$((total_mem_total + mem_total))

    used_gb=$((mem_used / 1024))
    tot_gb=$((mem_total / 1024))
    individual_output+="${idx}:${util}% ${used_gb}/${tot_gb}G "
done <<< "$stats"

# 3. Format the final text
if [ "$gpu_count" -gt 2 ]; then
    avg_util=$((total_util / gpu_count))
    agg_used_gb=$((total_mem_used / 1024))
    agg_total_gb=$((total_mem_total / 1024))
    final_text="Tot: ${avg_util}% ${agg_used_gb}/${agg_total_gb}G"
else
    final_text="${individual_output% }"
fi

# 4. Apply Catppuccin Mocha Styling directly
# Colors: Teal, Crust (Dark Background), Surface0 (Lighter Background), Text (Foreground)
PREFIX="#[fg=#94e2d5,bg=default]#[fg=#11111b,bg=#94e2d5]󰢮 #[fg=#cdd6f4,bg=#313244] "
SUFFIX=" #[bg=default]"

echo "${PREFIX}${final_text}${SUFFIX}"
