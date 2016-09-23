#political affiliation of candidates

LC1_affl <- c("B","D","B","D","B","B","D","D","B","B","D","D","D","D","B")
LC2_affl <- c("D","D","D","B","D","D","D","D","B","B","B","D","D","B","B")
LC3_affl <- c("B","D","B","D","B","B","B","D","D","D","D","D")
LC4_affl <- c("D","D","B","B","D","B","B","B","B","D","D","D","D","B","D","B","B","B","B","D")
LC5_affl <- c("B","D","B","D","D","D","D","B","D","B","B","B","B","D","B","D","B","D","D","B","B","B")

factor_LC1_affl <- factor(LC1_affl)
factor_LC2_affl <- factor(LC2_affl)
factor_LC3_affl <- factor(LC3_affl)
factor_LC4_affl <- factor(LC4_affl)
factor_LC5_affl <- factor(LC5_affl)

levels(factor_LC1_affl) <- c("Pro-Beijing","Pro-Democracy")
levels(factor_LC2_affl) <- c("Pro-Beijing","Pro-Democracy")
levels(factor_LC3_affl) <- c("Pro-Beijing","Pro-Democracy")
levels(factor_LC4_affl) <- c("Pro-Beijing","Pro-Democracy")
levels(factor_LC5_affl) <- c("Pro-Beijing","Pro-Democracy")
