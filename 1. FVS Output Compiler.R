rm(list = ls()) # Clean environment.
## Set working directory and path:
setwd("/Users/bmishra/Dropbox/OSU/PhD/Dissertation/Push and FVS/FVS")

## Load Libraries:
library(dplyr, warn.conflicts = F) # Data Management.
library(tidyverse, warn.conflicts = F) # Data Management.
library(readxl, warn.conflicts = F) # Read excel.
library(ggplot2, warn.conflicts = F) # Plot Data.

variable.names = c("trtmnt", "Year", "Age", 
                   "S_NoTr", "S_BA", "S_SDI", "S_CCF", "S_TpHt", "S_QMD",
                   "S_Mer", "S_SLgCft", "S_SLgBft", "R_NoTr", "R_Mer",
                   "R_SLgCft", "R_SLgBft", "Aft_BA", "Aft_SDI", "Aft_CCF",
                   "Aft_TpHt", " AftQMD", "G_PYr", "G_Accre", "G_Mort",
                   "MAIMer", "Fortyp", "MAISS")

# Import FVS Output File:
##### Control: #####
skip.control = c(1418, 3042, 4661)
cont1 = read.csv2("CONT.out",
                        sep = "", 
                        skip = skip.control[1], 
                        header = F)[1:41,] #Stand 1
cont10 = read.csv2("CONT.out", 
                   sep = "", 
                   skip = skip.control[2], 
                   header = F)[1:41,] # Stand 10
cont5 = read.csv2("CONT.out", 
                  sep = "", 
                  skip = skip.control[3], 
                  header = F)[1:41,] # Stand 5
control = cbind( c("cont"), 
                 rbind(cont1, cont5, cont10))
names(control) = variable.names

# Added in Control plots:
skip.control.a10 = c(1418, 3042, 4661)
cont1.a10 = read.csv2("CONT.A10.out", 
                      sep = "", 
                      skip = skip.control.a10[1], 
                      header = F)[1:41,] # Stand 1

cont10.a10 = read.csv2("CONT.A10.out",
                       sep = "",
                       skip = skip.control.a10[2],
                       header = F)[1:41,] # Stand 10

cont5.a10 = read.csv2("CONT.A10.out", 
                      sep = "", 
                      skip = skip.control.a10[3],
                      header = F)[1:41,] # Stand 5

control.a10 = cbind( c("cont.a10"), 
                     rbind(cont1.a10, cont5.a10, cont10.a10))
names(control.a10) = variable.names

skip.control.a20 = c(1418, 3042, 4661)
cont1.a20 = read.csv2("CONT.A20.out", 
                      sep = "", 
                      skip = skip.control.a20[1], 
                      header = F)[1:41,] # Stand 1

cont10.a20 = read.csv2("CONT.A20.out", 
                       sep = "", 
                       skip = skip.control.a20[2],
                       header = F)[1:41,] # Stand 10

cont5.a20 = read.csv2("CONT.A20.out",
                      sep = "",
                      skip = skip.control.a20[3], 
                      header = F)[1:41,] # Stand 5

control.a20 = cbind( c("cont.a20"), 
                     rbind(cont1.a20, cont5.a20, cont10.a20))
names(control.a20) = variable.names

skip.control.a30 = c(1418, 3042, 4661)
cont1.a30 = read.csv2("CONT.A30.out", 
                      sep = "", 
                      skip = skip.control.a30[1], 
                      header = F)[1:41,] # Stand 1

cont10.a30 = read.csv2("CONT.A30.out", 
                       sep = "", 
                       skip = skip.control.a30[2], 
                       header = F)[1:41,] # Stand 10

cont5.a30 = read.csv2("CONT.A30.out", 
                      sep = "", 
                      skip = skip.control.a30[3], 
                      header = F)[1:41,] # Stand 5

control.a30 = cbind( c("cont.a30"), 
                     rbind(cont1.a30, cont5.a30, cont10.a30))
names(control.a30) = variable.names

skip.control.a40 = c(1418, 3042, 4661)
cont1.a40 = read.csv2("CONT.A40.out", 
                      sep = "", 
                      skip = skip.control.a40[1], 
                      header = F)[1:41,] # Stand 1

cont10.a40 = read.csv2("CONT.A40.out", 
                       sep = "", 
                       skip = skip.control.a40[2], 
                       header = F)[1:41,] # Stand 10

cont5.a40 = read.csv2("CONT.A40.out", 
                      sep = "", 
                      skip = skip.control.a40[3],
                      header = F)[1:41,] # Stand 5

control.a40 = cbind( c("cont.a40"),
                     rbind(cont1.a40, cont5.a40, cont10.a40))
names(control.a40) = variable.names

skip.control.a50 = c(1418, 3042, 4661)
cont1.a50 = read.csv2("CONT.A50.out", 
                      sep = "", 
                      skip = skip.control.a50[1], 
                      header = F)[1:41,] # Stand 1

cont10.a50 = read.csv2("CONT.A50.out", 
                       sep = "", 
                       skip = skip.control.a50[2], 
                       header = F)[1:41,] # Stand 10

cont5.a50 = read.csv2("CONT.A50.out", 
                      sep = "", 
                      skip = skip.control.a50[3], 
                      header = F)[1:41,] # Stand 5

control.a50 = cbind( c("cont.a50"), 
                     rbind(cont1.a50, cont5.a50, cont10.a50))
names(control.a50) = variable.names

