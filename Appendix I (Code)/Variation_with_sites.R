#load the library
library(ggplot2)

png(filename="compare.png", width=1024, height=1024)

#it is the graph between number of visits and number of orders placed 
a <- ggplot(test,aes(test$visits))+geom_line(aes(y=test$platform),colour="red")+ggtitle("Visits in various platform")+xlab("Visits")+ylab("Platform")

#it is the graph between number of visits and number of visitors
b <- ggplot(dataacme,aes(dataacme$visits))+geom_line(aes(y=dataacme$platform),colour = "blue") +ggtitle("Visits in various platform by Acme")+xlab("Visits")+ylab("Platform")

c <- ggplot(datapinnacle,aes(datapinnacle$visits))+geom_line(aes(y=datapinnacle$platform),colour = "blue") +ggtitle("Visits in various platform by Acme")+xlab("Visits")+ylab("Platform")

grid.arrange(a,b,c,ncol=2,nrow=2)  
dev.off()
