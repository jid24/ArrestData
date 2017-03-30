#Cleaning Data
rm(list=ls())
dat=read.csv("ArrestData.csv")
y<-regexpr("/",dat$OFFENSES)
idx<-which(y>0)
offense<-NULL
i=0
for(n in 1:3100){
  i=i+1
  offense[i]<-substr(dat$OFFENSES[idx[n]],1,y[idx[n]]-1)
}
dat1<-dat[idx,]
dat1$OFFENSES<-offense
dat2<-dat[-idx,]
arrest<-rbind(dat1,dat2)

y6<-regexpr(" ",arrest$OFFENSES)
code<-NULL
i=0
for(n in 1:4805){
  i=i+1
  code[i]<-substr(arrest$OFFENSES[n],1,y6[n]-1)
}
arrest<-data.frame(arrest$AGE,arrest$GENDER,arrest$OFFENSES,arrest$RACE,code)

y1<-regexpr("[(]",arrest$code)
idx1<-which(y1>0)
code1<-NULL
i=0
for(n in 1:1069){
  i=i+1
  code1[i]<-substr(arrest$code[idx1[n]],1,y1[idx1[n]]-1)
}
arrest1<-arrest[idx1,]
arrest1$code<-code1
arrest2<-arrest[-idx1,]
arrest<-rbind(arrest1,arrest2)

y2<-regexpr("[.]",arrest$code)
idx2<-which(y2>0)
code2<-NULL
i=0
for(n in 1:48){
  i=i+1
  code2[i]<-substr(arrest$code[idx2[n]],1,y2[idx2[n]]-1)
}
arrest1<-arrest[idx2,]
arrest1$code<-code2
arrest2<-arrest[-idx2,]
arrest<-rbind(arrest1,arrest2)

sort(table(arrest$code), decreasing = TRUE)[1:10]
idx3<-which(arrest$code==2701|arrest$code==13|arrest$code==903|arrest$code==2702|arrest$code==9501|arrest$code==9015|arrest$code==1543|arrest$code==3925|arrest$code==2706|arrest$code==3929)
ArrestTopTen<-arrest[idx3,]

idx4<-which(arrest$code==2701|arrest$code==13|arrest$code==903|arrest$code==2702|arrest$code==9501)
ArrestTopFive<-arrest[idx4,]

#Plot
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
###########Test
plotbygender(ArrestTopFive)
plotbygender(ArrestTopTen)

##########
install.packages("RColorBrewer")
library("RColorBrewer") 
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
###########Test
plotbyage(ArrestTopFive)
plotbyage(ArrestTopTen)

##########
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
          ylab="Number of Crime",main="Top 5 Crimes among Race")
}
###########Test
plotbyrace(ArrestTopFive)

###########
library(lubridate)
dt=read.csv("ArrestData.csv")
time<-as.POSIXct(dt$ARRESTTIME)
time<-year(time)
arrest<-cbind(arrest,time)

a<-ggplot(data=ArrestTopFive,aes(x=ArrestTopFive$arrest.AGE,fill=ArrestTopFive$arrest.GENDER))
a+geom_bar(stat="count",width = .5)+facet_grid(.~ArrestTopFive$code)+
  ylab("Number of Crime")+
  xlab("Age")+
  ggtitle("Top 5 Crimes among age")+
  guides(fill=guide_legend(title="Gender"))