# Subracted in Control plots:
skip.control.s10 = c(1418, 3042, 4661)
cont1.s10 = read.csv2("CONT.S10.out", 
                      sep = "", 
                      skip = skip.control.s10[1], 
                      header = F)[1:41,] # Stand 1

cont10.s10 = read.csv2("CONT.S10.out",
                       sep = "",
                       skip = skip.control.s10[2], 
                       header = F)[1:41,] # Stand 10

cont5.s10 = read.csv2("CONT.S10.out", 
                      sep = "", 
                      skip = skip.control.s10[3], 
                      header = F)[1:41,] # Stand 5

control.s10 = cbind( c("cont.s10"), 
                     rbind(cont1.s10, cont5.s10, cont10.s10))
names(control.s10) = variable.names

skip.control.s20 = c(1418, 3042, 4661)
cont1.s20 = read.csv2("CONT.S20.out", 
                      sep = "", 
                      skip = skip.control.s20[1], 
                      header = F)[1:41,] # Stand 1

cont10.s20 = read.csv2("CONT.S20.out", 
                       sep = "", 
                       skip = skip.control.s20[2], 
                       header = F)[1:41,] # Stand 10

cont5.s20 = read.csv2("CONT.S20.out", 
                      sep = "", 
                      skip = skip.control.s20[3],
                      header = F)[1:41,] # Stand 5

control.s20 = cbind( c("cont.s20"), 
                     rbind(cont1.s20, cont5.s20, cont10.s20))
names(control.s20) = variable.names

skip.control.s30 = c(1418, 3042, 4661)
cont1.s30 = read.csv2("CONT.S30.out", 
                      sep = "", 
                      skip = skip.control.s30[1], 
                      header = F)[1:41,] # Stand 1

cont10.s30 = read.csv2("CONT.S30.out", 
                       sep = "", 
                       skip = skip.control.s30[2], 
                       header = F)[1:41,] # Stand 10

cont5.s30 = read.csv2("CONT.S30.out", 
                      sep = "", 
                      skip = skip.control.s30[3], 
                      header = F)[1:41,] # Stand 5

control.s30 = cbind( c("cont.s30"), 
                     rbind(cont1.s30, cont5.s30, cont10.s30))
names(control.s30) = variable.names

skip.control.s40 = c(1418, 3042, 4661)
cont1.s40 = read.csv2("CONT.S40.out", 
                      sep = "", 
                      skip = skip.control.s40[1], 
                      header = F)[1:41,] # Stand 1

cont10.s40 = read.csv2("CONT.S40.out", 
                       sep = "", 
                       skip = skip.control.s40[2],
                       header = F)[1:41,] # Stand 10

cont5.s40 = read.csv2("CONT.S40.out", 
                      sep = "", 
                      skip = skip.control.s40[3], 
                      header = F)[1:41,] # Stand 5

control.s40 = cbind( c("cont.s40"), 
                     rbind(cont1.s40, cont5.s40, cont10.s40))
names(control.s40) = variable.names

skip.control.s50 = c(1418, 3042, 4661)
cont1.s50 = read.csv2("CONT.S50.out", 
                      sep = "", 
                      skip = skip.control.s50[1],
                      header = F)[1:41,] # Stand 1

cont10.s50 = read.csv2("CONT.S50.out", 
                       sep = "", 
                       skip = skip.control.s50[2], 
                       header = F)[1:41,] # Stand 10

cont5.s50 = read.csv2("CONT.S50.out", 
                      sep = "", 
                      skip = skip.control.s50[3], 
                      header = F)[1:41,] # Stand 5

control.s50 = cbind( c("cont.s50"), 
                     rbind(cont1.s50, cont5.s50, cont10.s50))
names(control.s50) = variable.names

##### HT #####
skip.ht = c(1467, 3522, 5599)
ht1 = read.csv2("HT.out",
                        sep = "", 
                        skip = skip.ht[1], 
                        header = F)[1:41,] #Stand 1

ht10 = read.csv2("HT.out", 
                   sep = "", 
                   skip = skip.ht[2], 
                   header = F)[1:41,] # Stand 10

ht5 = read.csv2("HT.out", 
                  sep = "", 
                  skip = skip.ht[3], 
                  header = F)[1:41,] # Stand 5
ht = cbind( c("ht"), 
                 rbind(ht1, ht5, ht10))
names(ht) = variable.names

# Added in HT:
skip.ht.a10 = c(1467, 3523, 5602)
ht1.a10 = read.csv2("HT.A10.out", 
                      sep = "", 
                      skip = skip.ht.a10[1], 
                      header = F)[1:41,] # Stand 1

ht10.a10 = read.csv2("HT.A10.out",
                       sep = "",
                       skip = skip.ht.a10[2],
                       header = F)[1:41,] # Stand 10

ht5.a10 = read.csv2("HT.A10.out", 
                      sep = "", 
                      skip = skip.ht.a10[3],
                      header = F)[1:41,] # Stand 5

ht.a10 = cbind( c("ht.a10"), 
                     rbind(ht1.a10, ht5.a10, ht10.a10))
names(ht.a10) = variable.names

skip.ht.a20 = c(1467, 3522, 5598)
ht1.a20 = read.csv2("HT.A20.out", 
                      sep = "", 
                      skip = skip.ht.a20[1], 
                      header = F)[1:41,] # Stand 1

ht10.a20 = read.csv2("HT.A20.out", 
                       sep = "", 
                       skip = skip.ht.a20[2],
                       header = F)[1:41,] # Stand 10

