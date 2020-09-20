#파이그래프
#도수분포표를 원모양으로 시각화한 것
#지표의 범주별 빈도비율을 요약해서 나타낸 그래프
#pie(데이터, 각종옵션)

val <- c(10, 20, 30, 40, 50)

pie(val) # 기본작성 : 3시가 기준, 반시계방향 배치

pie(val, init.angle = 90) #12시 기준, 반시계방향

pie(val, init.angle = 90
    ,clockwise = T, col=rainbow(5)) #12시 기준, 시계방향

pie(val, init.angle = 90
    ,clockwise = T, col=rainbow(5)
    ,labels = c('a','b','c','d','e'))

#mtcars 데이터에서 실린더 비율 시각화
#빈도표 작성 : table
#빈도비율 작성 : prop.table

mtcars$cyl

frq_cyl <- table(mtcars$cyl)
pct_cyl <- prop.table(frq_cyl)
txt_pcyl <- paste(round(pct_cyl*100), '%')
txt_pcyl

pie(pct_cyl)
pie(pct_cyl, init.angle = 90, clockwise = T, col = rainbow(3))

text(0.4, 0.2, txt_pcyl[1])
text(0, -0.3, txt_pcyl[2])
text(-0.4, 0.3, txt_pcyl[3])

#핫도그우승대회에서 국가별/우승자별 비율 파이그래프로 시각화

summary(hotdogs)
View(hotdogs)

WC <- hotdogs$Country

a_WC <- table(WC)
b_WC <- prop.table(a_WC)
b_WC

txt_pWC <- paste(round(b_WC*100), '%')
txt_pWC

pie(b_WC, init.angle = 90, clockwise = T , col = rainbow(4))
text(0.1, 0.5, txt_pWC[1])
text(0.4, 0.2, txt_pWC[2])
text(0.6, -0.3, txt_pWC[3])
text(-0.2, -0.1, txt_pWC[4])

#
nation <- hotdogs$Country
winner <- hotdogs$Winner

frq_nat <- table(nation) #빈도계산
pct_nat <- prop.table(frq_nat) #빈도비율 계산
txt_pnat <- paste(round(pct_nat*100), '%') #비율을 백분율로 변환
txt_pnat


pie(pct_nat, init.angle = 90
    ,clockwise = T, col = rainbow(4))

text(0, 0.5, txt_pnat[1], col = 'green')
text(0.4, 0.2, txt_pnat[2], col = 'red')
text(0.6, -0.3, txt_pnat[3], col = 'black')
text(-0.2, -0.1, txt_pnat[4], col = 'orange')

frq_win <-table(winner)
frq_win
pct_win <-prop.table(frq_win)
txt_pwin <- paste(round(pct_win*100),'%')
txt_pwin

pie(pct_win, init.angle = 90
    ,clockwise = T, col = rainbow(length(frq_win))) #넘나 많은 것

win1 <- frq_win[frq_win >= 2] #2회 이상 우승한 사람만 추출

pct_win1 <-prop.table(win1)
txt_pwin1 <- paste(round(pct_win1*100),'%')
txt_pwin1

pie(win1, init.angle = 90
    ,clockwise = T, col = rainbow(length(win1))) 


win2 <- frq_win[frq_win == 1] #1회 우승한 사람만
win2
pct_win2 <- prop.table(win2)
txt_pwin2 <- paste(round(pct_win2*100), '%')
pie(pct_win2, init.angle = 90
    ,clockwise = T, col = rainbow(length(win2)))
















