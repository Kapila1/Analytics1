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
(course= sample(c('BBA','MBA','FPM'), size=60, replace=T, prob=c(.4,.2,.1)))
(marks1 = ceiling(rnorm(60,mean = 60, sd=11)))
(marks2 = ceiling(rnorm(60,mean = 65, sd=7)))
(grades= sample(c('A','B','C'), size=60, replace= T))
students =data.frame(rollno, name, gender, course, marks1, marks2, grades, stringsAsFactors= F) 
class(students)
summary(students)# prints value
students[,c('name')]

students[students$gender == 'Male', c('rollno','gender','marks1')]

students[students$gender == 'Male' & students$grades == 'C', c('rollno','gender','marks1')]

students[students$marks1 > 55 |students$marks1 < 75, c('rollno','gender','marks1')]

students$gender
t1 = table(students$course)
barplot(table(students$course))

barplot(table(students$course), ylim=c(0,50), col=1:3)
text(1:3, 25, table(students$course)+5, table(students&course)) #table(x axis, y axis, what to print)


str(students)  #structure of the data frame or any other value,prints the type of the column
nrow(students)
names(students)
dim(students)#tells the dimension
head(students) #first few records
tail(students)#last few records
head(students, n=7)

?head
#avg marks scored by each gender in marks1

#gender, marks1
aggregate(students$marks1, by= list(students$gender), FUN= mean) #groupby=by and FUN=function
aggregate(students$marks2, by= list(students$course), FUN= max) #max marks scored from each course in subject 2
aggregate(students$marks2, by= list(students$gender , students$course), FUN= mean) #mean marks scored by each gender in each subject



#deployer package- dplyr
library(dplyr) #to load the library

students %>% group_by(gender) %>% summarise(mean(marks1)) #piping it

students %>% group_by(course,gender) %>% summarise(mean(marks1), min(marks2), max(marks2)) 

students %>% group_by(course,gender) %>% summarise(meanmarks1= mean(marks1), min(marks2), max(marks2)) %>% arrange(desc(meanmarks1))

students %>% arrange(marks1)

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') 

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% head(n=5)



#sample fraction and sample n function

#sample_frac(students, 0.1, replace=FALSE)
#sample_n(students, 5, replace=FALSE)

students %>% sample_frac(.1)
students %>% sample_n(2)

students %>% sample_frac(.1) %>% arrange(course)

students %>% sample_frac(.1) %>% arrange(course) %>% select(name, gender)

students %>% arrange(course, grades, marks1) %>% select(course, grades, marks1)

students %>% arrange(desc(course), gender, marks1)

students %>% arrange(course, grades, marks1) %>% select(course, grades, marks1) %>% filter(course=='BBA')
students %>% select(name, course, grades, marks1) %>% group_by(course) %>% arrange(course, grades, marks1) %>% top_n(5)

#factor
names(students)
students$gender= factor(students$gender)
summary(students$gender)
summary(students$course)
students$course = factor(students$course, ordered = T, levels = c('FPM','MBA','BBA'))
summary(students$course)

students$grades
#C, A, B
students$grades = factor(students$grades, ordered= T, levels = c('C','A','B'))

students$grades
table(students$grades)
barplot(table(students$grades))


students
write.csv(students, './data/iimtrichy.csv') #to save the file in data folder, will make one extra column of serial no(x)
#FILE IMPORT
students2 = read.csv('./data/iimtrichy.csv')

head(students2) # default of head=6

students3 = read.csv(file.choose())
head(students3)

students3 = students3[,-1] #to remove the X column
head(students3)

