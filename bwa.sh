

bwa mem -t  20 -K 1000000000 -v 3 GCA_000001405.15_GRCh38_no_alt_analysis_set.fa K4PolMerge_RG.fastq K4PolMerge_RG2.fastq | samtools view -Sb -o k4_realign.bam