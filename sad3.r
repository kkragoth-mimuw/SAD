loadlibrary = function() {
  load(MASS)
  load(ISLR)
  print("libraries loaded")
}

nr <- 100
X1 <- runif(nr, 2, 5)
X2 <- 2 * X1 + rnorm(nr, 100, 10)
X3 <- rbinom(nr, 1, 0.5)
X4 <- X1 * X2
X5 <- X1 * X3
eps <-rnorm(nr)

B0 <- 50
B1 <- 20
B2 <- 0.07
B3 <- 35
B4 <- 0.01
B5 <- -10

Y <- B0 + B1*X1 + B2*X2 + B3*X3 + B4*X4 + B5*X5 + eps
print(summary(lm(Y~X1+X2+X3+X4+X5)))

# Zadanie 2
model1 <- lm(medv~lstat, data=MASS::Boston)
print(summary(model1))

attach(MASS::Boston)
plot(medv,lstat, col="blue", pch=6)
abline(model1, col="red")

model2 <- lm(medv~lstat+I(lstat**2))
print(summary(model2))
plot(model2)