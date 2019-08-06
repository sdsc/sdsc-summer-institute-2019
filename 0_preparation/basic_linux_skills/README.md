# Preparing for the Summer Institute:  Basic Linux Skills
[//]: # " Comment example "

[//]: # ( Comment2 )

When you log on to Comet, your computer operating system will be a Unix shell. \"_A Unix shell is a command-line interpreter or shell that provides a traditional Unix-like command line user interface. This environment is very different from the easy to use GUI interfaces we have all become used in the Windows and MacOS systems_\" (https://en.wikipedia.org/wiki/Unix_shell).

Basic Linux skills are necessary to complete the hands-on exercises. If it’s been a while since you’ve worked in a Linux environment, be sure to reacquaint yourself with the following topic (many of which are demonstrated below)s: copying, listing, deleting and renaming files; using wildcards; navigating directories; changing file permissions; setting environment variables; using common utilities (grep, cat, less, head, sort, tar, gzip). A nice tutorial can be found here http://www.ee.surrey.ac.uk/Teaching/Unix/. You should also be comfortable with one of the standard Linux editors, such as vim, emacs, or nano.

You should also be comfortable with one of the standard Linux editors, such as vim, emacs, or nano.

Notes:
* For the examples below, we are using the `bash` shell, which is the default shell for new accounts on Comet. For the purposes of the Institute exercises, please do not change the shell.

<a name="top">**Examples::**
* [Basic Environment](#basic-env)
* [Directories and Navigation](#dirs-and-nav)
* [Files](#files)
* [Permissions](#permissions)
* [Wildcards](#wildcards)
* [Common Utilities](#common-utilities)


Note: if you have difficulties completing this task, please contact Institute staff at <consult@sdsc.edu>.
<hr>

## <a name="basic-env">Basic Environment</a>
Using Unix commands, we can learn a lot about the machine we are logged onto. Some of the commands are simple:

```
[mthomas@comet-ln2 ~]$ date
Tue Jul 17 18:54:37 PDT 2018
[mthomas@comet-ln2 ~]$ hostname
comet-ln2.sdsc.edu
[mthomas@comet-ln2 ~]$ whoami
mthomas
```
Note: To learn about most unix commands, try accessing the `man` pages:
``` sh
[mthomas@comet-ln2 ~]$ man date

NAME
       date - print or set the system date and time

SYNOPSIS
       date [OPTION]... [+FORMAT]
       date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

DESCRIPTION
       Display the current time in the given FORMAT, or set the system date.
       ..... more info .....
```

The unix command `env` will print out the _environment_ settings for your login session.
The list below is an edited summary of all the information
```
[mthomas@comet-ln2 ~]$ env
HOSTNAME=comet-ln2.sdsc.edu
TERM=xterm-256color
SHELL=/bin/bash
HISTSIZE=1000
SSH_CLIENT=169.228.90.10 53640 22
LIBRARY_PATH=/opt/intel/composer_xe_2013_sp1.2.144/compiler/lib/intel64:/opt/intel/composer_xe_2013_sp1.2.144/ipp/../compiler/lib/intel64:/opt/intel/composer_xe_2013_sp1.2.144/ipp/lib/intel64:/opt/intel/composer_xe_2013_sp1.2.144/compiler/lib/intel64:/opt/intel/composer_xe_2013_sp1.2.144/mkl/lib/intel64:/opt/intel/composer_xe_2013_sp1.2.144/tbb/lib/intel64/gcc4.4
USER=mthomas
CPATH=/opt/intel/composer_xe_2013_sp1.2.144/ipp/include:/opt/intel/composer_xe_2013_sp1.2.144/mkl/include:/opt/intel/composer_xe_2013_sp1.2.144/tbb/include
PWD=/home/mthomas
MODULEPATH=/opt/modulefiles/mpi/.intel:/opt/modulefiles/applications/.intel:/opt/modulefiles/mpi:/opt/modulefiles/compilers:/opt/modulefiles/applications:/usr/share/Modules/modulefiles:/etc/modulefiles
LOADEDMODULES=intel/2013_sp1.2.144:mvapich2_ib/2.1:gnutools/2.69
HOME=/home/mthomas
SDSCHOME=/opt/sdsc
LOGNAME=mthomas
SSH_CONNECTION=169.228.90.10 53640 198.202.113.253 22
DISPLAY=localhost:24.0
```
It is often useful to print out (or use) environment variables. To print them out, use the `echo` command, and `$` sign (which extracts the value of the shell variable):
```
[mthomas@comet-ln2 ~]$ echo $SHELL
/bin/bash
[mthomas@comet-ln2 ~]$ echo $HOME
/home/mthomas
```
Another important environment variable is the home directory variable, the \"tilde\" character:  `~`
```
[mthomas@comet-ln2 testdir]$ echo ~
/home/mthomas
[mthomas@comet-ln2 testdir]$
```
You can create your own environment variables:
```
[mthomas@comet-ln2 ~]$ MY_NAME="Mary Thomas"
[mthomas@comet-ln2 ~]$ echo $MY_NAME
Mary Thomas
```

Unix has the concept of users and groups. Users can be in more than one group. To see which groups you are a member of, use the `group` command:
```
[mthomas@comet-ln2 OPENMP]$ groups
use300 pet heart scicom-docs grdclus webwrt scwpf ...
```

[Back to Top](#top)
<hr>

## <a name="dirs-and-nav">Directories and Navigation</a>
In unix, everything is a file, which can be confusing at first. The locations for where files are stored are also called directories (which is equivalent to folders). To find out where you are in the system, use the `pwd` command, which prints the full path to the current/working directory:
```
[mthomas@comet-ln2 ~]$ pwd
/home/mthomas
```
To see what are the contents of the directory, use the file listing command `ls`
```
[mthomas@comet-ln2 ~]$ ls
filelisting.txt intel   loadgccomgnuenv.sh  loadgnuenv.sh	loadintelenv.sh  tools
```
In every Unix directory, there are \"hidden\" files (just like on Macs and Windows machines), to see them, run the `ls -a` command:
```
[mthomas@comet-ln2 ~]$ ls -a
.	.bash_history  .bashrc	 .gitconfig  loadgccomgnuenv.sh  .ncviewrc     .ssh	 .vimrc
..	.bash_logout   .config filelisting.txt	 intel	     loadgnuenv.sh	 .petscconfig  tools	 .Xauthority
.alias	.bash_profile    .kshrc      loadintelenv.sh	 .slurm        .viminfo
```
In Unix, sometimes it is hard tell if a file is also a directory. To see file details (including timestamp and size), run the `ls -l` command:
```
[mthomas@comet-ln2 ~]$ ls -l
-rw-r--r-- 1 mthomas use300 1543 Jul 17 21:04 filelisting.txt
drwxr-xr-x 3 mthomas use300   3 Jun 22  2017 intel
-rwx------ 1 mthomas use300 101 Jun 27  2017 loadgccomgnuenv.sh
-rwx------ 1 mthomas use300  77 Oct 16  2017 loadgnuenv.sh
-rwxr-xr-x 1 mthomas use300 125 Oct 16  2017 loadintelenv.sh
drwxr-xr-x 2 mthomas use300   4 Jun 30  2017 tools
```
You can combine the two commands above and use it to see the full directory and file information:
```
[mthomas@comet-ln2 ~]$ ls -al
total 166
drwx------   7 mthomas use300    23 Jul 17 19:33 .
drwxr-xr-x 143 root    root       0 Jul 17 20:01 ..
-rw-r--r--   1 mthomas use300  2487 Jun 23  2017 .alias
-rw-------   1 mthomas use300 14247 Jul 17 12:11 .bash_history
-rw-r--r--   1 mthomas use300    18 Jun 19  2017 .bash_logout
-rw-r--r--   1 mthomas use300   176 Jun 19  2017 .bash_profile
-rw-r--r--   1 mthomas use300   159 Jul 17 18:24 .bashrc
drwx------   3 mthomas use300     3 Oct 23  2017 .config
-rw-r--r--   1 mthomas use300  1543 Jul 17 21:04 filelisting.txt
-rw-r--r--   1 mthomas use300  1641 Jun 22  2017 .gccomrc
-rw-r--r--   1 mthomas use300   245 Jun 28  2017 .gitconfig
drwxr-xr-x   3 mthomas use300     3 Jun 22  2017 intel
-rw-r--r--   1 mthomas use300   171 Jun 19  2017 .kshrc
-rwx------   1 mthomas use300   101 Jun 27  2017 loadgccomgnuenv.sh
-rwx------   1 mthomas use300    77 Oct 16  2017 loadgnuenv.sh
-rwxr-xr-x   1 mthomas use300   125 Oct 16  2017 loadintelenv.sh
[snip extra lines]
```
There are several things to notice in the above listing: the first column of data is information about the file "permissions\", which controls who can see/read/modify what files (`r`=read, `w`=write,`x`=execute,`-`=no permission); the next 2 columns are the username and groupID; the 3rd and 4th columns are the size and date. This is discussed in more detail in the [Permissions](#permissions) section below. Also, note that two files have `dots` for their names: in unix the "dot" is a component of a filename. When working with filenames, a leading dot is the prefix of a "hidden" file, a file that an `ls` will not normally show. But also, the single dot, `.` represents the current working directory, and the double dots, `..` represent the directory above. You use these as arguments to unix commands dealing with directories.

To create directories, use the `mkdir`, make directory command:
```
[mthomas@comet-ln2 ~]$ mkdir testdir
[mthomas@comet-ln2 ~]$ ls -l
total 12
drwxr-xr-x 3 mthomas use300   3 Jun 22  2017 intel
-rwx------ 1 mthomas use300 101 Jun 27  2017 loadgccomgnuenv.sh
-rwx------ 1 mthomas use300  77 Oct 16  2017 loadgnuenv.sh
-rwxr-xr-x 1 mthomas use300 125 Oct 16  2017 loadintelenv.sh
drwxr-xr-x 2 mthomas use300   2 Jul 17 20:49 testdir
drwxr-xr-x 2 mthomas use300   4 Jun 30  2017 tools
```
To move into that directory, use the `cd`, change directory command:
```
[mthomas@comet-ln2 ~]$ cd testdir/
[mthomas@comet-ln2 testdir]$ ls -al
total 20
drwxr-xr-x 2 mthomas use300  2 Jul 17 20:49 .
drwxr-x--- 9 mthomas use300 25 Jul 17 20:49 ..
[mthomas@comet-ln2 testdir]$
```
From this directory, you can use the `..` command to see the contents of the directory above:

```
[mthomas@comet-ln2 testdir]$ ls -l ..
[mthomas@comet-ln2 testdir]$ /bin/ls -l ..
total 22
drwxr-xr-x 4 mthomas use300    5 Jul 17 20:43 comet-examples
-rw-r--r-- 1 mthomas use300 1543 Jul 17 21:04 filelisting.txt
drwxr-xr-x 3 mthomas use300    3 Jun 22  2017 intel
-rwx------ 1 mthomas use300  101 Jun 27  2017 loadgccomgnuenv.sh
-rwx------ 1 mthomas use300   77 Oct 16  2017 loadgnuenv.sh
-rwxr-xr-x 1 mthomas use300  125 Oct 16  2017 loadintelenv.sh
drwxr-xr-x 2 mthomas use300    4 Jul 17 20:53 testdir
drwxr-xr-x 2 mthomas use300    4 Jun 30  2017 tools
```

[Back to Top](#top)
<hr>

## <a name="files">Manipulating Files</a>

This section will show you how to manipulate files: copying, listing, deleting and renaming
Continuing with the `testdir` we created above, we can create files in many ways. One is to use the `touch` commmand, which will create a file with no contents:
```
[mthomas@comet-ln2 testdir]$ touch myfile1.txt
[mthomas@comet-ln2 testdir]$ touch myfile2.txt
[mthomas@comet-ln2 testdir]$ ls -l
total 21
drwxr-xr-x 2 mthomas use300  4 Jul 17 20:53 .
drwxr-x--- 9 mthomas use300 25 Jul 17 20:49 ..
-rw-r--r-- 1 mthomas use300  0 Jul 17 20:53 myfile1.txt
-rw-r--r-- 1 mthomas use300  0 Jul 17 20:53 myfile2.txt
```

To copy a file from another directory  to the current directory, use the full path. In this example, we will copy the _filelisting.txt_ file from the directory above, using the `..` (\"dot-dot\") variable for the directory location:

```java
[mthomas@comet-ln2 testdir]$ cp ../filelisting.txt .
[mthomas@comet-ln2 testdir]$ ls -l
total 11
-rw-r--r-- 1 mthomas use300 1543 Jul 17 21:09 filelisting.txt
-rw-r--r-- 1 mthomas use300    0 Jul 17 20:53 myfile1.txt
-rw-r--r-- 1 mthomas use300    0 Jul 17 20:53 myfile2.txt
```

To rename a file, use the `mv` (move) command:

```java
[mthomas@comet-ln2 testdir]$ mv myfile2.txt newfile.txt
[mthomas@comet-ln2 testdir]$ ls -l
total 11
-rw-r--r-- 1 mthomas use300 1543 Jul 17 21:09 filelisting.txt
-rw-r--r-- 1 mthomas use300    0 Jul 17 20:53 myfile1.txt
-rw-r--r-- 1 mthomas use300    0 Jul 17 20:53 newfile.txt
```
To delete a file, use the `rm` (remove command):

```java
[mthomas@comet-ln2 testdir]$ rm myfile1.txt
[mthomas@comet-ln2 testdir]$  ls -l
total 10
-rw-r--r-- 1 mthomas use300 1543 Jul 17 21:09 filelisting.txt
-rw-r--r-- 1 mthomas use300    0 Jul 17 20:53 newfile.txt
```

[Back to Top](#top)
<hr>

### Copying directories

A common task in computing is to work with examples and collaborator files. Suppose we want to copy the contents of another directory to our local directory. On Comet, there is a large suite of applications that you can work with. In this example, we will copy the GPU application folder. Suppose you are interested in working with one of the files or directories in the /share/apps/examples/ directory.

First, we will make a folder to hold comet examples and then `cd` into that new directory. This is done using the `mkdir` command:
```
[mthomas@comet-ln2 ~]$ mkdir comet-examples
[mthomas@comet-ln2 ~]$ ls -al            
total 166
drwxr-x---   8 mthomas use300    24 Jul 17 20:20 .
drwxr-xr-x 139 root    root       0 Jul 17 20:17 ..
-rw-r--r--   1 mthomas use300  2487 Jun 23  2017 .alias
-rw-------   1 mthomas use300 14247 Jul 17 12:11 .bash_history
-rw-r--r--   1 mthomas use300    18 Jun 19  2017 .bash_logout
-rw-r--r--   1 mthomas use300   176 Jun 19  2017 .bash_profile
-rw-r--r--   1 mthomas use300   159 Jul 17 18:24 .bashrc
drwxr-xr-x   2 mthomas use300     2 Jul 17 20:20 comet-examples
[snip extra lines]
[mthomas@comet-ln2 ~]$ cd comet-examples/
[mthomas@comet-ln2 comet-examples]$ pwd
/home/mthomas/comet-examples
[mthomas@comet-ln2 comet-examples]$
```

Next, we will look at the directory where the OPENMP code is stored:
```
[mthomas@comet-ln2 ~]$ ls -al /share/apps/examples/OPENMP/
total 740
drwxrwxr-x  2 mahidhar use300   4096 Mar 12 08:54 .
drwxrwxr-x 56 mahidhar use300   4096 May 14 18:11 ..
-rwxr-xr-x  1 mahidhar use300 728112 Apr 15  2015 hello_openmp
-rw-r--r--  1 mahidhar use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-r--r--  1 mahidhar use300    247 Apr 15  2015 hello_openmp.f90
-rw-r--r--  1 mahidhar use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-r--r--  1 mahidhar use300    310 Apr 15  2015 openmp-slurm.sb
-rw-r--r--  1 mahidhar use300    347 Apr 22  2015 openmp-slurm-shared.sb
```
Copies of files and directories use the same command: `cp`. To copy a single file to the `comet-examples` directory, we need to use the full path:

```sh
[mthomas@comet-ln2 comet-examples]$ cp /share/apps/examples/OPENMP/hello_openmp.f90 hello_openmp.f90
[mthomas@comet-ln2 comet-examples]$ ls -al
total 29
drwxr-xr-x 2 mthomas use300   3 Jul 17 20:24 .
drwxr-x--- 8 mthomas use300  24 Jul 17 20:20 ..
-rw-r--r-- 1 mthomas use300 247 Jul 17 20:24 hello_openmp.f90

```
For a large number of files, it is easier to copy the entire directory using the `-R` or `-r` recursive command:

```
[mthomas@comet-ln2 comet-examples]$ cp -r -p /share/apps/examples/OPENMP/ .
[mthomas@comet-ln2 comet-examples]$ ll
total 48
drwxr-xr-x 3 mthomas use300   4 Jul 17 20:26 .
drwxr-x--- 8 mthomas use300  24 Jul 17 20:20 ..
-rw-r--r-- 1 mthomas use300 247 Jul 17 20:24 hello_openmp.f90
drwxr-xr-x 2 mthomas use300   8 Jul 17 20:26 OPENMP
[mthomas@comet-ln2 comet-examples]$ ls -al OPENMP/
total 479
drwxrwxr-x 2 mthomas use300      8 Mar 12 08:54 .
drwxr-xr-x 3 mthomas use300      4 Jul 17 20:32 ..
-rwxr-xr-x 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-r--r-- 1 mthomas use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-r--r-- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rw-r--r-- 1 mthomas use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-r--r-- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb
-rw-r--r-- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb
```
There are several things to observe with this command:
1. The owner of these new files is the user who ran the commands (mthomas).
2. The use of the `-r` argument is a recursive copy, which gets all files in the directory.
3. The use of the `-p` arguement preserves the date/timestamp, which can be helpful but not always required.
4. The use of one of the special _dot_ characters,  \. in the command above: the syntax tells the operating system to copy all contents of the _/share/apps/examples/OPENMP/_ directory to the `.` directory, or the current directory, which in this case is:

```java
[mthomas@comet-ln2 comet-examples]$ pwd
/home/mthomas/comet-examples
[mthomas@comet-ln2 comet-examples]$ ls -al  
total 48
drwxr-xr-x 3 mthomas use300   4 Jul 17 20:32 .
drwxr-x--- 8 mthomas use300  24 Jul 17 20:20 ..
-rw-r--r-- 1 mthomas use300 247 Jul 17 20:24 hello_openmp.f90
drwxr-xr-x 2 mthomas use300   8 Jul 17 20:26 OPENMP
[mthomas@comet-ln2 comet-examples]$ ls -al .
total 48
drwxr-xr-x 3 mthomas use300   4 Jul 17 20:32 .
drwxr-x--- 8 mthomas use300  24 Jul 17 20:20 ..
-rw-r--r-- 1 mthomas use300 247 Jul 17 20:24 hello_openmp.f90
drwxr-xr-x 2 mthomas use300   8 Jul 17 20:26 OPENMP
```
You can also copy a file or directory and give it a new name:
```
[mthomas@comet-ln2 comet-examples]$  cp -r -p /share/apps/examples/OPENMP/ FOOBAR  
[mthomas@comet-ln2 comet-examples]$ ll
total 49
drwxr-xr-x 4 mthomas use300   5 Jul 17 21:19 .
drwxr-x--- 9 mthomas use300  26 Jul 17 21:04 ..
-rw-r--r-- 1 mthomas use300 247 Jul 17 20:24 hello_openmp.f90
drwxrwxr-x 2 mthomas use300   8 Mar 12 08:54 OPENMP
drwxrwxr-x 2 mthomas use300   8 Mar 12 08:54 FOOBAR
[mthomas@comet-ln2 comet-examples]$ ll FOOBAR
total 488
drwxrwxr-x 2 mthomas use300      8 Mar 12 08:54 .
drwxr-xr-x 4 mthomas use300      5 Jul 17 21:19 ..
-rwxr-xr-x 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-r--r-- 1 mthomas use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-r--r-- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rw-r--r-- 1 mthomas use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-r--r-- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb
-rw-r--r-- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb
```
You can rename a directory using the `mv` command:
```
[mthomas@comet-ln2 comet-examples]$ mv FOOBAR/ OPENMP_DUP
[mthomas@comet-ln2 comet-examples]$ /bin/ls -l
total 48
-rw-r--r-- 1 mthomas use300 247 Jul 17 20:24 hello_openmp.f90
drwxrwxr-x 2 mthomas use300   8 Mar 12 08:54 OPENMP
drwxrwxr-x 2 mthomas use300   8 Mar 12 08:54 OPENMP_DUP
[mthomas@comet-ln2 comet-examples]$
```

To move to the directory, use the `cd` (change directory)
```
[mthomas@comet-ln2 comet-examples]$ pwd
/home/mthomas/comet-examples
[mthomas@comet-ln2 comet-examples]$ cd OPENMP/
[mthomas@comet-ln2 OPENMP]$ pwd
/home/mthomas/comet-examples/OPENMP
[mthomas@comet-ln2 OPENMP]$ ls -al
total 479
drwxr-xr-x 2 mthomas use300      8 Jul 17 20:26 .
drwxr-xr-x 3 mthomas use300      4 Jul 17 20:32 ..
-rwxr-xr-x 1 mthomas use300 728112 Jul 17 20:26 hello_openmp
-rw-r--r-- 1 mthomas use300    984 Jul 17 20:26 hello_openmp.500005.comet-27-01.out
-rw-r--r-- 1 mthomas use300    247 Jul 17 20:26 hello_openmp.f90
-rw-r--r-- 1 mthomas use300    656 Jul 17 20:26 hello_openmp_shared.508392.comet-11-01.out
-rw-r--r-- 1 mthomas use300    310 Jul 17 20:26 openmp-slurm.sb
-rw-r--r-- 1 mthomas use300    347 Jul 17 20:26 openmp-slurm-shared.sb
```
You can sort the order of the file listings by date (or size or other fields -- see the `man` pages). The default file listing in alphabetic, to  see the files in chronological order (or reverse):
```
[mthomas@comet-ln2 comet-examples]$ ls -alt OPENMP/
total 479
drwxr-xr-x 4 mthomas use300      5 Jul 17 20:43 ..
drwxrwxr-x 2 mthomas use300      8 Mar 12 08:54 .
-rw-r--r-- 1 mthomas use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-r--r-- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb
-rw-r--r-- 1 mthomas use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rwxr-xr-x 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-r--r-- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rw-r--r-- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb

[mthomas@comet-ln2 comet-examples]$ ls -altr OPENMP/
total 479
-rw-r--r-- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb
-rw-r--r-- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rwxr-xr-x 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-r--r-- 1 mthomas use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-r--r-- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb
-rw-r--r-- 1 mthomas use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
drwxrwxr-x 2 mthomas use300      8 Mar 12 08:54 .
drwxr-xr-x 4 mthomas use300      5 Jul 17 20:43 ..
```

[Back to Top](#top)
<hr>

## <a name="permissions">Permissions</a>
In the section we will look breifly at how to file permissions. Before you can change the file permissions, you need to own it or have permission as a group member. For a more detailed tutorial, see http://www.nersc.gov/users/storage-and-file-systems/unix-file-permissions/. Permissions are written in the first column, with fields that specify whether or not the file is a directory (`d`), what the read/write/execution permissions (`rwx`) for the files are for users and groups.  Using the example below:

```
[mthomas@comet-ln2 OPENMP]$ ls -l hello_openmp
total 479
drwxr-xr-x 2 mthomas use300      2 Jul 17 21:53 direxample
-rwxr-xr-x 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-r--r-- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
```
The order of the markers are grouped into 4 fields:
`-` `rwx` `r-x` `r-x`
Field 1 == directory, a `d` or `-` means directory or not a directory
Field 2 == owner permissions 'rwx' means the owner can read, write, and exectute
Field 3 == group permissions 'rwx' means the owner can read and exectute, but not modify
Field 4 == other/world permissions 'r-x' means the others can read and exectute, but not modiry

To change the file access permissions, use the `chmod` command. In the example below, only user mthomas has permission to edit (`rw-`) the files, members of the group use300 and others have read only permission (`--`). There are several ways to modify permissions, we will use the binary representation where the rwx status represents a binary number 2^n, where n is the position of the permission starting from the right. For example:
```
  r-- = 2^2 + 0 + 0 = 4 + 0 + 0 = 4
  rw- = 2^2 + 2^1 + 0 = 4 + 2 + 0 = 6
  r-x = 2^2 + 0 + 2^0 = 4 + 0 + 1 = 5
  rwx = 2^2 + 2^1 + 2^0 = 4 + 2 + 1 = 7
```

In the example below, we will set read and write permissions to the owner and the group, and limit the other/world group to read only:
```
[mthomas@comet-ln2 OPENMP]$ ls -l
total 479
drwxr-xr-x 2 mthomas use300      2 Jul 17 21:53 direxample
-rwxr-xr-x 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-r--r-- 1 mthomas use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-r--r-- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rw-r--r-- 1 mthomas use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-r--r-- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb
-rw-r--r-- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb
[mthomas@comet-ln2 OPENMP]$ chmod 660 *
[mthomas@comet-ln2 OPENMP]$ ls -l
total 460
drwxr-xr-x 2 mthomas use300      2 Jul 17 21:53 direxample
-rw-rw-r-- 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-rw---- 1 mthomas use300    984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-rw---- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rw-rw---- 1 mthomas use300    656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-rw---- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb
-rw-rw---- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb

```
In the example above, we use the star wildcard, \" \* \" to represent all the files in the directory (See the section on wildcards below). We can use the wildcard to **change the group** of some of the files. For example, to change the group of only the \*.out files:

```
[mthomas@comet-ln2 OPENMP]$ groups
use300 pet heart scicom-docs grdclus webwrt ...
[mthomas@comet-ln2 OPENMP]$ chgrp heart *.out
[mthomas@comet-ln2 OPENMP]$ ls -l
total 460
drwxr-xr-x 2 mthomas use300      2 Jul 17 21:53 direxample
-rw-rw-r-- 1 mthomas use300 728112 Apr 15  2015 hello_openmp
-rw-rw---- 1 mthomas heart     984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-rw---- 1 mthomas use300    247 Apr 15  2015 hello_openmp.f90
-rw-rw---- 1 mthomas heart     656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
-rw-rw---- 1 mthomas use300    310 Apr 15  2015 openmp-slurm.sb
-rw-rw---- 1 mthomas use300    347 Apr 22  2015 openmp-slurm-shared.sb
```

[Back to Top](#top)
<hr>

## <a name="wildcards">Wildcards</a>

\"A wildcard is a character that can be used as a substitute for any of a class of characters in a search, thereby greatly increasing the flexibility and efficiency of searches."  The wildcards are very powerful, and there is not room in this document for all of them, so we recommend that you check out this site:  http://www.linfo.org/wildcard.html for more information.

In the example below, we use the star wildcard to list all files ending in `.out`

```
[mthomas@comet-ln2 OPENMP]$ ls -al *.out
-rw-rw---- 1 mthomas heart 984 Apr 15  2015 hello_openmp.500005.comet-27-01.out
-rw-rw---- 1 mthomas heart 656 Apr 22  2015 hello_openmp_shared.508392.comet-11-01.out
```

[Back to Top](#top)
<hr>

## <a name="common-utilities">Common Utilities</a>
 common utilities: grep, cat, less, head, sort, tar, gzip ,and pigz
