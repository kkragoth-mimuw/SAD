print("Operacja na macierzach")
macierz <- matrix(seq(1, 180, 2), nrow=10)
macierz[3, 2] <- 100

print(mean(macierz[1,]))
print(median(macierz[, 3:8]))

macierz <- macierz ** 2

macierz <- cbind(macierz, rep(c(10, pi), 5))
print(var(as.vector(macierz[-5,])))
#var(macierz[-5]) - macierz kowiariancji
print(sd(macierz[-5,]))

print("Zadanie drugie")
losowy_wektor <- runif(1000)
print(losowy_wektor)
print(mean(losowy_wektor))
print(var(losowy_wektor))

print("Zadanie trzecie")
install.packages("PogromcyDanych")
library(PogromcyDanych)