rm(list = ls()) # Clean environment.
## Set working directory and path:
setwd("/Users/bmishra/Dropbox/OSU/PhD/Dissertation/Push and FVS/FVS")

## Load Libraries:
library(dplyr, warn.conflicts = F) # Data Management.
library(tidyverse, warn.conflicts = F) # Data Management.
library(readxl, warn.conflicts = F) # Read excel.
library(ggplot2, warn.conflicts = F) # Plot Data.
library(tidyselect, warn.conflicts = F)
library(FinancialMath, warn.conflicts = F) #NPV calculation

# Import Data:
push.timber.org = read.csv("FVSOutputCompiled.csv") # Read Data
push.timber.org = setNames(push.timber.org, 
                           tolower(names(push.timber.org))) #Names Lower Case
attach(push.timber.org, pos = 2L, warn.conflicts = F)
dim(push.timber.org)

# Source of Conversion factor: 
# https://extension.msstate.edu/sites/default/files/publications/publications/P2244_web.pdf.
# https://extension.msstate.edu/sites/default/files/publications/publications/P3448_web.pdf

push.timber = push.timber.org %>%
  select(trtmnt, year, 
         s_ba, # Sq ft/acres
         s_mer, # Merchantable timber in Cubit ft.
         s_slgcft # Sawlog in cubic ft.
         ) %>%
  mutate(plpwdcft = s_mer - s_slgcft, # Pulpwood, cubic foot.
         plp.ton = plpwdcft * 2.7/128, # Pulpwood, ton.
         mer.ton = s_mer * 2.7/128, # Merchantable timber, cubic foot.
         slg.ton = s_slgcft * 2.7/128, # Sawlog, ton.
         plp.cord = plpwdcft/128, # Pulpwood, Cord.
         mer.cord = s_mer/128, # Merchantable timber, Cord
         slg.cord = s_slgcft/128, # Sawlog, Cord
         ba.m2pha = s_ba * 0.23 # Basal area, meter sq/ha.
         ) %>% 
  group_by(trtmnt, year) %>%
  summarise_if(is.numeric, mean, na.rm = T)
dim(push.timber)
Simulation = c("0% (Base)",
               "+ 10%", "+ 20%", "+ 30%", "+ 40%", "+ 50%", 
               "- 10%", "- 20%", "- 30%", "- 40%", "- 50%")

##### Timber Price #####
timber.price = read.delim("TimberPrice.txt", 
                          skip = 16, 
                          header = T, 
                          sep = " ")
timber.price = set_names(timber.price, 
                         tolower(names(timber.price)))
names(timber.price)

##### Basal Area #####
# Compiled BA for all plots for year 1987:
# Basal Area for 1987:
push.ba.1987 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "1987") %>%
  summarise(ba.mean = round(mean(ba.m2pha), 2))

push.ba.1987.cont = (push.ba.1987$ba.mean[1:11])
push.ba.1987.ht = (push.ba.1987$ba.mean[12:22])
push.ba.1987.ht2 = (push.ba.1987$ba.mean[23:33])
push.ba.1987.ht3 = (push.ba.1987$ba.mean[34:44])
push.ba.1987.ht4 = (push.ba.1987$ba.mean[45:55])

push.all.ba.1987 = as.data.frame(cbind("1987",
                                       Simulation,
                                       push.ba.1987.cont, 
                                       push.ba.1987.ht, 
                                       push.ba.1987.ht2, 
                                       push.ba.1987.ht3, 
                                       push.ba.1987.ht4))
names(push.all.ba.1987) = c("Year","Simulation", 
                            "Control", "HT", "HT2", "HT3", "HT4")

# Basal Area for 2024:
push.ba.2024 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "2024") %>%
  summarise(ba.mean = round(mean(ba.m2pha),2))

push.ba.2024.cont = (push.ba.2024$ba.mean[1:11])
push.ba.2024.ht = (push.ba.2024$ba.mean[12:22])
push.ba.2024.ht2 = (push.ba.2024$ba.mean[23:33])
push.ba.2024.ht3 = (push.ba.2024$ba.mean[34:44])
push.ba.2024.ht4 = (push.ba.2024$ba.mean[45:55])

