library(AnomalyDetection)
library(ggplot2)
library(foreach)

head(Davis)

d = foreach(i=1:200, .combine = 'c') %do% {
  as.POSIXct(Sys.Date() + i)
}

head(d)
df = data.frame(as.POSIXct(d, origin = "1970-01-01"), Davis$weight)
colnames(df) = c("num", "weight")

ggplot(df, aes(1:200, df$weight)) + geom_line(colour="pink")
res = AnomalyDetectionTs(df, max_anoms = 0.02, direction = 'both', plot = T)
res$anoms

res$plot
ggsave("chap2/img/use_pkg_anomaly.jpg", res$plot) 

