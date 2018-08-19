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

#matrix----can be of 1 datatype-numerical,logical or character
 (m1= matrix(1:24, nrow=4)) #data is getting filled up column wise
(m2= matrix(1:24, nrow=4, byrow=T)) #data getting filled up row wise
#by default its column wise

(m3= matrix(1:24, ncol=4, byrow=T))

x= runif(60,60,100) #60 students and marks btw 60 and 100
?runif #uniform distributed values

plot(density(x))

#round, trunc, ceiling, floor
x= trunc(runif(60,60,100))
plot(density(x))

(m4= matrix(x, ncol=6))

colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4>67]
m4[m4>67 & m4<86]
m4[10,]
m4[8:10,]
m4[8:10,1:3]
m4[8:10, c(1,3,5)]#use c when not in sequence otherwise :
m4[,c(1,5,6)]

rowSums(m4[8:10, c(1,3,5)])



#array---- one more dimension to matrix

#data.frame
#rollno, name, gende, course, marks1, marks2

(rollno = 1:60)
(name= paste('student1', 1:60, sep='-'))
name[1:10]
name[15:20]
name[c(15,20,37)]
name[-1]
name[-c(1:10)] #- to remove
rev(name)
name[60:1]
name[-c(1:10, 35:40)]
(gender=sample(c('Male','Female'),size=60, replace = T, prob=c(.3,.7)))



