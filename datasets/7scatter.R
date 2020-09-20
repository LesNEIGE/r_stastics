# 데이터 시각화
# 데이터를 관찰하는 과정에서 선택이 아닌 
# 반드시 거쳐야 할 필수사항
# 그래프와 그림형태의 시각적인 묘사 

#R 그래프 함수
# -> plot, hist, boxplot, barplot, pie, stem

#표준정규분포를 따르는 난수 15개 생성하고
#그에 따른 그래프를 작성해서 시각화
#정규분포 : 수집한 자료가 나타날 분포의 형태가
#보통 평균 0, 표준편차가 1인 형태

x <- rnorm(15) # 정규분포 난수 r은 랜덤 : -1~1 , rnorm(갯수) 
summary(x)

plot(x) #산점도 : plot(x, y, 기타옵션)

barplot(x) # 막대그래프 : barplot(x, y, 기타옵션)

hist(x) # 히스토그램 : hist(x, 구간, 기타옵션)

boxplot(x) # 상자수염그래프 : boxplot(x, 기타옵션)

stem(x) #줄기잎그래프 : stem(x, 기타옵션)

#두 약물에 따른 환자반응

dose <- c(20, 30, 40, 45, 60) # 나이
drugA <- c(16, 20, 27, 40, 60) # 효과정도
drugB <- c(15, 18, 25, 31, 40)



#학생 10명의 키
heights <-c(170, 165,182,156,142,165,159,147,175,172)

# 산점도 scatter plot
# n개의 짝으로 이루어진 자료들을
# x, y 평면에 점으로 나타낸 그래프
# 자료의 흩어짐(분포) 정도를 파악 - 상관/회구분석에 사용
# plot(x, y, 그래프옵션)
# plot(y, 그래프옵션) -> x축 자동 지정

#단순출력
plot(heights)
#plot(x=seq(1:10), y=heights)


plot(dose, drugA)
plot(dose, drugB)


#그래프의 다양한 설정 보기 
#main, sub, xlab/ylab, axes, xlim/ylim, col, pch

plot(heights, main = '학생10명의키')
plot(heights, main = '학생10명의키', sub = '2020.07')
plot(heights, main = '학생 10명의 키', sub = '2020.07'
     , xlab = '학생번호' , ylab = '키')
plot(heights, main = '학생 10명의 키', sub = '2020.07'
     , xlab = '학생번호' , ylab = '키' , ylim = c(140,185)) # 축 값 범위
plot(heights, main = '학생 10명의 키', sub = '2020.07'
     , xlab = '학생번호' , ylab = '키' , ylim = c(140,185), col = 'red' 
     , type = 'l') # type : 그래프 유형, p(점) , l(선) 

grid() # 그래프 배경 눈금을 표시


plot(heights, main = '학생 10명의 키', sub = '2020.07'
     , xlab = '학생번호' , ylab = '키' , ylim = c(140,185), col = 'red' 
     , type = 'l'
     , axes = F) #axes : 축 지우기
axis(side = 1 , at = 1:10) #axis : 축 만들기
axis(side = 2 , at = seq(140,185,5),las = 1)

# axis(side = 축방향 (1:x축), at=눈금간격, las=눈금레이블방향(1:x축과 평행으로))

box() # 테두리 표시

text(heights, cex=0.8, adj = c(0, -0.2) , lab=heights) #단일 값이라 잘 나옴

# text(y좌표, 글자크기, 글자위치, 글자내용)
# 특정 x,y 위치에 지점 표시
# adj : 음수 일 때는 오른쪽,위쪽
# adj : 양수 일 때는 왼쪽,아래쪽


#A약물에 대한 반응정도



plot(dose, drugA, main = '나이에 따른 A약물의 반응정도', sub = '2020.07'
     , xlab = '환자나이' , ylab = '약물반응정도' , ylim = c(10,70), col = 'red' 
     , type = 'b'
     , axes = F) 
axis(side = 1 , at = seq(20,60,5))
axis(side = 2 , at = seq(15,60,5),las = 2)
text(dose, drugA , cex = 0.7, adj = c(0, -0.2),  lab = drugA) # x, y 둘 다 잡아줘야함

grid()


box()

