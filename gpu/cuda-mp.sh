#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres gpu:rtx:4
#SBATCH --mem-per-gpu=8G
#SBATCH --no-requeue

env

IMG=/home/software/singularity/base.simg

cd ~/code-examples/gpu
singularity exec --nv $IMG python3 cuda-mp.py 
