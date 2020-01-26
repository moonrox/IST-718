# TODO: Format all dollar amounts as a numeric and remove the $. Print the $on output but not stored in vector
# TODO: if the dollar amount is blank use the average of the column as the value.
# TODO: Create a new vector for each school using last year's record.
# TODO: FIgure out how to handle blank records.

library(formattable)

setwd("/Users/jmonroe1/Documents/syracuse/718/lab1")
wd = getwd()

# put the data from the csv into a data frame

my_coaches8_data = read.csv("/Users/jmonroe1/Documents/syracuse/718/lab1/coaches8.csv")
stadium_data = read.csv("/Users/jmonroe1/Documents/syracuse/718/lab1/import_college_lookup.csv")
#all_college_data = read.csv("/users/jmonroe1/documents/syracuse/718/lab1/Most-Recent-Cohorts-All-Data-Elements.csv")
#names(all_college_data) <- c("ID")
all_college_treasury_data = read.csv("/users/jmonroe1/documents/syracuse/718/lab1/Most-Recent-Cohorts-Treasury-Elements.csv")
names(all_college_treasury_data) <- c("ID","OPEID","OPEID6","Institution","COUNT_ED","AGEGE24","PCT_WHITE","PCT_BLACK","PCT_ASIAN","PCT_HISPANIC","PCT_BA","PCT_GRAD_PROF","PCT_BORN_US","MEDIAN_HH_INC","POVERTY_RATE","UNEMP_RATE","LN_MEDIAN_HH_INC","COUNT_NWNE_P10","COUNT_WNE_P10","MN_EARN_WNE_P10","MD_EARN_WNE_P10","PCT10_EARN_WNE_P10","PCT25_EARN_WNE_P10","PCT75_EARN_WNE_P10","PCT90_EARN_WNE_P10","SD_EARN_WNE_P10","COUNT_WNE_INC1_P10","COUNT_WNE_INC2_P10","COUNT_WNE_INC3_P10","COUNT_WNE_INDEP0_INC1_P10","COUNT_WNE_INDEP0_P10","COUNT_WNE_INDEP1_P10","COUNT_WNE_MALE0_P10","COUNT_WNE_MALE1_P10","GT_25K_P10","MN_EARN_WNE_INC1_P10","MN_EARN_WNE_INC2_P10","MN_EARN_WNE_INC3_P10","MN_EARN_WNE_INDEP0_INC1_P10","MN_EARN_WNE_INDEP0_P10","MN_EARN_WNE_INDEP1_P10","MN_EARN_WNE_MALE0_P10","MN_EARN_WNE_MALE1_P10","COUNT_NWNE_P6","COUNT_WNE_P6","MN_EARN_WNE_P6","MD_EARN_WNE_P6","PCT10_EARN_WNE_P6","PCT25_EARN_WNE_P6","PCT75_EARN_WNE_P6","PCT90_EARN_WNE_P6","SD_EARN_WNE_P6","COUNT_WNE_INC1_P6","COUNT_WNE_INC2_P6","COUNT_WNE_INC3_P6","COUNT_WNE_INDEP0_INC1_P6","COUNT_WNE_INDEP0_P6","COUNT_WNE_INDEP1_P6","COUNT_WNE_MALE0_P6","COUNT_WNE_MALE1_P6","GT_25K_P6","MN_EARN_WNE_INC1_P6","MN_EARN_WNE_INC2_P6","MN_EARN_WNE_INC3_P6","MN_EARN_WNE_INDEP0_INC1_P6","MN_EARN_WNE_INDEP0_P6","MN_EARN_WNE_INDEP1_P6","MN_EARN_WNE_MALE0_P6","MN_EARN_WNE_MALE1_P6","COUNT_NWNE_P7","COUNT_WNE_P7","MN_EARN_WNE_P7","SD_EARN_WNE_P7","GT_25K_P7","COUNT_NWNE_P8","COUNT_WNE_P8","MN_EARN_WNE_P8","MD_EARN_WNE_P8","PCT10_EARN_WNE_P8","PCT25_EARN_WNE_P8","PCT75_EARN_WNE_P8","PCT90_EARN_WNE_P8","SD_EARN_WNE_P8","GT_25K_P8","COUNT_NWNE_P9","COUNT_WNE_P9","MN_EARN_WNE_P9","SD_EARN_WNE_P9","GT_25K_P9","GT_28K_P10","GT_28K_P8","GT_28K_P6"
)
#my_coaches8_data
str(my_coaches8_data)

