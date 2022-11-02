# SETUP
# Remove everything from memory
rm(list=ls())
# Load packages
library(ggplot2)
library(gridExtra)
library(RColorBrewer)

# DATA
# Load in data
data_file <- "Undaria_Variants.tab"
if (file.exists(data_file)) {
  print("Using original data file.")
  dat <- read.table(file = data_file, header = TRUE)
} else {
  print("Error: no data files found.")
}

# PLOTS
# Plot all 3 data variables on grid
# QD
qd1 <- ggplot(data = dat, aes(x = QD)) + 
  geom_density()
# Set cutoff
qd_cutoff <- 24
qd <- qd1 + 
  geom_vline(aes(xintercept=qd_cutoff), color="red", data.frame()) + 
  xlab("QualByDepth")
# MQRS
mq1 <- ggplot(data = dat, aes(x = MQ)) + 
  geom_density() + ylab("") + xlab("RMSMappingQuality")
# Set cutoff
mq_cutoff <- 37
mq <- mq1 + 
  geom_vline(aes(xintercept=mq_cutoff), color="red", data.frame())
# MQRS
mqrs1 <- ggplot(data = dat, aes(x = MQRankSum)) + 
  geom_density() + 
  xlab("MappingQualityRankSumTest")
# Set cutoff
mqrs_cutoff <- 2
mqrs <- mqrs1 + 
  geom_vline(aes(xintercept=mqrs_cutoff), color="red", data.frame()) + 
  geom_vline(aes(xintercept=-mqrs_cutoff), color="red", data.frame())
# Arrange graphs and print
png("undaria_hard_filt_stats.png", height = 300, width = 900, res = 110)
grid.arrange(qd, mq + ylab(""), mqrs + ylab(""), nrow = 1, 
             top = "Hard Filtering Undaria Variants")
dev.off()

