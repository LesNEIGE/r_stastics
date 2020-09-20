#상자수염그래프(box and whiskers plot)
#연속형 변수에 대해 이상치와
#최소 / 1사분위(25%)/중위/3사분위/최대값등을
#시각적으로 표현하는 그래프

#기술통계에는 중심화경향과 분산도로 구분
#boxplot은 데이터의 분산도를 시각적으로 나타낸 그래프

#boxplot(대상, 옵션)


#mtcars 데이터중 자동차 연비에 대한 수치 분포

summary(mtcars$mpg)

boxplot(mtcars$mpg)
boxplot(mtcars$mpg, ylim=c(10,35),col=rainbow(1))

#인사정보 employees 데이터 사용해서
#급여현황에 대한 상자수염그래프를 그려보기

setwd('C:/Users/tjoeun/Desktop/R/day2/datasets')

employees <- read.csv('EMPLOYEES.csv')

summary(employees)

sal<-employees$SALARY

#급여평균 계산후 그래프에 기호표시
boxplot(sal, ylim = c(0,25000))
mean <- mean(sal)
points(mean, col=2, pch=18)

#이상치 제외후 다시 그림

sal2 <- sal[sal != 24000]
boxplot(sal2, col='red', ylim = c(0,20000))

mean2 <- mean(sal2)
points(mean2, col = 'white', pch='^')


#직책별 급여 현황
#boxplot(data=데이터프레임명, 집계대상컬럼~그룹화할 컬럼)

employees$JOB_ID 
boxplot(data=employees, SALARY~JOB_ID, las = 3, ylim = c(0,25000))

#부서별 급여 현황


boxplot(data=employees, SALARY~DEPARTMENT_ID, las = 3, ylim = c(0,25000))

View(employees)