ht5.a20 = read.csv2("HT.A20.out",
                      sep = "",
                      skip = skip.ht.a20[3], 
                      header = F)[1:41,] # Stand 5

ht.a20 = cbind( c("ht.a20"), 
                     rbind(ht1.a20, ht5.a20, ht10.a20))
names(ht.a20) = variable.names

skip.ht.a30 = c(1467, 3520, 5593)
ht1.a30 = read.csv2("HT.A30.out", 
                      sep = "", 
                      skip = skip.ht.a30[1], 
                      header = F)[1:41,] # Stand 1

ht10.a30 = read.csv2("HT.A30.out", 
                       sep = "", 
                       skip = skip.ht.a30[2], 
                       header = F)[1:41,] # Stand 10

ht5.a30 = read.csv2("HT.A30.out", 
                      sep = "", 
                      skip = skip.ht.a30[3], 
                      header = F)[1:41,] # Stand 5

ht.a30 = cbind( c("ht.a30"), 
                     rbind(ht1.a30, ht5.a30, ht10.a30))
names(ht.a30) = variable.names

skip.ht.a40 = c(1467, 3516, 5586)
ht1.a40 = read.csv2("HT.A40.out", 
                      sep = "", 
                      skip = skip.ht.a40[1], 
                      header = F)[1:41,] # Stand 1

ht10.a40 = read.csv2("HT.A40.out", 
                       sep = "", 
                       skip = skip.ht.a40[2], 
                       header = F)[1:41,] # Stand 10

ht5.a40 = read.csv2("HT.A40.out", 
                      sep = "", 
                      skip = skip.ht.a40[3],
                      header = F)[1:41,] # Stand 5

ht.a40 = cbind( c("ht.a40"),
                     rbind(ht1.a40, ht5.a40, ht10.a40))
names(ht.a40) = variable.names

skip.ht.a50 = c(1467, 3515, 5583)
ht1.a50 = read.csv2("HT.A50.out", 
                      sep = "", 
                      skip = skip.ht.a50[1], 
                      header = F)[1:41,] # Stand 1

ht10.a50 = read.csv2("HT.A50.out", 
                       sep = "", 
                       skip = skip.ht.a50[2], 
                       header = F)[1:41,] # Stand 10

ht5.a50 = read.csv2("HT.A50.out", 
                      sep = "", 
                      skip = skip.ht.a50[3], 
                      header = F)[1:41,] # Stand 5

ht.a50 = cbind( c("ht.a50"), 
                     rbind(ht1.a50, ht5.a50, ht10.a50))
names(ht.a50) = variable.names

# Subtracted in HT plots:
skip.ht.s10 = c(1467, 3530, 5614)
ht1.s10 = read.csv2("HT.S10.out", 
                      sep = "", 
                      skip = skip.ht.s10[1], 
                      header = F)[1:41,] # Stand 1

ht10.s10 = read.csv2("HT.S10.out",
                       sep = "",
                       skip = skip.ht.s10[2], 
                       header = F)[1:41,] # Stand 10

ht5.s10 = read.csv2("HT.S10.out", 
                      sep = "", 
                      skip = skip.ht.s10[3], 
                      header = F)[1:41,] # Stand 5

ht.s10 = cbind( c("ht.s10"), 
                     rbind(ht1.s10, ht5.s10, ht10.s10))
names(ht.s10) = variable.names

skip.ht.s20 = c(1467, 3533, 5622)
ht1.s20 = read.csv2("HT.S20.out", 
                      sep = "", 
                      skip = skip.ht.s20[1], 
                      header = F)[1:41,] # Stand 1

ht10.s20 = read.csv2("HT.S20.out", 
                       sep = "", 
                       skip = skip.ht.s20[2], 
                       header = F)[1:41,] # Stand 10

ht5.s20 = read.csv2("HT.S20.out", 
                      sep = "", 
                      skip = skip.ht.s20[3],
                      header = F)[1:41,] # Stand 5

ht.s20 = cbind( c("ht.s20"), 
                     rbind(ht1.s20, ht5.s20, ht10.s20))
names(ht.s20) = variable.names

skip.ht.s30 = c(1467, 3535, 5627)
ht1.s30 = read.csv2("HT.S30.out", 
                      sep = "", 
                      skip = skip.ht.s30[1], 
                      header = F)[1:41,] # Stand 1

ht10.s30 = read.csv2("HT.S30.out", 
                       sep = "", 
                       skip = skip.ht.s30[2], 
                       header = F)[1:41,] # Stand 10

ht5.s30 = read.csv2("HT.S30.out", 
                      sep = "", 
                      skip = skip.ht.s30[3], 
                      header = F)[1:41,] # Stand 5

ht.s30 = cbind( c("ht.s30"), 
                     rbind(ht1.s30, ht5.s30, ht10.s30))
names(ht.s30) = variable.names

skip.ht.s40 = c(1467, 3540, 5635)
ht1.s40 = read.csv2("HT.S40.out", 
                      sep = "", 
                      skip = skip.ht.s40[1], 
                      header = F)[1:41,] # Stand 1

ht10.s40 = read.csv2("HT.S40.out", 
                       sep = "", 
                       skip = skip.ht.s40[2],
                       header = F)[1:41,] # Stand 10

ht5.s40 = read.csv2("HT.S40.out", 
                      sep = "", 
                      skip = skip.ht.s40[3], 
                      header = F)[1:41,] # Stand 5

