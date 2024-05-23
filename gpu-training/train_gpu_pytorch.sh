#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres gpu:rtx:1
#SBATCH --mem-per-gpu=8G
#SBATCH --no-requeue

#see https://github.com/HEP-KBFI/singularity/blob/master/README.md
#to read about how to install additional packages
IMG=/home/software/singularity/pytorch.simg\:2024-04-30

cd ~/code-examples/gpu-training
env
apptainer exec -B /scratch/persistent --nv $IMG python3 train_pytorch.py


