setwd('C:/geo_data/BulkRNAseq')
data1=readRDS("log_data1.RDS")
data1

#creating a empty matrix to add value
mat1= matrix(NA,ncol=4,nrow=nrow(data1))
rownames(mat1)= rownames(data1)
colnames(mat1)=c("control","test","p_value","logfc2")

View(mat1)

#rounding the data upto 4 digits
data2=round(data1,4)

dim(data2)

for (i in 1:nrow(data2)){
  cdata=as.numeric(data2[i,1:4])
  tdata=as.numeric(data2[i,5:28])
  
  if(length(unique(cdata))==1){
    next
  }
  
  if(length(unique(tdata))==1){
    next
  }
  test1=t.test(cdata,tdata,paired=F,alternative = 'two.sided')
  mat1[i,1]= test1$estimate[[1]]
  mat1[i,2]= test1$estimate[[2]]
  mat1[i,3]= test1$p.value
  mat1[i,4]= mat1[i,1]- mat1[i,2]
  
}

summary(data2[,1])
mat1
print(test1)

#volcano plot



mat2= as.data.frame(mat1)
mat2
num= which(is.na(mat2$p_value))
num
mat2[num,'p_value']= 1
mat2
View(mat2)

library(ggplot2)
library(ggrepel)
library(EnhancedVolcano)

vol=EnhancedVolcano(mat2,lab=rownames(mat2),x='logfc2',y='p_value')
vol