ht.s40 = cbind( c("ht.s40"), 
                     rbind(ht1.s40, ht5.s40, ht10.s40))
names(ht.s40) = variable.names

skip.ht.s50 = c(1467, 3545, 5646)
ht1.s50 = read.csv2("HT.S50.out", 
                      sep = "", 
                      skip = skip.ht.s50[1],
                      header = F)[1:41,] # Stand 1

ht10.s50 = read.csv2("HT.S50.out", 
                       sep = "", 
                       skip = skip.ht.s50[2], 
                       header = F)[1:41,] # Stand 10

ht5.s50 = read.csv2("HT.S50.out", 
                      sep = "", 
                      skip = skip.ht.s50[3], 
                      header = F)[1:41,] # Stand 5

ht.s50 = cbind( c("ht.s50"), 
                     rbind(ht1.s50, ht5.s50, ht10.s50))
names(ht.s50) = variable.names

###### HT2 #####
skip.ht2 = c(1475, 3487, 5522)
ht21 = read.csv2("HT2.out",
                sep = "", 
                skip = skip.ht2[1], 
                header = F)[1:41,] #Stand 1

ht210 = read.csv2("HT2.out", 
                 sep = "", 
                 skip = skip.ht2[2], 
                 header = F)[1:41,] # Stand 10

ht25 = read.csv2("HT2.out", 
                sep = "", 
                skip = skip.ht2[3], 
                header = F)[1:41,] # Stand 5
ht2 = cbind( c("ht2"), 
            rbind(ht21, ht25, ht210))
names(ht2) = variable.names

# Added in HT2:
skip.ht2.a10 = c(1475, 3489, 5524)
ht21.a10 = read.csv2("HT2.A10.out", 
                    sep = "", 
                    skip = skip.ht2.a10[1], 
                    header = F)[1:41,] # Stand 1

ht210.a10 = read.csv2("HT2.A10.out",
                     sep = "",
                     skip = skip.ht2.a10[2],
                     header = F)[1:41,] # Stand 10

ht25.a10 = read.csv2("HT2.A10.out", 
                    sep = "", 
                    skip = skip.ht2.a10[3],
                    header = F)[1:41,] # Stand 5

ht2.a10 = cbind( c("ht2.a10"), 
                rbind(ht21.a10, ht25.a10, ht210.a10))
names(ht2.a10) = variable.names

skip.ht2.a20 = c(1475, 3487, 5524)
ht21.a20 = read.csv2("HT2.A20.out", 
                    sep = "", 
                    skip = skip.ht2.a20[1], 
                    header = F)[1:41,] # Stand 1

ht210.a20 = read.csv2("HT2.A20.out", 
                     sep = "", 
                     skip = skip.ht2.a20[2],
                     header = F)[1:41,] # Stand 10

ht25.a20 = read.csv2("HT2.A20.out",
                    sep = "",
                    skip = skip.ht2.a20[3], 
                    header = F)[1:41,] # Stand 5

ht2.a20 = cbind( c("ht2.a20"), 
                rbind(ht21.a20, ht25.a20, ht210.a20))
names(ht2.a20) = variable.names

skip.ht2.a30 = c(1475, 3488, 5523)
ht21.a30 = read.csv2("HT2.A30.out", 
                    sep = "", 
                    skip = skip.ht2.a30[1], 
                    header = F)[1:41,] # Stand 1

ht210.a30 = read.csv2("HT2.A30.out", 
                     sep = "", 
                     skip = skip.ht2.a30[2], 
                     header = F)[1:41,] # Stand 10

ht25.a30 = read.csv2("HT2.A30.out", 
                    sep = "", 
                    skip = skip.ht2.a30[3], 
                    header = F)[1:41,] # Stand 5

ht2.a30 = cbind( c("ht2.a30"), 
                rbind(ht21.a30, ht25.a30, ht210.a30))
names(ht2.a30) = variable.names

skip.ht2.a40 = c(1475, 3488, 5524)
ht21.a40 = read.csv2("HT2.A40.out", 
                    sep = "", 
                    skip = skip.ht2.a40[1], 
                    header = F)[1:41,] # Stand 1

ht210.a40 = read.csv2("HT2.A40.out", 
                     sep = "", 
                     skip = skip.ht2.a40[2], 
                     header = F)[1:41,] # Stand 10

ht25.a40 = read.csv2("HT2.A40.out", 
                    sep = "", 
                    skip = skip.ht2.a40[3],
                    header = F)[1:41,] # Stand 5

ht2.a40 = cbind( c("ht2.a40"),
                rbind(ht21.a40, ht25.a40, ht210.a40))
names(ht2.a40) = variable.names

skip.ht2.a50 = c(1475, 3487, 5522)
ht21.a50 = read.csv2("HT2.A50.out", 
                    sep = "", 
                    skip = skip.ht2.a50[1], 
                    header = F)[1:41,] # Stand 1

ht210.a50 = read.csv2("HT2.A50.out", 
                     sep = "", 
                     skip = skip.ht2.a50[2], 
                     header = F)[1:41,] # Stand 10

ht25.a50 = read.csv2("HT2.A50.out", 
                    sep = "", 
                    skip = skip.ht2.a50[3], 
                    header = F)[1:41,] # Stand 5

ht2.a50 = cbind( c("ht2.a50"), 
                rbind(ht21.a50, ht25.a50, ht210.a50))
