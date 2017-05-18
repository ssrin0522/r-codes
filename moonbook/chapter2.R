require(moonBook)
require(rmarkdown)

data(acs)
?acs
str(acs)

mytable(Dx~., data=acs)
mytable(sex~age+Dx, data=acs)

mytable(am~.-hp-disp-cyl-carb-gear, data=mtcars)

data(radial)
mytable(sex~age+weight+TC+hsCRP, data=radial, method=3)

mytable(am~., data=mtcars)

mytable(am~carb, data=mtcars, max.ylev=6)

mytable(sex+DM~., data=acs)

mytable(sex+Dx~., data=acs)

out <- mytable(Dx~., data=acs); mylatex(out)
out1 <- mytable(sex+Dx~.-smoking, data=acs); mylatex(out1, size=4)

out <- mytable(sex~age+Dx, data=acs)
for(i in 1:8) mylatex(out, size=i, caption=paste("Table ", i, ". Fontsize=", i, sep=""))

# 9

mycsv(out, file="test1.csv")
mycsv(mytable(sex+DM~age+Dx, data=acs), file="test2.csv")

# 10
out <- mytable(sex~age+Dx, data=acs)
myhtml(out)
myhtml(mytable(sex+DM~age+Dx,data=acs))
myhtml(out)

out <- mytable(sex~age+Dx, data=acs)
myhtml(out)
myhtml(mytable(sex+DM~age+Dx, data=acs))
