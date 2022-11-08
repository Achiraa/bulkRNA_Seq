#setting the working directory
setwd("C:/geo_data/BulkRNAseq")

#reading the data
data=read.csv("finalcsvfile.csv")
data

#checking the dimensions
dim(data)

#summary
#summary(data$Sample_111_MGL)

#removing 1st column
genename=data[,-1]
genename

# Store Genename as rownames
rownames(genename) <- data[,1]
head(genename)

#install packages
install.packages("BiocManager")
R.version.string

BiocManager::install("edgeR")
library(limma)
library(edgeR)

#use DGE 
new=DGEList(genename)
new
x=names(genename)
x

#use cpm
cpm_data=cpm(new)
cpm_data
log_data1<- cpm(genename, log=TRUE)
log_data1

#saving the log file
saveRDS(log_data1,file="log_data1.RDS")

summary(log_data1)
summary(log_data1[,1])

v=median(log_data1)
v
mean(log_data1)
boxplot(log_data1) 
abline (h=v, col="blue")

boxplot(log_data1[1:20000,])
boxplot(log_data1[20000:50000,])

mat=as.matrix(log_data1)
mat

for(i in 1:nrow(mat)){
  vec= as.numeric(mat[i,])
  mat[i,1:ncol(mat)]=(vec-mean(vec))/sd(vec) #zvalue
}
View(mat)


install.packages('gplots')
library(gplots)
BiocManager::install("ComplexHeatmap")

library(ComplexHeatmap)
library(circlize)

hm=Heatmap(mat)
hm






















































































