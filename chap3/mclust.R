library(car)
library(mclust)
library(ggplot2)

X = Davis[-12, c("weight", "height")]
result = Mclust(X)
print(summary(result, parameters = T))
plot(result)

pi = result$parameters$pro
X = Davis[, c("weight", "height")]
XX = cdens(modelName = result$modelName, X, parameters = result$parameters)
a = -log(as.matrix(XX) %*% as.matrix(pi))
g = ggplot() + geom_point(aes(1:200, a), colour="red", alpha=0.5) + labs(x="sample no", y="anomaly score")
plot(g)
ggsave("chap3/img/mclust.jpeg", g)

