plotbygender<-function(x){
  five<-x
  colnames(five)<-c("age","gender","offense","race","code")
  idx<-which(five$gender=="M")
  a<-tapply(five$gender[idx],five$code[idx],length)
  b<-tapply(five$gender[-idx],five$code[-idx],length)
  z<-data.frame(a,b)
  colnames(z)<-c("Male","Female")
  barplot(as.matrix(t(z)),beside=T,legend.text =c("Male","Female"),args.legend = list(bty="n",horiz=T),
          col=c("#E41A1C","#377EB8"),border="white",ylim=c(0,600),
          ylab="Number of Crime",main="Top 5 Crime among Gender")
}


plotbyage<-function(x){
  five<-x
  colnames(five)<-c("age","gender","offense","race","code")
  idx1<-which(five$age<=18)
  idx2<-which(five$age<=55&five$age>=19)
  idx3<-which(five$age>55)
  a<-tapply(five$age[idx1],five$code[idx1],length)
  b<-tapply(five$age[idx2],five$code[idx2],length)
  c<-tapply(five$age[idx3],five$code[idx3],length)
  z<-data.frame(a,b,c)
  barplot(as.matrix(t(z)),beside=T,legend.text =c("Minor","Puber","Old"),args.legend = list(bty="n",horiz=T),
          col=brewer.pal(3,"Set2"),border="white",ylim=c(0,730),
          ylab="Number of Crime",main="Top 5 Crime among Age")
  }

plotbyrace<-function(x){
  five<-x
  colnames(five)<-c("age","gender","offense","race","code")
  idx1<-which(five$race=="B")
  idx2<-which(five$race=="W")
  idx3<-which(five$race!="B"&five$race!="W")
  a<-tapply(five$race[idx1],five$code[idx1],length)
  b<-tapply(five$race[idx2],five$code[idx2],length)
  c<-tapply(five$race[idx3],five$code[idx3],length)
  z<-data.frame(a,b,c)
  barplot(as.matrix(t(z)),beside=T,legend.text =c("Black","White","Other"),args.legend = list(bty="n",horiz=T),
          col=brewer.pal(3,"Paired"),border="white",ylim=c(0,550),
          ylab="Number of Crime",main="Top 5 Crime among Race")
}