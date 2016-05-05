library(kernlab)

x = rbind(matrix(rnorm(120), ncol=2), matrix(rnorm(120, mean=3), ncol=2))
x = scale(x)
rbf = rbfdot(sigma = 0.5)
ocsvm  = ksvm(x, type="one-svc", kernel=rbf, nu=0.1)

colorcode = rep(0, nrow(x))
colorcode[ocsvm@alphaindex] < 1
plot(x, pch=21, bg=colorcode)
