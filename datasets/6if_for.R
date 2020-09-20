stdName <- c('지현','혜교','수지')
kor <- c(90,70,68)
eng <- c(85,90,95)
mat <- c(85,80,60)

sj <- data.frame(stdName, kor, eng , mat)

sj$tot <- sj$kor + sj$eng + sj$mat
sj$avg <- sj$tot / 3

x <- 10
x

if(x %% 2 == 0){
  print("짝수")
}else{
  print("홀수")
}

a <- 41
b <- 41
if(a > b){
  print('a는 b보다 크다')
}else if (a < b){
  print('a는 b보다 작다')
}else {
  print('a와 b는 같다')
}

#조건문의 단축표기
#ifelse(조건식, 참일경우, 거짓일경우)

#7의 배수인지 알아보기

y <- 21

ifelse((y %% 7 == 0), print('7의 배수'), print('아님'))


a <- 37
b <- 37
ifelse((a > b), 'a는 b보다 크다', 
       ifelse((a < b), 'a는 b보다 작다' , 'a와 b는 같다'))


#평균기준으로 수우미양가

sj$grd<- ifelse((sj$avg >= 90), '수',
       ifelse((sj$avg) >= 80, '우',
              ifelse((sj$avg) >=70 , '미',
                     ifelse((sj$avg) >=60, '양','가'))))







Manager <- c(1, 2, 3, 4, 5)
Date <- factor(c("10/24/14", "10/28/14", "10/01/14", "10/12/14", "05/01/14"))
Country <- factor(c("Us", "US", "UK", "UK", "UK"))
Gender <- factor(c("M", "F", "F", "M", "F"))
mgrage <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5,NA,2)
q5 <- c(5, 5, 2,NA,1)


leadership <- data.frame(Manager, Date, Country, Gender, mgrage, q1, q2, q3, q4, q5)
leadership
View(leadership)


#leadership 데이터 기준으로 나이컬럼을 재정의하는 나이대 ages변수 생성
#20~30 : 청년 31~45 : 중년 46~65:장년 66~ : 노년

#leadership$ages[leadership$mgrage <= 30] <- '청년'
#leadership$ages[leadership$mgrage >= 31] <- '중년'
#leadership$ages[leadership$mgrage >= 46] <- '장년'
#leadership$ages[leadership$mgrage >= 66] <- '노년' #순서대로 하면 간편


leadership$mgrages<- ifelse((leadership$mgrage >=66), '노년', 
                            ifelse((leadership$mgrage >=46), '중년' , 
                                   ifelse((leadership$mgrage>=31) ,'장년', '청년')))

#반복문
#1. 어떤 문장을 출력
Print('무엇을 할까요!')

#2. 여러번 출력
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')

#3.많이 출력
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')
Print('무엇을 할까요!')


#4.무엇을 -> 어떤걸 로 변경
#반복문 이용하여 수정
#동일한 문장을 여러번 반복해서 실행하는 명령 -> for, while
#for (반복변수 in 반복범위){
# 반목할 명령문}

#*를 5번 출력

print('*')
print('*')
print('*')
print('*')
print('*')
 

# i <- '*' 이 부분이 없어도 되네?
for(i in 1:5){
  print('*')
}

# 1~5 정수를 출력

for(i in 1:5){
  print(i)
  
}

#1~50 사이의 짝수

for(i in 1:50){
  if(i %% 2 == 0){
    print(i)
  }
  else{
    print('홀수')
  }
}

#1~100까지의 총합

sum <- 0
for(i in 1:100){
  sum = sum + i
}
print(sum)

# 100*101/2 <- 가우스덧셈법이 되도록 코드 짜보기

for(i in 1:9){
  for(j in 1:9){
    if(i*j %% 7 == 0){
      cat(j , 'x' , i , '=' , i*j , '\n')
    }
    }
  }

for(i in 1:9){
  #print('7 x 1 = 7')
  #cat('7 x', i , '=' , 7*i, '\n')
  result <- sprintf('7 x %d = %d' , i , 7*i)
  print(eval(result))
}

#매니저 평점분석
Manager <- c(1, 2, 3, 4, 5)
Date <- factor(c("10/24/14", "10/28/14", "10/01/14", "10/12/14", "05/01/14"))
Country <- factor(c("Us", "US", "UK", "UK", "UK"))
Gender <- factor(c("M", "F", "F", "M", "F"))
mgrage <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5,NA,2)
q5 <- c(5, 5, 2,NA,1)


leadership <- data.frame(Manager, Date, Country, Gender, mgrage, q1, q2, q3, q4, q5 , stringsAsFactors = F)

leadership

#계산된 대체값을 NA가 있는 q4, q5에 저장
leadership[4,9] <- min(leadership$q4 , na.rm = T)
leadership[4,10] <- min(leadership$q5 , na.rm = T)

#수정해야할 컬럼이 많다면 반복문으로 사용하면 편리하게 가능

for(i in 9:10){
  leadership[4,i] <- min(leadership$q4 , na.rm = T)
  leadership[4,i] <- min(leadership$q5 , na.rm = T)
}

leadership

#iris 데이터에서 꽃잎 길이(petal length)에 따라
#레이블(L,M,H)을 정의하세요
# <= 1.6 : L , <5.1 : M, >= 5.1 : H

iris

#iris <- iris$sjql(ifelse(iris$Petal.Length <= 1.6 , 'L',
                     
str(iris)
iris$Petal.Length

ifelse(iris$Petal.Length <= 1.6 , 'L',
   ifelse(iris$Petal.Length < 5.1, 'M' , 'H'))
#잘 실행 됌


if(iris$Petal.Length <= 1.6){
  print('L')
}else if(iris$Petal.Length <= 5.1){
  print('M')
}else{
  print('H')}

#첫번째 것만 작용된다고 경고가 뜸


if(iris$Petal.Length[150] <= 1.6){
  print('L')
}else if(iris$Petal.Length[150] <= 5.1){
  print('M')
}else{
  print('H')}

#150번째 것에 적용


for(i in 1:150){
if(iris$Petal.Length[i] <= 1.6){
  print('L')
}else if(iris$Petal.Length[i] <= 5.1){
  print('M')
}else{
  print('H')}
}

#for문 이용해서 모든 데이터를 대상으로 조건문 실행

#while
#실행할 반복횟수를 명시하지 않고
#단지 조건 불일치 여부에 따라 반복을 실행

#반복횟수초기화
#while(조건식){
#실행할 문장
#반복횟수 증가식
#}



#1~20까지 정수
i <- 1
while( i <= 20){
  print(i)
  i = i + 1
}

#1~100사이 3의 배수 출력

i <- 1
while(i <= 100){
  if(i %% 3 == 0){
    print(i)
    }
}


#break : 반복문 실행 도중 중단이 필요할때

#1~10000 까지 총합 계산
#200726되면 중단

sum <- 0 
for(i in 1:10000){
  sum = sum + i
  if(sum >= 200726) break
}
#print(sum)
cat(sum,i)

#next : 반복실행중 어떤 조건에 의해
#반복문의 나머지 문장을 실행하지 않고 건너뛰어
#반복을 계속하고 싶을 때 사용

#1~10000까지 총합계산. 단 , 짝수는 제외하고 계산


sum <- 0
for(i in 1:10000){
  if(i %% 2 == 0) next
  sum <- sum + i
}

print(sum)





