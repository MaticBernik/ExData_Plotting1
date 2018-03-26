dataOrig<-read.csv('household_power_consumption.txt', sep = ';')
data<-dataOrig
data[['Date']]<-as.Date(data[['Date']],format='%d/%m/%Y')
#data[['Date']]<-as.Date(dataOrig[['Date']],'%d/%m/%y')
#& dataOrig[,'Global_active_power'] != '?'
data<-data[data[,'Date']>='2007-02-01'
               & data[,'Date']<='2007-02-02'
               ,'Global_active_power']
data<-as.numeric(as.character(data))
#data<-data/1000
options(scipen = 5)
hist(data, col='red', xlab = 'Global Active Prower (kilowatts)', main = 'Global Active Power')
dev.copy(png,file='plot1.png')
#dev.flush()
dev.off()
