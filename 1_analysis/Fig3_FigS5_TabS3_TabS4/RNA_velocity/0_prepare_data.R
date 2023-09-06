# following the tutorial in https://github.com/basilkhuder/Seurat-to-RNA-Velocity
library(Seurat)

dir_out <- paste0(dirname(rstudioapi::getSourceEditorContext()$path), "/meta_data/")
if(!dir.exists(dir_out)) dir.create(dir_out)

so <- readRDS(file = "0_data/GSE223873_sc_RNAseq/GSE223873_tumor_T_cleaned.rds")
write.csv(Cells(so), file = paste0(dir_out, "cellID_obs.csv"), row.names = FALSE)
write.csv(Embeddings(so, reduction = "umap"), file = paste0(dir_out, "cell_embeddings.csv"))
write.csv(so$annotation, file = paste0(dir_out, "clusters.csv"))
