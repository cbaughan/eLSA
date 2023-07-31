#!/bin/bash

# Install the conda environment:
conda env create -f elsa_install.yml --force

source $(conda info --base)/etc/profile.d/conda.sh
# Since the name changes with each version, make sure to pull the version
# name out of the yml file
ENV_NAME=$(awk '/name: elsa_env_v/{print $NF}' elsa_install.yml)
conda activate $ENV_NAME

# Install elsa
cd elsa

# Install ELSA
echo "Installing ELSA"
python setup.py install

# Make sure ssa.py ends up in correlct location since setup.py doesn't appear to do it correctly
cd lsa
cp ssa.py $HOME/.conda/envs/elsa_env_v0.1/bin/ # ASSUMES THAT conda environments are stored in $HOME

# Test installation
echo "Testing installation"
cd ../test
./test.sh
 
# Deactivate the conda environment
conda deactivate
