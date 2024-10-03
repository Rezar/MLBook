# Created by Chang Liu, Boston University
# cliu17@bu.edu

import numpy as np
from scipy import stats
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection  # for the triangle surface
from mpl_toolkits.mplot3d import Axes3D


plt.figure(figsize=(12,8))
surface = plt.subplot(231,projection='3d') #  subplot 1
x1 = np.array([0, 1, 0])
y1 = np.array([1, 0, 0])
z1 = np.array([0, 0, 1])  # cornor of triangle surface


#create surface
# 1. create vertices from points
verts = [list(zip(x1, y1, z1))]
# 2. create 3d polygons and specify parameters
srf = Poly3DCollection(verts, alpha=.25, facecolor='#ffffb3')
# 3. add polygon to the figure (current axes)
ax = plt.gca().add_collection3d(srf)

# create dirichlet distribution data
rng = np.random.default_rng()  # random PCG64 generator
alpha = [0.2, 0.2, 0.2]   #set alpha
s = rng.dirichlet(alpha=alpha, size=1500).transpose()
ax = plt.gca(projection='3d')
ax.scatter(s[0], s[1], s[2], c='#0059b3', s =2) 

# plot setting
ax.view_init(30, 60)  #elev 30° azim 60°
ax.set_title("α(0.2, 0.2, 0.2)") # set title
ax.set_xlabel('X') # set label name
ax.set_ylabel('Y')
ax.set_zlabel('Z')



surface=plt.subplot(232, projection='3d')    #subplot 2

# create surface
# 1. create vertices from points
verts = [list(zip(x1, y1, z1))]
# 2. create 3d polygons and specify parameters
srf = Poly3DCollection(verts, alpha=.25, facecolor='#ffffb3')
# 3. add polygon to the figure (current axes)
ax = plt.gca().add_collection3d(srf)
surface = plt.gca().add_collection3d(srf)   #create surface

# create dirichlet distribution data
rng = np.random.default_rng()    # random PCG64 generator
alpha = [3, 3, 3]   #set alpha
s = rng.dirichlet(alpha=alpha, size=1500).transpose()
ax = plt.gca(projection='3d')
ax.scatter(s[0], s[1], s[2], c='#0059b3', s = 2)  

# plot setting
ax.view_init(30, 60)  # elev 30° azim 60°
ax.set_title("α=(3, 3, 3)")    #set title
ax.set_xlabel('X')    #set label name
ax.set_ylabel('Y')
ax.set_zlabel('Z')


surface=plt.subplot(233, projection='3d')   #subplot 3

# create surface
# 1. create vertices from points
verts = [list(zip(x1, y1, z1))]
# 2. create 3d polygons and specify parameters
srf = Poly3DCollection(verts, alpha=.25, facecolor='#ffffb3')
# 3. add polygon to the figure (current axes)
ax = plt.gca().add_collection3d(srf)
surface = plt.gca().add_collection3d(srf)   #create surface

# create dirichlet distribution data
rng = np.random.default_rng()  # random PCG64 generator
alpha = [9, 9, 9] #set alpha
s = rng.dirichlet(alpha=alpha, size=1500).transpose()
ax = plt.gca(projection='3d')
ax.scatter(s[0], s[1], s[2], c='#0059b3', s = 2)

# plot setting
ax.view_init(30, 60)  # elev 30° azim 60°
ax.set_title("α=(9, 9, 9)")   #set title
ax.set_xlabel('X')    #set label name
ax.set_ylabel('Y')
ax.set_zlabel('Z')

surface=plt.subplot(234, projection='3d') #subplot 4

# create surface
# 1. create vertices from points
verts = [list(zip(x1, y1, z1))]
# 2. create 3d polygons and specify parameters
srf = Poly3DCollection(verts, alpha=.25, facecolor='#ffffb3')
# 3. add polygon to the figure (current axes)
ax = plt.gca().add_collection3d(srf)
surface = plt.gca().add_collection3d(srf) #create surface

# create dirichlet distribution data
rng = np.random.default_rng()  # random PCG64 generator
alpha = [2, 6, 10] #set alpha
s = rng.dirichlet(alpha=alpha, size=1500).transpose()
ax = plt.gca(projection='3d')
ax.scatter(s[0], s[1], s[2], c='#0059b3', s=2)   

# plot setting
ax.view_init(30, 60)  #elev 30° azim 60°
ax.set_title("α=(2, 6, 10)")   #set title
ax.set_xlabel('X')   #set label name
ax.set_ylabel('Y')
ax.set_zlabel('Z')

surface=plt.subplot(235, projection='3d') #subplot 5

# create surface
# 1. create vertices from points
verts = [list(zip(x1, y1, z1))]
# 2. create 3d polygons and specify parameters
srf = Poly3DCollection(verts, alpha=.25, facecolor='#ffffb3')
# 3. add polygon to the figure (current axes)
ax = plt.gca().add_collection3d(srf)
surface = plt.gca().add_collection3d(srf)   #create surface

# create dirichlet distribution data
rng = np.random.default_rng()    # random PCG64 generator
alpha = [14, 9, 5] #set alpha
s = rng.dirichlet(alpha=alpha, size=1500).transpose()
ax = plt.gca(projection='3d')
ax.scatter(s[0], s[1], s[2], c='#0059b3', s=2) 

#plot setting
ax.view_init(30, 60)    # elev 30° azim 60°
ax.set_title("α=(14, 9, 5)")   #set title
ax.set_xlabel('X')   # set label name
ax.set_ylabel('Y')
ax.set_zlabel('Z')


surface=plt.subplot(236, projection='3d') #subplot 6

# create surface
# 1. create vertices from points
verts = [list(zip(x1, y1, z1))]
# 2. create 3d polygons and specify parameters
srf = Poly3DCollection(verts, alpha=.25, facecolor='#ffffb3')
# 3. add polygon to the figure (current axes)
ax = plt.gca().add_collection3d(srf)
surface = plt.gca().add_collection3d(srf) #create surface

# create dirichlet distribution data
rng = np.random.default_rng()   # random PCG64 generator
alpha = [6, 2, 6] #set alpha
s = rng.dirichlet(alpha=alpha, size=1500).transpose()
ax = plt.gca(projection='3d')
ax.scatter(s[0], s[1], s[2], c='#0059b3', s=2)   #scatter with color

#plot setting
ax.view_init(30, 60)    #elev 30° azim 60°
ax.set_title("α=(6, 2, 6)")   #set title
ax.set_xlabel('X')   #set label name
ax.set_ylabel('Y')
ax.set_zlabel('Z')

plt.show()
