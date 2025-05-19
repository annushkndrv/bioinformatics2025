BATCH --job-name=qc        # Job name
#SBATCH --cpus-per-task=40         # Run on a single CPU
#SBATCH --mem=25gb                 # Job memory request
#SBATCH --time=00:15:00           # Time limit hrs:min:sec
#SBATCH -o logs/multiqc.log  # Standard output file
#SBATCH -e logs/multiqc.err  # Standard error file
#SBATCH --partition=short         # Task priority
#SBATCH --constraint=compute      # Node type 

cd /home/aandreeva/hw/hw_13/hm_rna_seq
mkdir fastqc_result
fastqc *.gz -o fastqc_result
cd fastqc_result
multiqc 
