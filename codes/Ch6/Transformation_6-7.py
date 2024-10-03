import pandas as pd
import numpy as np
import seaborn as sns
from scipy import stats
import matplotlib.pyplot as plt


# Data preperation. Generate random long-tail data and save it
mu, sigma = 5., 0.7   # mean and standard deviation
s = np.random.lognormal(mu, sigma, 1500) 
np.savetxt('original.csv', s, delimiter=',')    # save data
original = np.loadtxt(open("original.csv", "r"), delimiter=",")    # load data

# Create subplot 1
plt.figure()
plt1 = plt.subplot(131)
plt1.set_title('Original Histogram')  # Set title
plt.hist(original, 100, density=False, align='mid', color='cornflowerblue') 

# Create subplot2
plt2 = plt.subplot(132)
log = np.log(original)  # log transformation
plt2.set_title('Log Transformed Histogram')  # Set title
plt2.set_xlim((3, 8))  # set x-axis and y-axis limit to keep two transformation results in the same scope
plt2.set_ylim((0, 60))
plt.hist(log, 100, color='cornflowerblue')

plt3 = plt.subplot(133)
boxcox = stats.boxcox(original)[0]  # Box-cox log transformation
plt3.set_title('Box-Cox Transformed Histogram') # Set title
plt3.set_xlim((3, 8))  # set x-axis and y-axis limit to keep two transformation results in the same scope
plt3.set_ylim((0, 60))
plt.hist(boxcox, 100, color='cornflowerblue')


plt.show()