#!/bin/bash
# Run with sh install_reionizer.sh

##Load anacoda
module load anaconda3/2021.11
conda init bash

# create lya_env environment in project directory
conda create --prefix /home/projects/ku_00154/apps/.conda/envs/lya_env python=3.7
conda activate lya_env

# install requirements
conda install pip

# Make sure the code can find the data
export LYA_DATA_DIR=/home/projects/ku_00154/data/LyaInference_data/

# Afterwards we clone and install the LyaInference package itself
cd /home/projects/ku_00154/apps/
git clone https://github.com/charlottenosam/LyaInference.git
cd LyaInference
python setup.py install

# install pyqt for KDE
pip uninstall -y pyqt_fit
pip install git+https://github.com/charlottenosam/pyqt-fit.git
echo pip install git+https://github.com/charlottenosam/pyqt-fit.git

# test installation
python -c "import reionizer; print('Imported reionizer succesfully'); print(reionizer.get_xHI_tab())"
