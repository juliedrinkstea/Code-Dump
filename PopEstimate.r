setwd("REDACTED")
COdata = read.csv('ColoradoPop.csv', header = T, stringsAsFactors = F)
str(COdata)
COdata

Pop_Est_Summary = lm(Population ~ Year, data=COdata)
Pop_Est_Summary

summary(Pop_Est_Summary)

require(stats)
Pop_Est_Summary = lm(Population ~ Year)
Future_Est = data.frame(Year = 2020)
predict(Pop_Est_Summary, Future_Est, interval = "predict")


hpop = c(5440445, 5530105, 5607154)
bins = c(5400000, 5500000, 5600000, 5700000)
colors = c("darkgreen", "darkmagenta","blue")
hist(hpop, main = "Histogram of Pop. by Year", breaks = bins, col = colors)


Y = -158266904 + (81243*2020)
Y

YearExtended = c(Year, 2020)
PopulationExtended = c(Population, Y)
plot(YearExtended ~ PopulationExtended, main = "Colorado Population by Year")
abline(lm(YearExtended ~ PopulationExtended))
