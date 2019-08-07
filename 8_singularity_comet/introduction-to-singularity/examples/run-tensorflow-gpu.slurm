#!/usr/bin/env bash

#SBATCH --job-name="tensorflow-gpu-example"
#SBATCH --account=use300
#SBATCH --partition=gpu-shared
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00
#SBATCH --no-requeue
#SBATCH --output="tensorflow-gpu-example.o%j.%N"

declare -xr SINGULARITY_MODULE='singularity/2.6.1'
declare -xr SINGULARITY_IMAGE_DIR='/share/apps/gpu/singularity/images'

module purge
module load "${SINGULARITY_MODULE}"
module list
printenv

time -p singularity exec "${SINGULARITY_IMAGE_DIR}/tensorflow/tensorflow-gpu.simg" \
  python2 /opt/tensorflow/tensorflow/examples/tutorials/mnist/mnist_deep.py

time -p singularity exec "${SINGULARITY_IMAGE_DIR}/tensorflow/tensorflow-gpu.simg" \
  python3 /opt/tensorflow/tensorflow/examples/tutorials/mnist/mnist_deep.py
