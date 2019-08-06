#!/usr/bin/env bash

#SBATCH --job-name="meep-example"
#SBATCH --account=use300
#SBATCH --partition=debug
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=24
#SBATCH --time=00:30:00
#SBATCH --no-requeue
#SBATCH --output="meep-example.o%j.%N"

declare -xr COMPILER_MODULE='gnu/4.9.2'
declare -xr MPI_MODULE='openmpi_ib/1.8.4'
declare -xr SINGULARITY_MODULE='singularity/2.6.1'

declare -xr SINGULARITY_IMAGE_DIR='/share/apps/compute/singularity/images'

module purge
module load "${COMPILER_MODULE}"
module load "${MPI_MODULE}"
module load "${SINGULARITY_MODULE}"
module list
printenv

time -p ibrun singularity exec "${SINGULARITY_IMAGE_DIR}/meep/meep.simg" \
  meep /opt/meep/scheme/examples/parallel-wvgs-force.ctl
