BiocManager::install('DESeq2')
library(DESeq2)
library(Biobase)
library(edgeR)
library(limma)

#converting into expression set
setwd("C:/geo_data/BulkRNAseq")
data=read.csv("stromalfinal1.csv")
data

#checking the dimensions
dim(data)

#removing 1st column
genename=data[,-1]
genename

# Store Genename as rownames
rownames(genename) <- data[,1]
head(genename)

new1=matrix(genename)
new1

minimaldata=ExpressionSet(new1)
minimaldata

View(new1)
View(minimaldata)






















