# cd 1_analysis/Fig3_FigS5_TabS3_TabS4/RNA_velocity/

## only run kb count on LN fastq files because we previously noticed that the tumor T cells were added to the LN sample by mistake
## the correct tissue identity have been computationally recovered based on dissociation signature gene expression (high in tumor only due to differences in sample prep stategies)
## only tumor cells will be retained once intersected with the cell metadata (see 0_prepare_data.R and 2_scVelo.ipynb)

# ref contains the kb mm10 lamanno reference: https://www.kallistobus.tools/kb_usage/kb_ref/
# output loom files are too big to share on github; please contact lhuang@bwh.harvard.edu if you need the files.

for SAMPLE in KO_LN_1 KO_LN_2 WT_LN_1 WT_LN_2;
do
kb count -o ${SAMPLE}_kb_count \
-w ref/737K-august-2016.txt \
--loom \
-t 8 \
--workflow lamanno \
-i ref/kb_python_lamanno/kb_python_lamanno.kbidx \
-g ref/kb_python_lamanno/t2g.tsv \
-x 10XV2 \
-c1 ref/kb_python_lamanno/cdna_tx_to_capture.txt -c2 ref/kb_python_lamanno/intron_tx_to_capture.txt \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L001_R1_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L001_R2_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L002_R1_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L002_R2_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L003_R1_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L003_R2_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L004_R1_001.fastq.gz \
0_data/GSE223873/fastqs/${SAMPLE}GEX_S19_L004_R2_001.fastq.gz
done