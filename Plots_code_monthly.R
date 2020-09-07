#Load Data
data <- read.csv("Data_Preprocessing/ProcessedOutputFile/Final Input File/ProcessedDataset.csv")
View(data)
data$Month_N <- factor(
  data$Month,
  levels = 1:12,
  labels = c(
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  )
)

#Weekwise all the plots 2005 - 2014
data_AY<- data[data['Year'] == c(2005:2014), ]

#Getting mean of the Admissions,Discharges and Occupancy
data_AY_a<-
  aggregate(data_AY[, 2:4], list(data_AY$Month_N, data_AY$Year), mean)

data_AY_a[, 3:5] <- round(data_AY_a[, 3:5], 0)
colnames(data_AY_a)[1:2] <- c("Month","Year")
data_AY_a$Year <- factor(data_AY_a$Year)
#Ordering the data by Year and Weekday
data_AY_a <- data_AY_a[with(data_AY_a, order(Year, Month)), ]

View(data_AY_a)
str(data_AY_a)



#Weekwise 2004 - 2008(Early Years)
data_EY <- data[data['Year'] == c(2004:2008), ]

#Getting mean of the Admissions,Discharges and Occupancy
data_EY_a <-
  aggregate(data_EY[, 2:4], list(data_EY$wday_name, data_EY$Year), mean)
data_EY_a[, 3:5] <- round(data_EY_a [, 3:5], 0)
colnames(data_EY_a)[1:2] <- c("WeekDay", "Year")
data_EY_a$Year <- factor(data_EY_a$Year)
#Ordering the data by Year and Weekday
data_EY_a  <- data_EY_a [with(data_EY_a , order(Year, WeekDay)), ]

View(data_EY_a)
str(data_EY_a)

#Weekwise 2010 - 2014
data_RY <- data[data['Year'] == c(2010:2014), ]

#Getting mean of the Admissions,Discharges and Occupancy(Recent Years)
data_RY_a <-
  aggregate(data_RY[, 2:4], list(data_RY$wday_name, data_RY$Year), mean)
data_RY_a[, 3:5] <- round(data_RY_a [, 3:5], 0)
colnames(data_RY_a)[1:2] <- c("WeekDay", "Year")
data_RY_a$Year <- factor(data_RY_a$Year)
#Ordering the data by Year and Weekday
data_RY_a  <- data_RY_a [with(data_RY_a , order(Year, WeekDay)), ]

View(data_RY_a)
str(data_RY_a)