names(ht2.a50) = variable.names

# Subtracted in HT2 plots:
skip.ht2.s10 = c(1475, 3488, 5527)
ht21.s10 = read.csv2("HT2.S10.out", 
                    sep = "", 
                    skip = skip.ht2.s10[1], 
                    header = F)[1:41,] # Stand 1

ht210.s10 = read.csv2("hT2.S10.out",
                     sep = "",
                     skip = skip.ht2.s10[2], 
                     header = F)[1:41,] # Stand 10

ht25.s10 = read.csv2("HT2.S10.out", 
                    sep = "", 
                    skip = skip.ht2.s10[3], 
                    header = F)[1:41,] # Stand 5

ht2.s10 = cbind( c("ht2.s10"), 
                rbind(ht21.s10, ht25.s10, ht210.s10))
names(ht2.s10) = variable.names

skip.ht2.s20 = c(1475, 3485, 5521)
ht21.s20 = read.csv2("HT2.S20.out", 
                    sep = "", 
                    skip = skip.ht2.s20[1], 
                    header = F)[1:41,] # Stand 1

ht210.s20 = read.csv2("HT2.S20.out", 
                     sep = "", 
                     skip = skip.ht2.s20[2], 
                     header = F)[1:41,] # Stand 10

ht25.s20 = read.csv2("HT2.S20.out", 
                    sep = "", 
                    skip = skip.ht2.s20[3],
                    header = F)[1:41,] # Stand 5

ht2.s20 = cbind( c("ht2.s20"), 
                rbind(ht21.s20, ht25.s20, ht210.s20))
names(ht2.s20) = variable.names

skip.ht2.s30 = c(1475, 3482, 5520)
ht21.s30 = read.csv2("HT2.S30.out", 
                    sep = "", 
                    skip = skip.ht2.s30[1], 
                    header = F)[1:41,] # Stand 1

ht210.s30 = read.csv2("HT2.S30.out", 
                     sep = "", 
                     skip = skip.ht2.s30[2], 
                     header = F)[1:41,] # Stand 10

ht25.s30 = read.csv2("HT2.S30.out", 
                    sep = "", 
                    skip = skip.ht2.s30[3], 
                    header = F)[1:41,] # Stand 5

ht2.s30 = cbind( c("ht2.s30"), 
                rbind(ht21.s30, ht25.s30, ht210.s30))
names(ht2.s30) = variable.names

skip.ht2.s40 = c(1475, 3487, 5525)
ht21.s40 = read.csv2("HT2.S40.out", 
                    sep = "", 
                    skip = skip.ht2.s40[1], 
                    header = F)[1:41,] # Stand 1

ht210.s40 = read.csv2("HT2.S40.out", 
                     sep = "", 
                     skip = skip.ht2.s40[2],
                     header = F)[1:41,] # Stand 10

ht25.s40 = read.csv2("HT2.S40.out", 
                    sep = "", 
                    skip = skip.ht2.s40[3], 
                    header = F)[1:41,] # Stand 5

ht2.s40 = cbind( c("ht2.s40"), 
                rbind(ht21.s40, ht25.s40, ht210.s40))
names(ht2.s40) = variable.names

skip.ht2.s50 = c(1475, 3488, 5524)
ht21.s50 = read.csv2("HT2.S50.out", 
                    sep = "", 
                    skip = skip.ht2.s50[1],
                    header = F)[1:41,] # Stand 1

ht210.s50 = read.csv2("HT2.S50.out", 
                     sep = "", 
                     skip = skip.ht2.s50[2], 
                     header = F)[1:41,] # Stand 10

ht25.s50 = read.csv2("HT2.S50.out", 
                    sep = "", 
                    skip = skip.ht2.s50[3], 
                    header = F)[1:41,] # Stand 5

ht2.s50 = cbind( c("ht2.s50"), 
                rbind(ht21.s50, ht25.s50, ht210.s50))
names(ht2.s50) = variable.names

##### HT3 #####
skip.ht3 = c(1496, 3840, 6221)
ht31 = read.csv2("HT3.out",
                sep = "", 
                skip = skip.ht3[1], 
                header = F)[1:41,] #Stand 1

ht310 = read.csv2("HT3.out", 
                 sep = "", 
                 skip = skip.ht3[2], 
                 header = F)[1:41,] # Stand 10

ht35 = read.csv2("HT3.out", 
                sep = "", 
                skip = skip.ht3[3], 
                header = F)[1:41,] # Stand 5
ht3 = cbind( c("ht3"), 
            rbind(ht31, ht35, ht310))
names(ht3) = variable.names

# Added in HT3:
skip.ht3.a10 = c(1496, 3837, 6216)
ht31.a10 = read.csv2("HT3.A10.out", 
                    sep = "", 
                    skip = skip.ht3.a10[1], 
                    header = F)[1:41,] # Stand 1

ht310.a10 = read.csv2("HT3.A10.out",
                     sep = "",
                     skip = skip.ht3.a10[2],
                     header = F)[1:41,] # Stand 10

ht35.a10 = read.csv2("HT3.A10.out", 
                    sep = "", 
                    skip = skip.ht3.a10[3],
                    header = F)[1:41,] # Stand 5

ht3.a10 = cbind( c("ht3.a10"), 
                rbind(ht31.a10, ht35.a10, ht310.a10))
names(ht3.a10) = variable.names

