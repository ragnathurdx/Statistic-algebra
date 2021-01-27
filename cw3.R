#zad1

probability <- rep(1/6, 6)
values <- seq(1, 6, 1)

meanval = mean(values)
medianval = median(values)
stdval = sd(values)
varval = var(values)


#zad2

n=100
p=0.4
k=6

bernoulli <- rbern(n,p)
binomial <- rbinom(n,k,p)
poisson <- rpois(n,p)


#zad3

n=100
p=0.4
k=6

bernoulli <- rbern(n,p)
binomial <- rbinom(n,k,p)
poisson <- rpois(n,p)

mean(bernoulli)
median(bernoulli)
var(bernoulli)
skew(bernoulli)
kurt(bernoulli)

mean(binomial)
median(binomial)
var(binomial)
skew(binomial)
kurt(binomial)

mean(poisson)
median(poisson)
var(poisson)
skew(poisson)
kurt(poisson)
