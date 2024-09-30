# Assuming a tumor file named tumor.bam, a normal file named normal.bam, and a interval file of high coverage regions for the tumor file in 100X bed
python filter.py \
    --normal_bam normal.bam \
    --tumor_bam tumor.bam \
    --output_dir varnet_outputs \
    --reference GRCh38.fa \
    --region_bed 100X.bed

python predict.py \
	--normal_bam normal.bam \
	--tumor_bam tumor.bam \
	--output_dir varnet_outputs \
	--reference GRCh38.fa \