# sum up Pro-Beijing and Pro-Democracy votes in each district
# (expressed as percentage)

LC1_subtotal <- colSums(LC1)
LC2_subtotal <- colSums(LC2)
LC3_subtotal <- colSums(LC3)
LC4_subtotal <- colSums(LC4)
LC5_subtotal <- colSums(LC5)

LC1_total <- sum(LC1_subtotal)
LC2_total <- sum(LC2_subtotal)
LC3_total <- sum(LC3_subtotal)
LC4_total <- sum(LC4_subtotal)
LC5_total <- sum(LC5_subtotal)

total <- cbind("LC1"=LC1_total,"LC2"=LC2_total,"LC3"=LC3_total,"LC4"=LC4_total,"LC5"=LC5_total)

# boolean vector for pan-democratic affiliation
LC1_PD <- LC1_affl == "D"
LC2_PD <- LC2_affl == "D"
LC3_PD <- LC3_affl == "D"
LC4_PD <- LC4_affl == "D"
LC5_PD <- LC5_affl == "D"

LC1_PDtotal <- sum(LC1_subtotal*LC1_PD)
LC2_PDtotal <- sum(LC2_subtotal*LC2_PD)
LC3_PDtotal <- sum(LC3_subtotal*LC3_PD)
LC4_PDtotal <- sum(LC4_subtotal*LC4_PD)
LC5_PDtotal <- sum(LC5_subtotal*LC5_PD)


PDsubtotal <- cbind("LC1"=LC1_PDtotal,"LC2"=LC2_PDtotal,"LC3"=LC3_PDtotal,"LC4"=LC4_PDtotal,"LC5"=LC5_PDtotal)
PBsubtotal <- total-PDsubtotal

#percentage by districts
print("Percentage of votes by districts")
percentage <- rbind("Pro-Democracy"=PDsubtotal/total*100,"Pro-Beijing"=PBsubtotal/total*100)
print(percentage)

#difference in percentage
print("Difference in percentages")
print(percentage[1,]-percentage[2,])

#total percentage for all 5 districts
print("Total Pro-Democracy %")
print(sum(PDsubtotal)/sum(total)*100)
print("Total Pro-Beijing %")
print(sum(PBsubtotal)/sum(total)*100)