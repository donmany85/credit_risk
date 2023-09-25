library(tvm)

period = c()
for (i in 1:36) {
  period[i] = paste("m", i, sep = "")
}


period
# period = c()
interest=seq(0.01, 0.05,0.01)
loan_id <- c("a","b","c","d","e")
loan_type <- c("bullet", "french", "french", 'bullet', 'french')
loan_term=c(12, 36, 24,18, 36)
cash_flow <- data.frame()

for (i in 1:length(interest)) {
  for (j in 1:36) {  # 예상되는 현금 흐름 기간에 따라 수정
    a <- loan(rate = interest[i] / 12, maturity = loan_term[i], amt = 10000000, type = loan_type[i])
    cash_flow[j, i] <- cashflow(a)[j]}}
cash_flow

cash_flow=t(cash_flow)
cash_flow
# cash_flow=cbind(cashflow, as.data.frame(loan_type))

loan_id=data.frame(loan_id)
loan_id
loan_type=data.frame(loan_type)
loan_type
interest=data.frame(interest)
interest
loan_term=data.frame(loan_term)

portfolio_cf=cbind(loan_id,loan_type,interest, loan_term)
portfolio_cf=cbind(portfolio_cf, cash_flow)
row.names(portfolio_cf)=1:5
portfolio_cf
