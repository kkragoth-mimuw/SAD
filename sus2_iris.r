#install.packages("tree")
library("tree")
#ir.tr <- tree(Species ~., iris)
#ir.tr <- tree(iris$Species~iris$Petal.Width)
#print(summary(ir.tr))

m <- dim(iris)[1]
val <- sample(1:m, size=round(m/3), replace=FALSE, prob=rep(1/m, m))
iris.learn = iris[-val,]
iris.valid = iris[val,]

ir.tr <- tree(Species ~., iris.learn)
print(summary(ir.tr))
fit <- predict(ir.tr, iris.valid)
fit <- predict(ir.tr, iris.valid, type="class")
print(table(iris.valid$Species, fit))
plot(iris$Species)
plot(iris$Petal.Width, iris$Petal.Length)
plot(iris$Species~iris$Petal.Width)

coplot(iris$Petal.Width~iris$Petal.Length|iris$Species)
coplot(iris$Petal.Width~iris$Petal.Length|iris$Sepal.Length)

# Obrazek trojwymiarowy - image
# Na jednym wykresie potrafimy umiescic 5 wymiarow (czas~animacja, kolor, kształt, x, y)

pcol <- as.character(as.numeric(iris.valid$Species))
pairs(iris.valid[1:4], pch=pcol, col=c("green3", "red")[(iris.valid$Species != fit) + 1])

# Zadanie 2 napisz skrypt który wykonuje n-krotna cross-validację
N <- 3
for (i in 1:N-1) {
  start <- round(m/N) * i;
  end <- start + round(m/N);
  
  iris.learn = iris[c(start:end),]
  iris.valid = iris[-c(start:end),]
  
  ir.tr <- tree(Species ~., iris.learn)
  
  print(iris.learn)
  print(start)
  print(end)
}

