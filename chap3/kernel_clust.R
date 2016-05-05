library(car)
library(KernSmooth)

x = Davis[, c("weight", "height")]
h = c(dpik(x$weight), dpik(x$height))
est = bkde2D(x, bandwidth = h, gridsize = c(10^3, 10^3))
d = list(x=est$x1, y=est$x2, z=est$fhat)

image(d, col=terrain.colors(7), xlim=c(35, 110), ylim=c(145,200))
contour(d, add=T)