#B
plot(dose, drugB, main = '나이에 따른 B약물의 반응정도', sub = '2020.07'
     , xlab = '환자나이' , ylab = '약물반응정도' , ylim = c(10,70), col = 'blue' 
     , type = 'l'
     , axes = F) 
axis(side = 1 , at = seq(20,60,5))
axis(side = 2 , at = seq(15,40,5),las = 2)
text(dose, drugB, cex=0.8 , adj= c(0,0.2) , lab=drugB)

grid()


box()

#산점도 행렬 이용
#여러변수 쌍의 관계를 동시에 평가

plot(iris[, -5])
pairs(iris[,-5])


#iris 데이터에서 품종별 붓꽃꽃받침 길이와
#꽃잎 길이에 대한 산점도를 그려보기

iris$Species # 품종이 문자형(명목형)
as.integer(iris$Species) # 순서가 있는 서수형 데이터로 변환


plot(iris$Sepal.Length, iris$Petal.Length
     , pch = as.integer(iris$Species)+1 # pch : 포인트 유형
     , col = as.integer(iris$Species)+1) # col : 색깔
#+1 로 하나씩 증가시켜 모양과 색상 변경가능
#서수형데이터를 토대로 붗꽃의 품종을 나타냄


#범례표시하기
#legend(위치, 값, 기호, 색상)
#위치 : top, bottom .right, left ,center (여러개 조합가능)
legend('topleft', c('setosa','versicolor','virginica')
       ,pch=as.integer(iris$Species)+1
       ,col=as.integer(iris$Species)+1)


legend('topleft', levels(iris$Species)
       ,pch=unique(as.integer(iris$Species))+1
       ,col=unique(as.integer(iris$Species)+1))


#매니저별 산점도 표시
Manager <- c(1, 2, 3, 4, 5)
Date <- factor(c("10/24/14", "10/28/14", "10/01/14", "10/12/14", "05/01/14"))
Country <- factor(c("Us", "US", "UK", "UK", "UK"))
Gender <- factor(c("M", "F", "F", "M", "F"))
mgrage <- c(32, 45, 25, 39, 99)



leadership <- data.frame(Manager, Country, Gender, mgrage)

leadership


#
plot(leadership$Manager, leadership$mgrage, main = '매니저별 나이'
     , type = 'b'
     , pch = as.integer(leadership$Country)
     , col = as.integer(leadership$Country))

axis(side = 1 , at = seq(1,5,1))
axis(side = 2 , at = seq(1,100,5),las = 2)


grid()


box()


legend('topleft', levels(leadership$Country),
       pch = unique(as.integer(leadership$Country))
       , col = unique(as.integer(leadership$Country)))


#
plot(leadership$Manager, leadership$mgrage, main = '매니저별 나이'
     , type = 'b'
     , pch = as.integer(leadership$Gender)
     , col = as.integer(leadership$Gender))


legend('topleft', levels(leadership$Gender),
       pch = unique(as.integer(leadership$Gender))
       , col = unique(as.integer(leadership$Gender)))

#2개의 그래프 동시에 그리기
#A, B 약물에 따른 환자 반응

plot(dose, drugA, col = 2, type = 'b', pch = 1,
     xlab = '나이' , ylab = '약물반응정도'
     , las = 1)
lines(dose, drugB, col = 4, type = 'b', pch = 2)
legend('topleft', c('drugA','drugB')
       ,pch = c(1,2), col = c(2,4))


setwd('C:/Users/tjoeun/Desktop/R/day2/data1')
read.csv('hotdog-winners.csv')
hotdogs <- read.csv('hotdog-winners.csv')
hotdogs
summary(hotdogs)

head(hotdogs)
View(hotdogs)




plot(hotdogs)

plot(hotdogs$Year, hotdogs$Dogs.eaten , main = '핫도그 먹기', sub = '총 시기'
     , xlab = '연도' , ylab = '먹은 갯수'
     , type = 'b'
     , col = 2
     , axes = F)


axis(side = 1 , at = seq(1980,2010,10))
axis(side = 2 , at = seq(10,70,10),las = 2)

grid()
box()

legend('topleft' , c('년도별 핫도그 먹기 갯수') , col = c(2))




