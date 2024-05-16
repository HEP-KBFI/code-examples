#!/bin/bash
#SBATCH -p short
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 8

set -x

env

#for some reason, mpirun with --host localhost:$SLURM_CPUS_PER_TASK does not work
#instead, if we allow mpirun to oversubscribe, because slurm has booked the CPUs for us 
singularity exec --env HWLOC_COMPONENTS=-gl /home/software/singularity/base.simg mpirun -np $SLURM_CPUS_PER_TASK --oversubscribe example
