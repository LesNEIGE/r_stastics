#히스토그램
#연속형 데이터를 빈도표(frequency, 도수분포표)를 이용해서
#막대그래프와 비슷하게 표현
#x축은 변수들의 구간을 의미하는 '계급'
#y축은 구간의 빈도를 의미하는 '도수'

#구간을 나누기 전에 먼저 정렬을 해야함

#hist(대상, 구간정보)


#상대도수 히스토그램
#일반적인 히스토그램의 경우 y축은 빈도수를 나타내는데
#각 빈도가 발생할 확률을 나타내기 위해
#상대도수를 표시하기도 함
#상대도수 : 특정구간빈도 / 전체빈도수

#도수분포표
#특정구간에 속하는 자료의 갯수를 나타낸 표

#학생 10명의 키
heights <-c(170, 165,182,156,142,165,159,147,175,172)

hist(heights)

hist(heights , main = '학생들별 키' , xlab = '키' , ylab = '학생 수'
     ,las = 1 ,axes = F
     ,col=c(2:10))

axis(side = 1 , at = seq(140,190,10))
axis(side = 2 , at = seq(0,5))

grid()
box()

#색상 팔레트를 이용한 색상 지정
#색상팔레트명(색상수)
#rainbow, heat.colors, topo.colors, terrain.colors
#density : 확률밀도 추정 그래프
hist(heights , main = '학생들별 키' , xlab = '키 구간' , ylab = '확률'
    ,col=rainbow(5), probability = T)

lines(density(heights), col = 2)


#상대도수 히스토그램
#일반적인 히스토그램의 경우 y축은 빈도수를 나타내는데
#각 빈도가 발생할 확률을 나타내기 위해
#상대도수를 표시하기도 함
#상대도수 : 특정구간빈도 / 전체빈도수




#구간재설정 : breaks
hist(heights , main = '학생들별 키' , xlab = '키' , ylab = '학생 수'
     ,las = 1 ,axes = F
     ,col=rainbow(10), breaks = 10)

axis(side = 1 , at = seq(140,190,5))
axis(side = 2 , at = seq(0,5))

grid()
box()

#구간재설정 : 사용자 정의
cuts <-c(170, 165,182,156,142,165,159,147,175,172)
hist(heights , main = '학생들별 키' , xlab = '키' , ylab = '학생 수'
     ,las = 1 ,axes = F
     ,col=rainbow(5), breaks = cuts)

axis(side = 1 , at = seq(141,191,5))
axis(side = 2 , at = seq(0,4))

grid()
box()

#mtcars 데이터셋에서
#연비에대한 히스토그램으로 나타내어라

summary(mtcars)


hist(mtcars$mpg , xlab = '연비구간' , ylab = '빈도'
     , main = '자동차연비' , col=rainbow(5), axes = F
     , labels = T , cex = 0.3)

axis(side = 1, at = seq(10,35,5))
axis(side = 2, at = seq(0,15) , las = 2)


#
hist(mtcars$mpg , xlab = '연비구간' , ylab = '확률'
     , main = '자동차연비'
     , probability = T , las = 1)

lines(density(mtcars$mpg), col = 2)

#마력에 대한 히스토그램
hist(mtcars$hp , xlab = '마력구간' , ylab = '빈도'
     , main = '자동차마력' , col=rainbow(5), axes = F
     , labels = T , cex = 0.3)

axis(side = 1, at = seq(10,500,50))
axis(side = 2, at = seq(0,15) , las = 2)

#

hist(mtcars$hp , xlab = '마력구간' , ylab = '확률'
     , main = '자동차마력'
     , probability = T , las = 1)

lines(density(mtcars$hp), col = 2)


#핫도그컨테스트에서 우승자의 핫도그 먹은 갯수 시각화


setwd('C:/Users/tjoeun/Desktop/R/day2/data1')

hotdogs<-read.csv('hotdog-winners.csv')

View(hotdogs)

plot(hotdogs)

summary(hotdogs)

eats <- hotdogs$Dogs.eaten

hist(hotdogs$Dogs.eaten , main = '우승자가 먹은 갯수' , xlab = '우승자' , ylab = '먹은 갯수'
     ,las = 1 ,axes = F
     ,col=c(2:10))

hist(eats)
hist(eats , col=rainbow(7))
hist(eats , breaks = seq(5,70,5)
     , xlim = c(5,70) ,col=rainbow(15))
h <- hist(eats , breaks = seq(5,70,5)
     , xlim = c(5,70) ,col=rainbow(15), las = 1)

text(h$mids, h$counts + 0.7, labels = h$counts)















