#!/usr/bin/env python
# coding: utf-8

# In[23]:


from pyclustering.cluster import cluster_visualizer
from pyclustering.cluster.cure import cure
import numpy as np

X = np.array([[5,3], [10,15], [15,12], [43,67], [45,56],[63,54], [49,50],
    [24,10], [30,30], [85,70], [71,80], [60,78], [70,55], [80,91],])


#    cure_instance = cure(sample, number_clusters, number_represent_points, compression, ccore_flag)
cure_instance = cure(X, 3)
cure_instance.process()                             
clusters = cure_instance.get_clusters()
print(clusters)

representors = cure_instance.get_representors()
means = cure_instance.get_means()

print("Sample: ", X)

visualizer = cluster_visualizer()
visualizer.append_clusters(clusters, X)

for cluster_index in range(len(clusters)):
     visualizer.append_cluster_attribute(0, cluster_index, representors[cluster_index], '*', 10)
     visualizer.append_cluster_attribute(0, cluster_index, [ means[cluster_index] ], 'o')

visualizer.show()


# In[ ]:




