
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# 통계

# 1. 기술통계학
# 2. 추론통계학
# 3. 베이즈통계학

# 표본추출방법
* 단순랜덤
* 계통추출
* 층화추출
* 군집추출

*복원추출
    + 표본을 하나 추출한 후 다시 모집단에 넣은 후 추출
      그 다음 표본을 추출하는 방식
      $$ m x m x ... x m = m^n = _m{/pin} n_ $$
      $$ _m{/pi}n_$$
*비복원추출
    + 한 번 뽑은 표본을 모집단에 넣지 않고 다음 표본을 추출
      $$ m(m-1)(m-2)...(m-n+1) = _mP_n $$
      $$ _m{P}_n$$

* R에서는 sample 함수를 이용해서 표본 추출이 가능
    + sample(모집단, 표본수, 복원/비복원여부)


```{r}

sample(x=1:10, 5, replace = T) #복원추출



```
```{r}


menu <- c('연어','삼겹살','곱창','참치','양꼬치')
sample(menu, 1 , replace = F) #비복원추출



```



# 자료의 종류
* 질적자료
    + 명목자료
    + 순서자료
    + 구간자료
    + 비율자료
    
* 양적자료
    + 이산형
    + 연속형
    
```
# 타이타닉 자료에서 성별, 승선위치별, 승선등급별 
# 승객 비율을 조사해서 출력
```
```{r}
setwd('C:/Users/tjoeun/Desktop/R/day03/titanic')
titanic <- read.csv('titanic.csv')
head(titanic)


```    
```{r}
summary(titanic)
```

```{r}
#성별 승객 현황

frq_gender <- table(titanic$sex)
print(frq_gender)
barplot(frq_gender)


```

```{r}
#승선권 등급별 승객 현황
frq_pcls <- table(titanic$pclass)
barplot(frq_pcls, las = 1)
```
```{r}
#승선위치별 승객 현황
frq_embk <- table(titanic$embarked)
frq_embk
barplot(frq_embk)
```
```{r}
age <- titanic$age[!is.na(titanic$age)]
ages <- as.character(age)

df_age <- data.frame(age, ages, stringsAsFactors = F)

head(df_age, 10)
```
```{r}
df_age <- within(df_age, {
  ages[age <= 1 ] <- '~01'
ages[age >= 2 & age < 5 ] <- '~05'
ages[age >= 5 & age < 13] <- '~13'
ages[age >= 13 & age < 19 ] <- '~19'
ages[age >= 19 & age < 30 ] <- '~29'
ages[age >= 30 & age < 40 ] <- '~39'
ages[age >= 40 & age < 50 ] <- '~49'
ages[age >= 50 & age < 60 ] <- '~59'
ages[age >= 60 & age < 70 ] <- '~69'
ages[age >= 70 & age < 80 ] <- '~79'
ages[age >= 80 ] <- '~80'
})

head(df_age$ages, 10)
```
```{r}
#분류된 결과에 대한 빈도표 작성하고 시각화

frq_ages <- table(df_age$ages)
frq_ages

```
```{r}
#빈도표를 막대그래프 시각화
barplot(frq_ages, las=1)
```

# 통계 중요용어
* 모집단
  +$ U $, $ N $
* 표본
  +$ S $, $ n $

# 중심화 경향
  + 평균값
  + 중앙값
  + 최빈값

# 분산화 경향
  + 범위
  + 사분위수
  + 분산
  + 표준편차

# 대표값
### 평균 : 중심척도의 대표적인 통계값

