# AGP_exercise_analysis
Analysis of existing American Gut Project data on exercise frequency

## Clone repo
Clone this repository via the following command line code:
```git clone https://github.com/adamklie/AGP_exercise_analysis.git```

### Download and install miniconda3
Download the appropriate [miniconda3 installer](https://docs.conda.io/en/latest/miniconda.html) for your system (Linux-64 bit) shown here
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh  # follow instructions from here
```

### Download and install Qiime2 conda environment 
Run the following from the terminal to set-up a default Qiime2 environment
```bash
cd ../config
conda env create -n qiime2-2020.2 --file qiime2-2020.2-py36-osx-conda.yml
conda activate qiime2-2020.2
conda install jupyter
```

### Install bash kernel for Jupyter notebooks
Run the following after activating the environment to set-up bash kernel
```bash
pip install bash_kernel
python -m bash_kernel.install

jupyter serverextension enable --py qiime2 --sys-prefix
```

### Run env_setup.ipynb to install plugins
TODO: Change this to a command line call

## Data download
Run download_data.ipynb to download BIOM table and metadata for AGP samples

## Generate features for analysis
https://forum.qiime2.org/t/imort-fastq-with-manifest-via-artifact-api/2755/3