names(my_coaches8_data) <- c("School","Conference","Coach","SchoolPay","TotalPay","Bonus","BonusPaid","AssistantPay","Buyout","ID")
#str(my_coaches8_data)

#Remove the $ from all the rows.
my_coaches8_data$SchoolPay <- gsub("\\$","",my_coaches8_data$SchoolPay)
my_coaches8_data$Bonus <- gsub("\\$","",my_coaches8_data$Bonus)
my_coaches8_data$BonusPaid <- gsub("\\$","",my_coaches8_data$BonusPaid)
my_coaches8_data$TotalPay <- gsub("\\$","",my_coaches8_data$TotalPay)
my_coaches8_data$Buyout <- gsub("\\$","",my_coaches8_data$Buyout)
my_coaches8_data$AssistantPay <- gsub("\\$","",my_coaches8_data$AssistantPay)

#Remove the , from all the columns with financial data.
my_coaches8_data$SchoolPay <- gsub(",","",my_coaches8_data$SchoolPay)
my_coaches8_data$Bonus <- gsub(",","",my_coaches8_data$Bonus)
my_coaches8_data$BonusPaid <- gsub(",","",my_coaches8_data$BonusPaid)
my_coaches8_data$TotalPay <- gsub(",","",my_coaches8_data$TotalPay)
my_coaches8_data$Buyout <- gsub(",","",my_coaches8_data$Buyout)
my_coaches8_data$AssistantPay <- gsub(",","",my_coaches8_data$AssistantPay)

#Remove the -- and replace with 0 for all colums with numeric values
my_coaches8_data$SchoolPay <- gsub("--","0",my_coaches8_data$SchoolPay)
my_coaches8_data$Bonus <- gsub("--","0",my_coaches8_data$Bonus)
my_coaches8_data$BonusPaid <- gsub("--","0",my_coaches8_data$BonusPaid)
my_coaches8_data$TotalPay <- gsub("--","0",my_coaches8_data$TotalPay)
my_coaches8_data$Buyout <- gsub("--","0",my_coaches8_data$Buyout)

#Cast all the rows with numerics as numeric
my_coaches8_data$SchoolPay <- as.integer(my_coaches8_data$SchoolPay)
my_coaches8_data$Bonus <- as.integer(my_coaches8_data$Bonus)
my_coaches8_data$BonusPaid <- as.integer(my_coaches8_data$BonusPaid)
my_coaches8_data$TotalPay <- as.integer(my_coaches8_data$TotalPay)
my_coaches8_data$Buyout <- as.integer(my_coaches8_data$Buyout)

#Change the format back to currency in order to ensure the data is viewed correctly
#my_coaches8_data$SchoolPay <- currency(my_coaches8_data$SchoolPay, digits = 0L)
#my_coaches8_data$Bonus <- currency(my_coaches8_data$Bonus, digits = 0L)
#my_coaches8_data$BonusPaid <- currency(my_coaches8_data$BonusPaid, digits = 0L)
#my_coaches8_data$TotalPay <- currency(my_coaches8_data$TotalPay, digits = 0L)
#my_coaches8_data$Buyout <- currency(my_coaches8_data$Buyout, digits = 0L)
#my_coaches8_data$AssistantPay <- currency(my_coaches8_data$AssistantPay, digits = 0L)

#Create a new column of data that is the subtraction of Bonus Paid from Total pay
my_coaches8_data$PayMinusBonusPaid <- c(my_coaches8_data$TotalPay - my_coaches8_data$BonusPaid)

#head(my_coaches8_data)

#View(my_coaches8_data)

#mean(my_coaches8_data$SchoolPay)
#View(stadium_data)

all_data <- merge(my_coaches8_data, stadium_data, "ID")
#View(all_data)
#View(all_college_data)

combined_data <- merge(all_data, all_college_treasury_data, "ID", all = FALSE)
View(combined_data)

dfObj <- as.data.frame(combined_data)
View(dfObj)

#write.xlsx(combined_data, file = '/Users/jmonroe1/Documents/syracuse/718/lab1/outfile.xlsx', sheetName = 'ALLDATA', col.names = TRUE, row.names = TRUE, append = FALSE)
write.csv2(combined_data,file = '/Users/jmonroe1/Documents/syracuse/718/lab1/outfile.csv')
#write.xlsx(all_data,file = '/Users/jmonroe1/Documents/syracuse/718/lab1/all_data.xlsx')
write.csv(my_coaches8_data,file = '/Users/jmonroe1/Documents/syracuse/718/lab1/my_coaches8_data.csv')

