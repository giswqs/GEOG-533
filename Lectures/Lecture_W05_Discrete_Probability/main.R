
### Counting the number of combinations
#choose(n,k) = n!/k!(n-k)!
choose(3,2)
factorial(3)/(factorial(2)*factorial(3-2))

choose(5,3)
factorial(5)/(factorial(3)*factorial(5-3))

choose(50,3)
factorial(50)/(factorial(3)*factorial(50-3))

choose(4,2)

### Generating combinations
#combn(items, k)
combn(1:5,3)
combn(c("T1","T2","T3","T4","T5"),3)

### Generate random numbers
runif(1)
runif(10)
runif(10,min = -3,max = 3)

rnorm(10)
rnorm(10,mean = 100,sd = 15)
rnorm(3,mean = c(-10,0,10),sd = 1)


### Generating reproducible random numbers
set.seed(100)
runif(10)
set.seed(100)
runif(10)

#### Generating a random sample
library(MASS)
df <- Cars93
sample(df$Price, 10)
sample(df$Manufacturer,10)



?sample

sample(1:10,size = 10,replace = FALSE)
sample(1:10,size = 10,replace = TRUE)


?set.seed
set.seed(100)
sample(1:10)
sample(1:10,size = 10,replace = FALSE)
sample(c("H","T"),size = 10,replace = TRUE)
sample(c("blue","yellow","red","green","purple"),size = 5,replace = FALSE)



births <- sample(c("boy","girl"),size = 10,replace = TRUE,prob = c(0.513,0.487))
births
table(births)
manybirths <- sample(c("boy","girl"),size = 100000,replace = TRUE,prob = c(0.513,0.487))
table(manybirths)


?dbinom
dbinom(5,size = 10,prob = 0.5)
dbinom(7,size = 10,prob = 0.5)
pbinom(7,size = 10,prob = 0.5)
pbinom(7,size = 10,prob = 0.5,lower.tail = FALSE)

dbinom(6,size = 10,prob = 0.5) + dbinom(7,size = 10,prob = 0.5)
pbinom(7,size = 10,prob = 0.5) - pbinom(5,size = 10,prob = 0.5)
pbinom(c(5,7),size = 10,prob = 0.5)
diff(pbinom(c(5,7),size = 10,prob = 0.5))


n <- 20
x <- 0:n
y <- dbinom(x,size = n,prob = 0.5)
plot(x,y)
plot(x,y,type = "b",pch = 16,col="black")


n <- 20
x <- 0:n
y <- pbinom(x,size = n,prob = 0.5)
plot(x,y)
plot(x,y,type = "b",pch = 16,col="black")


x <- seq(from = -3,to = 3,length.out = 100)
y <- dnorm(x)
plot(x,y)
plot(x,y,type = "l",pch = 16,col="black")


### plot multiple graphs
x <- seq(from=0,to = 6,length.out = 100)
ylim <- c(0,0.6)
par(mfrow=c(2,2))
plot(x,dunif(x,min=2,max=4),main="Uniform",type="l",ylim=ylim)
plot(x,dnorm(x,mean=3,sd=1),main="Normal",type="l",ylim=ylim)
plot(x,dexp(x,rate=1/2),main="Exponential",type="l",ylim=ylim)
plot(x,dgamma(x,shape=2,rate = 1),main="Gamma",type="l",ylim=ylim)


### shading a region
par(mfrow=c(1,1))
x <- seq(from=-3,to = 3,length.out = 100)
y <- dnorm(x)
plot(x,y,main="Standard Normal Distribution",type="l",ylab = "Density",xlab="Quantile")
abline(h = 0)
region.x <- x[1 <= x & x <= 2]
region.y <- y[1 <= x & x <= 2]
region.x <- c(region.x[1],region.x,tail(region.x,1))
region.y <- c(0,region.y,0)
polygon(region.x,region.y,density = 10)
polygon(region.x,region.y,density = -1,col="red")

### http://www.alisonsinclair.ca/2011/03/shading-between-curves-in-r/
x <- seq(-3,3,0.01)
y1 <- dnorm(x,0,1)
y2 <- 0.5*dnorm(x,0,1)
plot(x,y1,type="l",bty="L",xlab="X",ylab="dnorm(X)")
points(x,y2,type="l",col="red")
polygon(c(x,rev(x)),c(y2,rev(y1)),col="skyblue")


### Geometric distribution
dgeom(0,prob = 0.5)
dgeom(1,prob = 0.5)

n <- 10
x <- 0:n
y <- dgeom(x,prob = 0.5)
plot(x,y)
plot(x,y,type = "b",pch = 16,col="black",ylim = c(0,1))

y2 <- dgeom(x, prob=0.8)
lines(x,y2,type = "b",pch = 16,col="red")

y3 <- dgeom(x, prob=0.2)
lines(x,y3,type = "b",pch = 16,col="blue")

### Poisson distribution
### During the last 60 days, there were 3 accidents. What’s the probability that there will be more than 3 accidents during the next month?

dpois(0,lambda = 1.5)
dpois(1,lambda = 1.5)
dpois(2,lambda = 1.5)
dpois(3,lambda = 1.5)
1- dpois(0,1.5)-dpois(1,1.5)-dpois(2,1.5)-dpois(3,1.5)

ppois(3,lambda = 1.5,lower.tail = FALSE)


n <- 20
x <- 0:n
y <- dpois(x,lambda = 1)
plot(x,y)
plot(x,y,type = "b",pch = 16,col="black")

y2 <- dpois(x,lambda = 4)
lines(x,y2,type = "b",pch = 16,col="red")

y3 <- dpois(x,lambda = 10)
lines(x,y3,type = "b",pch = 16,col="blue")


dhyper(1,3,2,2)


x
rev(x)
c(x,rev(x))
c(y2,rev(y1))

age <- 1:10
y.low <- rnorm(length(age), 150, 25) + 10*age
y.high <- rnorm(length(age), 250, 25) + 10*age

plot(age,y.high,type = 'n', ylim = c(100, 400), ylab = 'Y Range', xlab = 'Age (years)')
lines(age, y.low, col = 'grey')
lines(age, y.high, col = 'grey')

polygon(c(age, rev(age)), c(y.high, rev(y.low)),col = "grey30", border = NA)





prob <- dbinom(0:n,size = n,prob = 0.5)
plot(0:n,prob,pch = 16,col="black")

n <- 20
prob <- dbinom(0:n,size = n,prob = 0.7)
plot(0:n,prob,col="green",pch=19)





numbirths <- 10
numboys <- 0:numbirths
binom.prob <- dbinom(numboys,size = numbirths,prob = 0.513)
plot(numboys,binom.prob)
plot(numboys,binom.prob,type = "b")
?plot
plot(numboys,binom.prob,type="b",xlab = "number of boys babies in 10 births", ylab = "probability that this occurs")

pbinom(3,size = 10,prob = 0.513)
dbinom(3,size = 10,prob = 0.513)
1 - pbinom(7,size = 10,prob = 0.513)


numbirths <- 10
numboys <- 0:numbirths
binom.prob <- pbinom(numboys,size = numbirths,prob = 0.513)
plot(numboys,binom.prob)
plot(numboys,binom.prob,type = "b")
plot(numboys,binom.prob,type="b",xlab = "number of boys babies in 10 births", ylab = "probability of this many boy births or fewer")



dbinom(5,10,0.5)



