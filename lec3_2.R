# lec3_2.r
# Data handling
# subset and export

# set working directory
# change working directory 
setwd("C:/tempstore/moocr")

brain<-read.csv("brain2210.csv")
head(brain)

attach(brain)

# ex1. subset with female
# brainf<-subset(brain, sex=='f') after attach(brain)
brainf<-subset(brain, sex=='f') 
mean(brainf$wt)
sd(brainf$wt)

# ex2. subset with male
brainm<-subset(brain, sex=='m') 
mean(brainm$wt)
sd(brainm$wt)

# histogram for female and male
# 2*2 multiple plot
par(mfrow=c(2,2))
brainf<-subset(brain, sex=='f')
hist(brainf$wt, breaks = 12,col = "green",cex=0.7, main="Histogram (Female)", xlab="brain weight")

# subset with male
brainm<-subset(brain,sex=='m') 
hist(brainm$wt, breaks = 12,col = "orange", main="Histogram (Male)",xlab="brain weight")

# histogram with same scale
hist(brainf$wt, breaks = 12,col = "green",cex=0.7, main="Histogram(Female)" , xlim=c(900,1700),ylim=c(0,25), xlab="brain weight")
hist(brainm$wt, breaks = 12,col = "orange", main="Histogram(Male)" , xlim=c(900,1700), ylim=c(0,25),xlab="brain weight")

# ex3. subset with wt<1300
brain1300<-subset(brain,wt<1300)

# same subset of brain1300
# brain1300<-subset(brain,!brain$wt>=1300)
# summary를 통해 data의 요약 통계치 알아냄
summary(brain1300)
# 현재 sex 변수가 character 문자 변수로 되어있어서 지금 전체의 총 관측치수만 나옴.
# 따라서 table 함수를 사용해 빈도 얻음
table(brain1300$sex)

hist(brain1300$wt, breaks = 12,col = "lightblue", main="Histogram <1300 ", xlab="brain weight")

# Q1
brain1000<-subset(brain,wt<1000)
table(brain1000$sex)

#Q2
# 데이터 내 그룹별 요약통계치를 구하고 싶을 때는?
# group_by & summarize


# export csv file - write out to csv file 
write.table(brainf,file="brainf.csv", row.names = FALSE, sep=",", na=" ")

write.csv(brainf,file="brainf.csv", row.names = FALSE)

# export txt file 
write.table(brainm, file="brainm.txt", row.names = FALSE,  na=" ")


####################################################

# Data handling using "dplyr"
install.packages("dplyr")
library(dplyr)

# Statistics by group
summarize(group_by(brain, sex), mean_wt=mean(wt))
summarize(group_by(brain, sex), sd_wt=sd(wt))

# 'aggregate' for statistics by group
# aggregate(wt~sex, data=brain, FUN=mean)
# aggregate(wt~sex, data=brain, FUN=sd)


