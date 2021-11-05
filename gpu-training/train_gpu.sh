#!/bin/bash
#SBATCH -p gpu
#SBATCH --gpus 1
#SBATCH --mem-per-gpu=8G
#SBATCH --no-requeue
IMG=/home/software/singularity/tf26.simg:latest
cd ~/code-examples/gpu-training
singularity exec -B /scratch-persistent --nv $IMG python3 train.py


