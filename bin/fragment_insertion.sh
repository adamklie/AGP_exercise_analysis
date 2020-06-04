#!/bin/bash

### Specify the name of the job, output file, and error/log file;
#PBS -N fragment_insertion
#PBS -o /home/aklie/doc/log/fragment_insertion.$PBS_JOBID.log
#PBS -e /home/aklie/doc/err/fragment_insertion.$PBS_JOBID.err

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
### USAGE: qsub -v DATA=$PATH_TO_DATA_DIR,RESULTS=$PATH_TO_RESULTS_DIR fragment_insertion.sh
start=$SECONDS

echo -e "Getting data from ${DATA}\n"
echo -e "Running command qiime fragment-insertion sepp \n
    --i-representative-sequences ${RESULTS}/rep_seqs/rep-seqs.qza \n
    --i-reference-database ${DATA}/sepp/sepp-refs-gg-13-8.qza \n
    --p-threads 16 \n
    --o-tree ${RESULTS}/fragment_insertion/sepp-tree.qza \n
    --o-placements ${RESULTS}/fragment_insertion/sepp-placements.qza\n"
echo -e "Outputting results to ${RESULTS}"

cd $PBS_O_WORKDIR
source activate qiime2-2020.2
qiime fragment-insertion sepp \
    --i-representative-sequences ${RESULTS}/rep_seqs/unhealthy-rep-seqs.qza \
    --i-reference-database ${DATA}/sepp/sepp-refs-gg-13-8.qza \
    --p-threads 16 \
    --o-tree ${RESULTS}/fragment_insertion/unhealthy-sepp-tree.qza \
    --o-placements ${RESULTS}/fragment_insertion/unhealthy-sepp-placements.qza
    
duration=$(( SECONDS - start ))
echo -e "\nTime elapsed: $duration"
