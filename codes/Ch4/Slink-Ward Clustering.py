#!/usr/bin/env python
# coding: utf-8

# In[4]:


from scipy.cluster.hierarchy import dendrogram, linkage
from matplotlib import pyplot as plt
X = [[i] for i in [2, 8, 0, 4, 1, 9, 9, 0]]
X


# In[9]:


Z = linkage(X, 'single')
print(Z)
fig = plt.figure(figsize=(15, 10))
dn = dendrogram(Z)
plt.show()
#note on the X axis in dendrogram positions of index were written (2->0, 8->1).


# In[3]:


Z = linkage(X, 'ward')
fig = plt.figure(figsize=(25, 10))
dn = dendrogram(Z)
plt.show()


# In[ ]:




