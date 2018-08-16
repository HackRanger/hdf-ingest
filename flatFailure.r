library(zoo)
setwd("C:\\workspace\\dataset1\\")
colnames = c("datetime","machineID","comp")
failuredata = read.table("machine_1_failures.csv",sep=",",header=FALSE,col.names=colnames)
component_type = c("comp1","comp2","comp3","comp4")
start <- as.POSIXct("2015-07-01 06:00:00")
end   <- as.POSIXct("2015-08-30 06:00:00")
dates <- seq(start, end, by=3600)

datetimes = c()
comp1s = c()
comp2s = c()
comp3s = c()
comp4s = c()

failuredata$datetime <- as.POSIXct(as.vector(failuredata$datetime))

for ( date in dates )
{
  comp1 = 0
  comp2 = 0
  comp3 = 0
  comp4 = 0
  for(row in 1:nrow(failuredata)){
    rowdate = as.POSIXct(failuredata[row,"datetime"])
    rowcomp = failuredata[row,"comp"]
    if(rowdate == date){
      if(rowcomp == "comp1"){
        comp1 <- comp1 + 1
      }else if(rowcomp == "comp2"){
        comp2 <- comp2 + 1
      }else if(rowcomp == "comp3"){
        comp3 <- comp3 + 1
      }else if(rowcomp == "comp4"){
        comp4 <- comp4 + 1
      } 
    }
  }
  datetimes = c(datetimes,date)
  comp1s = c(comp1s,comp1)
  comp2s = c(comp2s,comp2)
  comp3s = c(comp3s,comp3)
  comp4s = c(comp4s,comp4)
}
failureframe = data.frame(dates,comp1s,comp2s,comp3s,comp4s)
head(failureframe)
