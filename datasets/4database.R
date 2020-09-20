#외부 데이터 다루기
#데이터베이스 MySQL/Oracle/MariaDB를 이용해서
#테이블에 저장된 데이터들을 R에서 활용 할 수 있음


#R + MySQL/MariaDB
#RMySQL 패키지를 통해
#테이블의 데이터를 데이터프레임으로 변환 가능

install.packages('RMySQL')
library(RMySQL)




# 1. MySQL/MariaDB 서버 접속
# dbConnect(사용자, 비밀번호, 디비명, 서버주소소)
dbconn <- dbConnect(MySQL(), user = 'bigdata', password = 'bigdata2020'
                    , dbname = 'bigdata', host = '140.238.26.183')



# 2. 한글처리
# dbSendQuery(대상, 질의문)
dbSendQuery(dbconn, 'set names utf8;')
dbSendQuery(dbconn, 'set character set utf8;')
dbSendQuery(dbconn, 'set character_set_connection = utf8;')


# 3. 디비상의 테이블 조회
dbListTables(dbconn)

# 4. 질의 생성 및 결과 집합 생성
# 조회 sql : select 컬럼들 from 테이블명
sql <- 'select * from summermedals' # * : 모든 컬럼들 출력해라
result <- dbSendQuery(dbconn, sql)


# 5. 결과집합에 저장된 조회결과를 데이터프레임에 저장
# fetch(결과집합명)

summermedals2 <- fetch(result)

# 6.  MySQL/MariaDB 서버접속종료

dbDisconnect(dbconn)

# 7. 저장한 데이터프레임 확인
head(summermedals2)



#ex) zipcode 테이블 읽어서 zipcodef 라는 데이터 프레임을 생성
#zipcode2013c <- read_csv('zipcode_20130201.txt')


dbconn <- dbConnect(MySQL(), user = 'bigdata', password = 'bigdata2020'
                    , dbname = 'bigdata', host = '140.238.26.183')




dbSendQuery(dbconn, 'set names utf8;')
#전체인코딩을 utf-8로 설정
dbSendQuery(dbconn, 'set character set utf8;')
#문자집합을 utf-8로 설정
dbSendQuery(dbconn, 'set character_set_connection = utf8;')
#서버 연결시 인코딩을 utf-8로 설정

sql <- 'select * from zipcode' # * : 모든 컬럼들 출력해라
result <- dbSendQuery(dbconn, sql)

zipcode2013f <- fetch(result, n = -1)
# n = 숫자옵션 : 테이블에서 n건 만큼의 데이터를 읽어옴
#(단, -1로 설정하면 모두 읽어옴 기본은 500건건)
dbDisconnect(dbconn)

#한글 데이터가 저장된 테이블이라면
#iconv라는 함수 사용해서 적절하게 변환하는 과정이 필요
#iconv(대상, from = 인코딩)
zipcode2013f[,2] <- iconv(zipcode2013f[,2], from = 'utf-8')
zipcode2013f[,3] <- iconv(zipcode2013f[,3], from = 'utf-8')
zipcode2013f[,4] <- iconv(zipcode2013f[,4], from = 'utf-8')
zipcode2013f[,5] <- iconv(zipcode2013f[,5], from = 'utf-8')
zipcode2013f[,6] <- iconv(zipcode2013f[,6], from = 'utf-8')



View(zipcode2013f)