<!-- ![](https://files.cloud.naver.com/.fileLink/gMkTtabE4OWPTGo%2BbEExUdVvtSwZRbKuhzggalyBAJe8W0TplT847WBiM7W%2BGb3KQkKAiOFLz5mV32wySYLY5go%3D/greecechar.png?authtoken=%2BE1ooOisTw9OhULy5fs31gI%3D) -->

![](C:/Users/tjoeun/Desktop/R/day06/greecechar.png)

### 모평균
* $ \mu $

>>
$$ \mu = \dfrac{1}{N} \sum_{n=1}^N x_i $$

### 표본평균
* $ \bar x $

```{r}
# 평균 : mean(x, na.rm=F)
# x : 평균을 구할 대상
# 결측치 포함여부
x = c(1,2,3,4,5,6,7,8,9,10)

mean(x)
```
```{r}
# 조선 왕들의 평균수명?
kings <- c(73,62,45,53,38,16,51,28,37,30,56,30,33,56,
           66,54,40,33,59,36,82,48,44,22,32,67,52)

mean(kings)
```
### 중앙값
* $ M_e $

```{r}

# 중앙값 : median(x, na.rm=F)
a <- c(1:9)
b <- c(1:10)

median(a)
median(b)


```

```{r}
# 중앙값 계산

x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

sort(x)
median(x)

```
### 최빈값
* $ M_o $
* R에서는 최빈값을 구하는 함수가 제공되지 않음
* table 함수와 which.max함수를 이용해서 구하도록 함

```{r}
# 최빈값
# 빈도표 작성 : table(x)
# 최대빈도 요소 위치값 조사 : which.max(x)
# 빈도표의 컬럼명 조사 : names(x)

x <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
sort(x)
table(x)

frqx <- table(x)
frqx
```
```{r}
maxidx <- which.max(frqx)
maxidx


names(frqx[maxidx])
# 위 예에서는 최빈값이 2개인데 1개만 나옴

```
```{r}
# 최빈값 구하는 함수 : get_mode
getmode <- function(x){}
getmode

```
```{r}
# 평균이 동일한 자료들

a <- c(1,2,3,4,5,5,5,6,7,8,8,9,9,9,9)
b <- c(4,5,5,5,6,6,6,6,6,6,6,7,7,7,8)
mean(a)
mean(b)

median(a)
median(b)

# 두 자료 모두 평균은 동일하지만
# 자료의 구성은 다름


```

### 범위
* $ R $

```{r}

# 범위 : range(x)

range(a)
range(b)

max(a) - min(a)



```

```{r}

# 조선 왕들의 평균수명 범위?
kings <- c(73,62,45,53,38,16,51,28,37,30,56,30,33,56,
           66,54,40,33,59,36,82,48,44,22,32,67,52)


range(kings)
max(kings)-min(kings)
```

### 분산
* 모분산 : $\sigma^2$
* 표본분산 : $S^2$

![](https://camo.githubusercontent.com/d940dd3ee3714fb61d6537384b92f64d3aad398e/68747470733a2f2f64726976652e676f6f676c652e636f6d2f75633f69643d315752494e6a46326d7159755146347a435733464c6d6f4552584956305a4c496f)

```{r}

# 조선 왕들의 평균수명 범위?
kings <- c(73,62,45,53,38,16,51,28,37,30,56,30,33,56,
           66,54,40,33,59,36,82,48,44,22,32,67,52)

var(kings)
# 결과값이 이상함

```
```{r}
my.var <- function(x){
  m <- mean(x) # 평균계산
  return(sum((x - m)^2)/(length(x)-1)) # 표본분산
  
  
}

# retrun (sum((x - m)^2)/(length(x))) # 모분산


my.var(kings)
```
```{r}
# 어떤 가푸치노 판매점들의 5일동안
# 오후 4~5시 사이의 판매량 데이터를 보고
# 어느 지점이 판매를 잘 하였는지 파악

ga <- c(20,40,50,60,80)
na <- c(20,45,50,55,80)



mean(ga)
mean(na)

summary(ga)
summary(na)

# 중심화경향으로 기술통계 실시  -> 가늠 할 수 없음



coffee.var <- function(x){
  m <- mean(x)
  return(sum((x - m)^2)/(length(x)-1)) # 표본분산
  
  
}

coffee.var(ga)
coffee.var(na)

var(ga)
var(na)

# 각 데이터의 위치(분산)척도로 두 집단의 차이를 알아 봄
# 나 집단이 분산이 적음으로 좀 더 괜찮은 판매추이를 보임(더 일정함)
```

### 표준편차
* 분산을 구하기 위해 편차($x_i - \bar x$)의 제곱합을 구함
* 편차의 제곱합 덕에 값이 너무 커짐
* 따라서, 분산값에 제곱근(루트)을 취함으로써
  측정값과 같은 단위로 변환 가능
* $S$

```{r}
# 분산 : sd(x)
# 조선왈들의 수명 표준편차

var(kings)
sd(kings)

```
```{r}
# 회계사원들의 웝급과 사무수습사원들의 월급비교
# 수습사원 평균월급은 3550, 표준편차는 250이다
acc <- c(3536,3173,3448,3121,3622)

summary(acc)
sd(acc)







```
#### 사분위수
# 대표적인 위치척도를 이용한 기술통계
# 관측치를 여러부분으로 나눠 각 값들의 위치를 결정
# 사분위수를 구하는 방법은 데이터의 유형과 방식에 따라
  9가지가 존재
* $Q_1, Q_2, Q_3, Q_4$

### 사분위수 구하는 방법
* 먼저, 중앙값을 구함 : 2사분위수
* 중앙값을 기준을 왼쪽방향의 1사분위수를 구함
* 중앙값을 기준을 오른쪽방향의 3사분위수를 구함

```{r}
# 표본이 다음과 같을 때 Q1, Q2 , Q3 구하기
nums <- c(1,3,4,7,10,11,20,22,25,30,31)

median(nums)

fivenum(nums)
quantile(nums, type = 1) # 위치 기반
quantile(nums, type = 6) # 값 기반

boxplot(nums)
```





```{r}
# 사분위수 : quantile(x, type)
# 위치 기반 사분위수 : fivenum(x)
# 비연속형 수치 (위치기준) : type 1~3 (1추천)
# 연속형 수치 (값기준): type 4~9 (6추천)

x <- c(1,2,3,4,10,50,100)
quantile(x)



fivenum(x)
quantile(x , type =1)
quantile(x , type =2)
quantile(x , type =3)
quantile(x , type =4)
quantile(x , type =5)
quantile(x , type =6)
quantile(x , type =7)
quantile(x , type =8)
quantile(x , type =9)


```
```{r}
numf <- c(1,2,2,4,4,6,7,8,9,10,12,12)

summary(numf)
quantile(numf, type = 1)
quantile(numf, type = 6)
boxplot(numf)

```

### 사분위수 활용방법

* fivenum : 상자수염그래프와 같이 사용
* quantile : 일반적인 사분위수

# 비대칭도
* 중심치 경향과 분포 경향을 통해 표본의 특성과
산포 정도를 파악 가능
* 분포가 좌우대칭/완만정도를 파악하기 어려움
* 표본의 도수분포에서 평균에 대한 비대칭방향과 정도를 어느정도 알 수 있음

```{r}
# 80명의 학생데이터의 분포에 대한 시각화
# 먼저, 도수분포표를 작성

heights <- read.csv('height.csv')
summary(heights)


```

```{r}
# 구간파악 : 최대/최소 파악

min <- min(heights)
max <- max(heights)


# min # 143 -> 140 (내림)
# max # 169 -> 170 (올림)

min <- as.integer(min/10)*10
max <- as.integer(max/10)*10+10


min
max
```
```{r}
# 구간별 범위 지정

bins <- seq(min,max,5 )

```
```{r}
# 계급값 : 각 계급을 대표하는 값, 계급의 중앙 값
# 140,145,150,155,160,165,170

mid <- ((bins[2] - bins[1]) / 2 )
mdbins <- bins + mid
mdbins

```
```{r}
# 상대도수 구하기 : 전체도수 / 전체빈도수


total <- length(heights$height)
h <- hist(heights$height, las=1)
relfrq <-h$counts / total
relfrq
sum(relfrq)

```

```{r}
# 누적도수 : 각 구간별 도수 누적합
# 누적합 : cumsum(x)
h$counts
csfrq <- cumsum(h$counts)
csfrq

```

```{r}
# 히스토그램, 계급값, 상대도수, 누적도수 시각화
hist(heights$height, las=1)
plot(mdbins[1:6], h$counts, type = 'b' , col = 'red' , las=1, sub = '구간')
plot(mdbins[1:6], relfrq, type = 'b' , col = 'black' , las=1, sub = '구간')
plot(mdbins[1:6], csfrq, type = 'b' , col = 'blue' , las=1, xlab = '구간'
     ,ylab = '누적분량')
hist(heights$height, freq = F, las = 1)
lines(density(heights$height), col = 'red') # 확률밀도곡선

```

### 왜도
* 분포곡선이 좌측이나 우측으로 어느정도 쏠렸는지 나타냄
* 왜도가 0보다 크면 왼쪽으로 쏠리는 분포로 나타나짐
* 즉, 오른쪽으로 꼬리가 긴 분포로 나타남

### 첨도
* 분포곡선의 봉우리가 어느정도로 뾰족한지 나타냄
* 첨도가 3보다 크면 폭이 좁고 봉우리가 높은 분포를 나타냄
* 간혹 프로그램에 따라 0을 기준으로 측정하는 경우도 있음

```{r}
# R에서는 psych 패키지의 skew와 kurtosi 함수를 이용
# 왜도 : skew(x)
# 첨도 : kurtosi(x)
```

install.packages('moments')
library(moments)

```{r}
skewness(x)
kurtosis(x)
```
```{r}
# 청소년 핸드폰 사용시간에 대한 히스토그램과
# KDE를 작성

phone <- c(10,37,22,32,18,15,15,18,22,15,20,25,38,28,
         25,30,20,22,18,22,22,12,22,26,22,32,22,23,
         20,23,23,20,25,51,20,25,26,22,26,28,28,20,
         23,30,12,22,35,11,20,25)


hist(phone, freq = F, las = 1)
lines(density(phone), col = 'red')

skewness(phone)
kurtosis(phone)




```
### 확률밀도추정
* kernal density estimation
* 관측된 데이터들의 분포로부터 원래 변수의 확률분포특성을 추정
* 즉, 해당변수에서 관측된 몇 가지 데이터로 부터 변수가 가질수 있는
모든값들에 대한 밀도(확률)를 추정하는 것

```{r}
# ex) 어느 회사의 주당이익자료임
# (0.09,0.13,0.41,0.51,1.12,1.20,1.49,3.18,3.50,6.36,7.83,8.92,10.13,12.99,16.40)
# 평균,사분위값, 표준편차, 왜도, 첨도는?

eps <- c(0.09,0.13,0.41,0.51,1.12,1.20,1.49,3.18,3.50,6.36,7.83,8.92,10.13,12.99,16.40)

mean(eps)
quantile(eps, type = 6)
sd(eps)
skewness(eps)
kurtosis(eps)

hist(eps, freq = F,las =1 )
lines(density(eps), col = 'blue')
```






