#!/bin/bash

[ -n "$SLURM_JOB_ID" ] || { echo "No job id!"; exit 1; }

(
workdir=$(scontrol show job "$SLURM_JOB_ID" | sed 's/.*\( \|^\)WorkDir=\([^ ]*\)\( \|$\).*/\2/p;d')
container_config="${workdir}/container_config.json"

if [ -d "$workdir" -a -f "$container_config" ]; then
    container_id=$(jq -r '.container_name'  "$container_config")
    docker kill "$container_id"
fi
) 2>&1 >/dev/null #>/tmp/epilog."$SLURM_JOB_ID"

exit 0
