java -Xmx4g -jar /pi/thomas.fazzio-umw/Sarah/picard-tools-2.5.0/picard.jar AddOrReplaceReadGroups \
    I=nKP_merged_sorted.bam \
    O=nKP_RG.bam \
    RGID=1 \
    RGLB=lib1to8 \
    RGPL=illumina \
    RGPU=unk \
    RGSM=KP


samtools sort -o nKP_RG_sorted.bam nKP_RG.bam
samtools index nKP_RG_sorted.bam

gatk BaseRecalibrator \
   -I nKP_RG_sorted.bam \
   -R /pi/thomas.fazzio-umw/Kate/TBKN/GCA_000001405.15_GRCh38_no_alt_analysis_set.fa  \
   --known-sites /pi/thomas.fazzio-umw/Kate/TBKN/BQSR_RefSet/resources_broad_hg38_v0_Homo_sapiens_assembly38.known_indels.vcf.gz \
   --known-sites /pi/thomas.fazzio-umw/Kate/TBKN/BQSR_RefSet/resources_broad_hg38_v0_Homo_sapiens_assembly38.dbsnp138.vcf.gz \
   -O /pi/thomas.fazzio-umw/Kate/TBKN/raw_fastq/humansamples/P3_Kidney/nKPrecal_data.table
   
   gatk ApplyBQSR \
   -I nKP_RG_sorted.bam \
   -R /pi/thomas.fazzio-umw/Kate/TBKN/GCA_000001405.15_GRCh38_no_alt_analysis_set.fa \
   --bqsr-recal-file /pi/thomas.fazzio-umw/Kate/TBKN/raw_fastq/humansamples/P3_Kidney/nKPrecal_data.table \
   -O /pi/thomas.fazzio-umw/Kate/TBKN/raw_fastq/humansamples/P3_Kidney/nKP_BQSR.bam
 
   gatk Mutect2 \
     -R /pi/thomas.fazzio-umw/Kate/TBKN/GCA_000001405.15_GRCh38_no_alt_analysis_set.fa
     -I nKP_BQSR.bam \
     --panel-of-normals /pi/thomas.fazzio-umw/Kate/TBKN/BQSR_RefSet/somatic-hg38_1000g_pon.hg38.vcf.gz \
     --germline-resource /pi/thomas.fazzio-umw/Kate/TBKN/BQSR_RefSet/somatic-hg38_af-only-gnomad.hg38.vcf.gz \
     -O nKP_BQSR.vcf.gz