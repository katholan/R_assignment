#Data Inspection
options(stringsAsFactors = F)
genotypes <- read.table("C:\\Users\\Test\\Documents\\Iowa_State_University\\Classes\\EEOB 546X\\R\\R_assignment\\fang_et_al_genotypes.txt", header = T, stringsAsFactors = F)
#head(genotypes)
#dim(genotypes)
#str(genotypes)
#nrow(genotypes)
#ncol(genotypes)
#colnames(genotypes)
#row.names(genotypes)


snps <- read.delim("C:\\Users\\Test\\Documents\\Iowa_State_University\\Classes\\EEOB 546X\\R\\R_assignment\\snp_position.txt", header = T, stringsAsFactors = F)
#head(snps)
#dim(snps)
#str(snps)
#nrow(snps)
#ncol(snps)
#colnames(snps)
#row.names(snps)

###Data Processing
##Maize
maize <- genotypes[genotypes$Group == "ZMMIL" | genotypes$Group == "ZMMLR" | genotypes$Group == "ZMMMR",]
#nrow(maize)
#includes headers
transposed_maize <- t(maize)
#includes headers that are row numbers

merged_maize <- merge(snps, transposed_maize, by.x = "SNP_ID", by.y = "row.names")
#nrow(merged_maize)
#983 rows which is the number from transposed_maize - the 3 header rows

maize_cut <- merged_maize[,-c(2,5:15)]
#removes columns we don't want

maize_cut_increasing_snps <- maize_cut[order(as.numeric(as.character(maize_cut$Position))),]
#orders by snp position, putting non-numeric values at the end of the data frame


for (i in 1:10) {
  maize_loop <- maize_cut_increasing_snps[maize_cut_increasing_snps$Chromosome == i,]
  write.csv(maize_loop, sprintf("maize_chromosome_%d_increasing_snps", i), row.names = F)
}
#separates by chromosome and then creates CSV file for each chromosome

maize_cut_decreasing_snps <- maize_cut[order(-as.numeric(as.character(maize_cut$Position))),]
#sorts by decreasing posittion of snp

maize_dashes <- maize_cut_decreasing_snps
maize_dashes[maize_dashes == "?/?"] <- "-/-"
#replaces ? with -


for (i in 1:10) {
  maize_loop <- maize_dashes[maize_dashes$Chromosome == i,]
  write.csv(maize_loop, sprintf("maize_chromosome_%d_decreasing_snps", i), row.names = F)
}



##Teosinte
teosinte <- genotypes[genotypes$Group == "ZMPBA" | genotypes$Group == "ZMPIL" | genotypes$Group == "ZMPJA",]
nrow(teosinte) 
#includes headers
transposed_teosinte <- t(teosinte)
#includes headers that are row numbers

#join snp data to genotypes data
merged_teosinte <- merge(snps, transposed_teosinte, by.x = "SNP_ID", by.y = "row.names")
nrow(merged_teosinte)

#cut out only columns you need
teosinte_cut <- merged_teosinte[,-c(2,5:15)]

#sort by snp increasing
teosinte_cut_increasing_snps <- teosinte_cut[order(as.numeric(as.character(teosinte_cut$Position))),]

#make files for each chromosome
for (i in 1:10) {
  teosinte_loop <- teosinte_cut_increasing_snps[teosinte_cut_increasing_snps$Chromosome == i,]
  write.csv(teosinte_loop, sprintf("teosinte_chromosome_%d_increasing_snps", i), row.names = F)
}

#sort by snp decreasing
teosinte_cut_decreasing_snps <- teosinte_cut[order(-as.numeric(as.character(teosinte_cut$Position))),]

#substitute ? for -
teosinte_dashes <- teosinte_cut_decreasing_snps
teosinte_dashes[teosinte_dashes == "?/?"] <- "-/-"

#make files for each chromosome
for (i in 1:10) {
  teosinte_loop <- teosinte_dashes[teosinte_dashes$Chromosome == i,]
  write.csv(teosinte_loop, sprintf("teosinte_chromosome_%d_decreasing_snps", i), row.names = F)
}

