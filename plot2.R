#Sys.setenv("LANGUAGE"="En")
#Sys.setlocale("LC_ALL", "English")

dataOrig<-read.csv('household_power_consumption.txt', sep = ';')
data<-dataOrig
dateTime<-strptime(apply(data[,c('Date','Time')],1,paste,collapse=' '),format='%d/%m/%Y %H:%M:%S')
data[['DateTime']]<-dateTime
data_dateTime<-data[data[['DateTime']]>=as.POSIXlt.date('2007-02-01 00:00:00') & data[['DateTime']]<=as.POSIXlt.date('2007-02-02  23:59:59'),]
data_dateTime_ordered<-data_dateTime[order(data_dateTime[['DateTime']]),]
data_dateTime_ordered[['Global_active_power']]<-as.numeric(as.character(data_dateTime_ordered[['Global_active_power']]))
options(scipen = 5)
plot(data_dateTime_ordered[,'DateTime'],data_dateTime_ordered[,'Global_active_power'], ylab = 'Global Active Prower (kilowatts)', type='l', xlab = '')
dev.copy(png,file='plot2.png')
#dev.flush()
dev.off
