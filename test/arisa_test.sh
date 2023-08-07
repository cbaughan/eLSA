#!/bin/bash
#SBATCH --account=paulcarini
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=050:05:00

source ~/.bashrc
conda activate charade


# Parallal (require user customization based on  hpc system, not supported) 
echo "par_ana Tests"
par_ana ARISA20_Over1.txt ARISA20_Over1.lsa 'lsa_compute %s %s -e ARISA20_Over1.txt -s 127 -r 1 -p perm' $PWD
#par_ana ARISA20_Over1.txt ARISA20_Over1.la 'la_compute %s ARISA20_Over1.laq %s -s 127 -r 1 -p 1000' $PWD
