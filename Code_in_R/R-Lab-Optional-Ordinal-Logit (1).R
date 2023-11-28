##Optional Lab (due Dec. 7th)

d=read.csv(file.choose())  ## choose 2006 GSS ###

## install.packages("ordinal")
library(ordinal)

## 1. Run a multiple ordinal logistic regression. Tell me what you expect to find and then interpret your results to tell me what you did in fact find.

d$nsatfin = 4-d$satfin

fm1 <- clm(as.factor(nsatfin) ~ educ + sex, data=d)
summary(fm1)

## 2. Test the proportional odds assumption of the ordinal logistic regression. Tell me what the test found ?? Is the assumption satisfied or not?

fm2 <- clm(as.factor(nsatfin) ~ sex, nominal=~educ, data=d)
summary(fm2)

anova(fm1,fm2) ## this is a Brandt test comparing if educ has parallel slopes ##

