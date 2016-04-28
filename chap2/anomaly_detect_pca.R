library(ggplot2)
library(car)

head(Davis)

df =  data.frame(Davis$weight, Davis$height)
pca = princomp(df)
summary(pca)
pca

pca$scores
df2 = data.frame(pca$x[,1], pca$x[,2])
df2
colnames(df2) = c("pr1", "pr2")
ggplot() + geom_point(aes(1:200, df2$pr2), colour="pink")
