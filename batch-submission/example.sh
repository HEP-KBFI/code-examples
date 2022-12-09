#!/bin/bash
#SBATCH -p short
#SBATCH --no-requeue

IMG=/home/software/singularity/base.simg

cd ~/code-examples/batch-submission
singularity exec $IMG python3 example.py
