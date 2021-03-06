library(RgoogleMaps)
library(ggmap)
library(maps)
elec <- read.csv("Average_monthly_residential_energy_usage_By_zip_code.csv",header = TRUE)
elec <- data.frame(elec)
water <- read.csv("Water_Use_Average_By_Zipcode.csv",header = TRUE)
# Check Dimensions
dim(elec)
dim(water)
# Total units consumed each year
total05 <- sum(elec$FY.05.06)
total06 <- sum(elec$FY.06.07)
total07 <- sum(elec$FY.07.08)
total08 <- sum(elec$FY.08.09)
total09 <- sum(elec$FY.09.10)
total10 <- sum(elec$FY.10.11)
total11 <- sum(elec$FY.11.12)
total12 <- sum(elec$FY.12.13)
total <- c(total05, total06, total07, total08, total09, total10, total11, total12)
year <- c(2005,2006,2007,2008,2009,2010,2011,2012)
plot(year,total,main = "Total Units Consumed Every Year in Los Angeles",
     xlab = "Year",ylab = "Total Units Consumed", pch = 2 , col = "royalblue",
     xlim = c(2005,2015),ylim = c(50000,70000),xaxt ="n")
lines(year,total,col='firebrick1',lwd=3)
axis(1, at = seq(2005, 2016, by = 1), las=1)
model <- lm(total~ poly(year,3))
predicted.intervals <- predict(model,data.frame(x=year),interval='confidence',
                               level=0.99)
lines(q,predicted.intervals[,1],col='green',lwd=3)
lines(q,predicted.intervals[,2],col='black',lwd=1)
lines(q,predicted.intervals[,3],col='black',lwd=1)
total5 <- sum(water$FY.05.06)
total6 <- sum(water$FY.06.07)
total7 <- sum(water$FY.07.08)
total8 <- sum(water$FY.08.09)
total9 <- sum(water$FY.09.10)
tota10 <- sum(water$FY.10.11)
tota11 <- sum(water$FY.11.12)
tota12 <- sum(water$FY.12.13)
totalw <- c(total5, total6, total7, total8, total9, tota10, tota11, tota12)
plot(year,totalw,main = "Total Units of Water Consumed Every Year in Los Angeles",
     xlab = "Year",ylab = "Total Units Consumed", pch = 2 , col = "royalblue",
     xlim = c(2005,2015),ylim = c(500,4500),xaxt ="n")
lines(year,totalw,col='firebrick1',lwd=3)
axis(1, at = seq(2005, 2016, by = 1), las=1)
fit <- lm(totalw ~ year, data = water)
abline(fit)
fit2 <- lm(total~(year,3), data = elec)
summary(fit)
fitted(fit)
summary(fit2)

