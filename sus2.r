data.frame
x <- sin(1:100)
y <- ifelse(x < -0.5, "A", ifelse(x>0.5, "C", "B"))
f <- data.frame(sin=x, dec=y)
#print(z)
f$cos <-sqrt(1-x*x)
#print(z$cos*z$sin+z$cos*z$cos)

plot(f$sin, f$cos)
# plot(f$dec)

plot(f$dec, f$sin)
plot(f$sin, f$dec)

# hist(y)
# read.table()

# Zadanie 1
iris[iris$Petal.Width > 1.5,]$Species