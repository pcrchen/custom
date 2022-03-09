#!/usr/bin/bash

SLURM_JOB_ID="$1"

echo ""
echo "Slurm Job General information"
sacct -j "$SLURM_JOB_ID" --format="JobID, JobName, Priority, State, ExitCode, User"
echo ""
echo "Time"
sacct -j "$SLURM_JOB_ID" --format="JobID, Elapsed, Timelimit, Submit, Eligible, End"
echo ""
echo "CPU"
sacct -j "$SLURM_JOB_ID" --format="JobID, ReqCPUS, AllocCPUS, Partition"
echo ""
echo "Memory"
sacct -j "$SLURM_JOB_ID" --format="JobID, ReqMem, AveRSS, MaxRSS"
