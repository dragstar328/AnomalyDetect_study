library(ggplot2)
library(car)

head(Davis)

hist = ggplot(Davis, aes(Davis$weight)) + geom_histogram(alpha=0.5)
ggsave("chap2/img/Davis_hist.jpg", hist)
mu = mean(Davis$weight)
mu
s2 = mean((Davis$weight-mu)^2)
s2
var(Davis$weight)
summary(Davis)

a = (Davis$weight-mu)^2/s2
a

th = qchisq(0.99, 1)
th

ad = data.frame(a)
p = ggplot(ad, aes(1:200, ad$a)) + geom_point(colour="pink") + labs(title="anomaly detect", x="number", y="anomaly")
l = geom_line(aes(1:200, th), linetype="dashed", colour="blue")
p + l
ggsave("chap2/img/anomary_1_dim.jpg", p + l)
