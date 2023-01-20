#!/bin/bash
#SBATCH -p short
#SBATCH --no-requeue
set -e

env
df -h

ls -al /scratch
echo "bla" > /scratch/$USER/test.rxt
cat /scratch/$USER/test.rxt
