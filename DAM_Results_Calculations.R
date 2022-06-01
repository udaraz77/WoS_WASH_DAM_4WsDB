##---- Damascus Results Calculation 
##---- Umar Daraz - Mohamad Yehya - Baha Qanier
##---- 29/5/2022

library(activityinfo)
library(dplyr)

activityInfoLogin("udaraz@unicef.org", "akhter123")


df_DAMData_All <- activityinfo::queryTable("cfchybhl3tytgjd3",columns = c(id = "_id"
                                                                          ,sn="SN"
                                                                          ,UNFunds = "UNFunds"
                                                                          ,OrgName = "OrgName"
                                                                          ,ReprtOrg = "ReprtOrg"
                                                                          ,OrgCode = "OrgCode"
                                                                          ,IPName = "IPName"
                                                                          ,FIPType = "FIPType"
                                                                          ,IPCode = "IPCode"
                                                                          ,SectMultiSec = "SectMultiSec"
                                                                          ,Activty = "Activty"
                                                                          ,ActivityStatus = "ActivityStatus"
                                                                          ,HRPYN = "HRPYN"
                                                                          ,HRPProjectCode = "HRPProjectCode"
                                                                          ,Location = "Location"
                                                                          ,Site = "Site"
                                                                          ,AreaOfOrigin = "AreaOfOrigin"
                                                                          ,CoverageLevel = "CoverageLevel"
                                                                          ,Address = "Address"
                                                                          ,startDate = "startDate"
                                                                          ,EndDate = "EndDate"
                                                                          ,ReportingMonth = "ReportingMonth"
                                                                          ,DeliveryModality = "DeliveryModality"
                                                                          ,BeneficiariesType = "BeneficiariesType"
                                                                          ,BenefReachedBefore = "BenefReachedBefore"
                                                                          ,WithDisability = "WithDisability"
                                                                          ,ChildMale = "ChildMale"
                                                                          ,ChildFemale = "ChildFemale"
                                                                          ,AdultMale = "AdultMale"
                                                                          ,AdultFemale = "AdultFemale"
                                                                          ,ChildUG = "ChildUG"
                                                                          ,AdultUG = "AdultUG"
                                                                          ,UAgeUGender = "UAgeUGender"
                                                                          ,TotalBenefReached = "TotalBenefReached"
                                                                          ,TotalHHReached = "TotalHHReached"
                                                                          ,Item = "Item"
                                                                          ,QTY = "QTY"
                                                                          ,ResponseModality = "ResponseModality"
                                                                          ,CashConditionality = "CashConditionality"
                                                                          ,CashRestriction = "CashRestriction"
                                                                          ,CashTransfer = "CashTransfer"
                                                                          ,CashDelivery = "CashDelivery"
                                                                          ,Frequency = "Frequency"
                                                                          ,Comment = "Comment"
                                                                          ,WASHPiN = "WASHPiN"
                                                                          ,AcuteWAHPiN = "AcuteWAHPiN"
                                                                          ,SeverityScale = "SeverityScale"
                                                                          ,Admin1Code = "Admin1Code"
                                                                          ,Admin2Code = "Admin2Code"
                                                                          ,Admin3Code = "Admin3Code"
                                                                          ,Admin4Code = "Admin4Code"
                                                                          ,LocationCode = "LocationCode"
                                                                          ,admin3Code_Origion = "admin3Code_Origion"
                                                                          ,admin4Code_Origion = "admin4Code_Origion"
                                                                          ,Location_Origion = "Location_Origion"
                                                                          ,Governorates = "Governorates"
                                                                          ,Districts = "Districts"
                                                                          ,Sub_Districts = "Sub_Districts"
                                                                          ,Communities = "Communities"
                                                                          ,SO = "SO"
                                                                          ,HRPActivityCode = "HRPActivityCode"
                                                                          ,HRPActivity = "HRPActivity"
                                                                          ,HRPIndicatorcode = "HRPIndicatorcode"
                                                                          ,RelatedHRPIndicator = "RelatedHRPIndicator"
                                                                          ,SO4 = "SO4"
                                                                          ,Unit = "Unit"
                                                                          ,Value = "Value"
                                                                          ,month4w="month4w"
                                                                          ,truncate.strings = TRUE))


df_DAMData_All[is.na(df_DAMData_All$TotalBenefReached)]<-0

#***************************DAM WASH-IND (SO1)************************************----

DAM4WS_Data_Pivot11 <- df_DAMData_All %>%
  filter(SO==1,ActivityStatus == "Completed") %>% 
  group_by(ReportingMonth,
           month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
           Activty) %>% 
  summarise_at(c("TotalBenefReached"), sum)

#*************************************capping *******
#*
#*
#*
#****************************************************
DAM4WS_Data_Pivot12 <- DAM4WS_Data_Pivot11 %>%
  # filter(SO==1) %>% 
  group_by(ReportingMonth,
           month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
           ) %>% 
  summarise_at(c("TotalBenefReached"), max)

DAM4WS_Data_Pivot12[,"sector"]<- "WASH_ind"
#***************************DAM WASH-Dir (SO2)************************************

DAM4WS_Data_Pivot21 <- df_DAMData_All %>%
  filter(SO==2,ActivityStatus == "Completed" ) %>% 
  group_by(ReportingMonth,
           month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
           Activty) %>% 
  summarise_at(c("TotalBenefReached"), sum)

