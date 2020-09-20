#R로 크롤링 하기
#crawling 또는 scraping은 웹페이지의 내용중 필요한 데이터를 추출하는 행위
#크롤링을 제대로 하려면 웹이 작동하는 방식과
#웹 표준 기술을 잘 파악하고 있어야 함 (HTNL/CSS/JS)
#hanb.co.kr / k-apt.go.kr


#R에서는 rvest 패키지 이용해서 크롤링 할 수 있음
#파이썬의 beautifulsoup4에서 영감받아 만든 패키지



install.packages('rvest')
library(rvest)

?rvest

#한빛출판사의 '새로나온페이지'에서
#도서제목, 자자, 가격을 크롤링해서
#newbooks라는 데이터프레임을 만들고
#newbooks.csv라는 파일로 저장 (또는 newbooks 테이블에 저장)


#수집할 데이터가 있는 url 정의

url <-'https://www.hanbit.co.kr/store/books/new_book_list.html'

#정의한 url로 부터 html 소스를 가져옴 : read_html
#read_html(대상url)

html <- read_html(url)
html

#데이터 탐색과 추출 : html_nodes, html_text
#html_nodes(소스, 찾을 대상) : 지정한 위치의 요소를 가져옴
#html_text(요소명) : 요소에서 텍스트를 추출해 냄
#찾을 대상은 tag명, css선택자등으로 지정가능

#특정 tag로 요소탐색
title <- html_nodes(html, 'title') #웹페이지 제목

#웹페이지의 제목(title)요소를 찾아서
html_text(title)
#제목(title)요소의 텍스트를 추출

#ex) h2태그의 텍스트를 추출



h2 <- html_nodes(html, 'h2')
html_text(h2)
#하나 이상일 경우 nodes

#도서제목 추출
#유일한 이름 찾음
#->p 태크의 class의 book_tit 라는 class속성 이용
#->css 선택자 : p.book_tit

btitle <- html_nodes(html, 'p.book_tit')
btitle<- html_text(btitle)
btitle
btitle<-gsub('∙','·',btitle)
#gsub(찾을 문자, 바꿀문자, 대상)


#가격, 저자



bwriter <- html_nodes(html, 'p.book_writer')
bwriter <-html_text(bwriter)


#span태그의 price라는 class속성 이용
bprice <-html_nodes(html, 'span.price')
bprice <-html_text(bprice)
bprice
#원, 콤마 제거 / 문자를 숫자로 변경
bprice <-gsub('원','',bprice)
bprice <-gsub(',','',bprice)
bprice <-as.numeric(bprice)

bprice

#데이터프레임 생성

bookinfo <- data.frame(btitle, bwriter,bprice ,
                       stringsAsFactors = F)
















