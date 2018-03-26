library("tree")

iris_perm <- iris[sample(nrow(iris)),]

averages = c()
N <- 10
for (i in 1:N-1) {

  start <- round(m/N) * i;
  end <- start + round(m/N);
  
  iris.learn = iris_perm[c(start:end),]
  iris.valid = iris_perm[-c(start:end),]
  
  ir.tr <- tree(Species ~., iris.learn)
  fit <- predict(ir.tr, iris.valid, type="class")
  
  #print(summary(ir.tr))
  #print(fit)
  #print(iris.valid$Species)
  #print(fit == iris.valid$Species)
  
  wrong_answers_percentage <- (sum(fit != iris.valid$Species)) / length(fit)
  print(wrong_answers_percentage)
  averages <- c(averages, wrong_answers_percentage)
  
  #print(iris.learn)
  #print(start)
  #print(end)
}

print("SREDNIA PROCENTOW BLEDNYCH ODPOWIEDZI:")
print(mean(averages))

