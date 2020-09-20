#자주 사용하거나 작업 결과 데이터프레임을 R형식으로 보관
#저장시 : save(객체명, 위치/파일명) 
#불러올 시 : load(위치/파일명)



baby <- data.frame(bage, bweight)

setwd('C:/Users/tjoeun/Desktop/R')
save(baby, file = 'baby.rdata')
save(leadership, file = 'leadership.rdata')
save(patients, file = 'patiensts.rdata')



#저장한 rdata 파일 불러옴
setwd('C:/Users/tjoeun/Desktop/R')
load('leadership.rdata')
load('patiensts.rdata')
load('baby.rdata')

leadership
patients
baby

#read.csv , write.csv



#R에서 작업한 데이터프레임을 콤마 단위로 구분된 csv형태로 저장가능
#또한 콤마 단위로 구분된 데이터가 저장된 csv파일을 R로 읽게해서 데이터프레임가능

#write.csv(객체명, 저장위치/파일명, 옵션등..)
#옵션 : row.names = F (행번호 포함여부 지정)
      #: quote = F (따옴표 포함여부 지정)
#데이터프레임명 <- read.csv(저장위치/파일명, 옵션등..)
#stringAsFactors = F : 문자형 데이터를 범주형으로 변환하지 않음

#header = T : csv의 첫줄을 데이터프레임의 변수명으로 사용
#sep = ',' : 각 변수들이 ,로 구분되어 있음
            #변수가 탭으로 구분된 경우 '/t'를
            #변수가 빈칸으로 구분된 경우 ' '를 사용

#na.string = '대상' : 데이터에 결측치가 있는 경우 어떻게 처리할 지 지정
#대상문자들을 NA로 대체함        



write.csv(baby, 'C:/Users/tjoeun/Desktop/R/baby.csv')


setwd('C:/Users/tjoeun/Desktop/R')
write.csv(baby, 'baby.csv')
write.csv(baby, 'baby.csv', row.names = F , quote = F)
write.csv(patients, 'patients.csv', row.names = F , quote = F)
write.csv(leadership, 'leadership', row.names = F , quote = F)

baby <- read.csv('baby.csv', stringsAsFactors = F, header = T, sep = ',')


zipcode2013 <- read.csv('zipcode_20130201.txt')
#구분자는 ,로 지정해서 zipecode2013 데이터를 읽어옴
#하지만 파일내 구분자는 tap이기 때문에 제대로 출력되지 않음



zipcode2013 <- read.csv('zipcode_20130201.txt', header = T, sep = '/t')
#다시 구분자를 tap으로 지정해서 지정해서 zipecode2013데이터를 읽어옴




View(zipcode2013)

zipcode2020 <- read.csv('zipcode_seoul_202006.txt', header = T, sep = ' ', na.strings = 'FD')
View(zipcode2020)





zipcode2020b <- read.csv('zipcode_seoul_202006.txt', header = T, sep = '/t', na.strings = ' ')



View(zipcode2020b)


zipcode_seoul2 <- read.csv('zipcode_seoul_202006.txt', sep = '/t', na.strings = ' ')
zipcode_seoul2

#summermedals.csv 파일을 읽어서 summermedals라는 데이터프레임 생성


zipcode_summermedals <- read.csv('summermedals.csv', sep = ',' , na.string = ' ')
View(zipcode_summermedals)
summermedals <- data.frame(zipcode_summermedals)
View(summermedals)
#제목이 없다면 제목 지정 header

#용량이 크다면 notepad++로 읽으면 빠르게 읽을 수 있음


Titanic <- read.csv('titanic.csv', sep = ',', na.string = ' ')
View(Titanic)

#excel 파일 읽기
#readxl 패키지 설치

install.packages("readxl")
library(readxl)


?read_excel

#read_excel(대상, col_type = 'guess' , na = 'NA')
#col_type : 엑셀시트의 데이터 타입을 자동유추
titanic2 <- read_excel('titanic.xls', col_types = 'guess', na = 'NA')
View(titanic2)


#하들리위캄이 만든 패키지인 readr을 이용
#readr을 통해 tibble이라는 패키지가 생성되는데
#이것은 기존의 data.frame 보다 더 유용한 기능을 제공
#기존의 data.frame을 tibble로 변환하려면
#as.tribble(대상) 함수를 사용하면 됌
#단 , R기본명령인 read.csv는 euc-kr 형식으로 파일을 읽어 오는데
#readr의 read_csv는 utf-8 형식으로 파일을 읽어옴!


install.packages('readr')
library(readr)

#read_csv(file = 대상, 한글처리)



titanic3 <- read_csv('titanic.csv')
View(titanic3)

# zipcode2013을 read_csv로 읽어옴

zipcode2013c <- read_csv('zipcode_20130201.txt')
View(zipcode2013c)

zipcode2013d <- read_csv('zipcode_20130201.txt'
                         , locale = locale('ko', encoding = 'euc-kr'))

View(zipcode2013d)


#tab으로 작성된 파일이라 각 열들이 구분되지 않음
#read_tsv사용

zipcode2013e <- read_tsv('zipcode_20130201.txt'
                         , locale = locale('ko', encoding = 'euc-kr'))

View(zipcode2013e)


write.csv(zipcode2013 , 'C:/Users/tjoeun/Desktop/R/output.csv' , quote = F)

#천만건 데이터를 읽어 올때 걸리는 시간
#read.csv : 55초
#read_csv : 25초
#fread : 10초



#data.table 패키지의 fread 함수를 이용하면
#많은양의 데이터파일을 빠르게 읽어 올 수 있음
#fread(파일명, 옵션)



install.packages('data.table')
library(data.table)

zipcode_seoul3 <- read.csv('zipcode_seoul_202006.txt' , sep = '\t')
zipcode_seoul4 <- read_tsv('zipcode_seoul_202006.txt' ,
                           locale = locale('ko',encoding = 'euc-kr'))
zipcode_seoul5 <- fread('zipcode_seoul_202006.txt' , sep = '\t')

View(zipcode_seoul5)

#RStudio의 enviroment탭의 import버튼을 이용하면
#손쉽게 외부파일을 읽어서 데이터프레임을 만들 수 있음



