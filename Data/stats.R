#Basic Stats
x=ceiling(rnorm(1000, mean=60, sd=20))
mean(x)
median(x)
#there is no mode function for mode stats
table(x)  #calculate frequency count
sort(table(x))
sort(table(x), decreasing = T)

library(modeest)
mlv(x, method='shorth')


quantile(x)
quantile(x, seq(.01,1, by=.01))
quantile(x, seq(.01,1, by=.01))
 library(e1071)
plot(density(x))
e1071 :: skewness(x)
kurtosis(x)



sd(x)::var(x)
cov(women$weight, women$height)
cor(women$weight, women$height)

stem(x)

#Freq Table
library(fdth)
ftable1 = fdt(x)
ftable1
