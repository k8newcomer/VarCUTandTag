<img align="left" src="https://github.com/user-attachments/assets/c9535d19-627c-44c4-a0eb-0c72aa5648d7">This is the repository for variant calling with varCUT&Tag, a modified protocol of Multi-CUT&Tag(1).
Several bioinformatics modules are required to run these scripts: Samtools(v 1.18), Picard (v3), and bedtools (v2.31.0). This pipeline may be compatible with previous versions of these modules, but it has not been tested. This assumes a Python 3.7+ and Java 1.17+ environment. 

Libraries are pre-processed using traditional guidance for Multi-CUT&Tag libraries. FASTQ files are aligned with BWA MEM, multi-mappers are filtered out, and PCR duplicates are filtered out using Picard. After merging the library based on antibody barcode to one file, a BED file of high coverage (100X+) is generated using bedtools genomecov. This BED file will be useful to restrict variant calling in the later steps to regions of high coverage to improve accuracy. 
This pipeline utilizes three variant callers to develop a high-confidence final variant set. This pipeline is based on GATK 4.1.4.1. GATK Base Recalibrator and BQSR are run using Mutect2 Somatic Best Practices (x) including filters: known indels and dsSNP138. Mutect2 is then run on tumor-only mode using the somatic panel of normals and gnomad as a germline filter. After that, variants are filtered based on frequency (VAF < 0.25) and passed through FilterMutectCalls to obtain high confidence somatic variants. 

This pipeline is based on Strelka2 v2.9.10. It is recommended to use the BED file of high coverage regions —callRegions—during the configureStrelkaSomaticWorkflow.py step. To improve runtime, we recommend using a modified version GRCh38.p14 ( ) that has the random and unknown contigs removed. Following the configuration, runWorkflow.py is run with no additional restrictions.

VarNet was also used in a similar two-step approach. A similar restricted search was utilized, with a 100X+ interval BED file for the --region_bed option. With this restricted search approach, VarNet is able to accurately identify variants in high coverage regions.

Following filtering, variants from all three variant callers are merged to identify final variants. 
This github is under development. For clarification or assistance feel free to email (katrina.newcomer@umassmed.edu), (trishita.basak@umassmed.edu), or (thomas.fazzio@umassmed.edu) 

Gopalan, S., & Fazzio, T. (2022, January 20). Multi-cut&tag to simultaneously profile multiple chromatin factors. STAR Protocols. https://www.sciencedirect.com/science/article/pii/S2666166721008066 
