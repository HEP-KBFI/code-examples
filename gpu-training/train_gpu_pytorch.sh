#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres gpu:mig:1
#SBATCH --mem-per-gpu=8G
#SBATCH --no-requeue

#see https://github.com/HEP-KBFI/singularity/blob/master/README.md
#to read about how to install additional packages
IMG=/home/software/singularity/pytorch.simg\:2025-11-01

cd ~/code-examples/gpu-training
env
apptainer exec --nv $IMG python3 train_pytorch.py


