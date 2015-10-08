
#function to find the conversion rate of the dataset
#conversion rate for the given data set is 
conversion_rate <- function(convtrain){
  #check whether the columns contains 'na' values. If it has then remove them
  if((length(which(!is.na(convtrain$orders))) == nrow(convtrain) ) &  (length(which(!is.na(convtrain$orders))) == nrow(convtrain)))
  {
    convtrain <- convtrain
  }
  else
  {
    convtrain <- convtrain[(!is.na(convtrain$visits))&(!is.na(convtrain$orders)),]  
  }
  
  #form a seperate column by dividing orders and visits and find the total mean
  convtrain <- transform(convtrain,conversion_rate = orders/visits )
  mean(convtrain$conversion_rate,na.rm = T)
}


#function to find the bounce rate of the given dataset
bounce_rate <- function(convtrain){
  #check whether the columns contains 'na' values. If it has then remove them
  if((length(which(!is.na(convtrain$bounces))) == nrow(convtrain) ) &  (length(which(!is.na(convtrain$visits))) == nrow(convtrain)))
  {
    convtrain <- convtrain
  }
  else
  {
    convtrain <- convtrain[(!is.na(convtrain$bounces))&(!is.na(convtrain$visits)),]  
  }
  
  #form a seperate column by dividing bounces and visits and find the total mean
  convtrain <- transform(convtrain,conversion_rate = bounces/visits )
  mean(convtrain$conversion_rate,na.rm = T)
}

#function to find the bounce rate of the given dataset
add_to_cart_rate <- function(convtrain){
  #check whether the columns contains 'na' values. If it has then remove them
  if((length(which(!is.na(convtrain$add_to_cart))) == nrow(convtrain) ) &  (length(which(!is.na(convtrain$visits))) == nrow(convtrain)))
  {
    convtrain <- convtrain
  }
  else
  {
    convtrain <- convtrain[(!is.na(convtrain$add_to_cart))&(!is.na(convtrain$visits)),]  
  }
  
  #form a seperate column by dividing add_to_cart and visits and find the total mean
  convtrain <- transform(convtrain,conversion_rate = add_to_cart/visits )
  mean(convtrain$conversion_rate,na.rm = T)
}
