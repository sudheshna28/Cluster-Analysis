install.packages('ggplot2')
install.packages("factoextra")
data = read.csv("C:/Users/saisu/OneDrive/Desktop/Clustering.csv",header = T)
data = as.data.frame(data)
head(data)
class(data)
# remove the first column as it represents the row number.
data = data[, -1]
head(data)
# tip: Before Appling dataset to K-means clustering you should better scale your data
data = scale(data)
class(data)
# Becuase the output of scale function is 'matrix''array', I transform it to dataframe

data = as.data.frame(data)
# let me show you the scatter plot between x, y, and latter applying it to k-means
library(ggplot2)

ggplot(data, aes(x, y)) + 
  geom_point() +  
  theme(
    axis.title.x = element_text(size = 20),
    axis.text.x = element_text(size = 20),
    axis.title.y = element_text(size = 20))
# In Kmeans Algorithm we have to define the number of Cluster which represent with k
# fortunatly in R, We have some intersting functions for selecting k.
library(factoextra)

fviz_nbclust(data, kmeans, method = "wss")
# method can be = 'gap_stat', 'wss', 'silhouette'
set.seed(123) # set seed for all of us get the same result
km <- kmeans(data, 2)
km
fviz_cluster(km, data = data,
             palette = c("yellow", "skyblue"),
             ellipse.type = "ellipse", # Concentration ellipse
             star.plot = TRUE, # Add segments from centroids to items
             repel = TRUE, # Avoid label overplotting (slow)
             ggtheme = theme_minimal())
