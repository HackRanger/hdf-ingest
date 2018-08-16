library(zoo)
#setwd("C:\\workspace\\dataset1\\")
colnames = c("datetime","machineID","error")
failuredata = read.table("machine_1_errors.csv",sep=",",header=FALSE,col.names=colnames)
component_type = c("type1","type2","type3","type4","type5")
start <- as.POSIXct("2015-07-01 01:00:00")
end   <- as.POSIXct("2015-08-31 23:00:00")
dates <- seq(start, end, by=3600)

datetimes = c()
type1s = c()
type2s = c()
type3s = c()
type4s = c()
type5s = c()

failuredata$datetime <- as.POSIXct(as.vector(failuredata$datetime))

for ( date in dates )
{
  type1 = 0
  type2 = 0
  type3 = 0
  type4 = 0
  type5 = 0
  posixdate = as.POSIXct(date,origin="1970-01-01")
  for(row in 1:nrow(failuredata)){
    rowdate = as.POSIXct(failuredata[row,"datetime"])
    rowcomp = failuredata[row,"error"]
    if(rowdate == posixdate){
      if(rowcomp == "error1"){
        type1 <- type1 + 1
      }else if(rowcomp == "error2"){
        type2 <- type2 + 1
      }else if(rowcomp == "error3"){
        type3 <- type3 + 1
      }else if(rowcomp == "error4"){
        type4 <- type4 + 1
      } else if(rowcomp == "error5"){
        type5 <- type5 + 1
      } 
    }
  }
  datetimes = c(datetimes,date)
  type1s = c(type1s,type1)
  type2s = c(type2s,type2)
  type3s = c(type3s,type3)
  type4s = c(type4s,type4)
  type5s = c(type5s,type5)
}
errorframe = data.frame(dates,type1s,type2s,type3s,type4s,type5s)
head(errorframe)
