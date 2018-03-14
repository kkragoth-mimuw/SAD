c(1,3,5,6) # explicit
seq(1,100)
rnorm(20)
rnorm(20,3,4)

w <-seq(1,100)
sum(w)

length(which(seq(1,10000) %% 7 == 0))

# Zadanie 2su
library(MASS)
?Animals
dim(Animals)
head(Animals, 6)

Animals['Brachiosaurus', 'brain']
max(Animals['brain'])

plot(Animals[,'body'], Animals[,'brain'])
text(Animals[,'body'], Animals[,'brain'], labels=rownames(Animals), cex= 0.7, pos=3)

plot(body~brain, Animals)

boxplot(weight~origin, data=Auto, names=c("Ameryka", "Europa", "Japonia")) 
boxplot(weight~(year<76), auta)

faktorial <- function(y, w, fun)
  if (y==0) w else fun(y-1,w*y,fun)

faktorjal <- function(x) faktorial(x, 1, faktorial)

faktorjal <- function(x) faktorial(1, x, 1, faktorial)

faktorjal <- function(x) {
  w <- 1
  if (x == 0)
    1
  else {
    for (i in 1:x) {
      w = w * i;
    }
    w
  }
}
