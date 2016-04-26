library(ggplot2)
library(car)

head(Davis)

X = cbind(Davis$weight, Davis$height)
head(X)
summary(X)
v = ggplot(Davis, aes(Davis$weight, Davis$height)) + geom_point(colour="pink")
v

mx = colMeans(X)
mx
Xc = X - matrix(1, nrow(X), 1) %*% mx
head(Xc)
Sx = t(Xc) %*% Xc / nrow(X)
Sx
a = rowSums((Xc %*% solve(Sx)) * Xc)
head(a)
ad = data.frame(a)
head(ad)

th = qchisq(0.99, 1)
th


p = ggplot() + geom_point(aes(1:200, ad$a), colour="pink") + labs(title="anomaly detect", x="number", y="anomaly")
l = geom_hline(yintercept=th, colour="blue", linetype="dashed")
p + l
