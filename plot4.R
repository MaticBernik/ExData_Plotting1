#Sys.setenv("LANGUAGE"="En")
#Sys.setlocale("LC_ALL", "English")

dataOrig<-read.csv('household_power_consumption.txt', sep = ';')
data<-dataOrig
dateTime<-strptime(apply(data[,c('Date','Time')],1,paste,collapse=' '),format='%d/%m/%Y %H:%M:%S')
data[['DateTime']]<-dateTime
data_dateTime<-data[data[['DateTime']]>=as.POSIXlt.date('2007-02-01 00:00:00') & data[['DateTime']]<=as.POSIXlt.date('2007-02-02  23:59:59'),]
data_dateTime_ordered<-data_dateTime[order(data_dateTime[['DateTime']]),]

data_dateTime_ordered[['Global_active_power']]<-as.numeric(as.character(data_dateTime_ordered[['Global_active_power']]))
data_dateTime[,'Sub_metering_1']<-as.numeric(as.character(data_dateTime[,'Sub_metering_1']))
data_dateTime[,'Sub_metering_2']<-as.numeric(as.character(data_dateTime[,'Sub_metering_2']))
data_dateTime[,'Sub_metering_3']<-as.numeric(as.character(data_dateTime[,'Sub_metering_3']))
data_dateTime[,'Voltage']<-as.numeric(as.character(data_dateTime[,'Voltage']))
data_dateTime[,'Global_reactive_power']<-as.numeric(as.character(data_dateTime[,'Global_reactive_power']))



options(scipen = 5)

par(mfrow=c(2,2))

#1. graph
plot(data_dateTime[,'DateTime'],data_dateTime[,'Global_active_power'], ylab = 'Global Active Prower (kilowatts)', type='l', xlab = '')

#2. graph
plot(data_dateTime[,'DateTime'],data_dateTime[,'Voltage'], ylab = 'Voltage', type='l', xlab = 'datetime')

#3. graph
plot(data_dateTime[,'DateTime'],data_dateTime[,'Sub_metering_1'], ylab = 'Energy sub metering', type='l', xlab = '')
lines(data_dateTime[,'DateTime'],data_dateTime[,'Sub_metering_2'],col='red')
lines(data_dateTime[,'DateTime'],data_dateTime[,'Sub_metering_3'],col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty = 'n', lty = 1, cex = 0.5 ,col = c('black','red','blue'))

#4. graph
plot(data_dateTime[,'DateTime'],data_dateTime[,'Global_reactive_power'], ylab = 'Global_reactive_power', type='l', xlab = 'datetime')

dev.copy(png,file='plot4.png')
#dev.flush()
dev.off()
