#################################################################################
###                                                                           ###
###  3. Correlation of different external indicators                          ###
###                                                                           ###
#################################################################################

#################################################################################
#  3.1 Definition of the indicators and their correlation with the basic data   #
#################################################################################

# The following indicators are to be tested:
#
#     1     Monthly Change in Export Price Index (CEPI)
#  	2 	Monthly Satisfaction Index (SI) government based data
#  	3 	Average monthly temperatures in Chulwalar
#  	4 	Monthly births in Chulwalar
#  	5 	Monthly Satisfaction Index (SI) external index 
#  	6 	Yearly Exports from Urbano
#  	7 	Yearly number of Globalisation Party members in Chulwalar
#  	8 	Monthly Average Export Price Index for Chulwalar
#  	9 	Monthly Producer Price Index (PPI) for Etel in Chulwalar
#  	10 	National Holidays
#  	11 	Chulwalar Index (Total value of all companies in Chulwalar)
#  	12	Monthly Inflation rate in Chulwalar
#	13	Proposed spending for National Holidays
#     14    Influence of National Holiday
#
# The indicators will be converted into individual  vectors and subsequently
# converted into time series. The correlation of the indicators will then be
# tested against the As Is exports for Chulwalar. 

# Monthly Change in Export Price Index (CEPI)
CEPIVector <- c(ImportedIndicators[2:13,2],ImportedIndicators[2:13,3],ImportedIndicators[2:13,4],ImportedIndicators[2:13,5],ImportedIndicators[2:13,6],ImportedIndicators[2:13,7])
CEPI <- ts(CEPIVector , start=c(2008,1), end=c(2013,12), frequency=12)

# Monthly Satisfaction Index (SI) government based data
SIGovVector <- c(ImportedIndicators[16:27,2],ImportedIndicators[16:27,3],ImportedIndicators[16:27,4],ImportedIndicators[16:27,5],ImportedIndicators[16:27,6],ImportedIndicators[16:27,7])
SIGov <- ts(SIGovVector , start=c(2008,1), end=c(2013,12), frequency=12)

