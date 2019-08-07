# Dask workers on Comet

## Launch scheduler

The scheduler needs to be launched on the same computing node used by the Notebook
so that we can connect easily from the Notebook to it.
The simpler way is to use the Terminal inside JupyterLab, open it and run:

    bash launch_scheduler.sh

Leave this running and look later for the workers connecting.

## Launch workers

In order to launch workers you need to have access to `SLURM` commands, unfortunately
the Singularity container we are using does not have them.
So get a terminal on the login node and submit the dask workers job.

    sbatch dask_workers.slrm

Look at the scheduler terminal and check for logs of the workers connecting as soon
as the job starts.

## Send jobs to the workers

See the Notebooks on how to create a `distributed.Client` object to connect from
the Notebook to the scheduler.
