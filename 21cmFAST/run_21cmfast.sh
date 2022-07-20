#!/bin/sh
### Note: No commands may be executed until after the #PBS lines
### Account information
#PBS -W group_list=ku_00154 -A ku_00154
### Job name (comment out the next line to get the name of the script used as the job name)
#PBS -N make_lightcones
### Output files (comment out the next 2 lines to get the job name used instead)
##PBS -e make_lightcones.err
##PBS -o make_lightcones.log
### Only send mail when job is aborted or terminates abnormally
#PBS -m n
### Number of nodes
#PBS -l nodes=1:ppn=4:thinnode # important!!!
### Memory
#PBS -l mem=128gb
### Requesting time - format is <days>:<hours>:<minutes>:<seconds> (here, 20 hours)
##PBS -l walltime=12:00:00
#PBS -l walltime=00:20:00:00
# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR
### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

# Load all required modules for the job
module load tools anaconda3/2021.05

# Activate the conda environment (for some reason only `source activate` works)
# need to use full path here, not just 21cmfast
export PATH=/home/projects/ku_00155/apps/modulefiles/.conda/bin
source activate /home/projects/ku_00155/apps/modulefiles/.conda/envs/21cmfast

# Get most up-to-date project code
cd /home/projects/ku_00155/apps/21cmfish/
git pull

# Run the command (match number of nodes above!)
python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/ETHOS.config --num_cores 4 --h_PEAK 0 --random_seed 12345