# Average monthly temperatures in Chulwalar
TemperatureVector <- c(ImportedIndicators[30:41,2],ImportedIndicators[30:41,3],ImportedIndicators[30:41,4],ImportedIndicators[30:41,5],ImportedIndicators[30:41,6],ImportedIndicators[30:41,7])
Temperature <- ts(TemperatureVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Monthly births in Chulwalar 
BirthsVector <- c(ImportedIndicators[44:55,2],ImportedIndicators[44:55,3],ImportedIndicators[44:55,4],ImportedIndicators[44:55,5],ImportedIndicators[44:55,6],ImportedIndicators[44:55,7])
Births <- ts(BirthsVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Monthly Satisfaction Index (SI) external index 
SIExternVector <- c(ImportedIndicators[58:69,2],ImportedIndicators[58:69,3],ImportedIndicators[58:69,4],ImportedIndicators[58:69,5],ImportedIndicators[58:69,6],ImportedIndicators[58:69,7])
SIExtern <- ts(SIExternVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Yearly exports from Urbano
UrbanoExportsVector <- c(ImportedIndicators[72:83,2],ImportedIndicators[72:83,3],ImportedIndicators[72:83,4],ImportedIndicators[72:83,5],ImportedIndicators[72:83,6],ImportedIndicators[72:83,7])
UrbanoExports <- ts(UrbanoExportsVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Yearly number of Globalisation Party members in Chulwalar
GlobalisationPartyMembersVector <- c(ImportedIndicators[86:97,2],ImportedIndicators[86:97,3],ImportedIndicators[86:97,4],ImportedIndicators[86:97,5],ImportedIndicators[86:97,6],ImportedIndicators[86:97,7])
GlobalisationPartyMembers <- ts(GlobalisationPartyMembersVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Monthly Average Export Price Index for Chulwalar
AEPIVector <- c(ImportedIndicators[100:111,2],ImportedIndicators[100:111,3],ImportedIndicators[100:111,4],ImportedIndicators[100:111,5],ImportedIndicators[100:111,6],ImportedIndicators[100:111,7])
AEPI <- ts(AEPIVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Monthly Producer Price Index (PPI) for Etel in Chulwalar
PPIEtelVector <- c(ImportedIndicators[114:125,2],ImportedIndicators[114:125,3],ImportedIndicators[114:125,4],ImportedIndicators[114:125,5],ImportedIndicators[114:125,6],ImportedIndicators[114:125,7])
PPIEtel <- ts(PPIEtelVector, start=c(2008,1), end=c(2013,12), frequency=12)

# National Holidays
NationalHolidaysVector <- c(ImportedIndicators[170:181,2],ImportedIndicators[170:181,3],ImportedIndicators[170:181,4],ImportedIndicators[170:181,5],ImportedIndicators[170:181,6],ImportedIndicators[170:181,7])
NationalHolidays <- ts(NationalHolidaysVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Chulwalar Index (Total value of all companies in Chulwalar)
ChulwalarIndexVector <- c(ImportedIndicators[128:139,2],ImportedIndicators[128:139,3],ImportedIndicators[128:139,4],ImportedIndicators[128:139,5],ImportedIndicators[128:139,6],ImportedIndicators[128:139,7])
ChulwalarIndex <- ts(ChulwalarIndexVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Monthly Inflation rate in Chulwalar 
InflationVector <- c(ImportedIndicators[142:153,2],ImportedIndicators[142:153,3],ImportedIndicators[142:153,4],ImportedIndicators[142:153,5],ImportedIndicators[142:153,6],ImportedIndicators[142:153,7])
Inflation <- ts(InflationVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Proposed spending for Independence day presents
IndependenceDayPresentsVector <- c(ImportedIndicators[156:167,2],ImportedIndicators[156:167,3],ImportedIndicators[156:167,4],ImportedIndicators[156:167,5],ImportedIndicators[156:167,6],ImportedIndicators[156:167,7])
IndependenceDayPresents <- ts(IndependenceDayPresentsVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Influence of National Holidays :
# This indicator is an experiment where the influence of National Holidays is 
# extended into the months leading up to the holiday. 
# However later tests show that this indicator is no better for forecasting than the
# orignial National Holidays indicator.    
InfluenceNationalHolidaysVector <- c(ImportedIndicators[184:195,2],ImportedIndicators[184:195,3],ImportedIndicators[184:195,4],ImportedIndicators[184:195,5],ImportedIndicators[184:195,6],ImportedIndicators[184:195,7])
InfluenceNationalHolidays <- ts(InfluenceNationalHolidaysVector, start=c(2008,1), end=c(2013,12), frequency=12)

# Check that the data import has worked

CEPIVector 
SIGovVector  
TemperatureVector 
BirthsVector 
SIExternVector 
UrbanoExportsVector 
GlobalisationPartyMembersVector 
AEPIVector 
PPIEtelVector 
NationalHolidaysVector 
ChulwalarIndexVector 
InflationVector 
IndependenceDayPresentsVector 


#################################################################################
#  3.2 Correlation of the indicators with a time offset                         #
#################################################################################

# The External Satisfaction Index indicator is to be offset by one month, to see if the 
# index change makes itself first noticeable on exports in the following months.

SIExternOffsetByOneMonthVector <- c(ImportedIndicators[57:68,2],ImportedIndicators[57:68,3],ImportedIndicators[57:68,4],ImportedIndicators[57:68,5],ImportedIndicators[57:68,6],ImportedIndicators[57:68,7])
SIExternOffsetByOneMonth <- ts(SIGovVector, start=c(2008,1), end=c(2013,11), frequency=12)

# Delete December 2013 from the ts 

TotalAsIsWithoutDec12013 <- ts(TotalAsIsVector , start=c(2008,1), end=c(2013,11), frequency=12)
EfakAsIsWithoutDec12013 <- ts(EfakAsIsVector , start=c(2008,1), end=c(2013,11), frequency=12)
WugeAsIsWithoutDec12013 <- ts(WugeAsIsVector, start=c(2008,1), end=c(2013,11), frequency=12)
TotalEtelAsIsWithoutDec12013 <- ts(TotalEtelAsIsVector, start=c(2008,1), end=c(2013,11), frequency=12)
BlueEtelAsIsWithoutDec12013  <- ts(BlueEtelAsIsVector, start=c(2008,1), end=c(2013,11), frequency=12)
RedEtelAsIsWithoutDec12013 <- ts(RedEtelAsIsVector, start=c(2008,1), end=c(2013,11), frequency=12)

# Offset SIGov Indicator by two months

SIGovVectorShifted2Months <- c(ImportedIndicators[15:26,2],ImportedIndicators[15:26,3],ImportedIndicators[15:26,4],ImportedIndicators[15:26,5],ImportedIndicators[15:26,6],ImportedIndicators[15:26,7])
SIGovShifted2Months <- ts(SIGovVectorShifted2Months , start=c(2008,1), end=c(2013,10), frequency=12)

# Delete November and December 2013 from the ts

TotalAsIsWithoutNovDec2013 <- ts(TotalAsIsVector , start=c(2008,1), end=c(2013,10), frequency=12)
EfakAsIsWithoutNovDec2013 <- ts(EfakAsIsVector , start=c(2008,1), end=c(2013,10), frequency=12)
WugeAsIsWithoutNovDec2013 <- ts(WugeAsIsVector, start=c(2008,1), end=c(2013,10), frequency=12)
TotalEtelAsIsWithoutNovDec2013 <- ts(TotalEtelAsIsVector, start=c(2008,1), end=c(2013,10), frequency=12)
BlueEtelAsIsWithoutNovDec2013 <- ts(BlueEtelAsIsVector, start=c(2008,1), end=c(2013,10), frequency=12)
RedEtelAsIsWithoutNovDec2013 <- ts(RedEtelAsIsVector, start=c(2008,1), end=c(2013,10), frequency=12)

#################################################################################
#  3.3 Correlation of the indicators with each another                          #
################################################################################# 

# In order to test which indicators could be used in a model with eachother,
# we need to look at the correlation of the indicators with eachother. All 
# thirteen indicators will be compared with eachother in a correlation 
# coefficient matrix. First of all it is necessary to summarise all indicators 
# in a matrix.

IndicatorsMatrix <-cbind(CEPIVector, SIGovVector, TemperatureVector, BirthsVector, SIGovVector, UrbanoExportsVector, GlobalisationPartyMembersVector, AEPIVector, PPIEtel, NationalHolidaysVector, ChulwalarIndexVector, InflationVector, IndependenceDayPresentsVector)

# Establish the standardised data matrix

IndicatorsmatrixStandardised=scale(IndicatorsMatrix)

# The dimensions of the matrix are determined by the number of indicators.
NumberOfIndicators=dim(IndicatorsmatrixStandardised)[1]

# Produce the IndicatorsCorrelationCoefficientMatrix.
IndicatorsCorrelationCoefficientMatrix=(1/(NumberOfIndicators-1))*t(IndicatorsmatrixStandardised)%*%IndicatorsmatrixStandardised

#################################################################################
###                                                                           ###
###  4. Development of forecasting models                                     ###
###                                                                           ###
################################################################################# 

# With help of the tslm function, we will produce a model based on the time series.
# Possible inputs could be Trend and Seasonality as well as the time series of
# the indicators. 

#################################################################################
#  4.1 ModelWithAlllIndicators and with each indicator individually             #
#################################################################################

# All Indiators in one model:
ModelWithAlllIndicators <- tslm(TotalAsIs ~ trend + season + CEPI + SIGov + Temperature + Births + SIExtern + UrbanoExports + GlobalisationPartyMembers + AEPI + PPIEtel + NationalHolidays + ChulwalarIndex + Inflation + IndependenceDayPresents)

# CEPI:
# The CEPI Indicator correlated best with total exports. Indeed the multiple R² 
# improved the model slighltly compared to the simple ModelWithTrendAndSeasonalityOnly 
# However the adjusted R² remains the same.
ModelWithCEPI <- tslm(TotalAsIs ~ trend + season + CEPI)

# SIGov:
# The Satisfaction Index (gov)  hardly changes the function of the model.
ModelWithSIGov <- tslm(TotalAsIs ~ trend + season + SIGov)

# Temperature:
ModelWithTemperature <- tslm(TotalAsIs ~ trend + season + Temperature)

# Births:
ModelWithBirths <- tslm(TotalAsIs ~ trend + season + Births)

# SIExtern:
ModelWithSIExtern <- tslm(TotalAsIs ~ trend + season + SIExtern)

# UrbanoExports:
# Indicator with adjusted R² shows a better result than the reference model (ModelWithTrendAndSeasonalityOnly).
# The individual months are also very significant.
ModelWithTotalUrbanoExports <- tslm(TotalAsIs ~ trend + season + UrbanoExports)

# GlobalisationPartyMembers:
ModelWithGlobalisationPartyMembers <- tslm(TotalAsIs ~ trend + season + GlobalisationPartyMembers)

# AEPI:
ModelWithAEPI <- tslm(TotalAsIs ~ trend + season + AEPI)

# PPIEtel:
ModelWithPPIEtel <- tslm(TotalAsIs ~ trend + season + PPIEtel)

# NationalHolidays:
# Indicator with the best adjusted R². The months remain very significant and the indicator
# itself has a p-value of 0,00636**
ModelWithNationalHolidays <- tslm(TotalAsIs ~ trend + season + NationalHolidays)

# ChulwalarIndex:
ModelWithChulwalarIndex <- tslm(TotalAsIs ~ trend + season + ChulwalarIndex)

# Inflation:
ModelWithInflation <- tslm(TotalAsIs ~ trend + season + Inflation)

# IndependenceDayPresents:
ModelWithIndependenceDayPresents <- tslm(TotalAsIs ~ trend + season + IndependenceDayPresents)

# InfluenceNationalHolidays:
# Indicator with the best adjusted R². The months remain very significant and the indicator
# itself has a p-value of 0,00636**
ModelWithInfluenceNationalHolidays <- tslm(TotalAsIs ~ trend + season + InfluenceNationalHolidays)

#################################################################################
#  4.2.1 ModelWithHighCorrelatingIndicators                                     #
################################################################################# 

# In this model only the indicators that correlate well with eachother have been used.  
# See the CorrelationCoefficientMatrix for clarification.
ModelWithHighCorrelatingIndicators <- tslm(TotalAsIs ~ trend + season + CEPI + SIExtern + UrbanoExports + GlobalisationPartyMembers + AEPI)

#################################################################################
#  4.2.2 ModelWithLowCorrelatingIndicators                                      #
################################################################################# 

# In this model only the indicators that hardly correlate at all with eachother have been used.  
# See the CorrelationCoefficientMatrix for clarification.
ModelWithLowCorrelatingIndicators <- tslm(TotalAsIs ~ trend + season + NationalHolidays + UrbanoExports + GlobalisationPartyMembers)

#################################################################################
#  4.3 ModelWithTrendAndSeasonalityOnly                                         #
#################################################################################

ModelWithTrendAndSeasonalityOnly <- tslm(TotalAsIs ~ trend + season)

#################################################################################
#  4.4 ModelWithoutTrendAndSeasonality                                          #
#################################################################################

ModelWithoutTrendAndSeasonality <- tslm(TotalAsIs ~ CEPI + SIExtern + UrbanoExports + GlobalisationPartyMembers + AEPI)

#################################################################################
#  4.5 ModelWithEfakExportsIndicators                                           #
#################################################################################

# ModelWithEfakExportsIndicators will be matched with a set of indicators that correlate with the Efak exports.
# The adjusted R² has the best value. However the diffent months and indicators are not significant apart from 
# GlobaliationPartyMembers. When testing the forecasts based on this model it generated unrealistic exports which were 
# much higher than the As Is data.
ModelWithEfakExportsIndicators <- tslm(EfakAsIs  ~ trend + season + CEPI + UrbanoExports + AEPI + GlobalisationPartyMembers)

ModelEfakSalesWithCEPI <- tslm(EfakAsIs  ~ trend + season + CEPI)

# ModelEfakSalesWithTrendAnsSeasonalityOnly does not seem to be anything special, but it returns fairly good results.
ModelEfakSalesWithTrendAnsSeasonalityOnly <- tslm(EfakAsIs  ~ trend + season)

ModelWithCEPIOnly <- tslm(EfakAsIs  ~ CEPI)

#################################################################################
#  4.6 ModelWithWugeExportsIndicators                                           #
#################################################################################

# The model does not work as well in the wuge segment as it does in the efak segment. The reason is that trend
# and seasonality are not as convincing here as they were in ModelWugeWithTrendAndSeasonalityOnly when compared
# to ModelWithCEPIOnly.

ModelWithWugeExportsIndicators <- tslm(WugeAsIs ~ trend + season + CEPI + UrbanoExports + AEPI)

ModelWugeWithCEPI <- tslm(WugeAsIs ~ trend + season + CEPI)

ModelWugeWithTrendAndSeasonalityOnly <- tslm(WugeAsIs ~ trend + season)

#################################################################################
#  4.7 ModelTotalEtel                                                            #
################################################################################# 

# The model for the etel segment, including both subcategories, work best with trend and seasonality. An attempt 
# to improve the model by adding Temperature showed no improvement worth mentioning.  
ModelTotalEtel <- tslm(TotalEtelAsIs~ trend + season)

ModelBlueEtel <- tslm(BlueEtelAsIs  ~ trend + season)

ModelRedEtel <- tslm(RedEtelAsIs  ~ trend + season)

#################################################################################
###                                                                           ###
###  5. Forecasts with the models                                             ###
###                                                                           ###
################################################################################# 

#################################################################################
#  5.1 Shorten the time series in order to test the forecasts                   # 
#################################################################################

# Shortening the exports data in the Time Series in order to be able to compare the produced forecasts with the 
# As Is data.

TotalAsIs_2012 <- ts(TotalAsIsVector , start=c(2008,1), end=c(2012,12), frequency=12)
EfakAsIs_2012 <- ts(EfakAsIsVector , start=c(2008,1), end=c(2012,12), frequency=12)
WugeAsIs_2012 <- ts(WugeAsIsVector, start=c(2008,1), end=c(2012,12), frequency=12)
TotalEtelAsIs_2012 <- ts(TotalEtelAsIsVector, start=c(2008,1), end=c(2012,12), frequency=12)
BlueEtelAsIs_2012 <- ts(BlueEtelAsIsVector, start=c(2008,1), end=c(2012,12), frequency=12)
RedEtelAsIs_2012 <- ts(RedEtelAsIsVector, start=c(2008,1), end=c(2012,12), frequency=12)
YearAsIs_2012 <- ts(YearAsIsVector, start=c(2008,1), end=c(2012,12), frequency=12)

# Shortening the indicators by the same amount

CEPI_2012 <- ts(CEPIVector , start=c(2008,1), end=c(2012,12), frequency=12)
SIGov_2012 <- ts(SIGovVector , start=c(2008,1), end=c(2012,12), frequency=12)
Temperature_2012 <- ts(TemperatureVector, start=c(2008,1), end=c(2012,12), frequency=12)
Births_2012 <- ts(BirthsVector, start=c(2008,1), end=c(2012,12), frequency=12)
SIExtern_2012 <- ts(SIExternVector, start=c(2008,1), end=c(2012,12), frequency=12)
UrbanoExports_2012 <- ts(UrbanoExportsVector, start=c(2008,1), end=c(2012,12), frequency=12)
GlobalisationPartyMembers_2012 <- ts(GlobalisationPartyMembersVector, start=c(2008,1), end=c(2012,12), frequency=12)
AEPI_2012 <- ts(AEPIVector, start=c(2008,1), end=c(2012,12), frequency=12)
PPIEtel_2012 <- ts(PPIEtel, start=c(2008,1), end=c(2012,12), frequency=12)
NationalHolidays_2012 <- ts(NationalHolidaysVector, start=c(2008,1), end=c(2012,12), frequency=12)
ChulwalarIndex_2012 <- ts(ChulwalarIndexVector, start=c(2008,1), end=c(2012,12), frequency=12)
Inflation_2012 <- ts(InflationVector, start=c(2008,1), end=c(2012,12), frequency=12)
InfluenceNationalHolidays_2012 <- ts(InfluenceNationalHolidaysVector, start=c(2008,1), end=c(2012,12), frequency=12)


# Seperate the As Is and Plan data for 2013 in order to be able to compare the forecast to this data.

TotalAsIsVector_2013 <- c(ImportedAsIsData [2:13,7])
AsIsWugeAsIsVector_2013 <- c(ImportedAsIsData [16:27,7])
TotalAsIsGewuerzeVector_2013 <- c(ImportedAsIsData [30:41,7])
TotalEtelAsIsVector_2013 <- c(ImportedAsIsData [44:55,7])
BlueEtelAsIsVector_2013 <- c(ImportedAsIsData [58:69,7])
RedEtelAsIsVector_2013 <- c(ImportedAsIsData [72:83,7])
YearAsIsVector_2013 <- c(ImportedAsIsData [86,7])

TotalAsIs_2013 <- ts(TotalAsIsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
EfakAsIs_2013 <- ts(AsIsWugeAsIsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
WugeAsIs_2013 <- ts(TotalAsIsGewuerzeVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
TotalEtelAsIs_2013 <- ts(TotalEtelAsIsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
BlueEtelAsIs_2013 <- ts(BlueEtelAsIsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
RedEtelAsIs_2013 <- ts(RedEtelAsIsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
YearAsIs_2013 <- ts(YearAsIsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)

PlanVector_2013 <- c(ImportedPlanData[2:13,7])
EfakPlanVector_2013 <- c(ImportedPlanData[16:27,7])
WugePlanVector_2013 <- c(ImportedPlanData[30:41,7])
TotalEtelPlanVector_2013 <- c(ImportedPlanData[44:55,7])
BlueEtelPlanVector_2013 <- c(ImportedPlanData[58:69,7])
RedEtelPlanVector_2013 <- c(ImportedPlanData[72:83,7])
YearPlanVector_2013 <- c(ImportedPlanData[86,7])

TotalPlan_2013 <- ts(PlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
EfakPlan_2013 <- ts(EfakPlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
WugePlan_2013 <- ts(WugePlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
TotalEtelPlan_2013 <- ts(TotalEtelPlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
BlueEtelPlan_2013 <- ts(BlueEtelPlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
RedEtelPlan_2013 <- ts(RedEtelPlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
YearPlan_2013 <- ts(YearPlanVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)

# Seperate the indicator data for 2013 and 2014 in order to use these in the forecasts. First as a vector and then as a time series.

CEPIVector_2013 <- c(ImportedIndicators[2:13,7])
CEPIVector_2014 <- c(ImportedIndicators[2:13,8])
SIGovVector_2013 <- c(ImportedIndicators[16:27,7])
SIGovVector_2014 <- c(ImportedIndicators[16:27,8])
TemperatureVector_2013 <- c(ImportedIndicators[30:41,7])
TemperatureVector_2014 <- c(ImportedIndicators[30:41,8])
BirthsVector_2013 <- c(ImportedIndicators[44:55,7])
BirthsVector_2014 <- c(ImportedIndicators[44:55,8])
SIExternVector_2013 <- c(ImportedIndicators[58:69,7])
SIExternVector_2014 <- c(ImportedIndicators[58:69,8])
UrbanoExportsVector_2013 <- c(ImportedIndicators[72:83,7])
UrbanoExportsVector_2014 <- c(ImportedIndicators[72:83,8])
GlobalisationPartyMembersVector_2013 <- c(ImportedIndicators[86:97,7])
GlobalisationPartyMembersVector_2014 <- c(ImportedIndicators[86:97,8])
AEPIVector_2013 <- c(ImportedIndicators[100:111,7])
AEPIVector_2014 <- c(ImportedIndicators[100:111,8])
PPIEtelVector_2013 <- c(ImportedIndicators[114:125,7])
PPIEtelVector_2014 <- c(ImportedIndicators[114:125,8])
NationalHolidaysVector_2013 <-c(ImportedIndicators[170:181,7])
NationalHolidaysVector_2014 <-c(ImportedIndicators[170:181,8])
ChulwalarIndexVector_2013 <- c(ImportedIndicators[128:139,7])
ChulwalarIndexVector_2014 <- c(ImportedIndicators[128:139,8])
InflationVector_2013 <- c(ImportedIndicators[142:153,7])
InflationVector_2014 <- c(ImportedIndicators[142:153,8])
InfluenceNationalHolidaysVector_2013 <-c(ImportedIndicators[184:195,7])
InfluenceNationalHolidaysVector_2014 <-c(ImportedIndicators[184:195,8])

CEPI_2013 <- ts(CEPIVector_2013 , start=c(2013,1), end=c(2013,12), frequency=12)
CEPI_2014 <- ts(CEPIVector_2014 , start=c(2013,1), end=c(2013,12), frequency=12)
SIGov_2013 <- ts(SIGovVector_2013 , start=c(2013,1), end=c(2013,12), frequency=12)
SIGov_2014 <- ts(SIGovVector_2014 , start=c(2013,1), end=c(2013,12), frequency=12)
Temperature_2013 <- ts(TemperatureVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
Temperature_2014 <- ts(TemperatureVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
Births_2013 <- ts(BirthsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
Births_2014 <- ts(BirthsVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
SIExtern_2013 <- ts(SIExternVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
SIExtern_2014 <- ts(SIExternVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
UrbanoExports_2013 <- ts(UrbanoExportsVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
UrbanoExports_2014 <- ts(UrbanoExportsVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
GlobalisationPartyMembers_2013 <- ts(GlobalisationPartyMembersVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
GlobalisationPartyMembers_2014 <- ts(GlobalisationPartyMembersVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
AEPI_2013 <- ts(AEPIVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
AEPI_2014 <- ts(AEPIVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
PPIEtel_2013 <- ts(PPIEtelVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
PPIEtel_2014 <- ts(PPIEtelVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
NationalHolidays_2013 <- ts(NationalHolidaysVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
NationalHolidays_2014 <- ts(NationalHolidaysVector_2014, start=c(2014,1), end=c(2014,12), frequency=12)
ChulwalarIndex_2013 <- ts(ChulwalarIndexVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
ChulwalarIndex_2014 <- ts(ChulwalarIndexVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
Inflation_2013 <- ts(InflationVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
Inflation_2014 <- ts(InflationVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)
InfluenceNationalHolidaysVector_2013 <- ts(InfluenceNationalHolidaysVector_2013, start=c(2013,1), end=c(2013,12), frequency=12)
InfluenceNationalHolidaysVector_2014 <- ts(InfluenceNationalHolidaysVector_2014, start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
#  5.2 Forecasting und testing the models                                       #
#################################################################################

#################################################################################
#  5.2.1.1 Forecast ModelWithHighCorrelatingIndicators                          #
#################################################################################

# Shorten ModelWithHighCorrelatingIndicators by one year in order to be able to produce a forecast for 2013. 
ModelWithHighCorrelatingIndicators_2012 <- tslm(TotalAsIs_2012 ~ trend + season + CEPI_2012 + SIExtern_2012 + UrbanoExports_2012 + GlobalisationPartyMembers_2012 + AEPI_2012)

# Add "newdata" to the 2013 indicator values for the forecast 
ModelWithHighCorrelatingIndicators_Forecast <- forecast(ModelWithHighCorrelatingIndicators_2012,newdata=data.frame(CEPI_2012=CEPI_2013, SIExtern_2012=SIExtern_2013, UrbanoExports_2012= UrbanoExports_2013, GlobalisationPartyMembers_2012=GlobalisationPartyMembers_2013, AEPI_2012=AEPI_2013),h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithHighCorrelatingIndicators_Forecast_df <-as.data.frame(ModelWithHighCorrelatingIndicators_Forecast) 
ModelWithHighCorrelatingIndicators_PointForecast <- ts(ModelWithHighCorrelatingIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# A Comparison with linear regression also supports the result.
ModelWithHighCorrelatingIndicators_forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithHighCorrelatingIndicators_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)

#################################################################################
#  5.2.1.2 Forecast ModelWithLowCorrelatingIndicators                           #
#################################################################################

# Shorten ModelWithLowCorrelatingIndicators by one year in order to be able to produce a forecast for 2013. 
ModelWithLowCorrelatingIndicators_2012 <- tslm(TotalAsIs_2012 ~ trend + season + NationalHolidays_2012 + UrbanoExports_2012 + GlobalisationPartyMembers_2012)

# Add "newdata" to the 2013 indicator values for the forecast 
ModelWithLowCorrelatingIndicators_Forecast <- forecast(ModelWithLowCorrelatingIndicators_2012,newdata=data.frame(NationalHolidays_2012=NationalHolidays_2013, UrbanoExports_2012= UrbanoExports_2013, GlobalisationPartyMembers_2012=GlobalisationPartyMembers_2013),h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithLowCorrelatingIndicators_Forecast_df <-as.data.frame(ModelWithLowCorrelatingIndicators_Forecast) 
ModelWithLowCorrelatingIndicators_PointForecast <- ts(ModelWithLowCorrelatingIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# A Comparison with linear regression also supports the result.
ModelWithLowCorrelatingIndicators_forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithLowCorrelatingIndicators_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)

#################################################################################
#  5.2.2 Forecast ModelWithTrendAndSeasonalityOnly                              #
#################################################################################

# Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013.
ModelWithTrendAndSeasonalityOnly_2012 <- tslm(TotalAsIs_2012 ~ trend + season)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithTrendAndSeasonalityOnly_Forecast <- forecast(ModelWithTrendAndSeasonalityOnly_2012,h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithTrendAndSeasonalityOnly_Forecast_df <-as.data.frame(ModelWithTrendAndSeasonalityOnly_Forecast) 
ModelWithTrendAndSeasonalityOnly_PointForecast <- ts(ModelWithTrendAndSeasonalityOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# A Comparison with linear regression also supports the result.
ModelWithTrendAndSeasonalityOnly_Forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithTrendAndSeasonalityOnly_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)

#################################################################################
#  5.2.3 Forecast ModelWithEfakExportsIndicators                                #
#################################################################################

# Shorten the variables in ModelWithEfakExportsIndicators by one year in order to be able to produce a forecast for 2013.
ModelWithEfakExportsIndicators_2012 <- tslm(EfakAsIs_2012 ~ trend + season + CEPI_2012 + UrbanoExports_2012 + AEPI_2012)
ModelEfakSalesWithCEPI_2012 <- tslm(EfakAsIs_2012 ~ trend + season + CEPI_2012)
ModelEfakSalesWithTrendAnsSeasonalityOnly_2012 <- tslm(EfakAsIs_2012 ~ trend + season)
ModelWithCEPIOnly_2012 <- tslm(EfakAsIs_2012 ~ CEPI_2012)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithEfakExportsIndicators_Forecast <- forecast(ModelWithEfakExportsIndicators_2012, newdata=data.frame(CEPI_2012=CEPI_2013, UrbanoExports_2012 = UrbanoExports_2013, AEPI_2012 = AEPI_2013),h=12)
ModelEfakSalesWithCEPI_Forecast <- forecast(ModelEfakSalesWithCEPI_2012, , newdata=data.frame(CEPI_2012=CEPI_2013), h=12)
ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast <- forecast(ModelEfakSalesWithTrendAnsSeasonalityOnly_2012,h=12)
ModelWithCEPIOnly_Forecast <- forecast(ModelWithCEPIOnly_2012, , newdata=data.frame(CEPI_2012=CEPI_2013), h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.
ModelWithEfakExportsIndicators_Forecast_df <-as.data.frame(ModelWithEfakExportsIndicators_Forecast) 
ModelEfakSalesWithCEPI_Forecast_df <-as.data.frame(ModelEfakSalesWithCEPI_Forecast) 
ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast_df <-as.data.frame(ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast) 
ModelWithCEPIOnly_Forecast_df <-as.data.frame(ModelWithCEPIOnly_Forecast) 
ModelWithEfakExportsIndicators_PointForecast <- ts(ModelWithEfakExportsIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelEfakSalesWithCEPI_PointForecast <- ts(ModelEfakSalesWithCEPI_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelEfakSalesWithTrendAnsSeasonalityOnly_PointForecast <- ts(ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelWithCEPIOnly_PointForecast <- ts(ModelWithCEPIOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
#  5.2.4 Forecast ModelWithWugeExportsIndicators                                #
#################################################################################

# Shorten the variable in ModelWithWugeExportsIndicators by one year in order to be able to produce a forecast for 2013.
ModelWithWugeExportsIndicators_2012 <- tslm(WugeAsIs_2012 ~ trend + season + CEPI_2012 + UrbanoExports_2012 + AEPI_2012 + GlobalisationPartyMembers_2012)
ModelWugeWithCEPI_2012 <- tslm(WugeAsIs_2012 ~ trend + season + CEPI_2012)
ModelWugeWithTrendAndSeasonalityOnly_2012 <- tslm(WugeAsIs_2012 ~ trend + season)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithWugeExportsIndicators_Forecast <- forecast(ModelWithWugeExportsIndicators_2012, newdata=data.frame(CEPI_2012=CEPI_2013, UrbanoExports_2012 = UrbanoExports_2013, AEPI_2012 = AEPI_2013, GlobalisationPartyMembers_2012 = GlobalisationPartyMembers_2013),h=12)
ModelWugeWithCEPI_Forecast <- forecast(ModelWugeWithCEPI_2012, , newdata=data.frame(CEPI_2012=CEPI_2013), h=12)
ModelWugeWithTrendAndSeasonalityOnly_Forecast <- forecast(ModelWugeWithTrendAndSeasonalityOnly_2012,h=12)

# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithWugeExportsIndicators_Forecast_df <-as.data.frame(ModelWithWugeExportsIndicators_Forecast) 
ModelWugeWithCEPI_Forecast_df <-as.data.frame(ModelWugeWithCEPI_Forecast) 
ModelWugeWithTrendAndSeasonalityOnly_Forecast_df <-as.data.frame(ModelWugeWithTrendAndSeasonalityOnly_Forecast)
ModelWithWugeExportsIndicators_PointForecast <- ts(ModelWithWugeExportsIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelWugeWithCEPI_PointForecast <- ts(ModelWugeWithCEPI_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelWugeWithTrendAndSeasonalityOnly_PointForecast <- ts(ModelWugeWithTrendAndSeasonalityOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
#  5.2.5 Forecast ModelTotalEtel                                                 #
#################################################################################

# Shorten the variables in ModelTotalEtel by one year in order to be able to produce a forecast for 2013.
ModelTotalEtel_2012 <- tslm(TotalEtelAsIs_2012 ~ trend + season)
ModelBlueEtel_2012 <- tslm(BlueEtelAsIs_2012 ~ trend + season)
ModelRedEtel_2012 <- tslm(RedEtelAsIs_2012 ~ trend + season)

# Forecast
ModelTotalEtel_Forecast <- forecast(ModelTotalEtel_2012,h=12)
ModelBlueEtel_Forecast <- forecast(ModelBlueEtel_2012,h=12)
ModelRedEtel_Forecast <- forecast(ModelRedEtel_2012,h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.
ModelTotalEtel_Forecast_df <-as.data.frame(ModelTotalEtel_Forecast) 
ModelBlueEtel_Forecast_df <-as.data.frame(ModelBlueEtel_Forecast) 
ModelRedEtel_Forecast_df <-as.data.frame(ModelRedEtel_Forecast) 
ModelTotalEtel_PointForecast <- ts(ModelTotalEtel_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelBlueEtel_PointForecast <- ts(ModelBlueEtel_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelRedEtel_PointForecast <- ts(ModelRedEtel_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
#  5.2.6 Forecast ModelWithTotalUrbanoExports                                   #
#################################################################################

# Shorten the variables in ModelWithTotalUrbanoExports by one year in order to be able to produce a forecast for 2013.
ModelWithTotalUrbanoExports_2012 <- tslm(TotalAsIs_2012 ~ trend + season + UrbanoExports_2012)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithTotalUrbanoExports_Forecast <- forecast(ModelWithTotalUrbanoExports_2012, newdata=data.frame(UrbanoExports_2012=UrbanoExports_2013), h=12)

# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithTotalUrbanoExports_Forecast_df <-as.data.frame(ModelWithTotalUrbanoExports_Forecast) 
ModelWithTotalUrbanoExports_PointForecast <- ts(ModelWithTotalUrbanoExports_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
#  5.2.7 Forecast ModelWithNationalHolidays                                      #
#################################################################################

# Shorten the variables in ModelWithNationalHolidays by one year in order to be able to produce a forecast for 2013.
ModelWithNationalHolidays_2012 <- tslm(TotalAsIs_2012 ~ trend + season + NationalHolidays_2012)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithNationalHolidays_Forecast <- forecast(ModelWithNationalHolidays_2012, newdata=data.frame(NationalHolidays_2012=NationalHolidays_2013), h=12)

# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series.
ModelWithNationalHolidays_Forecast_df <-as.data.frame(ModelWithNationalHolidays_Forecast) 
ModelWithNationalHolidays_PointForecast <- ts(ModelWithNationalHolidays_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
#  5.2.8 Forecast ModelWithInfluenceNationalHolidays                             #
#################################################################################

# Shorten the variables in ModelWithInfluenceNationalHolidays by one year in order to be able to produce a forecast for 2013.
ModelWithInfluenceNationalHolidays_2012 <- tslm(TotalAsIs_2012 ~ trend + season + InfluenceNationalHolidays_2012)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithInfluenceNationalHolidays_Forecast <- forecast(ModelWithInfluenceNationalHolidays_2012, newdata=data.frame(InfluenceNationalHolidays_2012=InfluenceNationalHolidaysVector_2013), h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.
ModelWithInfluenceNationalHolidays_Forecast_df <-as.data.frame(ModelWithInfluenceNationalHolidays_Forecast) 
ModelWithInfluenceNationalHolidays_PointForecast <- ts(ModelWithInfluenceNationalHolidays_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

#################################################################################
###                                                                           ###
###  6. Forecast for 2014                                                     ###
###                                                                           ###
#################################################################################


# As ModelWithLowCorrelatingIndicators was the one of best fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality and NationalHolidays, UrbanoExports and GlobalisationPartyMembers. 
Forecast_ModelWithLowCorrelatingIndicators_2014 <- forecast(ModelWithLowCorrelatingIndicators,newdata=data.frame(NationalHolidays=NationalHolidays_2014, UrbanoExports= UrbanoExports_2014, GlobalisationPartyMembers=GlobalisationPartyMembers_2014),h=12)

Forecast_ModelWithLowCorrelatingIndicators_2014_df <-as.data.frame(Forecast_ModelWithLowCorrelatingIndicators_2014) 
PointForecast_ModelWithLowCorrelatingIndicators_2014 <- ts(Forecast_ModelWithLowCorrelatingIndicators_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

# As ModelWithTrendAndSeasonalityOnly also gave a well fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality. 
Forecast_2014 <- forecast(ModelWithTrendAndSeasonalityOnly,h=12)

Forecast_2014_df <-as.data.frame(Forecast_2014) 
PointForecast_TrendAndSeasonality_2014 <- ts(Forecast_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

### ALTERNATIVE###
# As the indiators NationalHolidays delievered a good result, but could not convince in the 2013 forecast,
# it could be possible that the data for 2013 was to blame. Therefore there is another Forecast using the
# ModelWithNationalHolidays
Forecast_2014_alternative <- forecast(ModelWithNationalHolidays, newdata=data.frame(NationalHolidays=NationalHolidays_2014),h=12)

Forecast_2014_alternative_df <-as.data.frame(Forecast_2014_alternative) 
PointForecast_2014_alternative <- ts(Forecast_2014_alternative_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

# Output instruction for the data export of the results for further use in Excel.
#write.csv(PointForecast_2014_alternative,file='PointForecast_2014_alternative.csv')

#################################################################################
###                                                                           ###
### 7. Developing forecasting models with alternative model approaches        ###
###                                                                           ###
#################################################################################

#################################################################################
#  7.1 Exponential Smoothing                                                    #
#################################################################################

# Exponential Smoothing uses past values to calculate a forecast. The strength 
# with which each value influences the forecast is weakened with help of a 
# smoothing parameter. Thus we are dealing with a weighted average, whose 
# values fade out the longer ago they were in the past.

#################################################################################
#  7.1.1 Simple expontential smoothing                                          #
#################################################################################

# Formula: ses(). It must be decided if alpha (the smoothing parameter
# should be automatically calculated. If initial=simple, the alpha value can 
# be set to any chosen value, if initial=optimal (or nothing, as this is the 
# default), alpha will be set to the optimal value based on ets().
# h=12 gives the number of cycles for the forecast.

Model_ses <- ses(TotalAsIs, h=12)

#################################################################################
#  7.1.2 Holt's linear trend method                                             #
#################################################################################

# Holt added to the model in order to forecast using trends as well.
# For this it is necessary to add a beta, which determines the trend.
# If neither alpha nor beta is stated, both parameters will be optimised
# using ets(). 

Model_holt_1 <- holt(TotalAsIs,h=12)
Model_holt_2<- holt(TotalAsIs, exponential=TRUE,h=12)
Model_holt_3 <- holt(TotalAsIs, damped=TRUE,h=12)
Model_holt_4 <- holt(TotalAsIs, exponential=TRUE, damped=TRUE,h=12)

#################################################################################
#  7.1.3 Holt-Winter's seasonal method                                          #
#################################################################################

# Holt and Winters have expanded Holt's model further to include the
# seasonality aspect. The parameter gamma, which is for smoothing the
# seasonality, was added to achieve this. The values are better than 
# the models without seasonality. This logical matches our results from the regression approaches, 
# the data is strongly influenced by seasonality. 
# In the following model, none of the parameters are given so that they
# will be optimised automatically. There are two models: one using
# an additive error model method and one using a multiplicative error model.

Model_hw_1 <- hw(TotalAsIs ,seasonal="additive",h=12)
Model_hw_2 <- hw(TotalAsIs ,seasonal="multiplicative",h=12)

# In order to use the results later, they need to be converted into point forcasts.
Model_hw_1_df <-as.data.frame(Model_hw_1) 
Model_hw_1_PointForecast <- ts(Model_hw_1_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Model_hw_2_df <-as.data.frame(Model_hw_2) 
Model_hw_2_PointForecast <- ts(Model_hw_2_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_hw_1_PointForecast,file='Model_hw_1_PointForecast.csv')
#write.csv(Model_hw_2_PointForecast,file='Model_hw_2_PointForecast.csv')

#################################################################################
#  7.1.4 Innovations state space models for exponential smoothing               #
#################################################################################

# The funktion ets() produces a model with the same values as Model_hw_1. 
# The reason for this is that all of the parameters in this model were optimised 
# using the ets() function. The results are a ets(A,A,A) model which is an 
# additive method for trend, seasonality and errors. The previous models
# also showed the type of ets() model in their summary. In this case the user
# parameters were either accepted or rejected. As the model has been set to 
# "ZZZ", the best model will be automatically chosen. 

Model_ets <-ets(TotalAsIs, model="ZZZ", damped=NULL, alpha=NULL, beta=NULL, gamma=NULL, phi=NULL, additive.only=FALSE, lambda=NULL, lower=c(rep(0.0001,3), 0.8), upper=c(rep(0.9999,3),0.98), opt.crit=c("lik","amse","mse","sigma","mae"), nmse=3, bounds=c("both","usual","admissible"), ic=c("aicc","aic","bic"), restrict=TRUE)
Model_ets_forecast <- forecast(Model_ets,h=12)

# In order to use the results later, they need to be converted into point forcasts.
Model_ets_forecast_df <-as.data.frame(Model_ets_forecast) 
Model_ets_PointForecast <- ts(Model_ets_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_ets_PointForecast,file='Model_ets_PointForecast.csv')


#################################################################################
#  7.2 ARIMA       							                                                #
#################################################################################

ChulwalarDiff <- diff(TotalAsIs)

ns <- nsdiffs(TotalAsIs)
if(ns > 0) {
  xstar <- diff(TotalAsIs,lag=frequency(TotalAsIs),differences=ns)
} else {
  xstar <- TotalAsIs
}

nd <- ndiffs(xstar)
if(nd > 0) {
  xstar <- diff(xstar,differences=nd)
}

# If "lag" is set to 12, this is equivalent to 1* seasonal differencing
ChulwalarDiff_lag <- diff(TotalAsIs,lag=12)

#################################################################################
#  7.2.1 ARIMA modelling						                                            #
#################################################################################

# The values for AIC, AICc and BIC should be minimised.
# We wil try a range of combinations.

# R uses the maximum likelihood estimation (MLE) in order to decide how good
# a certain model is. The parameters, which give the most likely model based on the given data, are chosen.
# Furthermore, R gives the log-likelihood, which should be maximised. 

Model_ARIMA_1  <- Arima(TotalAsIs, order=c(0,1,0))
Model_ARIMA_2 <- Arima(TotalAsIs, order=c(1,1,0))
Model_ARIMA_3 <- Arima(TotalAsIs, order=c(1,1,1))
Model_ARIMA_4 <- Arima(TotalAsIs, order=c(2,1,1))
Model_ARIMA_5 <- Arima(TotalAsIs, order=c(2,1,2))
Model_ARIMA_6 <- Arima(TotalAsIs, order=c(3,1,2))
Model_ARIMA_7 <- Arima(TotalAsIs, order=c(3,1,3))
Model_ARIMA_8 <- Arima(TotalAsIs, order=c(3,1,1))
Model_ARIMA_9 <- Arima(TotalAsIs, order=c(3,1,2))
Model_ARIMA_10 <- Arima(TotalAsIs, order=c(1,1,3))
Model_ARIMA_11 <- Arima(TotalAsIs, order=c(2,1,3))
Model_ARIMA_12 <- Arima(TotalAsIs, order=c(2,2,3))
Model_ARIMA_13 <- Arima(TotalAsIs, order=c(2,3,2))

#################################################################################
#  7.2.2 Seasonal ARIMA modelling   				                                    #
#################################################################################

# This model integrates the seasonal aspect into the ARIMA model. As the previous
# models all had a peak in lag 12, it seems viable that the data are seasonal. 

Model_Seasonal_ARIMA_0 <- Arima(TotalAsIs, order=c(0,0,0), seasonal=c(1,0,0))
Model_Seasonal_ARIMA_1 <- Arima(TotalAsIs, order=c(0,1,1), seasonal=c(0,1,1))
Model_Seasonal_ARIMA_2 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,1,1))
Model_Seasonal_ARIMA_3 <- Arima(TotalAsIs, order=c(1,0,1), seasonal=c(1,1,1),include.drift=TRUE)
Model_Seasonal_ARIMA_4 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,3,2))
Model_Seasonal_ARIMA_5 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,4,2))

#################################################################################
#  7.2.3 Auto-ARIMA modelling						                                        #
#################################################################################

# The automatic establishment of an ARIMA model shows that (2,0,1)(0,1,1)
# with drift delivers the best results. 
# AIC=1344.04   AICc=1345.62   BIC=1356.6
# For comparison, here are the results of ModelWithTrendAndSeasonalityOnly with tslm():
#          CV          AIC         AICc          BIC        AdjR2 
# 8.472378e+10    1810.912      1818.281    1842.786    0.9004392 

Model_auto.arima <- auto.arima(TotalAsIs)
Model_auto.arima_forecast <- forecast(Model_auto.arima,h=12)
Model_auto.arima_forecast_df <-as.data.frame(Model_auto.arima_forecast) 
Model_auto.arima_PointForecast <- ts(Model_auto.arima_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

#################################################################################
#  7.3 Dynamic regression models					                                      #
#################################################################################

# Regression models are combined with ARIMA models on order to make sure that
# external factors are included and that the time series are not only forecasted 
# based on past values. A regression of the ARIMA errors should be aspired for. 

# We have to diffentiate, as the time series and the SIGov Indicator are not 
# stationary. So that a forecast can be produced, the indicator has to be lagged
# so that we have values for 2014. 

CEPI_lagged <- ts(c(rep(NA,12),CEPIVector),start=c(2008,1), end=c(2013,12), frequency=12)
CEPI_2014_lagged <- ts(CEPI_2013, start=c(2014,1), end=c(2014,12), frequency=12)

Model_dynreg <- Arima(TotalAsIs, xreg=CEPI_lagged, order=c(2,2,0))
Model_dynreg_auto.arima <- auto.arima(TotalAsIs, xreg=CEPI_lagged)
Model_dynreg_auto.arima_forecast <- forecast(Model_dynreg_auto.arima, xreg=CEPI_2014_lagged,h=12)
Model_dynreg_auto.arima_forecast_df <-as.data.frame(Model_dynreg_auto.arima_forecast) 
Model_dynreg_auto.arima_PointForecast <- ts(Model_dynreg_auto.arima_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)

#################################################################################
###                                                                           ###
### 8. Kappa                                                                  ###
###                                                                           ###
#################################################################################

#################################################################################
#   8.1   Rename the indicators                                                   #
#################################################################################

# In order simplify the use of the indicators when calculating "model.matrix" and thus "kappa", 
# we have renamed the indicators as letters. This enables me to use the function letters[] to call 
# the individual indicators.

a <- CEPIVector 
b <- SIGovVector  
c <- TemperatureVector 
d <- BirthsVector 
e <- SIGovVector 
f <- UrbanoExportsVector 
g <- GlobalisationPartyMembersVector 
h <- AEPIVector 
i <- PPIEtelVector 
j <- NationalHolidaysVector 
k <- ChulwalarIndexVector 
l <- InflationVector 
m <- IndependenceDayPresentsVector 


ListOfIndicators <- list(a,b,c,d,e,f,g,h,i,j,k,l,m)

library(foreach) # to use loops for possible combinations of indicators (introducing models)

#################################################################################
#   8.2   Create the names lists                                                #
#################################################################################


# names for 2 Chulwalar indicators

letter <- expand.grid(x =letters[1:13] ,y = letters[1:13])
newnames2 <- rev(letter)

# names for 3 Chulwalar indicators

letter <- expand.grid(x =letters[1:13] ,y = letters[1:13], z = letters[1:13])
newnames3 <- rev(letter)

indicators <- list(a,b,c,d,e,f,g,h,i,j,k,l,m)


#################################################################################
#   8.3   Kappa calculation with 2 indicators                                   #
#################################################################################


allkappa <- foreach (y = indicators[1:13], .combine = c)  %do% {
  foreach( z = indicators[1:13], .combine =c) %do% {
    kappa(model.matrix(~ y + z))
  }
}

kappasFor2CombinedIndicators <- cbind(allkappa,newnames2)

kappasFor2CombinedIndicators[with(kappasFor2CombinedIndicators, order(allkappa)),]

#################################################################################
#   8.4  Kappa calculation with 3 indicators                                    #
#################################################################################

allkappa <- foreach(x = indicators[1:13], .combine = c) %do% {foreach(y = indicators[1:13], .combine = c)  %do% {
  foreach( z = indicators[1:13], .combine =c) %do% {
    kappa(model.matrix(~ x + y + z))
  }
}
}

kappasFor3CombinedIndicators <- cbind(allkappa,newnames3)

kappasFor3CombinedIndicators[with(kappasFor3CombinedIndicators, order(allkappa)),]

#################################################################################
#   8.5  Interpretation of the kappa values                                     #
#################################################################################

# As a rough guide for regression, values should be below 30 to establish low multicollinearity. 
# The combinations that symmetrically return values of less than 30 when using 2 indicators are 
# "jl", "bc" and "ec" (see clipboard). These could form new models. As Chulwalr's experts' feedback 
# showed most interest in the influence of national holidays and
# inflation, we also included that model for further investigations.
# There are no values which are below 30 when using 3 indicators. Therefore, it is not
# necessary to try out 3 or 4 or more indicators.

#################################################################################
#   8.6  New model                                                              #
#################################################################################

# As trend and seasonality have been shown to forecast well on their own, we will add the new combination to trend and 
# seasonality in order to try to improve the forecast.

# 1. Inflation and NationalHolidays additional
# 2. Seasonality and Trend only


# 1. Inflation and NationalHolidays
ModelWithInflationAndNationalHolidays <- tslm(TotalAsIs ~ trend + season + Inflation + NationalHolidays)

# 2. Seasonality and Trend only (as comparison to 1.)
ModelWithTrendAndSeasonalityOnly <- tslm(TotalAsIs  ~ trend + season)

#################################################################################
#  8.7 Forecasts with the new model                                             #
################################################################################# 

#################################################################################
#  ModelWithInflationAndNationalHolidays                                        #
#################################################################################

# Shorten ModelWithInflationAndNationalHolidays by one year in order to be able to produce a forecast for 2013. 
ModelWithInflationAndNationalHolidays_2012 <- tslm(TotalAsIs_2012 ~ trend + season + Inflation_2012 + NationalHolidays_2012)

# Add "newdata" to the 2013 indicator values for the forecast 
ModelWithInflationAndNationalHolidays_Forecast <- forecast(ModelWithInflationAndNationalHolidays_2012,newdata=data.frame(Inflation_2012=Inflation_2013,NationalHolidays_2012=NationalHolidays_2013),h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithInflationAndNationalHolidays_Forecast_df <-as.data.frame(ModelWithInflationAndNationalHolidays_Forecast) 
ModelWithInflationAndNationalHolidays_PointForecast <- ts(ModelWithInflationAndNationalHolidays_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# A comparison with linear regression also supports the result.
ModelWithInflationAndNationalHolidays_forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithInflationAndNationalHolidays_PointForecast, data = TotalAsIs_2013)

#################################################################################
#  Trend and Seasonality only as benchmark                                      #
#################################################################################

# Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013.
ModelWithTrendAndSeasonalityOnly_2012 <- tslm(TotalAsIs_2012 ~ trend + season)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithTrendAndSeasonalityOnly_Forecast <- forecast(ModelWithTrendAndSeasonalityOnly_2012,h=12)

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the point 
# estimator into a time series. 
ModelWithTrendAndSeasonalityOnly_Forecast_df <-as.data.frame(ModelWithTrendAndSeasonalityOnly_Forecast) 
ModelWithTrendAndSeasonalityOnly_PointForecast <- ts(ModelWithTrendAndSeasonalityOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# A Comparison with linear regression also supports the result.
ModelWithTrendAndSeasonalityOnly_Forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithTrendAndSeasonalityOnly_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)

###############################################################################
# 8.8 Interpretation of the forecasts                                         #
###############################################################################

# Below are the results of chapter 8.7

# AsIs Data for 2013
# summary(TotalAsIs_2013_lm)
# Adjusted R²: 0.8509

# ModelWithInflationAndNationalHolidays 
# 
# cor(ModelWithInflationAndNationalHolidays_PointForecast, TotalAsIs_2013) 
# [1] 0.9598657
# cor(TotalAsIs_2013, TotalPlan_2013)
# [1] 0.929769

# Adjusted R²: 0.9135 


# ModelwithTrendAndSeasonalityOnly

# cor(ModelWithTrendAndSeasonalityOnly_PointForecast, TotalAsIs_2013) 
# [1] 0.9138049
# cor(TotalAsIs_2013, TotalPlan_2013)
# [1] 0.929769

# Adjusted R²: 0.8185

# The better model is ModelWithInflationAndNationalHolidays. It finally outperforms the plan data and provides explanatory potential.

# We will now use the ModelWithInflationAndNationalHolidays to forecast the year 2014

###############################################################################
# 8.9 Forecast for 2014                                                       #
###############################################################################

Forecast_ModelWithInflationAndNationalHolidays_2014 <- forecast(ModelWithInflationAndNationalHolidays, newdata=data.frame(Inflation=Inflation_2014, NationalHolidays=NationalHolidays_2014),h=12)
Forecast_ModelWithInflationAndNationalHolidays_2014_df <-as.data.frame(Forecast_ModelWithInflationAndNationalHolidays_2014) 
Pointforecast_ModelWithInflationAndNationalHolidays_2014 <- ts(Forecast_ModelWithInflationAndNationalHolidays_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
TotalAsIsVector_2014 <- c(ImportedAsIsData[2:13,8])
TotalAsIs_2014 <- ts(TotalAsIsVector_2014, start=c(2014,1), end=c(2014,12), frequency=12)

#################################################################################
###                                                                           ###
###  9. Comparison of the models						            ###
###                                                                           ###
#################################################################################

#plot(TotalAsIs_2014, type="o")
#lines(Model_dynreg_auto.arima_PointForecast, type="o", col="green")
#lines(Model_auto.arima_PointForecast, type="o",col="blue")
#lines(Model_ets_PointForecast, type="o",col="red")
#lines(PointForecast_TrendAndSeasonality_2014, type="o",col="orange")
#lines(Pointforecast_ModelWithInflationAndNationalHolidays_2014, type="o",col="pink")
#lines(TotalPlan_2014, type="o",col="purple")
#legend("topleft",lty=1, pch=1, col=c(1,"purple","red","blue","green","orange","pink"), c("data","Budget","ets/Holt-Winters","ARIMA", "Dynamische Regression","tslm","kappa"))

# Percentual differences

MAPE_AsIs_Plan <- mean(abs(TotalAsIs_2014-TotalPlan_2014)/(TotalAsIs_2014))*100
MAPE_AsIs_LowCorInd <- mean(abs(TotalAsIs_2014-PointForecast_ModelWithLowCorrelatingIndicators_2014)/(TotalAsIs_2014))*100
MAPE_AsIs_TrendSeasonality <- mean(abs(TotalAsIs_2014-PointForecast_TrendAndSeasonality_2014)/(TotalAsIs_2014))*100
MAPE_AsIs_ETSHoltWinters <- mean(abs(TotalAsIs_2014-Model_ets_PointForecast)/(TotalAsIs_2014))*100
MAPE_AsIs_ARIMA <- mean(abs(TotalAsIs_2014-Model_auto.arima_PointForecast)/(TotalAsIs_2014))*100
MAPE_AsIs_DynamicReg <- mean(abs(TotalAsIs_2014-Model_dynreg_auto.arima_PointForecast)/(TotalAsIs_2014))*100
MAPE_AsIs_Kappa <- mean(abs(TotalAsIs_2014-Pointforecast_ModelWithInflationAndNationalHolidays_2014)/(TotalAsIs_2014))*100