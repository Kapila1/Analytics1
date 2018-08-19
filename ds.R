#Data Structures
#vectors----

v1=1:100 #create vector form 1 to 100
v2= c(1,4,5,10)
class(v1)
class(v2)
v3=c('a','kaps','smriti','shraddha')
v3 #print the vector
class(v3)
v3= c(TRUE, FALSE, T, F)
class(v4)

hist(v1)
v2
v2[v2>=5]


x = rnorm(60, mean=60, sd=10)

x
plot(x)
hist(x)
plot(density(x))
abline(v=60)
#rectangles and density together
hist(x, freq=F)
lines(density(x))

hist(x, breaks=10, col=1:10)
length(x)
sd(x)
?sample

x1 = LETTERS[5:20]
x1

y1 = sample(x1)
y1


set.seed(1234) #to get the same sample everytime
y1 = sample(x1)
y1

set.seed(53)
(y2= sample(x1, size=5))


gender=sample(c('M','F'), size=60) #want to make 60 values from male and female therefore error
(gender=sample(c('M','F'), size=60, replace=TRUE))

(gender=sample(c('M','F'), size=60, replace=TRUE, prob=c(.6,.4)))

(t1=table(gender))
prop.table(t1) #giving frequency distribution of data, giving count of male and female

pie(t1)
barplot(t1, col=1:2, horiz=T)


#summary on vectors
mean(v1)
median(v1)
sd(v1)
variance(v1)

#matrix----
#array----