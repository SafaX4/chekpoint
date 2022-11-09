data(AirPassengers)
class(AirPassengers) #This tells you that the data series is in a time series format
start(AirPassengers)
end(AirPassengers) #This is the end of the time series
frequency(AirPassengers)  #The cycle of this time series is 12months in a year
summary(AirPassengers) # metrics of passengers min, max, mean, 1st and third quartiels
plot(AirPassengers)
cycle(AirPassengers) #This will print the cycle across years.
boxplot(AirPassengers~cycle(AirPassengers))

