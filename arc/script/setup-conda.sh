#!/usr/bin/bash

# Define path for where Miniconda3 will be installed
miniconda3="$HOME/miniconda3" # /home/username/miniconda3

# Download Miniconda3 version 4.8.2 installer script for Linux 64-bit
wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh \
     -O ~/miniconda3.sh


# Verify installer hash, will re-download if incorrect hash
while :
do
    # Define the hash for the original and downloaded installer scripts
    hash_orig="957d2f0f0701c3d1335e3b39f235d197837ad69a944fa6f5d8ad2c686b69df3b"
    hash_dl=$( sha256sum ~/miniconda3.sh | sed 's/ .*//')
    if [ "$hash_orig" == "$hash_dl" ]
    then
        echo ""
        echo "Correct hash: proceeding to install Miniconda3."
        echo ""
        break
    fi
    echo ""
    echo "The downloaded has is $hash_dl."
    echo "Incorrect hash: re-downloading Miniconda3 installer."
    echo ""
    wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh \
         -O ~/miniconda3.sh
done

# Execute Miniconda3 installer script
bash ~/miniconda3.sh -b -p "$miniconda3"

# Initialize conda (allowing "conda activate")
source "$miniconda3"/bin/activate
conda init

# Set up conda channels (in the right order)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# Delete Miniconda3 installer script
rm -rf ~/miniconda3.sh

# Complete
echo ""
echo "Conda installation complete"
echo "Please re-login to the server (type \"exit\" to logout)"
