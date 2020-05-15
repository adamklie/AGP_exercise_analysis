# AGP_exercise_analysis
Analysis of existing American Gut Project data on exercise frequency

## Environment set-up
To run the notebooks for this analysis, it is recommended to use a qiime2 conda environment and install a handful
of other useful plugins. Follow the instructions to do so below:

#### Download and install miniconda3
Download the appropriate [miniconda3 installer](https://docs.conda.io/en/latest/miniconda.html) for your system (Linux-64 bit shown here)
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh  # follow instructions from here
```

#### Clone github repo to desired location
Clone this repository via the following command line code:
```bash
git clone https://github.com/adamklie/AGP_exercise_analysis.git
cd AGP_exercise_analysis
```

#### Download and install Qiime2 conda environment 
Download the appropriate [environment configuration file](https://docs.qiime2.org/2020.2/install/native/#install-QIIME-2-within-a-conda-envrionment) for your operating system (example here is 64-bit Linux)
```bash
wget -O config/qiime2-2020.2-py36-linux-conda.yml https://data.qiime2.org/distro/core/qiime2-2020.2-py36-linux-conda.yml
```

Run the following from the terminal to set-up a default Qiime2 environment
```bash
conda env create -n qiime2-2020.2 --file config/qiime2-2020.2-py36-linux-conda.yml
conda activate qiime2-2020.2
conda install --file config/requirements.txt --yes
pip install git+https://github.com/biocore/empress.git
qiime dev refresh-cache
```

### Set-up kernels for Jupyter notebooks
Run the following after activating the environment to set-up bash kernel
```bash
pip install bash_kernel
python -m bash_kernel.install
python -m ipykernel install --user --name=qiime2-2020.2
jupyter serverextension enable --py qiime2 --sys-prefix
```

### Shuf?
If running from OSX, you may have to download shuf: brew install coreutils

## Data download

#### Feature table and metadata
Follow and run download_data.ipynb to download BIOM table and metadata for AGP samples

#### Fragment insertion tree reference
```bash
mkdir data/sepp
wget -O data/sepp/epp-refs-gg-13-8.qza https://data.qiime2.org/2020.2/common/sepp-refs-gg-13-8.qza
```

#### Taxonomic classification weights, reference sequences and reference taxonomy
```bash
mkdir data/taxonomy
wget -O data/taxonomy/human-stool.qza https://github.com/BenKaehler/readytowear/raw/master/data/gg_13_8/515f-806r/human-stool.qza
wget -O data/taxonomy/ref-seqs-v4.qza https://github.com/BenKaehler/readytowear/raw/master/data/gg_13_8/515f-806r/ref-seqs-v4.qza
wget -O data/taxonomy/ref-tax.qza https://github.com/BenKaehler/readytowear/raw/master/data/gg_13_8/515f-806r/ref-tax.qza
```

## Process downloaded data into qiime2 artifacts
Run the process_data.ipynb notebook to generate the following features that will be used:
1. A
2. 