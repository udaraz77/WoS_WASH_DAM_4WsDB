##---- Damascus Results Calculation 
##---- Umar Daraz - Mohamad Yehya - Baha Qanier
##---- 29/5/2022

library(activityinfo)
library(dplyr)

activityInfoLogin("udaraz@unicef.org", "akhter123")

df_DAMData_All <- activityinfo::queryTable("cfchybhl3tytgjd3",columns = c(id = "_id"
                                                                          ,SN = "SN"
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
                                                                          ,Value = "Value")
                                                                          ,truncate.strings = TRUE)

#***************************** SO1 **********************

      
      DAM4WS_Data_Pivot11 <- df_DAMData_All %>%
        filter(SO==1,ActivityStatus == "Completed" ) %>% 
        group_by(ReportingMonth,
                 Admin3Code,
                 LocationCode,
                 Activty) %>% 
        summarise_at(c("TotalBenefReached"), sum)
        
        
      DAM4WS_Data_Pivot12 <- DAM4WS_Data_Pivot11 %>%
       # filter(SO==1) %>% 
        group_by(ReportingMonth,
                 Admin3Code,
                 LocationCode) %>% 
        summarise_at(c("TotalBenefReached"), max)
        
      DAM4WS_Data_Pivot13 <- DAM4WS_Data_Pivot12 %>%
        # filter(SO==1) %>% 
        group_by(ReportingMonth) %>% 
        summarise_at(c("TotalBenefReached"), sum)
  
  
  
  
  

