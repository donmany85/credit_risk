#npv와 IRR


cfs1=c(-500,100,200,300,250)
times1=0:4
NPV1=presentValue(cashFlows=cfs1, t=times1, i=0.05)
NPV1

cfs2=c(-700,1000)
times2=c(0,2)
NPV2=presentValue(cashFlows=cfs2, t=times2, i=0.05)
NPV2

f <- function(irr){
  presentValue(cashFlows=CF,
               timeIds=TI,
               interestRates=irr)^2}
CF=cfs1
TI=times1
irr1=nlm(f,0.01)$estimate
irr1


#french loan

R <- 10000/annuity(i=0.07,n=5,k=12)/12
instalments <- rep(R,5*12)
balance <- numeric(60)
balance[1] <- 10000*(1+0.07)^(1/12)-R
for(i in 2:60) balance[i] <- balance[i-1]*(1+0.07)^(1/12)-R
amortization <- data.frame(month=1:60, rate=round(R,1),
                           balance <- round(balance,1))