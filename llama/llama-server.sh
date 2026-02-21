#!/bin/bash
# Submit job to GPU partition
#SBATCH -p gpu
# Request 1 A100 GPU
#SBATCH --gres gpu:a100:1
# Allocate 64GB memory per GPU
#SBATCH --mem-per-gpu=64G

# Path to Singularity image
IMG=/home/software/singularity/llama-server.simg
# Run llama-server with model path
apptainer exec -B /home --env LD_LIBRARY_PATH=/app --nv $IMG /app/llama-server --model /home/joosep/models/Devstral-Small-2-24B-Instruct-2512-Q8_0.gguf
