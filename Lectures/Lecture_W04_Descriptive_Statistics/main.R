### central tendency

v <- c(1,2,2,3,4,7,9)
mean(v)
median(v)
mode(v)
class(v)
table(v)
sort(table(v))
rev(sort(table(v)))
names(rev(sort(table(v))))[1]
v <- c(1,2,2,3,4,7,9,NA)
mean(v,na.rm = TRUE)




if (!require(moments))install.packages("moments")
library(moments)
v <- c(1,2,2,3,4,7,9)
min(v)
max(v)
range(v)
var(v)
sd(v)
skewness(v)
kurtosis(v)
quantile(v)
length(v)
which.max(v)
which.min(v)


####  read CSV file
csv.path = "http://spatial.binghamton.edu/geog533/data/students.csv"
df <- read.csv(csv.path)
df <- read.csv("students.csv")
str(df)
df$Last.Name <- as.character(df$Last.Name)
df$First.Name <- as.character(df$First.Name)
str(df)
df <- read.csv("students.csv",header = TRUE,as.is = TRUE)
str(df)


### read Excel file
if (!require(readxl)) install.packages("readxl")
library(readxl)
### http://spatial.binghamton.edu/geog533/data/students.xls"
df.xls <- read_excel("students.xls")
View(df.xls)


### write csv file
df <- read.csv("students.csv")
df2 <- df[,1:5]
write.csv(df2,file = "stu.csv")
write.csv(df2,file = "stu2.csv",row.names = FALSE)



### load built-in dataset
library(datasets)
df <- cars
boxplot(df)
boxplot(df$speed)
summary(df$speed)
hist(df$speed)


#### exploring data
df <- read.csv("students.csv")
summary(df)
fix(df)
str(df)
names(df)
head(df)
head(df, n = 10)
tail(df)
tail(df, n = 10)
tail(df, n = -10)
df[1:10,]
df[1:10,1:3]
df[c("Last.Name","First.Name","City","State")]


### Factor and String in data frame
df1 <- read.csv("students.csv")
str(df1)
df2 <- read.csv("students.csv",stringsAsFactors = FALSE)
str(df2)
df2$Gender <- as.factor(df2$Gender)
str(df2)



### descriptive statistics
if (!require(fBasics)) install.packages("fBasics")
library(fBasics)
SAT <- df$SAT
basicStats(SAT)
summary(SAT)
hist(SAT)
hist(df$SAT,main = "Histogram of SAT Score",xlab = "SAT Score",ylab = "Frequency",col = "green")


### descriptive statistics by groups
SAT.mean <- tapply(df$SAT, df$Gender, mean)
print(SAT.mean)
SAT.median <- tapply(df$SAT, df$Gender, median)
print(SAT.median)
SAT.sd <- tapply(df$SAT, df$Gender, sd)
print(SAT.sd)
SAT.max <- tapply(df$SAT, df$Gender, max)
print(SAT.max)

tapply(df$SAT,df$Gender,summary)
tapply(df$SAT,df$Gender,basicStats)

round(cbind(SAT.mean,SAT.median,SAT.sd,SAT.max),digits = 1)
t1 <- round(cbind(SAT.mean,SAT.median,SAT.sd,SAT.max),digits = 1)


### change column names
df <- read.csv("students.csv",header = TRUE)
names(df)
colnames(df)
colnames(df)[1] <- "Student.Id"



### Add a new column
df$Full.Name <- paste(df$First.Name, df$Last.Name,sep = " ")
df$Full.Name <- paste(df$Last.Name, df$First.Name, sep = ", ")
df$Extra.Credit <- 10
df$Total <- df$SAT + df$Extra.Credit


## Select rows
SAT <- df$SAT
SAT
index <- which.max(SAT)
index
print(paste(df$Last.Name[index], df$First.Name[index],sep = ", "))



## Data manipulation using dplyr
#installed.packages("dplyr")
library(dplyr)
df <- read.csv("students.csv")
head(df)

# subset rows using filter function
filter(df, Gender == "Male")
filter(df, SAT > mean(SAT))
slice(df, 1:10)

## select columns
select(df, SAT)
select(df, First.Name, Last.Name, SAT)


## rename column names
rename(df, Student.Id = Id)


# reorder rows
arrange(df, SAT)
arrange(df, desc(SAT))
arrange(df, Major, desc(SAT))


## unique values in a column
distinct(df, State)
distinct(df, Major)

## make new columns
mutate(df, Full.Name = paste(First.Name, Last.Name))
mutate(df, Birth.Year = 2017- Age)
transmute(df, Birth.Year = 2017- Age)


## aggregate data
summarise(df, avg_SAT=mean(SAT))

## select random rows
sample_n(df, 10)
sample_frac(df, 0.2)
