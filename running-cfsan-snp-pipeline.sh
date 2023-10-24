#!/bin/bash

#SBATCH -N 4
#SBATCH -t 60:00:00

#SBATCH -p normal_q
#SBATCH -A LINbase_BR
#PBS -W group_list=cascades
#PBS -M parulsharma@vt.edu
#PBS -m bea


###loading all the modules needed for Gatk
module load gcc/4.7.2
module load gcc/5.2.0
module load gcc/6.1.0
module load intel/15.3
module load intel/17.0
module load jdk/1.8.0
module load gatk/3.4.46


dir=/work/cascades/parulsharma/cool-virulence/snp-analysis
cd /work/cascades/parulsharma/cool-virulence/snp-analysis
#####run config file creation command before running the pipeline command;
###After the config file is created,limit the max memory used by varscan so it  does not not run out of memory

##this chunk is for moving paired reads of input files
#while read LINE;
#do
#	cp -r /work/cascades/parulsharma/Ralstonia_analysis/PL_output/input/$LINE $dir/
        #NAME=${LINE:2}
        #mv $w_dir/$LINE/${NAME}_R1_001.fastq.gz $w_dir/$LINE/${LINE}_1.fastq.gz
        #mv $w_dir/$LINE/${NAME}_R2_001.fastq.gz $w_dir/$LINE/${LINE}_2.fastq.gz
#done < list.txt

#cfsan_snp_peipeline data configurationFile    #this will output the default snppipeline.conf file

cfsan_snp_pipeline run -c $dir/snppipeline.conf -m soft -o $dir/output/ -s $dir/input/ $dir/UW477.fasta

exit;
