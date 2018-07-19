library(cluster)
library(gplots)
args=commandArgs(T)
num=as.numeric(args[2])
data = read.table(args[1], header=T, row.names=1,check.names=F,quote="",com='', sep="\t")
data = as.matrix(data) # convert to matrix
data[which(data>num)]=num
data[which(data<(-num))]=-num
centered_data=data;
col=colorRampPalette(c("green","white","red"))(50)
myheatcol = col
pdf(file=args[3],width=10, height=8)
heatmap.2(centered_data, dendrogram='none',Rowv="none",Colv="none",col=myheatcol ,scale="none", density.info="none", trace="none", key=TRUE, keysize=1, cexCol=1.2,cexRow=1.2,srtCol=0, margins=c(10,15), lhei=c(1,4), lwid=c(1,3))#,sepcolor="black",sepwidth=c(0.001,0.001),colsep=0:21,rowsep=0:20)
dev.off()
