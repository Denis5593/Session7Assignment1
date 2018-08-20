
# 1. Histogram for all variables in a dataset mtcars. Write a program to create histograms for all columns.

head(mtcars)
str(mtcars)

library(purrr)
library(tidyr)
library(ggplot2)

mtcars %>%
  keep(is.numeric) %>%
  gather() %>%
  ggplot(aes(value)) +
  facet_wrap( ~ key, scales = "free") +
  geom_histogram()


# 2. Check the probability distribution of all variables in mtcars

str(mtcars)
par(mfrow=c(3, 3))
colnames <- dimnames(mtcars)[[2]]
for (i in c(1, 3:11)) {
  d <- density(mtcars[,i])
  plot(d, type="n", main=colnames[i])
  polygon(d, col="red", border="gray")
}


# 3. Write a program to create boxplot for all variables.

mtcars %>%
  keep(is.numeric) %>%
  gather() %>%
  ggplot(aes(, y = value)) +
  facet_wrap( ~ key, scales = "free") +
  geom_boxplot()

