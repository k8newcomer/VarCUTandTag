
samtools sort -o P1_sorted.bam P_1_Picard2.bam
samtools index P1_sorted.bam

samtools sort -o P2_sorted.bam P_2_Picard2.bam
samtools index P2_sorted.bam

samtools sort -o P3_sorted.bam P_3_Picard2.bam
samtools index P3_sorted.bam

samtools sort -o P4_sorted.bam P_4_Picard2.bam
samtools index P4_sorted.bam

samtools sort -o P5_sorted.bam P_5_Picard2.bam
samtools index P5_sorted.bam

samtools sort -o P6_sorted.bam P_6_Picard2.bam
samtools index P6_sorted.bam

samtools sort -o K1_sorted.bam K_1_Picard2.bam
samtools index K1_sorted.bam

samtools sort -o K2_sorted.bam K_2_Picard2.bam
samtools index K2_sorted.bam

samtools sort -o K3_sorted.bam K_3_Picard2.bam
samtools index K3_sorted.bam

samtools sort -o K4_sorted.bam K_4_Picard2.bam
samtools index K4_sorted.bam

samtools sort -o K5_sorted.bam K_5_Picard2.bam
samtools index K5_sorted.bam

samtools sort -o K6_sorted.bam K_6_Picard2.bam
samtools index K6_sorted.bam



samtools merge nKP_merged.bam P1_sorted.bam P2_sorted.bam P3_sorted.bam P4_sorted.bam P5_sorted.bam P6_sorted.bam K1_sorted.bam K2_sorted.bam K3_sorted.bam K4_sorted.bam K5_sorted.bam K6_sorted.bam

samtools sort -o nKP_merged_sorted.bam nKP_merged.bam
samtools index nKP_merged_sorted.bam