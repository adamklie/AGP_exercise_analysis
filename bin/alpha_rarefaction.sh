#!/bin/bash

### Specify the name of the job, output file, and error/log file;
#PBS -N alpha_rarefaction
#PBS -o /home/aklie/doc/log/alpha_rarefaction.$PBS_JOBID.log
#PBS -e /home/aklie/doc/err/alpha_rarefaction.$PBS_JOBID.err

### Request resources for the job, and the walltime for the job to run
#PBS -l nodes=1:ppn=16
#PBS -l walltime=48:00:00
#PBS -l mem=64gb

##### Exports all user environment variables to the job
#PBS -V

### Specify the email to recieve
#PBS -M aklie@eng.ucsd.edu
#PBS -m abe

### Process downloaded Qiita data into Qiime artifacts
### USAGE: qsub -v DATA=$PATH_TO_DATA_DIR,RESULTS=$PATH_TO_RESULTS_DIR alpha_rarefaction.sh
start=$SECONDS

echo -e "Getting data from ${DATA}\n"
echo -e "qiime diversity alpha-rarefaction
	--i-table ${RESULTS}/feature_tables/insertion-table.qza
	--i-phylogeny ${RESULTS}/fragment_insertion/sepp-tree.qza
	--p-max-depth 10000
	--m-metadata-file ${DATA}/full/2020_05_15/filtered=metadata.tsv
	--o-visualization ${RESULTS}/diversity/alpha-rarefaction.qzv \n"
echo -e "Outputting results to ${RESULTS}"

cd $PBS_O_WORKDIR
source activate qiime2-2020.2

qiime diversity alpha-rarefaction \
	--i-table ${RESULTS}/feature_tables/insertion-table.qza \
	--i-phylogeny ${RESULTS}/fragment_insertion/sepp-tree.qza \
	--p-max-depth 10000 \
	--m-metadata-file ${DATA}/full/2020_05_15/filtered-metadata.tsv \
	--o-visualization ${RESULTS}/diversity/alpha-rarefaction.qzv

duration=$(( SECONDS - start ))
echo -e "\nTime elapsed: $duration"
