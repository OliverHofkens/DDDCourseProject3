internetPrices <- read.csv("data/internet-price.csv")
levels(internetPrices$breakdown) <- c("100 MBps", "12-30 MBps", "30-100 MBps", "8-12 MBps")