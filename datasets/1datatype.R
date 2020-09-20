#성적 처리 1
#이름, 국어 영어 수학에 대한
#총점 평균 계산
name = '수지'
kor = 98
eng = 97
mat = 90
tot = kor + eng + mat
mean = tot / 3

sprintf('%s %d %d %d %d %.1f', name, kor, eng, mat, tot, mean)

name2 = '혜교'
kor2 = 99
eng2 = 99
mat2 = 98
tot2 = kor + eng + mat
mean2 = tot / 3

sprintf('%s %d %d %d %d %.1f', name2, kor2, eng2, mat2, tot2, mean2)

#단일변수로는 많은 종류의 데이터를 다루기 힘드니
#데이터 분석에 용이한 자료형을 사용하는 것이 좋음

name3 <- '지현'
kor3 <- 75
eng3 <- 77
mat3 <- 60
tot3 <- kor + eng + mat
mean3 <- tot / 3

sprintf('%s %d %d %d %d %.1f', name3, kor3, eng3, mat3, tot3, mean3)


#할당연산자를 = 대신 <-로 사용
#R의 기본 자료형
#정수 실수 문자 범주형 논리형

x <- 5
y <- 3
z <- x / y #실수

str <- 'Hello, world!' #문자형
print(str)

gender <- factor(c('남' , '여')) #범주
gender

table(gender)


isMarreid <- T #논리형
isMarreid


haveCar <- F
haveCar


#산술연산자

x <- 5
y <- 2
sprintf("5 나누기  2 = %f", x / y)
sprintf("5 자수승  2 = %d", x ^ y)
sprintf("5 나누기  2 의 나머지 = %d", x %% y)
sprintf("5 나누기  2 의 몫= %d", x %/% y)





#자료형 변환 : as~

a <- '5'
b <- '10'



sprintf('5와 10을 더하면 %d', as.integer(a) + as.integer(b))




#논리식 연산자 : || (or) , &&(and)
#특히 , | , & 보다는 || , &&을 사용
#|| , &&는 단축식 평가 short circuit evaluation 가 지원됨

(1 == 2) && (3 < 4) && (T != F)

# Alt + shift +방향키
#ctrl + d 한줄지우기
#ctrl + shift + c : 주석붙이기


#백터 : 동일한 자료형으로 구성된 1차원 배열

# 백터생성은 c함수 이용해서 생성

# c(데이터 1, 데이터 2, ......)

?c # combination

name <- c("철수", "영희", "순돌돌")

age <- c(22 , 20 , 25)

sex <- c("M" , "F", "M") # as.factor(c("M" , "F", "M"))

blood <- c("A" , "O" , "B")

#문자형 데이터 중 범주혐 변수는 factor형으로 변환

sex <- as.factor(sex)
blood <- as.factor(blood)

evens <- seq(2 , 100 , 2)
evens

#백터 생성시 : 연산자를 사용하면 범위를 지정 할 수 있음

#C(시작 갑 : 끝 값)
#seq(from = 시작 값 , to = 끝 값 : by = [간격]) 갑을 순열형태로 생성가능, 
#[]는 생략 가능하다는 표시

#1~100사이 정수를 백터로 생성

nums <- c(1:100)
nums <- seq(1,100)
nums 

odds <- seq(from = 1 , to = 50 , by = 2)
odds


rep



#월별 신생아 몸무게

age <- c(1 , 3 , 5 , 2 , 11 , 9 , 3 , 9 , 12 , 3) #단위는 개월수
weight <- c(4.4 , 5.3 , 7.2 , 5.2 , 8.5 , 7.3 , 6.0 , 10.4 , 10.2 , 6.1)
#단위는 KG

#변수별 기술통계 실시

summary(age)
summary(weight)

#그래프로 시각화 - 상관곤계



plot(x = age, y = weight)
?plot

#벡터 연산
#벡터에 저장된 값을 이용해서 간단한 통계적 분석을 실시할 수 있음
#sum , mean , median , max , min , var , sd , range


var(weight)
sd(weight)
range(weight)
mean(weight)
median(weight)

#벡터 요소 다루기 (indexing)
#벡터에 저장된 데이터 또는 일부 데이터를 골라서 특정 작업을 실시할 때
#사용하는 기법

#벡터의 요소는 벡터명[위치 값] 형식으로 접근 할 수 있음
#요소의 위치 값은 1부터 시작

# age 벡터에서 1 , 5 , 10 번째 요소만 출력

age[1]
age[5]
age[10]

#하나 이상의 요소를 선택하려면 벡터명[c(위치값1, 위치값2,...)]
#의 형식으로 사용

age[c(1 , 5 , 10)]


# age 벡터에서 6 , 7 , 8 , 9 번째 요소만 출력

age[c(6 , 7 , 8 , 9)]
age[seq(6 , 9)]
age[6 : 9]

#age 벡터에서 1 ,2 ,3 번째 요소만출력

age[c(1 , 2 , 3)]
age[seq(1 , 3)]
age[1 : 3]
age[-c(4 : 10)] # 마이너스 기호는 특정요소를 제외한다는 의미


#head / tail 이용해서 데이터 일부 확인

#head(x = 대상 , y = 갯수) 위에서 n개의 데이터 추출
#tail(x = 대상 , y = 갯수) 끝에서 n개의 데이터 추출


head(x=age) # 갯수 지정 안 하면 기본 6개가 뜸
head(x=age, n=15)

tail(x=age)
tail(x=age , n=3)



