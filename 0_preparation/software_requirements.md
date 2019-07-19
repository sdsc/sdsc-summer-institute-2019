## Preparing for the Summer Institute: Software Requirements

While many of the hands-on activities will be run on Comet, some sessions require that customized software be installed on your laptop. Please perform the following software installations and file downloads before you arrive. Note: several of the preparation activities will provide information and guidance on how to install the required software components.

## Contents
 * [Preparation: Setting up GitHub Account](#github)
 * [Preparation: Anaconda for Jupyter Notebooks](#anaconda)
 * [Plenary session: An Introduction to Singularity](#singularity)
 * [Plenary session: SeedMe2: Creating data centric websites for researchers and research projects](#seedme)
 * [Parallel sessions: Machine Learning Overview](#mach-learn)
 * [Parallel session: Scientific visualization with Visit ](#visit)


### Preparation: Setting up GitHub Account  <a name="github"></a>
Tutorial material and software will be available via a GitHub repository that anyone can clone (download). Make sure your laptop can run git. See the GitHub guide here:  [https://help.github.com/en/articles/set-up-git](https://help.github.com/en/articles/set-up-git). 

### Preparation: Anaconda for Jupyter Notebooks <a name="anaconda"></a>
Some sessions and tutorials will be using Jupyter Notebooks. To learn more, see Jupyter/IPython Notebook Quick Start Guide:
[https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/index.html](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/index.html)

The Jupyter Notebook App can be installed using a scientific python distribution which also includes scientific python packages. The most common distribution is called Anaconda. To download:
[https://www.anaconda.com/download/](https://www.anaconda.com/download/)

### Preparation: Install VirtualBox for *An Introduction to Singularity*: <a name="singularity"></a>

If you plan to attend the introductory training session on [Singularity](https://singularity.lbl.gov/)
containers, we will be building some example containers. Unfortuntely, there is
not a stable version of Singularity for Mac OS X or Windows operating systems at
this time. It is a purely Linux-based tool. As such, if you will be
working on a Mac or Windows laptop during this session, your will need
to download and install [VirtualBox](https://www.virtualbox.org/) on
your laptop. This will allow you to run a Linux-based virtual machine on
your Mac or Windows system.

After installation and prior to attending the Summer Institute, we also
recommend the you attempt to work through the first steps to creating
and running your first (Linux) virtual machine as outlined in the
[VirtualBox User Manual](https://www.virtualbox.org/manual/ch01.html).

We recommend you create your Linux virtual machine using either the
[Ubuntu 16.04 LTS](http://releases.ubuntu.com/16.04/ubuntu-16.04.6-desktop-amd64.iso) or [CentOS 7](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1810.iso) operating system distributions.

### Plenary session: SeedMe2: Creating data centric websites for researchers and research projects <a name="seedme"></a>

All participants should take the following steps.

* [Download](https://www.docker.com/community-edition) and install Docker community edition for your operating system
    * Test if docker setup works on [linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-from-a-package) or [mac](https://docs.docker.com/docker-for-mac/#explore-the-application) or [windows](https://docs.docker.com/docker-for-windows/#explore-the-application)
+ [Download](https://dibbs.seedme.org/sites/dibbs.seedme.org/files/docker-images/seedme-workshop-2018-begin.tar.gz) begin docker image, this will be used to get started with the tutorial
+ [Download](https://dibbs.seedme.org/sites/dibbs.seedme.org/files/docker-images/seedme-workshop-2018-final.tar.gz) final docker image, this is a fully configured sandbox website 

### Parallel session: Machine Learning Overview (scheduled opposite Scientific Visualization with Visit) <a name="mach-learn"></a>

Participants who will be attending the Machine Learning Overview parallel session on Tuesday morning will need to install R (https://www.r-project.org/) and RStudio Desktop open source edition (https://www.rstudio.com/) on their laptops. Notes on using R on Comet can be found here:
[https://github.com/sdsc/sdsc-summer-institute-2018/blob/master/0_preparation/RStudio on Comet_07-18-2018.pdf](https://github.com/sdsc/sdsc-summer-institute-2018/blob/master/0_preparation/RStudio on Comet_07-18-2018.pdf)

A basic understanding of R will be very helpful and we recommend the following resources:

* https://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
* https://cran.r-project.org/doc/manuals/r-release/R-intro.html


### Parallel session: Scientific visualization with Visit (scheduled opposite Machine Learning Overview) <a name="visit"></a>

Participants who will be attending the Scientific visualization with Visit session on Thursday morning should make the following preparations.

* Computer, mouse with scroll wheel are required (tablets are not sufficient for this tutorial).

* [Download](https://wci.llnl.gov/simulation/computer-codes/visit/executables) and install VisIt version 3.0.1 (**the latest version**). Please do not compile from source unless you are adventurous

* Test run VisIt application on your laptop to make sure it works

* Download sample data: [visit_data_files.tar.gz](https://wci.llnl.gov/content/assets/docs/simulation/computer-codes/visit/visit_data_files.tar.gz). Unzip to your desktop

* Download [Comet host profile for VisIt-3.0.x](http://users.sdsc.edu/~amit/comet/visit3.0.x-comet-host-profile.zip).  
    Unzip and copy this file as follows  
    Linux and Mac: ~/.visit/hosts/  
    Windows: C:/users/username/Documents/visit/hosts/   
    Restart VisIt

