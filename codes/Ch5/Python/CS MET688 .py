#!/usr/bin/env python
# coding: utf-8

# In[9]:


from efficient_apriori import apriori
transactions = [('eggs', 'bread', 'soup'),
                ('eggs', 'bread', 'apple'),
                ('soup', 'bread', 'banana'),
                ('bread','banana','jam')]
#note support and confidence should be between 0 and 1
itemsets, rules = apriori(transactions, min_support=0.5,  min_confidence=0.8)
print(rules)


# In[14]:


import pyfpgrowth
transactions = [('eggs', 'bread', 'soup'),
                ('eggs', 'bread', 'apple'),
                ('soup', 'bread', 'banana'),
                ('bread','banana','jam')]
patterns = pyfpgrowth.find_frequent_patterns(transactions, 2)
patterns


# In[27]:


import pandas as pd

from fim import eclat

transactions = [('eggs', 'bread', 'soup'),
                ('eggs', 'bread', 'apple'),
                ('soup', 'bread', 'banana'),
                ('bread','banana','jam')]
rules = eclat(tracts = transactions, zmin = 2)
rules


# In[ ]:




