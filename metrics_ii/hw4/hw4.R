#Dependencies ---------------------------

rm(list=ls())
library(stargazer)
library(plm)
library(foreign)
library(lmtest)

#Read data and set up necessary tables for regression  ---------------------------

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

df<-read.dta('murder_oldstata.dta')

#Part a ---------------------------

fit_a <- lm(mrdrte ~ exec + unem ,df)

#write to latex
output <- capture.output(stargazer(fit_a, title='Murder Rate', align=TRUE, type = "latex", out='writeup/part_a.tex' ,no.space=TRUE))

#Part b ---------------------------

fit_b <-  plm(mrdrte ~ exec + unem , data=df, index=c("id", "year"), model="within")

output <- capture.output(stargazer(fit_b, title='Murder Rate', align=TRUE, type = "latex", out='writeup/part_b0.tex' ,no.space=TRUE))

# display with cluster VCE and df-adjustment
cluster_vcov <- vcovHC(fit_b, type = "HC1", cluster="group")
fit_b2 <- coeftest(fit_b, vcov = cluster_vcov)
output <- capture.output(stargazer(fit_b2, title='Murder Rate', align=TRUE, type = "latex", out='writeup/part_b.tex' ,no.space=TRUE))

print(fit_b2)

#Part c ---------------------------
fit_c <- lm(mrdrte ~ exec + unem + factor(id) ,df)
#write to latex
output <- capture.output(stargazer(fit_c, title='Murder Rate', align=TRUE, type = "latex", out='writeup/part_c.tex' ,no.space=TRUE))
