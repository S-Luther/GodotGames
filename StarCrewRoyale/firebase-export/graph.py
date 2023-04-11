import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
import json
import pylab

node_colors=[]
sizes=[]
labels=[]
color=0
# Opening JSON file
f = open('labels.json')
  
# returns JSON object as 
# a dictionary
data = json.load(f)
  
# Iterating through the json
# list
for i in data['colors']:
    node_colors.append(i)
    sizes.append(1000)
for i in data['colors']:
    labels.append(i)
input_data = pd.read_csv('graph.csv', index_col=0)

color_map=[]

for i in node_colors:
    temp = i
    color_map.append(temp)
t= 0
cmap = plt.cm.jet
print(color_map)
G = nx.Graph(input_data.values)


nx.draw_networkx(G,
                node_colors=color_map,
                node_size=sizes,
                cmap=cmap)
pylab.show()