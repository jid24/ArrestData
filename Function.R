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

a1<-c(2701,13,903,2702,9501,9015,1543,3925,2706,3929)
idx3<-which(arrest$code=="2701"|"13"|"903"|"2702"|"9501"|"9015"|"1543"|"3925"|"2706"|"3929")
idx3<-which(arrest$code==2701|13|903|2702|9501|9015|1543|3925|2706|3929)

