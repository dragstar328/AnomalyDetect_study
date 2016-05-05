library(ggplot2)
library(car)
library(MASS)

N = length(Davis$weight)
mu = mean(Davis$weight)
si = sd(Davis$weight)
kmo = (mu/si)^2
smo = si^2/mu
ml = fitdistr(Davis$weight, "gamma")
kml = ml$estimate["shape"]
sml = 1/ml$estimate["rate"]

a = Davis$weight/smo - (kmo -1)*log(Davis$weight/smo)
th = order(a, decreasing = T)[0.01*N]

g = ggplot() + geom_point(aes(1:200, a), colour="red", alpha=0.5) + labs(x="num", y="anomaly score") + geom_hline(yintercept = a[th], colour="blue", linetype="dashed")
plot(g)
ggsave("chap3/img/gammma.jpg", g)

