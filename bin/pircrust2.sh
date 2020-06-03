#!/bin/bash

### Specify the name of the job, output file, and error/log file;
#PBS -N picrust2
#PBS -o /home/aklie/doc/log/picrust2.$PBS_JOBID.log
#PBS -e /home/aklie/doc/err/picrust2.$PBS_JOBID.err

### Request resources for the job, and the walltime for the job to run
#PBS -l nodes=1:ppn=16
#PBS -l walltime=48:00:00
#PBS -l mem=64gb

##### Exports all user environment variables to the job
#PBS -V

### Specify the email to recieve
#PBS -M aklie@eng.ucsd.edu
#PBS -m abe

### Run picrust2
### USAGE: qsub -v RESULTS=$PATH_TO_RESULTS_DIR fragment_insertion.sh
start=$SECONDS

echo -e "qiime picrust2 full-pipeline \
    --i-table ${RESULTS}/feature_tables/insertion-table.qza \
    --i-seq ${RESUlTS}/rep_seqs/mammal_seqs.qza \
    --output-dir ${RESULTS}/functional_annotation \
    --p-threads 16 \
    --p-hsp-method pic \
    --p-max-nsti 2 \
    --verbose\n"
echo -e "Outputting results to ${RESULTS}"

cd $PBS_O_WORKDIR
source activate qiime2-2019.10
    
qiime picrust2 full-pipeline \
    --i-table ${RESULTS}/feature_tables/insertion-table.qza \
    --i-seq ${RESULTS}/rep_seqs/rep-seqs.qza \
    --output-dir ${RESULTS}/functional_annotation \
    --p-threads 16 \
    --p-hsp-method mp \
    --p-max-nsti 2 \
    --verbose
   
duration=$(( SECONDS - start ))
echo -e "\nTime elapsed: $duration"
