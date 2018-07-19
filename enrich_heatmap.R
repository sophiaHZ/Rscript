library(cluster)
library(gplots)
#library(Biobase)
args=commandArgs(T)
data = read.table(args[1], header=T, com='', sep="\t",row.names=1,quote = "")
data = as.matrix(data)
if (nrow(data)>60){
  data = data[attributes(sort(rowSums(data<0.05),decreasing=T))$names[1:60],]
}
data = -log10(data)
#centered_data = t(scale(t(data), scale=T,center=T))
#hc_genes = agnes(centered_data, diss=FALSE, metric="euclidean",method="complete")
#myheatcol = greenred(255)
#myheatcol=colorRampPalette(c("DodgerBlue3","yellow","red"))(255)
myheatcol=colorRampPalette(c("#4575B4", "white","#D73027"))(50)
nr=nrow(data);
nc=ncol(data);
pdf(file=args[2],width=5+nc*0.7, height=4+0.2*nr, paper="special")
title=sub(pattern=".fpkm",replacement="",args[1])
title2 = "Zscore(-log10(Fisher's test p value))"
heatmap.2(data, dendrogram='none', Rowv=TRUE,Colv=FALSE,col=myheatcol, scale="row", key.title=title2,symkey=T,density.info="none", trace="none", key=TRUE, keysize=1, cexCol=2, cexRow= 0.8+1/log10(nr), margins=c(2,17), main=title,lmat=rbind(c(0,3,4),c(2,1,0)),lhei=c(0.6*nr/(5+0.4*nr),0.2*nr),lwid=c(0.37*(5+nc)/2/nc/2,(5+nc)/2,0.37*(20+4*nc)/2/nc*9/8) ,srtCol=30,key.xlab=title2)#, adjCol=c(0.5,-(2.51+0.2*nr)*55/8.79),srtRow=0,key.xlab=title2,colsep=0:nc,rowsep=0:nr,sepcolor="black",sepwidth=c(0.005,0.005))
dev.off()