skip.ht3.a20 = c(1496, 3843, 6223)
ht31.a20 = read.csv2("HT3.A20.out", 
                    sep = "", 
                    skip = skip.ht3.a20[1], 
                    header = F)[1:41,] # Stand 1

ht310.a20 = read.csv2("HT3.A20.out", 
                     sep = "", 
                     skip = skip.ht3.a20[2],
                     header = F)[1:41,] # Stand 10

ht35.a20 = read.csv2("HT3.A20.out",
                    sep = "",
                    skip = skip.ht3.a20[3], 
                    header = F)[1:41,] # Stand 5

ht3.a20 = cbind(c("ht3.a20"), 
                rbind(ht31.a20, ht35.a20, ht310.a20))
names(ht3.a20) = variable.names

skip.ht3.a30 = c(1496, 3837, 6214)
ht31.a30 = read.csv2("HT3.A30.out", 
                    sep = "", 
                    skip = skip.ht3.a30[1], 
                    header = F)[1:41,] # Stand 1

ht310.a30 = read.csv2("HT3.A30.out", 
                     sep = "", 
                     skip = skip.ht3.a30[2], 
                     header = F)[1:41,] # Stand 10

ht35.a30 = read.csv2("HT3.A30.out", 
                    sep = "", 
                    skip = skip.ht3.a30[3], 
                    header = F)[1:41,] # Stand 5

ht3.a30 = cbind( c("ht3.a30"), 
                rbind(ht31.a30, ht35.a30, ht310.a30))
names(ht3.a30) = variable.names

skip.ht3.a40 = c(1496, 3836, 6215)
ht31.a40 = read.csv2("HT3.A40.out", 
                    sep = "", 
                    skip = skip.ht3.a40[1], 
                    header = F)[1:41,] # Stand 1

ht310.a40 = read.csv2("HT3.A40.out", 
                     sep = "", 
                     skip = skip.ht3.a40[2], 
                     header = F)[1:41,] # Stand 10

ht35.a40 = read.csv2("HT3.A40.out", 
                    sep = "", 
                    skip = skip.ht3.a40[3],
                    header = F)[1:41,] # Stand 5

ht3.a40 = cbind( c("ht3.a40"),
                rbind(ht31.a40, ht35.a40, ht310.a40))
names(ht3.a40) = variable.names

skip.ht3.a50 = c(1496, 3834, 6215)
ht31.a50 = read.csv2("HT3.A50.out", 
                    sep = "", 
                    skip = skip.ht3.a50[1], 
                    header = F)[1:41,] # Stand 1

ht310.a50 = read.csv2("HT3.A50.out", 
                     sep = "", 
                     skip = skip.ht3.a50[2], 
                     header = F)[1:41,] # Stand 10

ht35.a50 = read.csv2("HT3.A50.out", 
                    sep = "", 
                    skip = skip.ht3.a50[3], 
                    header = F)[1:41,] # Stand 5

ht3.a50 = cbind( c("ht3.a50"), 
                rbind(ht31.a50, ht35.a50, ht310.a50))
names(ht3.a50) = variable.names

# Subtracted in HT3 plots:
skip.ht3.s10 = c(1496, 3842, 6220)
ht31.s10 = read.csv2("HT3.S10.out", 
                    sep = "", 
                    skip = skip.ht3.s10[1], 
                    header = F)[1:41,] # Stand 1

ht310.s10 = read.csv2("HT3.S10.out",
                     sep = "",
                     skip = skip.ht3.s10[2], 
                     header = F)[1:41,] # Stand 10

ht35.s10 = read.csv2("HT3.S10.out", 
                    sep = "", 
                    skip = skip.ht3.s10[3], 
                    header = F)[1:41,] # Stand 5

ht3.s10 = cbind( c("ht3.s10"), 
                rbind(ht31.s10, ht35.s10, ht310.s10))
names(ht3.s10) = variable.names

skip.ht3.s20 = c(1496, 3842, 6220)
ht31.s20 = read.csv2("HT3.S20.out", 
                    sep = "", 
                    skip = skip.ht3.s20[1], 
                    header = F)[1:41,] # Stand 1

ht310.s20 = read.csv2("HT3.S20.out", 
                     sep = "", 
                     skip = skip.ht3.s20[2], 
                     header = F)[1:41,] # Stand 10

ht35.s20 = read.csv2("HT3.S20.out", 
                    sep = "", 
                    skip = skip.ht3.s20[3],
                    header = F)[1:41,] # Stand 5

ht3.s20 = cbind( c("ht3.s20"), 
                rbind(ht31.s20, ht35.s20, ht310.s20))
names(ht3.s20) = variable.names

skip.ht3.s30 = c(1496, 3841, 6220)
ht31.s30 = read.csv2("HT3.S30.out", 
                    sep = "", 
                    skip = skip.ht3.s30[1], 
                    header = F)[1:41,] # Stand 1

ht310.s30 = read.csv2("HT3.S30.out", 
                     sep = "", 
                     skip = skip.ht3.s30[2], 
                     header = F)[1:41,] # Stand 10

ht35.s30 = read.csv2("HT3.S30.out", 
                    sep = "", 
                    skip = skip.ht3.s30[3], 
                    header = F)[1:41,] # Stand 5

ht3.s30 = cbind( c("ht3.s30"), 
                rbind(ht31.s30, ht35.s30, ht310.s30))
names(ht3.s30) = variable.names

