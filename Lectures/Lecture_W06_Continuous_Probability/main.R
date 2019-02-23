?dunif
runif(10)
x <- runif(100)
hist(x)
x <- runif(10000)
hist(x)

x <- runif(100,min = 100,max = 200)
y <- dunif(x,min = 100,max = 200)
plot(x,y)

runif(100)
punif(0.5)  ## (P(x<=0.5)
punif(0.8) - punif(0.2)  ## P(0.2<=x<=0.8)
diff(punif(c(0.2,0.8)))
punif(0.8,lower.tail = FALSE)
qunif(0.8)

### plot the function
x <- runif(100,min = 100,max = 200)
y <- dunif(x,min = 100,max = 200)
y2 <- punif(x,min = 100,max = 200)
plot(x,y,type="b")
plot(x,y2,type="b",xlim = c(50,250))
curve(dunif,from = -1,to = 2,n=10000)
curve(punif,from = -1,to = 2)
curve(sin, -2*pi, 2*pi, xname = "t")
curve(cos, -2*pi, 2*pi, xname = "t")
?dnorm

x <- dnorm(1000)
hist(x)


curve(dnorm(x,0,1),xlim=c(-3,3),main='Normal Density')
cord.x <- c(-3,seq(-3,-2,0.01),-2) 
cord.y <- c(0,dnorm(seq(-3,-2,0.01)),0) 
curve(dnorm(x,0,1),xlim=c(-3,3),main='Standard Normal') 
polygon(cord.x,cord.y,col='skyblue')


curve(dnorm(x,0,1),xlim=c(-3,3),main='Normal Density')
cord.x <- c(-2,seq(-2,2,0.01),2) 
cord.y <- c(0,dnorm(seq(-2,2,0.01)),0) 
curve(dnorm(x,0,1),xlim=c(-3,3),main='Standard Normal',lwd=2) 
polygon(cord.x,cord.y,col='red')
polygon(cord.x,cord.y,density = 10)


curve(dnorm(x,0,1),from = -6,to = 6,col="red",lwd=2,xlim=c(-5,5),ylim=c(0,1))
curve(dnorm(x,-2,sqrt(0.5)),from = -6,to = 6,col="green",lwd=2,xlim=c(-5,5),ylim=c(0,1),add = TRUE)
curve(dnorm(x,0,sqrt(0.2)),from = -6,to = 6,col="blue",lwd=2,xlim=c(-5,5),ylim=c(0,1),add = TRUE,n = 500)
legend('topright',legend = c("N(0,1)","N(-2,0.5)","N(0,0.2)"), lty=1, lwd=2,col=c('red', 'green', 'blue'), bty='n', cex=1)


x <- seq(-5,5,by = 0.01)
y1 <- dnorm(x)
plot(x,y1,type="l",xlim=c(-5,5),ylim=c(0,1),lwd=2,col="red")
y2 <- dnorm(x,-2,sqrt(0.5))
lines(x,y2,type="l",xlim=c(-5,5),ylim=c(0,1),lwd=2,col="green")
y3 <- dnorm(x,0,sqrt(0.2))
lines(x,y3,type="l",xlim=c(-5,5),ylim=c(0,1),lwd=2,col="blue")



dnorm(-2,-2,.5)

curve(x^3,from = -5,to = 5)

w<-rnorm(1000) 
hist(w,col="grey",freq=F,xlim=c(-5,5))
curve(dnorm,-5,5,add=T,col="red")


### exponential distribution
curve(dexp(x,1),xlim = c(0,5),ylim=c(0,1.6),lwd=2,col="red")
curve(dexp(x,0.5),xlim = c(0,5),lwd=2,col="green",add=TRUE)
curve(dexp(x,1.5),xlim = c(0,5),lwd=2,col="blue",add=TRUE)
legend('topright',legend = c("rate = 1","rate = 0.5","rate = 1.5"), lty=1, lwd=2,col=c('red', 'green', 'blue'), bty='n', cex=1)


curve(pexp(x,1),xlim = c(0,5),ylim=c(0,1),lwd=2,col="red")
curve(pexp(x,0.5),xlim = c(0,5),lwd=2,col="green",add=TRUE)
curve(pexp(x,1.5),xlim = c(0,5),lwd=2,col="blue",add=TRUE)
legend('bottomright',legend = c("rate = 1","rate = 0.5","rate = 1.5"), lty=1, lwd=2,col=c('red', 'green', 'blue'), bty='n', cex=1)


plot(x)

plot(punif,from = -1,to = 2)
plot(dunif,from=-1,to=2)


curve(dunif,from=-1,to=2)
curve(punif,from = -1,to = 2)


curve(dnorm,from = 100,to = 200)
curve(x^2 - 2, add = TRUE, col = "violet")

w<-rnorm(1000) 
hist(w,col="red",freq=F,xlim=c(-5,5))
curve(dnorm,-5,5,add=T,col="blue")

curve(dunif,-3,3)
curve(dnorm,-3.5,3.5)

?curve

?dnorm

pnorm(120,mean = 80,sd = 40,lower.tail = FALSE)

pnorm(35,mean = 30,sd = 16)

diff(pnorm(c(40,50),mean = 30,sd = 16))

pnorm(20,mean = 30,sd = 16)

diff(pnorm(c(25,45),mean = 30,sd = 16))

qnorm(0.2,mean = 30,sd = 16)


 ?dexp
pexp(5,0.1)

pexp(3,rate = 0.1,lower.tail = FALSE)
diff(pexp(c(3,8),rate = 0.1))

pexp(3,2,lower.tail = FALSE)

pexp(1,0.2)

pnorm(7,mean = 32,sd = 7)
pnorm(15,mean = 32,sd = 7,lower.tail = FALSE)
diff(pnorm(c(20,40),mean = 32,sd = 7))

pexp(3,0.1)
pexp(50,0.1,lower.tail = FALSE)
diff(pexp(c(5,10),rate = 0.1))

library(datasets)
df <- cars
head(df)

quantile(df$speed)
quantile(df$speed,0.1)

mean(df$speed < 12.00001)

n <- scale(df)
View(n)
t.test(df$speed)


### t.test
x <- rnorm(500,mean = 100,sd = 15)
t.test(x)
t.test(x,conf.level = 0.99)


wilcox.test(x,conf.int = TRUE)
median(x)

require(Rcmdr)

dpois(6,3)

x <- rnorm(100)
y <- rnorm(100,mean=1)
ks.test(x,y)

m <- lm(dist ~ speed, data = df)
anova(m)
residuals(m)
df$residual <- residuals(m)
summary(m)
coef(m)
confint(m)
deviance(m)
anova(m)

m <- lm(dist~speed+0,data=df)
summary(m)

library(Rcmdr)
hist(df$inctot)

