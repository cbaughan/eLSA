#!/bin/bash

#SBATCH --account=rschomer
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=02:00:00

source ~/.bashrc
micromamba activate charade
# Install the conda environment:
micromamba env update --name charade --file elsa_install.yml


# Install elsa
cd elsa

# Install ELSA
echo "Installing ELSA"
python setup.py install

# Make sure ssa.py ends up in correlct location since setup.py doesn't appear to do it correctly
cd lsa
cp ssa.py $HOME/.conda/envs/charade/bin/ # ASSUMES THAT conda environments are stored in $HOME

# Test installation
echo "Testing installation"
cd ../test
./test.sh
 
# Deactivate the conda environment
micromamba deactivate