skip.ht3.s40 = c(1496, 3840, 6217)
ht31.s40 = read.csv2("HT3.S40.out", 
                    sep = "", 
                    skip = skip.ht3.s40[1], 
                    header = F)[1:41,] # Stand 1

ht310.s40 = read.csv2("HT3.S40.out", 
                     sep = "", 
                     skip = skip.ht3.s40[2],
                     header = F)[1:41,] # Stand 10

ht35.s40 = read.csv2("HT3.S40.out", 
                    sep = "", 
                    skip = skip.ht3.s40[3], 
                    header = F)[1:41,] # Stand 5

ht3.s40 = cbind( c("ht3.s40"), 
                rbind(ht31.s40, ht35.s40, ht310.s40))
names(ht3.s40) = variable.names

skip.ht3.s50 = c(1496, 3841, 6218)
ht31.s50 = read.csv2("HT3.S50.out", 
                    sep = "", 
                    skip = skip.ht3.s50[1],
                    header = F)[1:41,] # Stand 1

ht310.s50 = read.csv2("HT3.S50.out", 
                     sep = "", 
                     skip = skip.ht3.s50[2], 
                     header = F)[1:41,] # Stand 10

ht35.s50 = read.csv2("HT3.S50.out", 
                    sep = "", 
                    skip = skip.ht3.s50[3], 
                    header = F)[1:41,] # Stand 5

ht3.s50 = cbind( c("ht3.s50"), 
                rbind(ht31.s50, ht35.s50, ht310.s50))
names(ht3.s50) = variable.names

##### HT4 #####
skip.ht4 = c(1492, 3754, 6062)
ht41 = read.csv2("HT4.out",
                sep = "", 
                skip = skip.ht4[1], 
                header = F)[1:41,] #Stand 1

ht410 = read.csv2("HT4.out", 
                 sep = "", 
                 skip = skip.ht4[2], 
                 header = F)[1:41,] # Stand 10

ht45 = read.csv2("HT4.out", 
                sep = "", 
                skip = skip.ht4[3], 
                header = F)[1:41,] # Stand 5
ht4 = cbind( c("ht4"), 
            rbind(ht41, ht45, ht410))
names(ht4) = variable.names

# Added in HT4:
skip.ht4.a10 = c(1492, 3755, 6061)
ht41.a10 = read.csv2("HT4.A10.out", 
                    sep = "", 
                    skip = skip.ht4.a10[1], 
                    header = F)[1:41,] # Stand 1

ht410.a10 = read.csv2("HT4.A10.out",
                     sep = "",
                     skip = skip.ht4.a10[2],
                     header = F)[1:41,] # Stand 10

ht45.a10 = read.csv2("HT4.A10.out", 
                    sep = "", 
                    skip = skip.ht4.a10[3],
                    header = F)[1:41,] # Stand 5

ht4.a10 = cbind( c("ht4.a10"), 
                rbind(ht41.a10, ht45.a10, ht410.a10))
names(ht4.a10) = variable.names

skip.ht4.a20 = c(1492, 3754, 6060)
ht41.a20 = read.csv2("HT4.A20.out", 
                    sep = "", 
                    skip = skip.ht4.a20[1], 
                    header = F)[1:41,] # Stand 1

ht410.a20 = read.csv2("HT4.A20.out", 
                     sep = "", 
                     skip = skip.ht4.a20[2],
                     header = F)[1:41,] # Stand 10

ht45.a20 = read.csv2("HT4.A20.out",
                    sep = "",
                    skip = skip.ht4.a20[3], 
                    header = F)[1:41,] # Stand 5

ht4.a20 = cbind( c("ht4.a20"), 
                rbind(ht41.a20, ht45.a20, ht410.a20))
names(ht4.a20) = variable.names

skip.ht4.a30 = c(1492, 3754, 6062)
ht41.a30 = read.csv2("HT4.A30.out", 
                    sep = "", 
                    skip = skip.ht4.a30[1], 
                    header = F)[1:41,] # Stand 1

ht410.a30 = read.csv2("HT4.A30.out", 
                     sep = "", 
                     skip = skip.ht4.a30[2], 
                     header = F)[1:41,] # Stand 10

ht45.a30 = read.csv2("HT4.A30.out", 
                    sep = "", 
                    skip = skip.ht4.a30[3], 
                    header = F)[1:41,] # Stand 5

ht4.a30 = cbind( c("ht4.a30"), 
                rbind(ht41.a30, ht45.a30, ht410.a30))
names(ht4.a30) = variable.names

skip.ht4.a40 = c(1492, 3754, 6060)
ht41.a40 = read.csv2("HT4.A40.out", 
                    sep = "", 
                    skip = skip.ht4.a40[1], 
                    header = F)[1:41,] # Stand 1

ht410.a40 = read.csv2("HT4.A40.out", 
                     sep = "", 
                     skip = skip.ht4.a40[2], 
                     header = F)[1:41,] # Stand 10

ht45.a40 = read.csv2("HT4.A40.out", 
                    sep = "", 
                    skip = skip.ht4.a40[3],
                    header = F)[1:41,] # Stand 5

ht4.a40 = cbind( c("ht4.a40"),
                rbind(ht41.a40, ht45.a40, ht410.a40))
names(ht4.a40) = variable.names

skip.ht4.a50 = c(1492, 3755, 6061)
ht41.a50 = read.csv2("HT4.A50.out", 
                    sep = "", 
                    skip = skip.ht4.a50[1], 
                    header = F)[1:41,] # Stand 1

