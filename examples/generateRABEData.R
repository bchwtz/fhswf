
load(paste0(getwd(),"/data/RABE5.RData"))

f <- ls()[grepl("^P",ls())]

for(file in f){
  save(file, file=paste0(getwd(),"/data/",file,".Rdata"))
}

