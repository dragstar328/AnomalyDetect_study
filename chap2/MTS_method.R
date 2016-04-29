library(MASS)
library(ggplot2)

head(road)
X = road / road$drivers
head(X)

X = as.matrix(log(X[,-2] + 1))
head(X)
mx = colMeans(X)
head(mx)
Xc= X - matrix(1, nrow(X), 1) %*% mx
head(Xc)

Sx = t(Xc) %*% Xc / nrow(X)
head(Sx)

a = rowSums((Xc %*% solve(Sx) * Xc) / ncol(X))
ad = data.frame(1:26, a)
ad
colnames(ad) = c("num", "a")

g = ggplot(ad, aes(ad$num, ad$a)) + geom_point(colour="red")
l = geom_hline(yintercept = 1, linetype="dashed", colour="blue")
lim = ylim(c(-1,30)/ncol(X))
lab = labs(x="number", y="anomaly")

g + l + lim + lab
ggsave("chap2/img/MTS.jpg", g + l + lim + lab)

xc_prime = Xc["Calif", ]
xc_prime

SN1 = 10 * log10(xc_prime^2 / diag(Sx))
SN1
SN1.df = data.frame(names(SN1), SN1)
SN1.df
colnames(SN1.df) = c("vars", "anomaly")
SN1.df

gb = ggplot(SN1.df, aes(vars, anomaly)) + geom_bar(alpha=0.5, stat="identity", fill="skyblue")
gt = labs(title="Anomaly about Calif")

gb + gt
ggsave("chap2/img/Calif_SN_ratio.jpg", gb + gt)
