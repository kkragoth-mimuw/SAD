# conda install clangxx_osx-64
# export CONDA_BUILD_SYSROOT=$(xcrun --show-sdk-path)
# install.packages("rjson")
# install.packages("PogromcyDanych")
library("PogromcyDanych")
print("Operacja na macierzach")
macierz <- matrix(seq(1, 180, 2), nrow=10)
macierz[3, 2] <- 100

print(mean(macierz[1,]))
print(median(macierz[, 3:8]))

macierz <- macierz ** 2
?
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
print(str(serialeIMDB))
ulubiony_serial <- "Battlestar Galactica"
liczba_odcinkow <- nrow(serialeIMDB[serialeIMDB$serial == ulubiony_serial,])
liczba_sezonow <- length(unique(serialeIMDB[serialeIMDB$serial == ulubiony_serial, "sezon"]))

library(dplyr)
sezony <- serialeIMDB %>%
  filter(serial == ulubiony_serial) %>%
  dplyr::select(sezon) %>%
  unique() %>%
  nrow()
print(sezony)

odcinki <- serialeIMDB[serialeIMDB$serial == ulubiony_serial,]
najlepszy <- odcinki[which.max(odcinki$ocena), c("nazwa", "ocena")]
najgorszy <- odcinki[which.min(odcinki$ocena), c("nazwa", "ocena")]

print(najlepszy)
print(najgorszy)


# WYKRESY:
ile_odcinkow_w_sezonie <- table(odcinki$sezon)
print(ile_odcinkow_w_sezonie)
ile_odcinkow_w_sezonie <- ile_odcinkow_w_sezonie[ile_odcinkow_w_sezonie != 0]
print(ile_odcinkow_w_sezonie)
barplot(ile_odcinkow_w_sezonie,
        ylab = "ile odcinkow", xlab = "ktory sezon", main = ulubiony_serial)

## f
odcinki %>%
  group_by(sezon) %>%
  mutate(srednia = mean(ocena)) %>%
  dplyr::select(sezon, srednia) %>%
  unique() -> oceny_sezonow
barplot(oceny_sezonow$srednia, names = oceny_sezonow$sezon,
        ylab = "srednia ocen", xlab = "ktory sezon", main = ulubiony_serial)

## ZADANIE 4
wyniki <- read.table("~/dev/SAD/coin.tsv", header = T)
print(wyniki)
print(mean(wyniki$true == wyniki$predicted))

# ZADANIE 5
losowy_wektor <- rbinom(50, 1, 0.5)

# orzel_reszka <- c(0, 1)
# losowy_wektor <- sample(orzel_reszka, 50, replace = T)

print(mean(losowy_wektor != wyniki$true))

# ZADANIE 6
prawdziwy_wynik <- read.table("~/dev/SAD/data/magic.txt")
prawdziwy_wynik_treningowy <- prawdziwy_wynik[1:700, 1]
prawdziwy_wynik_testowy <- prawdziwy_wynik[701:1000, 1]

predykowane_wyniki <- read.table("~/dev/SAD/data/magic_Results.csv", sep = ",")
print(predykowane_wyniki)

#liczba_modeli <-