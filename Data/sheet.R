
#install.packages('gsheet')
library(gsheet)
url='https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco= as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)

library(dplyr)
denco %>% count(custname, sort=T) #who are the most loyal customers, freq of customer buying the product

denco %>% group_by(custname) %>% summarise(n=n()) %>% arrange(desc(n)) #same as above but in diff format

df3a= aggregate(denco$revenue, by= list(denco$partnum), FUN=sum)
head(df3a)

denco %>% group_by(partnum) %>% summarise(n=n()) %>% arrange(desc(n))
 
#which part gives highest profit: partno- sum(profit)
names(denco)
df4a= aggregate(margin~partnum, data= sales, FUN=sum)
aggregate(margin~partnum, data= sales, FUN=sum)
head(df4a)




#delete all above comment