#Data Inspection

genotypes <- read.table("C:\\Users\\Test\\Documents\\Iowa_State_University\\Classes\\EEOB 546X\\R\\R_assignment\\fang_et_al_genotypes.txt", header = T, stringsAsFactors = F)
head(genotypes)
dim(genotypes)
str(genotypes)
nrow(genotypes)
ncol(genotypes)
colnames(genotypes)
row.names(genotypes)


snps <- read.delim("C:\\Users\\Test\\Documents\\Iowa_State_University\\Classes\\EEOB 546X\\R\\R_assignment\\snp_position.txt", header = T, stringsAsFactors = F)
head(snps)
dim(snps)
str(snps)
nrow(snps)
ncol(snps)
colnames(snps)
row.names(snps)

###Data Processing
##Maize
maize <- genotypes[genotypes$Group == "ZMMIL" | genotypes$Group == "ZMMLR" | genotypes$Group == "ZMMMR",]
nrow(maize)
#includes headers
transposed_maize <- t(maize)
#includes headers that are row numbers


##Teosinte
teosinte <- genotypes[genotypes$Group == "ZMPBA" | genotypes$Group == "ZMPIL" | genotypes$Group == "ZMPJA",]
nrow(teosinte) 
#includes headers
transposed_teosinte <- t(teosinte)
#includes headers that are row numbers