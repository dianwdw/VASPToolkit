
#####################
#User defined region
#####################

#Please specify the atom number you want to plot
iAtom<-1

Efermi=2.7668

#-Export figure file type:
#- PDF=1, TIFF=2, EPS=3
FigureType <- 1

###########
#Main part
###########

file1<-"DOS0"
file2<-paste("DOS",iAtom,sep="")
tbl1<-read.table(file1,header=FALSE)
tbl2<-read.table(file2,header=FALSE)

energy<-tbl2$V1
py<-tbl2$V3
pz<-tbl2$V4
px<-tbl2$V5
dxy<-tbl2$V6
dyz<-tbl2$V7
dz2<-tbl2$V8
dxz<-tbl2$V9
dx2<-tbl2$V10
s<-tbl2$V2
p<-tbl2$V3+tbl2$V4+tbl2$V5
d<-tbl2$V6+tbl2$V7+tbl2$V8+tbl2$V9+tbl2$V10
total<-s+p+d

#Plot
FileName="TDOS"
if(FigureType==1){
  pdf(file=paste(FileName,"pdf",sep="."),paper="special",width = 11.69,height = 8.27,bg="white")
}else if(FigureType==2){
  tiff(filename = paste(FileName,"tiff",sep="."),width = 29.7,height =21 ,units ="cm",compression="lzw",bg="white",res=300)
}else if(FigureType==3){
  postscript(file=paste(FileName,"eps",sep="."),paper="special",width = 11.69,height = 8.27,bg="white")  
}
plot(tbl1$V1,tbl1$V2,type="l",xlab="Energy(eV)",ylab="DOS",main="TDOS")
lines(c(Efermi,Efermi),c(min(tbl1$V1)-100,max(tbl1$V2)+100),col="red",lty=2)
dev.off()


FileName=paste("DOS",iAtom,sep="")
if(FigureType==1){
  pdf(file=paste(FileName,"pdf",sep="."),paper="special",width = 11.69,height = 8.27,bg="white")
}else if(FigureType==2){
  tiff(filename = paste(FileName,"tiff",sep="."),width = 29.7,height =21 ,units ="cm",compression="lzw",bg="white",res=300)
}else if(FigureType==3){
  postscript(file=paste(FileName,"eps",sep="."),paper="special",width = 11.69,height = 8.27,bg="white")  
}
plot(energy,s,type="l",xlab="Energy(eV)",ylab="DOS",xlim=c(min(energy),max(energy)),ylim=c(min(min(s),min(p),min(d)),max(max(s),max(p),max(d))),main=FileName)
lines(energy,p,col="green")
lines(energy,d,col="purple")
lines(c(Efermi,Efermi),c(min(energy)-100,max(s)+100),col="red",lty=2)
dev.off()