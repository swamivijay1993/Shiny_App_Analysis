#load data in R
test <- read.csv("data1.csv", header = T, sep = ",")

#Set up a plot for 4 graphs so that it is easy to analyse
png(filename="plot4.png", width=480, height=480)
par(mfcol = c(2,2))

#it is the graph between number of visits and number of orders placed 
plot(test$visits,
     test$orders,pch=13,
     col="blue",
     xlab = "visits",ylab = "orders", main = "visits vs orders")

#it is the graph between number of visits and number of visitors
plot(test$visits,
     test$distinct_sessions,pch=14,
     col="seagreen",
     xlab = "visits",ylab = "distinct sessions", main = "visits vs session") 

#it is the graph between number of visits and number of products to cart 
plot(test$visits,
     test$add_to_cart,pch=19,
     col="red",
     xlab = "visits",ylab = "product added", main = "visits vs product added")

#it is the graph between number of visits and number of unproductive visits
plot(test$visits,
     test$bounces,pch=12,
     col="green",
     xlab = "visits",ylab = "bounces", main = "visits vs bounces")


dev.off()