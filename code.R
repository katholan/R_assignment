#Data Inspection

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
  maize_loop <- maize_cut_ordered_snps[maize_cut_increasing_snps$Chromosome == i,]
  write.csv(maize_loop, sprintf("maize_chromosome_%d_increasing_snps", i), row.names = F)
}
#separates by chromosome and then creates CSV file for each chromosome

maize_cut_decreasing_snps <- maize_cut[order(-as.numeric(as.character(maize_cut$Position))),]
#sorts by decreasing posittion of snp


id <- (4:ncol(maize_cut_decreasing_snps)) 
maize_cut_decreasing_snps[,id] <- as.numeric(as.character(maize_cut_decreasing_snps[,id]))


maize_cut_decreasing_snps_numeric <- maize_cut_decreasing_snps[as.numeric(as.character(maize_cut_decreasing_snps$`1210`)),]

#stats[,i] <- as.numeric(as.character(stats[,i]))

#levels(maize_cut_decreasing_snps[,4:1576]) <- c(levels(maize_cut_decreasing_snps[,4:1576]), "-/-")
#maize_dashes <- maize_cut_decreasing_snps$c(4:1576)[maize_cut_decreasing_snps$c(4:1576) == '?/?'] <- '-/-'
#replaces ? with -


#write.csv(d, 
#         file = "data.csv",
#         row.names = FALSE)

#my_data <- read.csv("data.csv")



##Teosinte
teosinte <- genotypes[genotypes$Group == "ZMPBA" | genotypes$Group == "ZMPIL" | genotypes$Group == "ZMPJA",]
nrow(teosinte) 
#includes headers
transposed_teosinte <- t(teosinte)
#includes headers that are row numbers