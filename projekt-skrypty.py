#!/usr/bin/env python
# coding: utf-8

# In[70]:


import scipy.stats as scs
import pandas as pd
import pylab
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import statistics as stat
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split


# In[71]:


data1 = pd.read_csv('amazon.csv', encoding='latin1', delimiter=",")
data1["month"].replace({"Janeiro": "January", "Fevereiro": "February", "Março": "March", "Abril": "April", "Maio": "May", "Junho": "June", "Julho": "July", "Agosto": "August", "Setembro": "September", "Outubro": "October", "Novembro": "November", "Dezembro": "December",}, inplace=True)
print(data1)


# In[72]:


#3. Skrypt opisujący strukturę danych – statystyka opisowa
#a. Dla wybranych danych podstawowe elementy statystyki opisowej 

d = data1.describe()
print(d)


# In[73]:


#4. Skrypty testujące hipotezy
#a. Badanie normalności rozkładu, analiza równości wariancji

data4 = data1.groupby('month')['number'].sum()
print(data4)
print()
from scipy.stats import normaltest
stats, p = normaltest(data4)
print(stats, p)
if p > 0.05:
    print ("Rozkład wygląda na normalny")

print()
data5 = data4  
sns.distplot(data5)
plt.show()
#data1.plot(kind="scatter", x="month",y="number",figsize=(10,10),color="black")

data6 = np.std(data5)
print("Odchylenie standardowe:", data6)
#print(stat.stdev(data6))
#print(stat.variance(data6))


# In[91]:


#b. Testy dla zmiennych zależnych, niezależnych

#dla niezależnych:
#stats.f_oneway(data1, data2)
#zależnych:
#stats.wilcoxon(data1, data2)


#c. Testy dla wielu średnich (analiza wariancji)

fig, ax = plt.subplots()
data4.plot.kde(ax=ax, legend=True, title='Histogram')
ax.set_ylabel('Probability')
ax.grid(axis='y')


# In[85]:


#5. Skrypty wykorzystujące regresję do prognozowania przyszłych wartości
#a. Różne rodzaje regresji – do przewidywania przyszłych wartości

X = data1['year'].values.reshape(-1,1)
y = data1['number']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=0)

regressor = LinearRegression()
regressor.fit(X_train, y_train)

y_pred = regressor.predict(X_test)

print(regressor.intercept_)
print(regressor.coef_)

print('Linear Regression R squared: %.4f' % regressor.score(X_test, y_test))

plt.scatter(X_test, y_test,  color='black')
plt.plot(X_test, y_pred, color='blue', linewidth=3)


# In[ ]:




