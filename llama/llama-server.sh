#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres gpu:l40:2
#SBATCH --mem=80G
#SBATCH --cpus-per-task=16

#    --model /scratch/persistent/joosep/hf_hub/google_gemma-4-31B-it-Q4_K_L.gguf \
#    --model /scratch/persistent/joosep/hf_hub/google_gemma-4-31B-it-Q8_0.gguf \

IMG=/home/software/singularity/llama-server.simg
apptainer exec -B /scratch \
    --env LD_LIBRARY_PATH=/app \
    --env HF_HUB_CACHE=/scratch/persistent/joosep/hf_hub \
    --nv \
    $IMG /app/llama-server \
    --model /scratch/persistent/joosep/hf_hub/google_gemma-4-31B-it-Q8_0.gguf \
    --port 38080 \
    --ctx-size 256000 \
    --temp 1.0 \
    --top-p 0.95 \
    --top-k 64 \
    --threads-batch 16 \
    --chat-template-kwargs '{"enable_thinking":true}' \
    --cache-ram 2560 --ctx-checkpoints 1
