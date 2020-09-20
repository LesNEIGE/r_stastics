#당뇨병 환자 약물투여 결과

patientsID <- c(1, 2, 3, 4)
admDate <- factor(c("10/15/2014", "11/01/2014", "10/21/2014", "10/28/2014"))
ptage <- c(25, 34, 28, 52)
Dlabetes <- factor(c("Type1", "Type2", "Type1", "Type1"))
Status <- factor(c("Poor", "Improved", "Excellent", "Poor"))

cbind(patientsID, admDate, ptage, Dlabetes, Status)


#생성한 벡터를 엑셀의 시트처럼 표형태로 보고싶다면 View함수 이용
View(patientsID)

patients <- data.frame(patientsID, admDate, ptage, Dlabetes, Status)
patients

View(patients)


#매니저 평점 분석
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

#데이터프레임
#서로다른 자료형으로 구성된 데이터들로 만들어진 2차원 배열

#월별 신생아 몸무게

bage <- c(1 , 3 , 5 , 2 , 11 , 9 , 3 , 9 , 12 , 3) #단위는 개월수
bweight <- c(4.4 , 5.3 , 7.2 , 5.2 , 8.5 , 7.3 , 6.0 , 10.4 , 10.2 , 6.1)
#단위는 KG

baby <- data.frame(bage, bweight)
baby
View(baby)

##
name2 <- factor(c("철수", "춘향", "길동"))
age2 <- c(22, 20, 25)
sex2 <- factor(c("M", "F", "M"))
blood.type2 <- factor(c("A", "O", "B"))

patients2 <- data.frame(name2, age2, sex2, blood.type2)
patients2
View(patients2)



##데이터프레임 구조 파악 및 기술 통계
##str(이름 or 벡터)
##summary(이름 or 벡터)
str(baby)
str(patients)
str(patients2)
str(leadership)

summary(baby)
summary(patients)
summary(patients2)
summary(leadership)

#admDate 벡터 유형 잘못입력된 범주형에서 날짜형으로 변환 필요

#데이터 프레임의 특정변수 지정 : '데이터프레임이름$변수명' 으로 사용

?as.Date
#as.Date(대상, '변환날짜형식') 변환날짜형식문자 : %Y(4자리연도), %m(2자리), %d(2자리)
as.Date(patients$admDate, '%m/ %d/ %Y')
#변환결과는 시스템 날짜 표기형식으로 바뀌어 출력 됌

patients$admDate <- as.Date(patients$admDate, '%m/ %d/ %Y')
#변환결과를 다시 변수에 재적용

leadership$Date <- as.Date(leadership$Date, '%m / %d / %Y')

#데이터 프레임 생성이 문자형 데이터들은
#자동으로 범주형으로 바뀜
#이것을 막으려면 stringAsFactors 속성을 F로 지정

leadership2 <- data.frame(Manager, Date, Country, Gender, mgrage, 
                          q1, q2, q3, q4, q5, stringAsFactors = F)

str(leadership2)

#데이터 프레임 탐색
#데이터 프레임 각 요소에 접근 하려면
#'데이터프레임이름$변수명' 또는
#'데이터프레임이름[행-인덱스1, 열-인덱스2]' 또는
#'데이터프레임이름[, '열이름']'

#신생아 개월수 출력
print(baby$bage)
baby$bage
baby[,1]
baby[,'bage']



#당뇨병 환자 데이터 중에서 나이와 약물투여상태를 출력

#매니저 데이터에서 설문문항을 출력


patients$ptage
patients$Status

patients[,'ptage']
patients[, c(3,5)]
patients[, c('ptage','Status')]

leadership[,c(6:10)]
leadership[,seq(6,10)]



#당뇨병환자 데이터에서 3번 환자의 관측값 출력

patients[3,]
#'데이터프레임이름[boolean indexing,]' 형태로 작성
#boolean indexing : 조건식의 결과가 참인 위치값만 추출되도록 작성

patients$patientsID == 3
#조건에 일치하는 항모만 TURE로 표시되고 나머지는 FALSE
patients[patients$patientsID == 3,]

#데이터프레임의 행인덱스 부분에 조건식을 작성하면
#TURE인 항목만 표시 됌 - boolean indexing

#당뇨병환자 데이터에서 나이가 30이상인 환자 관측값 출력

patients$ptage > 30
patients[patients$ptage > 30,]
patients[patients$Status == "Poor",]

#매니저 데이터에서 국적이 영국 or, and 성별이 여자


leadership[leadership$Country == 'UK' | leadership$Gender == "F",]
leadership[leadership$Country == 'UK' & leadership$Gender == "F",]

cnd <- leadership$Country == 'UK' & leadership$Gender == "F"
leadership[cnd,]


#기존 데이터프레임에 새로운 컬럼 생성
#데이터프레임이름$새로운변수명 <- 값 지정

