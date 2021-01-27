data = read.csv(file='napoje_po_reklamie.csv', fileEncoding ="UTF-8-BOM", sep=";", row.names = 1, header = TRUE)

data
View(data)

mean_pepsi = mean(data$pepsi)
mean_fanta = colMeans(data['fanta'])
std_zywiec = sd(data$żywiec)
var_okocim = var(data$okocim)
max_lech = max(data$lech)
min_cola = min(data$cola)
r1 = range(data)

mean_pepsi
mean_fanta
std_zywiec
var_okocim
max_lech
min_cola

r1

vector1 = as.vector(data$pepsi)
vector2 = as.vector(data$fanta)
mean_vector1 = mean(vector1)
mean_vector2 = mean(vector2)
std_vector1 = sd(vector1)
var_vector2 = var(vector2)


data1 = read.table('Wzrost.csv', header= FALSE, sep = ',')
data1 = as.data.frame(t(data1))

mean1 = mean(data1$V1)
median1 = median(data1$V1)
std1 = sd(data1$V1)
var1 = var(data1$V1)
max1 = max(data1$V1)
min1 = min(data1$V1)
r2 = range(data1)

mean1
median1
std1
var1
max1
min1
r2
