library(gplots)
data = read.table('repeatability.txt', header=T,  sep="\t",row.names=1,check.names=F,quote = "")
data = as.matrix(data)
myheatcol=colorRampPalette(c("green", "white","#D73027"))(50)
nr = nrow(data)
pdf(file='repeatability.pdf',width=10, height=10)
title2 = "Pearson's Coefficient"
heatmap.2(data, dendrogram='none', Rowv=FALSE,Colv=FALSE,col=myheatcol, scale="none", key.title=title2,symkey=T,density.info="none", trace="none", key=TRUE, keysize=1,cexCol=1.5, cexRow=1.5, srtCol=30, adjCol=c(0.2,0.2),srtRow=0,key.xlab=title2)
dev.off()