stdName <- c('지현','혜교','수지')
kor <- c(90, 80, 90)
eng <- c(90, 70, 80)
mat <- c(90, 70, 60)

sungjuk <- data.frame(stdName, kor, eng, mat)
sungjuk


sungjuk$tot <- sungjuk$kor + sungjuk$eng + sungjuk$mat
sungjuk$tot

sungjuk$avg <- sungjuk$tot/3
sungjuk$avg



sungjuk$grd <- '가'
sungjuk$grd[sungjuk$avg >= 90] <- '수'
#단일 컬럼 대상으로 boolean indexing 사용할때는
#열인덱싱 사용하지 않음 (쉼표 안 찍음)

sungjuk$grd[sungjuk$avg >= 80 & sungjuk$avg < 90] <- '우'
sungjuk$grd[sungjuk$avg >= 70 & sungjuk$avg < 80] <- '미'
sungjuk$grd[sungjuk$avg >= 60 & sungjuk$avg < 70] <- '양'

View(sungjuk)



#leadership 데이터 기준으로 나이컬럼을 재정의하는 나이대 ages변수 생성
#20~30 : 청년 31~45 : 중년 46~65:장년 66~ : 노년

#leadership$ages[leadership$mgrage <= 30] <- '청년'
#leadership$ages[leadership$mgrage >= 31] <- '중년'
#leadership$ages[leadership$mgrage >= 46] <- '장년'
#leadership$ages[leadership$mgrage >= 66] <- '노년' #순서대로 하면 간편

leadership$ages <- "아이" #ages라는 값이 없으니 임의의 값 넣어줌 
#leadership$ages <- NULL

leadership$ages[leadership$mgrage >= 20 & leadership$mgrage <= 30] <- "청년"
leadership$ages[leadership$mgrage >= 31 & leadership$mgrage <= 45] <- "중년"
leadership$ages[leadership$mgrage >= 46 & leadership$mgrage <= 65] <- "장년"
leadership$ages[leadership$mgrage >= 66] <- "노년"
View(leadership)

#생성한 변수나 기존변수 제거 하려면 
#'변수명' <- NULL
#dplyer 등으로 변수명 줄여서 사용 가능
#attach / detach , with, within (이게 가장 추천)
#within 쓸 때 : 데이터프레임명 <-within(데이터프레임명, 
# {변수명만을 이용한 수식1})
# {변수명만을 이용한 수식2})

leadership <-within(leadership, {ages[age <= 30] <-'청년'
ages[age >= 31] <-'중년'
ages[age >= 46] <-'장년'
ages[age >= 66] <-'노년'})


#leadership 설문문항의 총합과 평균


leadership$sumq <- leadership$q1 + leadership$q2 +leadership$q3 +leadership$q4+leadership$q5

leadership$meanq <- leadership$sumq/5


leadership <- within(leadership, {sumq <- q1+ q2 + q3+ q4+ q5
meanq <- sumq/5})

#within 구문으로 표현식 단순화
#단, within 구문으로 실행한 결과를 다시 재저장해야함
leadership

#subset 함수를 사용하면 간단한 표현식으로
#데이터를 추출 할 수 있다

#subset(데이터프레임이름, 표현식)


#patients[patients$ptage >= 30,]

subset(patients, ptage >= 30)

#환자 번호, 상태 출력

patients[patients$ptage >= 30, c('patientsID','Status')]

#매니저 데이터에서 국적이 영국 or, and 성별이 여자


leadership[leadership$Country == 'UK' | leadership$Gender == "F",]
leadership[leadership$Country == 'UK' & leadership$Gender == "F",]

cnd <- leadership$Country == 'UK' & leadership$Gender == "F"
leadership[cnd,]


subset(leadership , Country == 'UK' & Gender == "F")
subset(leadership , Country == 'UK' | Gender == "F")

#NA가 포함된 변수는 제대로 계산이 안 됌
#leadership 데이터의 4행의 q4, q5가 NA
#결측치 처리방식 : 제거 , 대체(평균, 최소/최대, 로그값)

#최소값으로 대체해보자 (na.rm = T) 사용

min(leadership$q4) #NA라고 뜸
min(leadership$q4, na.rm = T) #2
min(leadership$q5, na.rm = T) #1

#대체 값을 NA에

leadership[4,9] <- min(leadership$q4, na.rm = T)
leadership[4,10] <- min(leadership$q5, na.rm = T)

View(leadership)


#데이터가 넉넉하여 결측치를 제거하는데 문제가 없는 경우
#na.omit 함수 사용


na.omit(leadership2)

leadership3 <- na.omit(leadership2)
leadership3

#결측치 제거한 데이터프레임으로 sumq, meanq생성


leadership3 <- within(leadership3 ,{sumq <- q1 + q2 + q3+ q4+q5
mean <- sumq/5})
leadership3

#merge : patients <- merge(p1, p2 , by = 'name')







 







