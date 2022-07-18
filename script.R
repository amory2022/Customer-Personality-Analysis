rm(list = ls())

#import the dataset from Excel
library(readxl)

data<- read_excel("D:/Projects/R-Customers/marketing_campaign (1).xlsx")

View(data)

#To see a summary of the dataset

summary(data)

#look at the structure of the data set

str(data)

#The sum of the empty values

sum(is.na(data))

#Remove empty values

data<-na.omit(data)

#look at the type of Education

unique(data$Education)

#Apply of some statistical functions

#see average Customer's yearly household income

mean(data$Income)

median(data$Recency)

range(data$MntWines)

#convert the datatype of Dt_Customer column to date type

as.Date(data$Dt_Customer)

class(data$Dt_Customer)

typeof(data$Dt_Customer)

#Extracting "income" column

data$Income->customer_incom

#Extracting 12th 13th 14th columns 

data[,c(12,13,14)]-> Customer_Mn_Products

# getting the count of Customer who is single

count=0
for (i in 1:nrow(data)) {
  if (data$Marital_Status[i]=="Single") {
    count=count+1
  }
}
print(count)

#Number of Customers whose date of birth is greater than 1960

count=0
i=1
while (i<nrow(data)) {
  if (data$Year_Birth[i]>1960) {
    count=count+1
  }
  i=i+1
}
print(count)


# data Manapulation

library(dplyr)

#Customer who is Married

data %>% filter(Marital_Status=="Married")->customer_Married

#Customer who is Married and his Income greater than 52247

data %>% filter(Marital_Status=="Married" & Income>52247)->customer_Married_Income

View(customer_Married_Income)

#count of different state of customers

data %>% count(Marital_Status)


# data visualization

library(ggplot2)

#bar plot for the Marital_Status column

ggplot(data = data,aes(x=Marital_Status,fill=Marital_Status))+geom_bar()

#scatter-plot between Marital_Status & Income

ggplot(data = data,aes(x=Marital_Status,y=Income))+geom_point(col="red")

#mapping Marital_Status to col aesthetic

ggplot(data = data,aes(x=Marital_Status,y=Income,col=Marital_Status))+geom_point()

#Boxplot between Marital_Status and Income

ggplot(data = data,aes(x=Marital_Status,y=Income))+geom_boxplot()

ggplot(data = data,aes(x=Marital_Status,y=Income))+geom_boxplot(col="green",fill="violet")

ggplot(data = data,aes(x=Marital_Status,y=Income))+geom_boxplot(fill="violet")












