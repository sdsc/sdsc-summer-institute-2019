# SDSC Summer Institute Topic: Accessing and Running Jobs on Comet
Presented by Mary Thomas (SDSC,  <mthomas@sdsu.edu> )
<hr>

## Presented by Mary Thomas (SDSC,  <mthomas@sdsc.edu> )
### Monday,  August 5, 2019


In this tutorial, you will learn how to compile and run jobs on Comet, where to run them, and how to run batch jobs for MPI, OpenMP, and GPU/CUDA examples.

<a name="top">Available Training Material:

* Self-guided tutorial: [running-jobs.md](running-jobs.md)  
* Webinar Presentation: [Running-Jobs-on-Comet.pdf](Running-Jobs-on-Comet.pdf)
* Preparation Materials: https://github.com/sdsc/sdsc-summer-institute-2019/tree/master/0_preparation


## Requirements & Notes:
* You must have a comet account in order to access the system. 
* You can obtain a trial account:  http://www.sdsc.edu/support/user_guides/comet.html#trial_accounts
* The `hostname` for Comet is `comet.sdsc.edu`

## Getting Interactive Nodes on Comet:
* First log onto Comet using your SI19 account.
* Run these aliases:
  * getcpu[1234]  - one compute node for 1/2/3/4 hours
  * getgpu[1234]  - one gpu node for  1/2/3/4 hours
* For SI19/This week only
* General interactive node command:
  * srun --pty --nodes=1 --ntasks-per-node=24 -p compute -t 00:30:00 --wait 0 /bin/bash