push.all.ba.2024 = as.data.frame(cbind("2024",
                                       Simulation,
                                       push.ba.2024.cont, 
                                       push.ba.2024.ht, 
                                       push.ba.2024.ht2, 
                                       push.ba.2024.ht3, 
                                       push.ba.2024.ht4))
names(push.all.ba.2024) = c("Year", "Simulation",
                            "Control", "HT", "HT2", "HT3", "HT4")

push.all.ba = as.data.frame(rbind(push.all.ba.1987, 
                                  push.all.ba.2024))
push.all.ba

##### Sawlog Timber #####
# Sawlog Timber for all plots for year 1987:
# Sawlog (ton) for 1987:
push.slg.1987 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "1987") %>%
  summarise(slg.mean = round(mean(slg.ton), 2))

push.slg.1987.cont = (push.slg.1987$slg.mean[1:11])
push.slg.1987.ht = (push.slg.1987$slg.mean[12:22])
push.slg.1987.ht2 = (push.slg.1987$slg.mean[23:33])
push.slg.1987.ht3 = (push.slg.1987$slg.mean[34:44])
push.slg.1987.ht4 = (push.slg.1987$slg.mean[45:55])

push.all.slg.1987 = as.data.frame(cbind("1987",
                                        Simulation,
                                        push.slg.1987.cont,
                                        push.slg.1987.ht, 
                                        push.slg.1987.ht2, 
                                        push.slg.1987.ht3, 
                                        push.slg.1987.ht4))
names(push.all.slg.1987) = c("Year", "Simulation",
                             "Control", "HT", "HT2", "HT3", "HT4")

# Sawlog Timber for 2024:
push.slg.2024 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "2024") %>%
  summarise(slg.mean = round(mean(slg.ton),2))

push.slg.2024.cont = (push.slg.2024$slg.mean[1:11])
push.slg.2024.ht = (push.slg.2024$slg.mean[12:22])
push.slg.2024.ht2 = (push.slg.2024$slg.mean[23:33])
push.slg.2024.ht3 = (push.slg.2024$slg.mean[34:44])
push.slg.2024.ht4 = (push.slg.2024$slg.mean[45:55])

push.all.slg.2024 = as.data.frame(cbind("2024",
                                        Simulation,
                                        push.slg.2024.cont, 
                                        push.slg.2024.ht, 
                                        push.slg.2024.ht2, 
                                        push.slg.2024.ht3, 
                                        push.slg.2024.ht4))
names(push.all.slg.2024) = c("Year", "Simulation",
                             "Control", "HT", "HT2", "HT3", "HT4")
push.all.slg = as.data.frame(rbind(push.all.slg.1987,
                                   push.all.slg.2024))
push.all.slg


##### PulpWood Timber #####
# Pulpwood Timber for all plots for year 1987:
# Pulpwood (ton) for 1987:
push.plp.1987 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "1987") %>%
  summarise(plp.mean = round(mean(plp.ton), 2))

push.plp.1987.cont = (push.plp.1987$plp.mean[1:11])
push.plp.1987.ht = (push.plp.1987$plp.mean[12:22])
push.plp.1987.ht2 = (push.plp.1987$plp.mean[23:33])
push.plp.1987.ht3 = (push.plp.1987$plp.mean[34:44])
push.plp.1987.ht4 = (push.plp.1987$plp.mean[45:55])

push.all.plp.1987 = as.data.frame(cbind("1987",
                                        Simulation,
                                        push.plp.1987.cont, 
                                        push.plp.1987.ht, 
                                        push.plp.1987.ht2, 
                                        push.plp.1987.ht3, 
                                        push.plp.1987.ht4))
names(push.all.plp.1987) = c("Year", "Simulation",
                             "Control", "HT", "HT2", "HT3", "HT4")

