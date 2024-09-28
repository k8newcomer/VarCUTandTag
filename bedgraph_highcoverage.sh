bedtools genomecov -ibam nKP_merged.bam -bg > coverage.bedgraph
awk '$4 > 100' coverage.bedgraph > coverage_100.bedgraph