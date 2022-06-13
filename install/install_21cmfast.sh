#!/bin/bash
# Run with sh install_21cmfast.sh

# Load anacoda
module load anaconda3/2021.11
conda init bash

# create 21cmfast environment in project directory
#conda create -n 21cmfast python=3.7
#conda create --prefix ./21cmfast python=3.7
conda create --prefix /home/projects/ku_00155/apps/modulefiles/.conda/envs/21cmfast python=3.7
source activate 21cmfast

# install required packages
conda install gsl fftw
conda install numpy scipy click pyyaml cffi astropy h5py pip
pip install powerbox

# Install 21cmfast
cd /home/projects/ku_00155/apps/
git clone https://github.com/21cmfast/21cmFAST.git
cd /home/projects/ku_00155/apps/21cmFAST
git checkout ETHOS_DM
INCLUDE=/home/projects/ku_00155/apps/modulefiles/.conda/envs/21cmfast/include LIB=/home/projects/ku_00155/apps/modulefiles/.conda/envs/21cmfast/lib  pip install -e .[dev]

# Install 21cmfish
# conda remove py21cmfish
pip uninstall -y py21cmfish
pip install git+git://github.com/charlottenosam/21cmfish.git
echo pip install git+git://github.com/charlottenosam/21cmfish.git

# test install
21cmfast --help