ht410.a50 = read.csv2("HT4.A50.out", 
                     sep = "", 
                     skip = skip.ht4.a50[2], 
                     header = F)[1:41,] # Stand 10

ht45.a50 = read.csv2("HT4.A50.out", 
                    sep = "", 
                    skip = skip.ht4.a50[3], 
                    header = F)[1:41,] # Stand 5

ht4.a50 = cbind( c("ht4.a50"), 
                rbind(ht41.a50, ht45.a50, ht410.a50))
names(ht4.a50) = variable.names

# Subtracted in HT4 plots:
skip.ht4.s10 = c(1492, 3754, 6060)
ht41.s10 = read.csv2("HT4.S10.out", 
                    sep = "", 
                    skip = skip.ht4.s10[1], 
                    header = F)[1:41,] # Stand 1

ht410.s10 = read.csv2("HT4.S10.out",
                     sep = "",
                     skip = skip.ht4.s10[2], 
                     header = F)[1:41,] # Stand 10

ht45.s10 = read.csv2("HT4.S10.out", 
                    sep = "", 
                    skip = skip.ht4.s10[3], 
                    header = F)[1:41,] # Stand 5

ht4.s10 = cbind( c("ht4.s10"), 
                rbind(ht41.s10, ht45.s10, ht410.s10))
names(ht4.s10) = variable.names

skip.ht4.s20 = c(1492, 3754, 6060)
ht41.s20 = read.csv2("HT4.S20.out", 
                    sep = "", 
                    skip = skip.ht4.s20[1], 
                    header = F)[1:41,] # Stand 1

ht410.s20 = read.csv2("HT4.S20.out", 
                     sep = "", 
                     skip = skip.ht4.s20[2], 
                     header = F)[1:41,] # Stand 10

ht45.s20 = read.csv2("HT4.S20.out", 
                    sep = "", 
                    skip = skip.ht4.s20[3],
                    header = F)[1:41,] # Stand 5

ht4.s20 = cbind( c("ht4.s20"), 
                rbind(ht41.s20, ht45.s20, ht410.s20))
names(ht4.s20) = variable.names

skip.ht4.s30 = c(1492, 3754, 6062)
ht41.s30 = read.csv2("HT4.S30.out", 
                    sep = "", 
                    skip = skip.ht4.s30[1], 
                    header = F)[1:41,] # Stand 1

ht410.s30 = read.csv2("HT4.S30.out", 
                     sep = "", 
                     skip = skip.ht4.s30[2], 
                     header = F)[1:41,] # Stand 10

ht45.s30 = read.csv2("HT4.S30.out", 
                    sep = "", 
                    skip = skip.ht4.s30[3], 
                    header = F)[1:41,] # Stand 5

ht4.s30 = cbind( c("ht4.s30"), 
                rbind(ht41.s30, ht45.s30, ht410.s30))
names(ht4.s30) = variable.names

skip.ht4.s40 = c(1492, 3754, 6060)
ht41.s40 = read.csv2("HT4.S40.out", 
                    sep = "", 
                    skip = skip.ht4.s40[1], 
                    header = F)[1:41,] # Stand 1

ht410.s40 = read.csv2("HT4.S40.out", 
                     sep = "", 
                     skip = skip.ht4.s40[2],
                     header = F)[1:41,] # Stand 10

ht45.s40 = read.csv2("HT4.S40.out", 
                    sep = "", 
                    skip = skip.ht4.s40[3], 
                    header = F)[1:41,] # Stand 5

ht4.s40 = cbind( c("ht4.s40"), 
                rbind(ht41.s40, ht45.s40, ht410.s40))
names(ht4.s40) = variable.names

skip.ht4.s50 = c(1492, 3754, 6062)
ht41.s50 = read.csv2("HT4.S50.out", 
                    sep = "", 
                    skip = skip.ht4.s50[1],
                    header = F)[1:41,] # Stand 1

ht410.s50 = read.csv2("HT4.S50.out", 
                     sep = "", 
                     skip = skip.ht4.s50[2], 
                     header = F)[1:41,] # Stand 10

ht45.s50 = read.csv2("HT4.S50.out", 
                    sep = "", 
                    skip = skip.ht4.s50[3], 
                    header = F)[1:41,] # Stand 5

ht4.s50 = cbind( c("ht4.s50"), 
                rbind(ht41.s50, ht45.s50, ht410.s50))
names(ht4.s50) = variable.names

push.fvs.results = rbind(control, control.a10, control.a20, control.a30, 
                  control.a40, control.a50, control.s10, control.s20,
                  control.s30, control.s40, control.s50,
                  ht, ht.a10, ht.a20, ht.a30, ht.a40, ht.a50,
                  ht.s10, ht.s20, ht.s30, ht.s40, ht.s50,
                  ht2, ht2.a10, ht2.a20, ht2.a30, ht2.a40, ht2.a50,
                  ht2.s10, ht2.s20, ht2.s30, ht2.s40, ht2.s50,
                  ht3, ht3.a10, ht3.a20, ht3.a30, ht3.a40, ht3.a50,
                  ht3.s10, ht3.s20, ht3.s30, ht3.s40, ht3.s50,
                  ht4,ht4.a10, ht4.a20, ht4.a30, ht4.a40, ht4.a50,
                  ht4.s10, ht4.s20, ht4.s30, ht4.s40, ht4.s50)
dim(push.fvs.results)
write_csv(push.fvs.results, "FVSOutputCompiled.csv")