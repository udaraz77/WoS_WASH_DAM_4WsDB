##---- NES Results Calculation 
##---- Umar Daraz - Mohamad Yehya - Baha Qanier
##---- 29/5/2022

library(activityinfo)
library(dplyr)

activityInfoLogin("udaraz@unicef.org", "akhter123")

df_DAMData_All <- activityinfo::queryTable("c8qdlxil3sth2zm3",columns = c(id = "_id"
                                                                          ,SN = "SN"
                                                                          ,NGO_Code = "NGO_Code"
                                                                          ,NGO_Type = "NGO_Type"
                                                                          ,IP_Code = "IP_Code"
                                                                          ,IP_Type = "IP_Type"
                                                                          ,Gov = "Gov"
                                                                          ,Community = "Community"
                                                                          ,District = "District"
                                                                          ,Sub_District = "Sub_District"
                                                                          ,Camp = "Camp"
                                                                          ,No_benif_at_location = "No_benif_at_location"
                                                                          ,collective_shelter = "collective_shelter"
                                                                          ,Schools_Name = "Schools_Name"
                                                                          ,Health_Facility_Name = "Health_Facility_Name"
                                                                          ,Reporting_Month = "Reporting_Month"
                                                                          ,Project_Start_Date = "Project_Start_Date"
                                                                          ,Project_End_Date = "Project_End_Date"
                                                                          ,Status = "Status"
                                                                          ,Name_of_Water_System = "Name_of_Water_System"
                                                                          ,Power_Source = "Power_Source"
                                                                          ,Rehab_Repair_WStat = "Rehab_Repair_WStat"
                                                                          ,O_and_M = "O_and_M"
                                                                          ,Construct_Wt_Station = "Construct_Wt_Station"
                                                                          ,Network_Rehab = "Network_Rehab"
                                                                          ,Constuct_Water_Netw = "Constuct_Water_Netw"
                                                                          ,Elevated_Ground_Tank = "Elevated_Ground_Tank"
                                                                          ,Chlorination = "Chlorination"
                                                                          ,WQ_Testing = "WQ_Testing"
                                                                          ,Water_Produc_Volume = "Water_Produc_Volume"
                                                                          ,Fule_Consumption = "Fule_Consumption"
                                                                          ,Solar_Panel = "Solar_Panel"
                                                                          ,Electrical_grid = "Electrical_grid"
                                                                          ,Electrical_bills = "Electrical_bills"
                                                                          ,Cost_Recovery = "Cost_Recovery"
                                                                          ,Water_Safety_Plans = "Water_Safety_Plans"
                                                                          ,Water_Trucking = "Water_Trucking"
                                                                          ,Cash_Water_Trucking = "Cash_Water_Trucking"
                                                                          ,Water_Truck_Volume = "Water_Truck_Volume"
                                                                          ,Pvt_Boreholes = "Pvt_Boreholes"
                                                                          ,Cash_PrivateBorehole = "Cash_PrivateBorehole"
                                                                          ,Pvt_Bore_Total_Vol = "Pvt_Bore_Total_Vol"
                                                                          ,WT_Borehol_Chlorined = "WT_Borehol_Chlorined"
                                                                          ,WT_Borehol_WQTesting = "WT_Borehol_WQTesting"
                                                                          ,M3_per_Wt_Container = "M3_per_Wt_Container"
                                                                          ,No_of_Wt_Containers = "No_of_Wt_Containers"
                                                                          ,Tanks_PWD_Ben = "Tanks_PWD_Ben"
                                                                          ,tanks_PWD = "tanks_PWD"
                                                                          ,HH_Water_Treatment = "HH_Water_Treatment"
                                                                          ,HH_WT_Treat_Cash = "HH_WT_Treat_Cash"
                                                                          ,HH_Water_Treat_Type = "HH_Water_Treat_Type"
                                                                          ,Sew_Rehab_Repair = "Sew_Rehab_Repair"
                                                                          ,Sew_Support = "Sew_Support"
                                                                          ,Sew_Construction = "Sew_Construction"
                                                                          ,waste_Wt_treat_plant = "waste_Wt_treat_plant"
                                                                          ,Benif_Toilets = "Benif_Toilets"
                                                                          ,PwD_Benif_Toilet = "PwD_Benif_Toilet"
                                                                          ,Benif_Cash_Toilets = "Benif_Cash_Toilets"
                                                                          ,Number_Toilets = "Number_Toilets"
                                                                          ,Maintenance_Cleaning = "Maintenance_Cleaning"
                                                                          ,Construct_new_Toilet = "Construct_new_Toilet"
                                                                          ,Bath_New = "Bath_New"
                                                                          ,Cash_Bath = "Cash_Bath"
                                                                          ,Bath_Units = "Bath_Units"
                                                                          ,Des_Beneficiaries = "Des_Beneficiaries"
                                                                          ,CubicMeterPerMonth = "CubicMeterPerMonth"
                                                                          ,SWM_Support_Benf = "SWM_Support_Benf"
                                                                          ,SWM_Support_Units = "SWM_Support_Units"
                                                                          ,Garbage_Bins = "Garbage_Bins"
                                                                          ,PWD_Consulted = "PWD_Consulted"
                                                                          ,VC_IRS_Fog_LC = "VC_IRS_Fog_LC"
                                                                          ,VC_BN_Curtains = "VC_BN_Curtains"
                                                                          ,HP_Ben = "HP_Ben"
                                                                          ,HP_PWD_Ben = "HP_PWD_Ben"
                                                                          ,HK_Ben = "HK_Ben"
                                                                          ,Cash_HK = "Cash_HK"
                                                                          ,PWD_Beneficiaries = "PWD_Beneficiaries"
                                                                          ,rounds_planned = "rounds_planned"
                                                                          ,WASH_NFI_Ben = "WASH_NFI_Ben"
                                                                          ,Cash_WASH_NFI = "Cash_WASH_NFI"
                                                                          ,incinerator_HF = "incinerator_HF"
                                                                          ,C19__resp_changed = "C19__resp_changed"
                                                                          ,C19_Water_increase = "C19_Water_increase"
                                                                          ,C19_Soap = "C19_Soap"
                                                                          ,Laundry_Detergent = "Laundry_Detergent"
                                                                          ,PPE_Kit = "PPE_Kit"
                                                                          ,CB_CM = "CB_CM"
                                                                          ,CB_WASH_Community = "CB_WASH_Community"
                                                                          ,Further_Discription = "Further_Discription"
                                                                          ,Cash_Total_Money_USD = "Cash_Total_Money_USD"
                                                                          ,In_HRP = "In_HRP"
                                                                          ,Women_Reached = "Women_Reached"
                                                                          ,Men_Reached = "Men_Reached"
                                                                          ,Boys_Reached = "Boys_Reached"
                                                                          ,Girls_Reached = "Girls_Reached"
                                                                          ,Women_Disability = "Women_Disability"
                                                                          ,Men_with_Disability = "Men_with_Disability"
                                                                          ,Girls_Disability = "Girls_Disability"
                                                                          ,Boys_with_Disability = "Boys_with_Disability"
                                                                          ,SD_Pcode = "SD_Pcode"
                                                                          ,Com_PCode = "Com_PCode"
                                                                          ,Camp_Pcode = "Camp_Pcode"
                                                                          ,Water_Station_P_Code = "Water_Station_P_Code"
                                                                          ,Comm_by_camp_pcode = "Comm_by_camp_pcode"
                                                                          ,Comm_by_Wat_Station = "Comm_by_Wat_Station"
                                                                          ,Benef = "Benef"
                                                                          ,CCCM_HNAP = "CCCM_HNAP"
                                                                          ,Today = "Today"
                                                                          ,project_Durationdays = "project_Durationdays"
                                                                          ,projects_end = "projects_end"
                                                                          ,Water1 = "Water1"
                                                                          ,Water2 = "Water2"
                                                                          ,final_Water = "final_Water"
                                                                          ,Sew_Inf = "Sew_Inf"
                                                                          ,Sew_Direct = "Sew_Direct"
                                                                          ,Final_SEW = "Final_SEW"
                                                                          ,Final_SWM = "Final_SWM"
                                                                          ,Final_Vector = "Final_Vector"
                                                                          ,Final_Hygeine = "Final_Hygeine"
                                                                          ,Final_beneficiaries = "Final_beneficiaries"
                                                                          ,WaterPerPersonPerDay = "WaterPerPersonPerDay"
                                                                          ,PersonPerLatrine = "PersonPerLatrine"
                                                                          ,TotalPer_Watervalum = "TotalPer_Watervalum"
                                                                          ,month4w ="month4w"
                                                                          ,SO1_1_1 = "SO1_1_1"
                                                                          ,SO1_1_2 = "SO1_1_2"
                                                                          ,Indic_1_1_1 = "Indic_1_1_1"
                                                                          ,Indic_1_2_1 = "Indic_1_2_1"
                                                                          ,Indic_1_2_2 = "Indic_1_2_2"
                                                                          ,Indic_1_2_3 = "Indic_1_2_3"
                                                                          ,Indic_1_3_1 = "Indic_1_3_1"
                                                                          ,Indic_1_3_2 = "Indic_1_3_2"
                                                                          ,SO2 = "SO2"
                                                                          ,Indic_2_1_1 = "Indic_2_1_1"
                                                                          ,Indic_2_1_2 = "Indic_2_1_2"
                                                                          ,Indic_2_2_1 = "Indic_2_2_1"
                                                                          ,Indic_2_2_2 = "Indic_2_2_2"
                                                                          ,Indic_2_2_3 = "Indic_2_2_3"
                                                                          ,Indic_2_3_1 = "Indic_2_3_1"
                                                                          ,SO4 = "SO4"
                                                                          ,Indic_4_1_1 = "Indic_4_1_1"
                                                                          ,Indic_4_2_1 = "Indic_4_2_1"
                                                                          ,Indic_4_2_2 = "Indic_4_2_2"
                                                                          ,Including_Date = "Including_Date",truncate.strings = TRUE))





df_DAMData_All$SO1_1_1[is.na(df_DAMData_All$SO1_1_1)]<-0
df_DAMData_All$SO1_1_2[is.na(df_DAMData_All$SO1_1_2)]<-0
df_DAMData_All$SO2[is.na(df_DAMData_All$SO2)]<-0

#***************************DAM WASH-IND (SO1)***********************************************************************







DAM4WS_Data_Pivot12[,"sector"]<- "WASH_ind"
#***************************DAM WASH-Dir (SO2)***********************************************************************








DAM4WS_Data_Pivot12[,"sector"]<- "WASH_dir"

WASH_DAM1 <- rbind(NWS4WS_Data_Pivot12,NWS4WS_Data_Pivot22)
WASH_DAM <- rbind(NWS4WS_Data_Pivot12,NWS4WS_Data_Pivot22)

#****************************OCHA ********************************************************************




#****************************DAM Each monthly table