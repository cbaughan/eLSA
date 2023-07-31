# elsa_conda_env
creating a conda environment to facilitate installation of elsa program: https://bitbucket.org/charade/elsa/src/master/

## Create conda environment

``` bash
git clone https://github.com/hhollandmoritz/elsa_conda_env.git
cd elsa_conda_env
./install_elsa.sh # this installs the conda environment, ELSA, and tests the installation
conda activate elsa_env_vX
```

## To run elsa

Activate the conda environment
``` bash
conda activate elsa_env_vX
```
Call on the ELSA script of your choice. 

For example the test script
```bash
cd elsa # replace x's with those in your folder
lsa_compute ../test/ARISA20.csv ../test/ARISA20.lsa -r 1 -s 127 -d 3 -p theo -x 1000 -f linear -n percentileZ -e ../test/ARISA20.csv -m 0
```


## Ongoing projects - Parallelization
`par_ana.py`, the parallel version of this assumes you're working on a PBS managed job scheduling system. Many systems use slurm these days. To make this work with slurm you'll need to edit par_ana.py to create slurm scripts and then run those in parallel. Currently only somewhat tested. When in doubt you can use the dryrun option and manually launch the slurm jobs.

For example
```bash
cd elsa/test
par_ana ARISA20.txt ARISA20.lsa 'lsa_compute %s %s -e ARISA20.txt -s 127 -r 1 -p theo' $PWD -d DRYRUN
```
