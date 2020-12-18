#Integrated SARS-COV-2 interactome&Proteome&CRISPR database 
#Written by Yuanjie Wei
# setwd('U:/projects/Yuanjie/integration/shiny')

###Load required packages
if(!require(shiny)) install.packages("shiny")
if(!require(shinythemes)) install.packages("shinythemes")
if(!require(data.table)) install.packages("data.table")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(venn)) install.packages("venn")
if(!require(dplyr)) install.packages("dplyr")
if(!require(rsconnect)) install.packages("rsconnect")

###import data
setwd('C:/YJ/shiny')
system.time(load('data/mergeRMCRI.SCOV2.Rdata'))
# load('https://github.com/IrisWEI-1996/MMlab_SCoV2_datasets/blob/main/mergeRMCRI.SCOV2.Rdata')
system.time(load('data/new_RAPMS1plot.Rdata'))
system.time(load('data/new_RAPMS2plot.Rdata'))

system.time(load('data/promerge.Rdata'))
system.time(load('data/new_pro1plot.Rdata'))
system.time(load('data/new_pro2plot.Rdata'))
system.time(load('data/new_pro3plot.Rdata'))
# 
mergeall <- data.table(mergeRMCRI.SCOV2)

###SHINY
source("R/ui.R")
source("R/server.R")

shinyApp(ui=ui,server=server)

