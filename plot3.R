#Sys.setenv("LANGUAGE"="En")
#Sys.setlocale("LC_ALL", "English")

dataOrig<-read.csv('household_power_consumption.txt', sep = ';')
data<-dataOrig
dateTime<-strptime(apply(data[,c('Date','Time')],1,paste,collapse=' '),format='%d/%m/%Y %H:%M:%S')
data[['DateTime']]<-dateTime
data_dateTime<-data[data[['DateTime']]>=as.POSIXlt.date('2007-02-01 00:00:00') & data[['DateTime']]<=as.POSIXlt.date('2007-02-02  23:59:59'),]
options(scipen = 5)

data_dateTime[,'Sub_metering_1']<-as.numeric(as.character(data_dateTime[,'Sub_metering_1']))
data_dateTime[,'Sub_metering_2']<-as.numeric(as.character(data_dateTime[,'Sub_metering_2']))
data_dateTime[,'Sub_metering_3']<-as.numeric(as.character(data_dateTime[,'Sub_metering_3']))

plot(data_dateTime[,'DateTime'],data_dateTime[,'Sub_metering_1'], ylab = 'Energy sub metering', type='l', xlab = '')
lines(data_dateTime[,'DateTime'],data_dateTime[,'Sub_metering_2'],col='red')
lines(data_dateTime[,'DateTime'],data_dateTime[,'Sub_metering_3'],col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, cex = 0.8 ,col = c('black','red','blue'))
dev.copy(png,file='plot3.png')
#dev.flush()
dev.off
