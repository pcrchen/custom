#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=single,lattice
#SBATCH --cpus-per-task=8
#SBATCH --mem=0
#SBATCH --time=48:00:00
#SBATCH --job-name=jobname
#SBATCH --output=slurm-%x-%J.out
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=<username>@ucalgary.ca


# Reads in Bash shell configuration to allow conda activation
source ~/.bashrc

# Activate conda environment
conda activate your_environment

# Commands
Rscript your_R_script.R

# Prints out date and time of completion
date
