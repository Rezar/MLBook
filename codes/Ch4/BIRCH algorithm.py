#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns
sns.set()
from sklearn.datasets.samples_generator import make_blobs
from sklearn.cluster import Birch

# we generate synthetic data, which are good for clustering. 
#This is not happening in the real-world, here we try to have good data for BIRCH
X, clusters = make_blobs(n_samples=450,centers=5,cluster_std=0.70,random_state=0)
plt.scatter(X[:,0], X[:,1], alpha=0.7, edgecolors='b')

#now lets run the lovely BIRCH algorithm
brc = Birch(branching_factor=50, n_clusters=None, threshold=1.5)
brc.fit(X)

# predict method obtains the list of point from clustered data
labels = brc.predict(X)
#labels

#now we plot clusters with different colors
plt.scatter(X[:,0], X[:,1], c=labels, cmap='rainbow', alpha=0.7, edgecolors='b')


# In[ ]:




