rm(list=ls())
setwd("C:/Users/dengj/Desktop/2016-2017 Spring/R/data")
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

arrest<-data.frame(arrest$AGE,arrest$GENDER,arrest$OFFENSES,code)
