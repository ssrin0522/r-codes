if(Sys.info()[["sysname"]] == "Darwin") { par(family="AppleGothic")}

plot(1:10, type="n", main="Mac에서 서체(fonts) 테스트", xlab="", ylab="")
text(1,8,"\"AppleGothic\"으로 설정한 경우", cex=1.5, pos=4)
text(1,7,"\"AppleMyungjo\"으로 설정한 경우", family="AppleMyungjo", cex=1.5, pos=4)
text(1,6,"\"NanumGothic\"으로 설정한 경우", family="NanumGothic", cex=1.5, pos=4)
text(1,5, "\"NanumMyeongjo\"으로 설정한 경우", family="NanumMyeongjo", cex=1.5, pos=4)
text(1,4,"\"Senggakdero\"로 설정한 경우", family="Senggakdero", cex=1.5, pos=4)

names(pdfFonts())

fontNo <- length(names(pdfFonts()))
plot(1:fontNo, type="n")
for(i in 1:fontNo) text(fontNo/2, i, names(pdfFonts())[i], family=names(pdfFonts())[i])
