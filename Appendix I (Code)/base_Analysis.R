#reference : https://www.youtube.com/watch?v=ujdBJmhLaGg&index=33&list=PLG4y4w32mF3okfFigbGb6DnElzahK_i8z

#load data in R
test <- read.csv("data1.csv", header = T, sep = ",")

#find the dimensions of the dataset
dim(test)

#find the levels of the coulmns
levels(test$platform)

#no of users who use various platforms 
ggplot(test,aes(test$visits))+geom_point(aes(y=test$platform),colour="red")

#the correlation of distinct_sessions and visits is close to 1, therefore most of the visitors 
#have visited once only
cor(test$distinct_sessions,test$visits)


#regression model between no of visits and orders placed
qplot(data=test, x = test$visits,y = test$orders, method ="lm", geom = "smooth", formula = y~x)

#plot between no of visits and orders.
plot(test$visits,test$orders,pch=14,col="blue",xlab = "visits",ylab = "orders")
#the graph is linear but it also has some deviations, but this can be ignored


#define a graph checking based on various sites. It is a graph between number of user visits and products added
qplot(test$visits,test$add_to_cart,facets= .~site,data = test)

#find the levels of the site
levels(test$site)

library(ggplot2)
#form a ggplot for the relation between the site and no of orders
qplot(test$orders, data=test, geom="bar", fill=test$site, alpha=I(.5), 
      main="Distribution of site", xlab="No of Orders", 
      ylab="Density")

#to check which site has most usage
summary(test$site)

#create a seperate data frame for that particular site
dataacme <- test[test$site == "Acme",]

#check the overall behaviour of our highest user
summary(dataacme)

#plot the platform used by acme users to visit the site
qplot(dataacme$platform,dataacme$visits,
        main = "Platform Vs Visits in Acme",xlab = "platform",ylab = "visits",data=dataacme,
        facets=.~new_customer, na.omit(dataacme$new_customer))

#the second highest used site is pinnacle so checl
datapinnacle <- test[test$site == "Pinnacle",]


#plot the platform used by pinnacle users to visit the site
qplot(datapinnacle$platform,datapinnacle$visits,
      main = "Platform Vs Visits in Pinnacle",xlab = "platform",ylab = "visits",data=datapinnacle,
      facets=.~new_customer, na.omit(datapinnacle$new_customer))


#the correlation comparison of distinct_sessions and visits of pinnacle and acme sites, therefore 
#most of the visitors have visited once only

cor(datapinnacle$distinct_sessions,datapinnacle$visits)
cor(dataacme$distinct_sessions,dataacme$visits)

  