DAM4WS_Data_Pivot22 <- DAM4WS_Data_Pivot21 %>%
  # filter(SO==1) %>% 
  group_by(ReportingMonth,
           month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
           ) %>% 
  summarise_at(c("TotalBenefReached"), max)

DAM4WS_Data_Pivot22[,"sector"]<- "WASH_dir"

WASH_DAM1 <- rbind(DAM4WS_Data_Pivot12,DAM4WS_Data_Pivot22)
WASH_DAM <- rbind(DAM4WS_Data_Pivot12,DAM4WS_Data_Pivot22)

#****************************monthly reach for OCHA************************************
WASH_DAM[,"month4w"]<- ifelse(WASH_DAM$month4w>9,WASH_DAM$month4w,paste(0,WASH_DAM$month4w,sep = ""))


WASH_DAM[,"year4w"]<-"2022"
WASH_DAM[,"month4w"]<- WASH_DAM[,"month4w"]
WASH_DAM[,"year_month"]<- paste(WASH_DAM$year4w,WASH_DAM$month4w,sep = "")
WASH_DAM[,"hub_4w"]<-"SYR"
WASH_DAM[,"modality_type"]<-"Syria HCT"
WASH_DAM[,"main_sector"] <- "WASH"
WASH_DAM[,"gov_pcode"]<- WASH_DAM[,"Admin1Code"]
WASH_DAM[,"district_pcode"]<- WASH_DAM[,"Admin2Code"]
WASH_DAM[,"subdistrict_pcode"]<- WASH_DAM[,"Admin3Code"]
WASH_DAM[,"community_pcode"]<- WASH_DAM[,"Admin4Code"]
WASH_DAM[,"beneficiaries"]<- WASH_DAM[,"TotalBenefReached"]


WASH_DAM[,c("neighborhood_pcode","access_status","org_type","implementing_type","delivery_modality","cash_conditionality","cash_delivery_mechanism","monthly_frequency","benef_type",
            "direct_indirect","hrp_nonhrp","male_benef","female_benef","u18_male_benef","u18_female_benef","children_u5","masterid","notes","record_id","gov_pcode","district_pcode")]<-""


WASH_DAM <- WASH_DAM[,c("record_id","gov_pcode","district_pcode","subdistrict_pcode","community_pcode","neighborhood_pcode","access_status","month4w","year4w","year_month","sector","main_sector",
                        "org_type","implementing_type","modality_type","delivery_modality","cash_conditionality","cash_delivery_mechanism","monthly_frequency","hub_4w","benef_type",
                        "direct_indirect","hrp_nonhrp","beneficiaries","male_benef","female_benef","u18_male_benef","u18_female_benef","children_u5","masterid","notes")]


write.csv(WASH_DAM,"DAMmonthly_results22.csv")
#****************************DAM Each monthly table************************************
DAM_monthly<- WASH_DAM1 %>% 
  group_by(ReportingMonth,sector) %>% 
  summarise_at(c("TotalBenefReached"),sum)
write.csv(DAM_monthly,"DAMmonthly_results.csv")

#***************************cumulative calculations ************************************----
#***************************DAM WASH-IND (SO1)************************************

DAM4WS_Data_Pivot11 <- df_DAMData_All %>%
  filter(SO==1, ActivityStatus == "Completed", BenefReachedBefore =="No\\(New beneficiaries)") %>% 
  group_by(Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
           #ReportingMonth,
           #month4w,
           Activty) %>% 
  summarise_at(c("TotalBenefReached"), sum)

#*************************************capping *******
#*
#*
#*
#****************************************************
DAM4WS_Data_Pivot12 <- DAM4WS_Data_Pivot11 %>%
  # filter(SO==1) %>% 
  group_by(#ReportingMonth,
           #month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
  ) %>% 
  summarise_at(c("TotalBenefReached"), max)

DAM4WS_Data_Pivot12[,"sector"]<- "WASH_ind"


DAM4WS_Data_Pivot13 <- DAM4WS_Data_Pivot12 %>%
  # filter(SO==1) %>% 
  group_by() %>% 
  summarise_at(c("TotalBenefReached"), sum)


#***************************DAM WASH-Dir (SO2)************************************

DAM4WS_Data_Pivot21 <- df_DAMData_All %>%
  filter(SO==2,ActivityStatus == "Completed", BenefReachedBefore =="No\\(New beneficiaries)" ) %>% 
  group_by(#ReportingMonth,
           #month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
           Activty) %>% 
  summarise_at(c("TotalBenefReached"), sum)

DAM4WS_Data_Pivot22 <- DAM4WS_Data_Pivot21 %>%
  # filter(SO==1) %>% 
  group_by(#ReportingMonth,
           #month4w,
           Admin1Code,
           Admin2Code,
           Admin3Code,
           Admin4Code,
           LocationCode,
  ) %>% 
  summarise_at(c("TotalBenefReached"), max)

DAM4WS_Data_Pivot22[,"sector"]<- "WASH_dir"

WASH_DAM1 <- rbind(DAM4WS_Data_Pivot12,DAM4WS_Data_Pivot22)
WASH_DAM <- rbind(DAM4WS_Data_Pivot12,DAM4WS_Data_Pivot22)
