# Assuming a tumor file named tumor.bam, a normal file named normal.bam, and a interval file of high coverage regions for the tumor file in 100X bed
configureStrelkaSomaticWorkflow.py \
    --normalBam normal.bam \
    --tumorBam tumor.bam \
    --referenceFasta GRhg38P14.fa \
    --callRegions 100X.bed \
    --runDir Somatic

Somatic/runWorkflow.py -m local -j 20