# Pulpwood Timber for 2024:
push.plp.2024 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "2024") %>%
  summarise(plp.mean = round(mean(plp.ton),2))

push.plp.2024.cont = (push.plp.2024$plp.mean[1:11])
push.plp.2024.ht = (push.plp.2024$plp.mean[12:22])
push.plp.2024.ht2 = (push.plp.2024$plp.mean[23:33])
push.plp.2024.ht3 = (push.plp.2024$plp.mean[34:44])
push.plp.2024.ht4 = (push.plp.2024$plp.mean[45:55])

push.all.plp.2024 = as.data.frame(cbind("2024",
                                        Simulation,
                                        push.plp.2024.cont, 
                                        push.plp.2024.ht, 
                                        push.plp.2024.ht2, 
                                        push.plp.2024.ht3, 
                                        push.plp.2024.ht4))
names(push.all.plp.2024) = c("Year", "Simulation",
                             "Control", "HT", "HT2", "HT3", "HT4")

push.all.plp = as.data.frame(rbind(push.all.plp.1987, 
                                   push.all.plp.2024))
push.all.plp


##### Merchantable Timber #####
# Merchantable Timber for all plots for year 1987:
# Merchantable Timber (ton) for 1987:
push.mer.1987 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "1987") %>%
  summarise(mer.mean = round(mean(mer.ton), 2))

push.mer.1987.cont = (push.mer.1987$mer.mean[1:11])
push.mer.1987.ht = (push.mer.1987$mer.mean[12:22])
push.mer.1987.ht2 = (push.mer.1987$mer.mean[23:33])
push.mer.1987.ht3 = (push.mer.1987$mer.mean[34:44])
push.mer.1987.ht4 = (push.mer.1987$mer.mean[45:55])

push.all.mer.1987 = as.data.frame(cbind("1987",
                                        Simulation,
                                        push.mer.1987.cont, 
                                        push.mer.1987.ht, 
                                        push.mer.1987.ht2, 
                                        push.mer.1987.ht3, 
                                        push.mer.1987.ht4))
names(push.all.mer.1987) = c("Year", "Simulation",
                             "Control", "HT", "HT2", "HT3", "HT4")

# Merchantable Timber for 2024:
push.mer.2024 = push.timber %>%
  group_by(trtmnt, year)  %>%
  filter(year == "2024") %>%
  summarise(mer.mean = round(mean(mer.ton),2))

push.mer.2024.cont = (push.mer.2024$mer.mean[1:11])
push.mer.2024.ht = (push.mer.2024$mer.mean[12:22])
push.mer.2024.ht2 = (push.mer.2024$mer.mean[23:33])
push.mer.2024.ht3 = (push.mer.2024$mer.mean[34:44])
push.mer.2024.ht4 = (push.mer.2024$mer.mean[45:55])

push.all.mer.2024 = as.data.frame(cbind("2024",
                                        Simulation,
                                        push.mer.2024.cont, 
                                        push.mer.2024.ht, 
                                        push.mer.2024.ht2, 
                                        push.mer.2024.ht3, 
                                        push.mer.2024.ht4))
names(push.all.mer.2024) = c("Year", "Simulation",
                             "Control", "HT", "HT2", "HT3", "HT4")

push.all.mer = as.data.frame(rbind(push.all.mer.1987, 
                                   push.all.mer.2024))
push.all.mer

# one table for all (BA, MER, SLG, PLP)
push.timber.summary = cbind(push.all.ba, push.all.mer, 
                            push.all.slg, push.all.plp)[c(1, 12:22), 
                                                        c(-8, -9, -15, -16, -22, -23)]

# one table for all (BA, MER, SLG, PLP)
Types = rep(c("BA", "Merch", "SLG", "PLP"), each = 22)
write_csv(push.timber.summary, file = "Push Timber Summary.csv")

push.timber.summary1 = cbind(Types, rbind(push.all.ba, push.all.mer, 
                                          push.all.slg, push.all.plp))

push.timber.summary1 = push.timber.summary1[c(1, 12:23, 34:45, 56:67,78:88),]