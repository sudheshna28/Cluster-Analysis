install.packages('ggplot2')
install.packages("factoextra")
data = read.csv("C:/Users/saisu/OneDrive/Desktop/Clustering.csv",header = T)
data = as.data.frame(data)
head(data)
class(data)
# remove the first column as it represents the row number.
data = data[, -1]
head(data)
## scaling the data
data = scale(data)
class(data)
data = as.data.frame(data)
## elbow method
library(ggplot2)
ggplot(data, aes(x, y)) + 
  geom_point() +  
  theme(
    axis.title.x = element_text(size = 20),
    axis.text.x = element_text(size = 20),
    axis.title.y = element_text(size = 20))
# In Kmeans Algorithm we have to define the number of Cluster which represent the  k
library(factoextra)
## elbow method for optimal number of clusters
fviz_nbclust(data, kmeans, method = "wss")
# method can be = 'gap_stat', 'wss', 'silhouette'
set.seed(123) # set seed for all of us get the same result
km <- kmeans(data, 2)
km
## visualizing the clusters 
fviz_cluster(km, data = data,
             palette = c("yellow", "skyblue"),
             ellipse.type = "eucloid", # Concentration ellipse
             star.plot = TRUE, # Add segments from centroids to items
             repel = TRUE, # Avoid label overplotting (slow)
             ggtheme = theme_minimal())
