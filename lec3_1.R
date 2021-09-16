# lec3_1.r
# Working directory
# Data import, frequency, histogram, 
# attach, detach

# set working directory
# change working directory 
setwd("C:/tempstore/moocr")

# check the current working directory
getwd()

# 1. Read csv file : brain weight data
brain<-read.csv("brain2210.csv")
head(brain)
dim(brain)

# 2. example for using 'attach'

# to get frequency of male and female (brain data)
# 빈도를 구하는 함수인 table
table(brain$sex)

# using the command 'attach'
# brain의 데이터에 있는 변수들을 사용할 거다. 
attach(brain)

# get frequency of male and female
table(sex)

# histogram of brain weight
# hist(brain$brainwt)
# attach를 안할 경우 위의 줄처럼 해줘야함
hist(wt)

detach(brain)


# several sheets in Excel file
install.packages("readxl")
library(readxl)

# 워크시트의 이름을 쓸 경우
mtcars1 <- read_excel("C:/tempstore/moocr/mtcarsb.xlsx", 
                      sheet = "mtcars")
# 워크시트의 페이지를 쓸 경우 
mtcars1 <- read_excel("C:/tempstore/moocr/mtcarsb.xlsx", 
                      sheet = 1)
head(mtcars1)

brain1<-read_excel("C:/tempstore/moocr/mtcarsb.xlsx", 
                   sheet = "brain")
head(brain1)

brainm<-read_excel("C:/tempstore/moocr/mtcarsb.xlsx", 
                   sheet = 2)
head(brainm)

