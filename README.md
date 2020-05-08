# AGP_exercise_analysis
Analysis of existing American Gut Project data on exercise frequency

### Download and install miniconda3
Download the appropriate [miniconda3 installer](https://docs.conda.io/en/latest/miniconda.html) for your system (Linux-64 bit shown here)
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh  # follow instructions from here
```

### Clone github repo to desired location
Clone this repository via the following command line code:
```bash
git clone https://github.com/adamklie/AGP_exercise_analysis.git
```

### Download and install Qiime2 conda environment 
Run the following from the terminal to set-up a default Qiime2 environment
```bash
cd ../config
conda env create -n qiime2-2020.2 --file config/qiime2-2020.2-py36-osx-conda.yml
conda activate qiime2-2020.2
conda install -r config/requirements.txt
```

### Set-up kernels for Jupyter notebooks
Run the following after activating the environment to set-up bash kernel
```bash
pip install bash_kernel
python -m bash_kernel.install
python -m ipykernel install --user --name=qiime2-2020.2
jupyter serverextension enable --py qiime2 --sys-prefix
```

## Data download
Run download_data.ipynb to download BIOM table and metadata for AGP samples
TODO: Add random seed

## Generate features for analysis --> make folders in scripts
```bash
DATE=$(date +%F | sed 's/-/_/g')
mkdir results/test/${DATE}
```

#### Feature tables
```bash
mkdir results/test/${DATE}/feature_tables
```

#### Representative sequences
```bash
mkdir results/test/${DATE}/rep_seqs
```

#### Fragment insertion tree
```bash
mkdir data/sepp
wget -O data/sepp-refs-gg-13-8.qza https://data.qiime2.org/2020.2/common/sepp-refs-gg-13-8.qza
mkdir results/test/${DATE}/fragment_insertion
````

#### Taxonomic classification
```bash
mkdir data/taxonomy
wget -O data/taxonomy/human-stool.qza https://github.com/BenKaehler/readytowear/raw/master/data/gg_13_8/515f-806r/human-stool.qza
wget -O data/taxonomy/ref-seqs-v4.qza https://github.com/BenKaehler/readytowear/raw/master/data/gg_13_8/515f-806r/ref-seqs-v4.qza
wget -O data/taxonomy/ref-tax.qza https://github.com/BenKaehler/readytowear/raw/master/data/gg_13_8/515f-806r/ref-tax.qza
mkdir results/test/${DATE}/taxonomy
```

#### Diversity
```bash
mkdir results/test/${DATE}/diversity
```

#### Differential abundance
```bash
mkdir results/test/${DATE}/differential_abundance
```

#### Sample classification
```bash
mkdir results/test/${DATE}/sample_classification
```