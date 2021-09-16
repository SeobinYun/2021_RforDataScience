# lec3_3.r
# Data handling
# Data analysis with autompg.csv

# data manipulation package
# select, filter, group by, summarise in dplyr package 
install.packages("dplyr")
library(dplyr)

# set working directory
setwd("C:/tempstore/moocr")

# Read txt file with variable name
# http://archive.ics.uci.edu/ml/datasets/Auto+MPG

# Data reading in R
car<-read.csv(file="autompg.csv")
attach(car)

head(car)
dim(car)
str(car)
# str: 데이터의 변수들이 어떻게 정의되어 있는지
# 398개의 행

# Summary
summary(car)

# Basic statistics

# frequency
table(origin)
table(year)

# mean and standard deviation
mean(mpg)
mean(hp)
mean(wt)

# Data handling using "dplyr"

# 1. subset data : selecting a few variables
# car 데이터에서 mpg, hp 변수만 추출
set1<-select(car, mpg, hp)

# 2. subset data : Drop variables with -
# car 데이터에서 mpg로 시작하는 변수를 제외하여 set2라는 데이터 생성
set2<-select(car, -starts_with("mpg"))

# 3. subset data : filter mpg>30
# car 데이터에서 mpg가 30보다 큰 행 추출
# filter()
set3<-filter(car, mpg>30) 
head(set3)

# 4. create a derived variable
# mutate - 기존 변수를 변환해서 새로운 변수를 만들 때 사용하는 함수
# %>% - 연산자를 사용하여 연결
# mpg라는 변수에서 결측치가 있는 경우를 제외
# mile per gallon을 km per gallon으로 바꿈

set4<-car %>%
  filter(!is.na(mpg)) %>%
  mutate(mpg_km = mpg*1.609)

head(set4)

# mean and standard deviation
car %>%
  summarize(mean(mpg),mean(hp),mean(wt))

# mean of some variables
# car 1~6번째 변수들에 대한 평균을 달라라
select(car, 1:6) %>%
  colMeans()

# table with descriptive statistics
a1 <- select(car, 1:6) %>% summarize_all(mean)
a2 <- select(car, 1:6) %>% summarize_all(sd)
a3 <- select(car, 1:6) %>% summarize_all(min)
a4 <- select(car, 1:6) %>% summarize_all(max)
table1 <- rbind(a1,a2,a3,a4)
rownames(table1) <- c("mean","sd","min","max")
table1

# summary statistics by group variable
# group_by - car 데이터의 cyl열을 그룹으로 묶음
# na.rm - TRUE일 경우 통계량을 구할 때 결측값은 제외하고 계산
car %>%
  group_by(cyl) %>%
  summarize(mean_mpg = mean(mpg, na.rm = TRUE))











