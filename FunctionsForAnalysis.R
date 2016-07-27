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
plot(CEPI, main="CEPI")

cor(TotalAsIs, CEPI)
cor(EfakAsIs , CEPI)
cor(WugeAsIs, CEPI)
cor(TotalEtelAsIs, CEPI)
cor(BlueEtelAsIs , CEPI)
cor(RedEtelAsIs , CEPI)

# The CEPI correlates very well with the efak exports.

# Monthly Satisfaction Index (SI) government based data

plot(SIGov, main="SIGov")

cor(TotalAsIs, SIGov)
cor(EfakAsIs , SIGov)
cor(WugeAsIs, SIGov)
cor(TotalEtelAsIs, SIGov)
cor(BlueEtelAsIs , SIGov)
cor(RedEtelAsIs , SIGov)



# The Satisfaction Index does not show any particular correlation with any of 
# the exports data.

# Average monthly temperatures in Chulwalar

plot(Temperature, main="Temperature")

cor(TotalAsIs, Temperature)
cor(EfakAsIs , Temperature)
cor(WugeAsIs, Temperature)
cor(TotalEtelAsIs, Temperature)
cor(BlueEtelAsIs , Temperature)
cor(RedEtelAsIs , Temperature)


# The temperatures have a negative correlation, exports                      
# increase in the colder months. However, the relationship is only stronger 
# with blue Etels.

# Monthly births in Chulwalar 
plot(Births, main="Births")

cor(TotalAsIs, Births)
cor(EfakAsIs , Births)
cor(WugeAsIs, Births)
cor(TotalEtelAsIs, Births)
cor(BlueEtelAsIs , Births)
cor(RedEtelAsIs , Births)


# The consideration by Chulwalar's experts was that expecting new parents to try to export more products to pay for the 
# cost of a new child. However, this could not be confirmed.  

# Monthly Satisfaction Index (SI) external index 
plot(SIExtern, main="SIExtern")

cor(TotalAsIs, SIExtern)
cor(EfakAsIs , SIExtern)
cor(WugeAsIs, SIExtern)
cor(TotalEtelAsIs, SIExtern)
cor(BlueEtelAsIs , SIExtern)
cor(RedEtelAsIs , SIExtern)


# This indicator also has a high correlation with Efak exports. 

# Yearly exports from Urbano
plot(UrbanoExports, main="UrbanoExports")

cor(TotalAsIs, UrbanoExports)
cor(EfakAsIs , UrbanoExports)
cor(WugeAsIs, UrbanoExports)
cor(TotalEtelAsIs, UrbanoExports)
cor(BlueEtelAsIs , UrbanoExports)
cor(RedEtelAsIs , UrbanoExports)


# This indicator also has a high correlation with Efak exports. The Wuge 
# exports also show a correlation. Unfortunatly it was not possible to find
# other useful indicators based on exports from Urbano, due to possible 
# informers being very restrictive with information. 

# Yearly number of Globalisation Party members in Chulwalar
plot(GlobalisationPartyMembers, main="GlobalisationPartyMembers")

cor(TotalAsIs, GlobalisationPartyMembers)
cor(EfakAsIs , GlobalisationPartyMembers)
cor(WugeAsIs, GlobalisationPartyMembers)
cor(TotalEtelAsIs, GlobalisationPartyMembers)
cor(BlueEtelAsIs , GlobalisationPartyMembers)
cor(RedEtelAsIs , GlobalisationPartyMembers)


# There is a similar picture here to that of Urbano Exports.
# It should however be noted that there is a continuos growth here and that
# the yearly view could lead to the data appearing to correlate, although this 
# could just be due to an increase in trend. Although this could also be true
# for the Urbano Exports, the trend seems logical due to the Chulwalar's 
# exports growing in accordance with the Urbano's Exports.

# Monthly Average Export Price Index for Chulwalar
plot(AEPI, main="AEPI")

cor(TotalAsIs, AEPI)
cor(EfakAsIs , AEPI)
cor(WugeAsIs, AEPI)
cor(TotalEtelAsIs, AEPI)
cor(BlueEtelAsIs , AEPI)
cor(RedEtelAsIs , AEPI)


# The continuous growth leads to a good correlation here too.
# See Above

# Monthly Producer Price Index (PPI) for Etel in Chulwalar
plot(PPIEtel, main="PPIEtel")

cor(TotalAsIs, PPIEtel)
cor(EfakAsIs , PPIEtel)
cor(WugeAsIs, PPIEtel)
cor(TotalEtelAsIs, PPIEtel)
cor(BlueEtelAsIs , PPIEtel)
cor(RedEtelAsIs , PPIEtel)


# This indicator does not give the expected results. It does not show any 
# correlation worth mentioning, not even with the Etel segment. 

# National Holidays
plot(NationalHolidays, main="NationalHolidays")

cor(TotalAsIs, NationalHolidays)
cor(EfakAsIs , NationalHolidays)
cor(WugeAsIs, NationalHolidays)
cor(TotalEtelAsIs, NationalHolidays)
cor(BlueEtelAsIs , NationalHolidays)
cor(RedEtelAsIs , NationalHolidays)


# The months April and December do not correlate well with the exports data. 
# However later tests will show that these are worth considering. 
# The missing correlation is just due to the sparse structure of the NationalHolidays time series.

# Chulwalar Index (Total value of all companies in Chulwalar)
plot(ChulwalarIndex, main="ChulwalarIndex")

cor(TotalAsIs, ChulwalarIndex)
cor(EfakAsIs , ChulwalarIndex)
cor(WugeAsIs, ChulwalarIndex)
cor(TotalEtelAsIs, ChulwalarIndex)
cor(BlueEtelAsIs , ChulwalarIndex)
cor(RedEtelAsIs , ChulwalarIndex)


# No particular findings

# Monthly Inflation rate in Chulwalar 
plot(Inflation, main="Inflation")

cor(TotalAsIs, Inflation)
cor(EfakAsIs , Inflation)
cor(WugeAsIs, Inflation)
cor(TotalEtelAsIs, Inflation)
cor(BlueEtelAsIs , Inflation)
cor(RedEtelAsIs , Inflation)


# No particular findings

# Proposed spending for Independence day presents
plot(IndependenceDayPresents, main="IndependenceDayPresents")

cor(TotalAsIs, IndependenceDayPresents)
cor(EfakAsIs , IndependenceDayPresents)
cor(WugeAsIs, IndependenceDayPresents)
cor(TotalEtelAsIs, IndependenceDayPresents)
cor(BlueEtelAsIs , IndependenceDayPresents)
cor(RedEtelAsIs , IndependenceDayPresents)


# No particular findings

# Influence of National Holidays :
# This indicator is an experiment where the influence of National Holidays is 
# extended into the months leading up to the holiday. 
# However later tests show that this indicator is no better for forecasting than the
# orignial National Holidays indicator.    
plot(InfluenceNationalHolidays, main="InfluenceNationalHolidays")

cor(TotalAsIs, InfluenceNationalHolidays)
cor(EfakAsIs , InfluenceNationalHolidays)
cor(WugeAsIs, InfluenceNationalHolidays)
cor(TotalEtelAsIs, InfluenceNationalHolidays)
cor(BlueEtelAsIs , InfluenceNationalHolidays)
cor(RedEtelAsIs , InfluenceNationalHolidays)



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

plot(SIExternOffsetByOneMonth, main="SIExternOffsetByOneMonth")



# Delete December 2013 from the ts 

cor(TotalAsIsWithoutDec12013, SIExternOffsetByOneMonth)
cor(EfakAsIsWithoutDec12013, SIExternOffsetByOneMonth)
cor(WugeAsIsWithoutDec12013, SIExternOffsetByOneMonth)
cor(TotalEtelAsIsWithoutDec12013, SIExternOffsetByOneMonth)
cor(BlueEtelAsIsWithoutDec12013 , SIExternOffsetByOneMonth)
cor(RedEtelAsIsWithoutDec12013, SIExternOffsetByOneMonth)
TotalAsIsWithoutDec2013_lm <- lm(TotalAsIsWithoutDec12013 ~ SIExternOffsetByOneMonth, data=TotalAsIsWithoutDec12013)
summary(TotalAsIsWithoutDec2013_lm)
# The result is not very convincing.

# Offset SIGov Indicator by two months

plot(SIGovShifted2Months)



# Delete November and December 2013 from the ts

cor(TotalAsIsWithoutNovDec2013, SIGovShifted2Months)
cor(EfakAsIsWithoutNovDec2013, SIGovShifted2Months)
cor(WugeAsIsWithoutNovDec2013, SIGovShifted2Months)
cor(TotalEtelAsIsWithoutNovDec2013, SIGovShifted2Months)
cor(BlueEtelAsIsWithoutNovDec2013, SIGovShifted2Months)
cor(RedEtelAsIsWithoutNovDec2013, SIGovShifted2Months)
TotalAsIsWithoutNovDec2013_lm <- lm(TotalAsIsWithoutNovDec2013 ~ SIGovShifted2Months, data=TotalAsIsWithoutNovDec2013)
summary(TotalAsIsWithoutNovDec2013)

# The correlation of the indicators has not really been improved by the
# offsets, so we will not continue with this approach. 

#################################################################################
#  3.3 Correlation of the indicators with each another                          #
################################################################################# 

# In order to test which indicators could be used in a model with eachother,
# we need to look at the correlation of the indicators with eachother. All 
# thirteen indicators will be compared with eachother in a correlation 
# coefficient matrix. First of all it is necessary to summarise all indicators 
# in a matrix.

# Establish the standardised data matrix

IndicatorsmatrixStandardised=scale(IndicatorsMatrix)
IndicatorsmatrixStandardised

# The dimensions of the matrix are determined by the number of indicators.
NumberOfIndicators

# Produce the IndicatorsCorrelationCoefficientMatrix.
IndicatorsCorrelationCoefficientMatrix



# The Correlation Coefficient Matrix shows that CEPI has a high correlation with SIExtern, 
# UrbanoExports, GlobalisationPartyMembers and AEPI . 
# These will become the set of indicators used later, although we are aware of the dangers of multicollinearity.

# However it is interesting to note that NationalHolidays, UrbanoExports, GlobalisationPartyMembers have a very low
# correlation with one another. 
# Therefore these will also  become a set of indicators used later.

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
summary(ModelWithAlllIndicators)
# Adjusted R²: 0.9106

# CEPI:
# The CEPI Indicator correlated best with total exports. Indeed the multiple R² 
# improved the model slighltly compared to the simple ModelWithTrendAndSeasonalityOnly 
# However the adjusted R² remains the same.
summary(ModelWithCEPI)    
# Adjusted R²: 0.9004

# SIGov:
# The Satisfaction Index (gov)  hardly changes the function of the model.
summary(ModelWithSIGov)    
# Adjusted R²: 0.8994

# Temperature:
summary(ModelWithTemperature)
# Adjusted R²: 0.8993 

# Births:
summary(ModelWithBirths) 
# Adjusted R²: 0.9088 

# SIExtern:
summary(ModelWithSIExtern) 
# Adjusted R²: 0.8998 

# UrbanoExports:
# Indicator with adjusted R² shows a better result than the reference model (ModelWithTrendAndSeasonalityOnly).
# The individual months are also very significant.
summary(ModelWithTotalUrbanoExports) 
# Adjusted R²: 0.9005 

# GlobalisationPartyMembers:
summary(ModelWithGlobalisationPartyMembers) 
# Adjusted R²: 0.8991 

# AEPI:
summary(ModelWithAEPI) 
# Adjusted R²: 0.8999

# PPIEtel:
summary(ModelWithPPIEtel)
# Adjusted R²: 0.9003 

# NationalHolidays:
# Indicator with the best adjusted R². The months remain very significant and the indicator
# itself has a p-value of 0,00636**
summary(ModelWithNationalHolidays)
# Adjusted R²: 0.9110 

# ChulwalarIndex:
summary(ModelWithChulwalarIndex) 
# Adjusted R²: 0.9001

# Inflation:
summary(ModelWithInflation)
# Adjusted R²: 0.8989

# IndependenceDayPresents:
summary(ModelWithIndependenceDayPresents)
# Adjusted R²: 0.8993

# InfluenceNationalHolidays:
# Indicator with the best adjusted R². The months remain very significant and the indicator
# itself has a p-value of 0,00636**
summary(ModelWithInfluenceNationalHolidays)
# Adjusted R²: 0.9110 

#################################################################################
#  4.2.1 ModelWithHighCorrelatingIndicators                                     #
################################################################################# 

# In this model only the indicators that correlate well with eachother have been used.  
# See the CorrelationCoefficientMatrix for clarification.
IndicatorsCorrelationCoefficientMatrix

summary(ModelWithHighCorrelatingIndicators) 
# Adjusted R²: 0,8941
# It can be seen that the addition of these indicators causes the seasonality to be weakened. 
# The individual indicators are not very significant either. 
# Is this a multicollinearity effect? Or is it just because we have chose irrelevant indicators? 
# An experimental idea comes from the next section:

#################################################################################
#  4.2.2 ModelWithLowCorrelatingIndicators                                      #
################################################################################# 

# In this model only the indicators that hardly correlate at all with eachother have been used.  
# See the CorrelationCoefficientMatrix for clarification.
IndicatorsCorrelationCoefficientMatrix

summary(ModelWithLowCorrelatingIndicators) 
# Adjusted R²: 0.9097
# It can be seen that the addition of these indicators causes the seasonality to be weakened. 
# The individual indicators are not very significant either. Thus we should continue with
# trend and *seasonality*; the comparison of 4.3 and 4.4 confirms this:  

#################################################################################
#  4.3 ModelWithTrendAndSeasonalityOnly                                         #
#################################################################################

summary(ModelWithTrendAndSeasonalityOnly)
# Adjusted R²: 0,9004
# Remains one of the best models when looking at total exports.

#################################################################################
#  4.4 ModelWithoutTrendAndSeasonality                                          #
#################################################################################

summary(ModelWithoutTrendAndSeasonality)
# Adjusted R²: 0,415

#################################################################################
#  4.5 ModelWithEfakExportsIndicators                                           #
#################################################################################

# ModelWithEfakExportsIndicators will be matched with a set of indicators that correlate with the Efak exports.
# The adjusted R² has the best value. However the diffent months and indicators are not significant apart from 
# GlobaliationPartyMembers. When testing the forecasts based on this model it generated unrealistic exports which were 
# much higher than the As Is data.
summary(ModelWithEfakExportsIndicators)
# Adjusted R²: 0,923

summary(ModelEfakSalesWithCEPI)
# Adjusted R²: 0,9125

# ModelEfakSalesWithTrendAnsSeasonalityOnly does not seem to be anything special, but it returns fairly good results.
summary(ModelEfakSalesWithTrendAnsSeasonalityOnly)
# Adjusted R²: 0,8881

summary(ModelWithCEPIOnly)
# Adjusted R²: 0,8636
# A Forecast based entirely on the CEPI is not convincing.

#################################################################################
#  4.6 ModelWithWugeExportsIndicators                                           #
#################################################################################

# The model does not work as well in the wuge segment as it does in the efak segment. The reason is that trend
# and seasonality are not as convincing here as they were in ModelWugeWithTrendAndSeasonalityOnly when compared
# to ModelWithCEPIOnly.

summary(ModelWithWugeExportsIndicators)
# Adjusted R²: 0,8758

summary(ModelWugeWithCEPI)
# Adjusted R²: 0,8771

summary(ModelWugeWithTrendAndSeasonalityOnly)
# Adjusted R²: 0,8789

#################################################################################
#  4.7 ModelTotalEtel                                                            #
################################################################################# 

# The model for the etel segment, including both subcategories, work best with trend and seasonality. An attempt 
# to improve the model by adding Temperature showed no improvement worth mentioning.  
summary(ModelTotalEtel)
# Adjusted R²: 0,8683

summary(ModelBlueEtel)
# Adjusted R²: 0,6937

summary(ModelRedEtel)
# Adjusted R²: 0,85

#################################################################################
###                                                                           ###
###  5. Forecasts with the models                                             ###
###                                                                           ###
################################################################################# 

#################################################################################
#  5.1 Shorten the time series in order to test the forecasts                   # 
#################################################################################

# Brian: Deleted all objects used in remaining segments of section 5

#################################################################################
#  5.2 Forecasting und testing the models                                       #
#################################################################################

#################################################################################
#  5.2.1.1 Forecast ModelWithHighCorrelatingIndicators                          #
#################################################################################

# Shorten ModelWithHighCorrelatingIndicators by one year in order to be able to produce a forecast for 2013. 
summary(ModelWithHighCorrelatingIndicators_2012) 

# Add "newdata" to the 2013 indicator values for the forecast 
plot(ModelWithHighCorrelatingIndicators_Forecast, main="ModelWithHighCorrelatingIndicators_Forecast")
ModelWithHighCorrelatingIndicators_Forecast

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data. 
cor(ModelWithHighCorrelatingIndicators_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)
summary(ModelWithHighCorrelatingIndicators_forecast_lm)
summary(TotalAsIs_2013_lm)

#################################################################################
#  5.2.1.2 Forecast ModelWithLowCorrelatingIndicators                           #
#################################################################################

# Shorten ModelWithLowCorrelatingIndicators by one year in order to be able to produce a forecast for 2013. 
summary(ModelWithLowCorrelatingIndicators_2012) 

# Add "newdata" to the 2013 indicator values for the forecast 
plot(ModelWithLowCorrelatingIndicators_Forecast, main="ModelWithLowCorrelatingIndicators_Forecast")
ModelWithLowCorrelatingIndicators_Forecast

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data. 
cor(ModelWithLowCorrelatingIndicators_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
summary(ModelWithLowCorrelatingIndicators_forecast_lm)
summary(TotalAsIs_2013_lm)

#################################################################################
#  5.2.2 Forecast ModelWithTrendAndSeasonalityOnly                              #
#################################################################################

# Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013.
summary(ModelWithTrendAndSeasonalityOnly_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithTrendAndSeasonalityOnly_Forecast, main="ModelWithTrendAndSeasonalityOnly_Forecast")
ModelWithTrendAndSeasonalityOnly_Forecast

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithTrendAndSeasonalityOnly_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
summary(ModelWithTrendAndSeasonalityOnly_Forecast_lm)
summary(TotalAsIs_2013_lm)


#################################################################################
#  5.2.3 Forecast ModelWithEfakExportsIndicators                                #
#################################################################################

# Shorten the variables in ModelWithEfakExportsIndicators by one year in order to be able to produce a forecast for 2013.
summary(ModelWithEfakExportsIndicators_2012) 
summary(ModelEfakSalesWithCEPI_2012) 
summary(ModelEfakSalesWithTrendAnsSeasonalityOnly_2012) 
summary(ModelWithCEPIOnly_2012)

# Add "newdata" to the 2013 indicator values for the forecast.
par(mfrow=c(2,2))

plot(ModelWithEfakExportsIndicators_Forecast, main="ModelWithEfakExportsIndicators_Forecast")
plot(ModelEfakSalesWithCEPI_Forecast, main="ModelEfakSalesWithCEPI_Forecast")
plot(ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast, main="ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast")
plot(ModelWithCEPIOnly_Forecast, main="ModelWithCEPIOnly_Forecast")
ModelWithEfakExportsIndicators_Forecast
ModelEfakSalesWithCEPI_Forecast
ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast
ModelWithCEPIOnly_Forecast

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithEfakExportsIndicators_PointForecast, EfakAsIs_2013) 
cor(ModelEfakSalesWithCEPI_PointForecast, EfakAsIs_2013) 
cor(ModelEfakSalesWithTrendAnsSeasonalityOnly_PointForecast, EfakAsIs_2013) 
cor(ModelWithCEPIOnly_PointForecast, EfakAsIs_2013)
cor(EfakAsIs_2013, EfakPlan_2013)

#################################################################################
#  5.2.4 Forecast ModelWithWugeExportsIndicators                                #
#################################################################################

# Shorten the variable in ModelWithWugeExportsIndicators by one year in order to be able to produce a forecast for 2013.
summary(ModelWithWugeExportsIndicators_2012) 
summary(ModelWugeWithCEPI_2012) 
summary(ModelWugeWithTrendAndSeasonalityOnly_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithWugeExportsIndicators_Forecast, main="ModelWithWugeExportsIndicators_Forecast")
plot(ModelWugeWithCEPI_Forecast, main="ModelWugeWithEPI_Forecast")
plot(ModelWugeWithTrendAndSeasonalityOnly_Forecast, main="ModelWugeWithTrendAndSeasonalityOnly_Forecast")
ModelWithWugeExportsIndicators_Forecast
ModelWugeWithCEPI_Forecast
ModelWugeWithTrendAndSeasonalityOnly_Forecast



# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series. 

# Correlation of the forecasts and As Is data. As a comparison, the correlation of the As Is data for 2013 with the Plan Data.
cor(ModelWithWugeExportsIndicators_PointForecast, WugeAsIs_2013) 
cor(ModelWugeWithCEPI_PointForecast, WugeAsIs_2013) 
cor(ModelWugeWithTrendAndSeasonalityOnly_PointForecast, WugeAsIs_2013) 
cor(WugeAsIs_2013, WugePlan_2013)

#################################################################################
#  5.2.5 Forecast ModelTotalEtel                                                 #
#################################################################################

# Shorten the variables in ModelTotalEtel by one year in order to be able to produce a forecast for 2013.
summary(ModelTotalEtel_2012) 
summary(ModelBlueEtel_2012) 
summary(ModelRedEtel_2012) 

# Forecast
plot(ModelTotalEtel_Forecast,main="ModelTotalEtel_Forecast")
plot(ModelBlueEtel_Forecast,main="ModelBlueEtel_Forecast")
plot(ModelRedEtel_Forecast,main="ModelRedEtel_Forecast")
ModelTotalEtel_Forecast
ModelBlueEtel_Forecast
ModelRedEtel_Forecast



# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelTotalEtel_PointForecast, TotalEtelAsIs_2013) 
cor(TotalEtelPlan_2013, TotalEtelAsIs_2013)
cor(ModelBlueEtel_PointForecast, BlueEtelAsIs_2013) 
cor(BlueEtelPlan_2013, BlueEtelAsIs_2013)
cor(ModelRedEtel_PointForecast, RedEtelAsIs_2013) 
cor(RedEtelPlan_2013, RedEtelAsIs_2013)

#################################################################################
#  5.2.6 Forecast ModelWithTotalUrbanoExports                                   #
#################################################################################

# Shorten the variables in ModelWithTotalUrbanoExports by one year in order to be able to produce a forecast for 2013.
summary(ModelWithTotalUrbanoExports_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithTotalUrbanoExports_Forecast,main="ModelWithTotalUrbanoExports_Forecast")
ModelWithTotalUrbanoExports_Forecast



# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series. 

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithTotalUrbanoExports_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

#################################################################################
#  5.2.7 Forecast ModelWithNationalHolidays                                      #
#################################################################################

# Shorten the variables in ModelWithNationalHolidays by one year in order to be able to produce a forecast for 2013.
summary(ModelWithNationalHolidays_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithNationalHolidays_Forecast,main="ModelWithNationalHolidays_Forecast")
ModelWithNationalHolidays_Forecast



# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series.

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is data for 2013 with the Plan Data.
cor(ModelWithNationalHolidays_PointForecast, TotalAsIs_2013) 

#################################################################################
#  5.2.8 Forecast ModelWithInfluenceNationalHolidays                             #
#################################################################################

# Shorten the variables in ModelWithInfluenceNationalHolidays by one year in order to be able to produce a forecast for 2013.
summary(ModelWithInfluenceNationalHolidays_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithInfluenceNationalHolidays_Forecast,main="ModelWithInfluenceNationalHolidays_Forecast")
ModelWithInfluenceNationalHolidays_Forecast



# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithInfluenceNationalHolidays_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

cor(TotalAsIs_2013, TotalPlan_2013)

#################################################################################
###                                                                           ###
###  6. Forecast for 2014                                                     ###
###                                                                           ###
#################################################################################


# As ModelWithLowCorrelatingIndicators was the one of best fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality and NationalHolidays, UrbanoExports and GlobalisationPartyMembers. 
summary(ModelWithLowCorrelatingIndicators) 
plot(Forecast_ModelWithLowCorrelatingIndicators_2014, main="Forecast_2014")





PointForecast_ModelWithLowCorrelatingIndicators_2014

cor(TotalAsIs_2014,TotalPlan_2014)
cor(TotalAsIs_2014,PointForecast_ModelWithLowCorrelatingIndicators_2014)


# As ModelWithTrendAndSeasonalityOnly also gave a well fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality. 
summary(ModelWithTrendAndSeasonalityOnly) 
plot(Forecast_2014, main="Forecast_2014")



PointForecast_TrendAndSeasonality_2014

cor(TotalAsIs_2014,TotalPlan_2014)
cor(TotalAsIs_2014,PointForecast_TrendAndSeasonality_2014)

# Output instruction for the data export of the results for further use in Excel. 
#write.csv(PointForecast_TrendAndSeasonality_2014,file='PointForecast_TrendAndSeasonality_2014.csv')

### ALTERNATIVE###
# As the indiators NationalHolidays delievered a good result, but could not convince in the 2013 forecast,
# it could be possible that the data for 2013 was to blame. Therefore there is another Forecast using the
# ModelWithNationalHolidays
summary(ModelWithNationalHolidays)
plot(Forecast_2014_alternative,main="Forecast_2014_alternative")



PointForecast_2014_alternative

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

summary(Model_ses)
plot(Model_ses)

# The Akaike's Information Criterion(AIC/AICc) or the Bayesian Information 
# Criterion (BIC) should be at minimum.

plot(Model_ses, plot.conf=FALSE, ylab="Exports Chulwalar  )", xlab="Year", main="", fcol="white", type="o")
lines(fitted(Model_ses), col="green", type="o")
lines(Model_ses$mean, col="blue", type="o")
legend("topleft",lty=1, col=c(1,"green"), c("data", expression(alpha == 0.671)),pch=1)


#################################################################################
#  7.1.2 Holt's linear trend method                                             #
#################################################################################

# Holt added to the model in order to forecast using trends as well.
# For this it is necessary to add a beta, which determines the trend.
# If neither alpha nor beta is stated, both parameters will be optimised
# using ets(). 

summary(Model_holt_1)
plot(Model_holt_1)

# The trend is exponential if the intercepts(level) and the gradient (slope) are
# multiplied with eachother. The values are worse. As the Beta was very low in 
# the optimisation, the forecast is very similar to the ses() model. 


summary(Model_holt_2)
plot(Model_holt_2)

# As such simple trends tend to forecast the future to positively, we have added
# a dampener.
# Similar values to that of Model_holt_1 

summary(Model_holt_3)
plot(Model_holt_3)

# This also works for exponential trends. 
# The values remain worse. 

summary(Model_holt_4)
plot(Model_holt_4)


# level and slope can be plotted individually for each model. 
plot(Model_holt_1$model$state)
plot(Model_holt_2$model$state)
plot(Model_holt_3$model$state)
plot(Model_holt_4$model$state)

plot(Model_holt_1, plot.conf=FALSE, ylab="Exports Chulwalar  )", xlab="Year", main="", fcol="white", type="o")
lines(fitted(Model_ses), col="purple", type="o")
lines(fitted(Model_holt_1), col="blue", type="o")
lines(fitted(Model_holt_2), col="red", type="o")
lines(fitted(Model_holt_3), col="green", type="o")
lines(fitted(Model_holt_4), col="orange", type="o")
lines(Model_ses$mean, col="purple", type="o")
lines(Model_holt_1$mean, col="blue", type="o")
lines(Model_holt_2$mean, col="red", type="o")
lines(Model_holt_3$mean, col="green", type="o")
lines(Model_holt_4$mean, col="orange", type="o")
legend("topleft",lty=1, col=c(1,"purple","blue","red","green","orange"), c("data", "SES","Holts auto", "Exponential", "Additive Damped", "Multiplicative Damped"),pch=1)

# As these forecasts are not very convincing at the moment, there is no need 
# to export the data.

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

summary(Model_hw_1)
plot(Model_hw_1)
#     AIC     AICc      BIC 
#2127.984 2137.875 2164.411 

summary(Model_hw_2)
plot(Model_hw_2)
#     AIC     AICc      BIC 
#2137.673 2147.564 2174.100 

# The additive model gives slightly better results than the multiplicative model.

plot(Model_hw_1, ylab="Exports Chulwalar  ", plot.conf=FALSE, type="o", fcol="white", xlab="Year")
lines(fitted(Model_hw_1), col="red", lty=2)
lines(fitted(Model_hw_2), col="green", lty=2)
lines(Model_hw_1$mean, type="o", col="red")
lines(Model_hw_2$mean, type="o", col="green")
legend("topleft",lty=1, pch=1, col=1:3, c("data","Holt Winters' Additive","Holt Winters' Multiplicative"))

# In order to use the results later, they need to be converted into point forcasts.
Model_hw_1_PointForecast
Model_hw_2_PointForecast

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

summary(Model_ets)

plot(Model_ets)
plot(Model_ets_forecast)
#     AIC     AICc      BIC 
#2127.984 2137.875 2164.411 

# In order to use the results later, they need to be converted into point forcasts.
Model_ets_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_ets_PointForecast,file='Model_ets_PointForecast.csv')


#################################################################################
#  7.2 ARIMA       							                                                #
#################################################################################

### AR = Autoregression
# A Regression of a variable with itself. The autoregressive model specifies 
# that the output variable depends linearly on its own previous values.

### MA = Moving Average
# The rolling average of past forecast errors.
# This model should not be confused with moving average smoothing, which is used
# for establishing trends and is based on past values. 

### ARIMA = AutoRegressive Integrated Moving Average model
# A combination of Differencing, Autoregression and Moving Average.
# Integration is the opposite of differencing.

### Differencing
# In order to make the time series stationary, it is necessary to difference.
# Firstly, we need to check if the data are already stationary. This can be done
# with help of the Augmented Dickey-Fuller Test
adf.test(TotalAsIs, alternative = "stationary")
# The p-value is less than 0,05. This means that the data is stationary, 
# as the 0-Hypothesis of the test is "The data are not stationary".

# Another possibility is the Kwiatkowski-Phillips-Schmidt-Shin Test
kpss.test(TotalAsIs)
# This test swaps the hypothesis so that a low p-value means that it
# is necessary to difference. The p-value here is under 0,01 and a warning
# is shown.

# As the test failed to deliver a clear result, the data will be differenced 
# and then retested. 


adf.test(ChulwalarDiff, alternative = "stationary")
kpss.test(ChulwalarDiff)
# The kpss.test now has a p-value of more than 0,1, which hints that the data
# is stationary. 

tsdisplay(ChulwalarDiff)
# However this plot shows that the months correlate stongly with the values
# from the previous year. This plot shows a  ACF
# (autocorrelation function) and a PACF (partial autocorrelation function).

# The folling is a test method to distinguish the number of "normal" 
# differencing rounds and seasonal differencing rounds. 
# Seasonal differencing is used for data which is dominated by seasonality.
# The time series has been assigned a lag.

nd # Number of normal differencing rounds
ns # Number of seasonal differencing rounds
xstar # The output "xstar" has been differenced correctly. 
tsdisplay(xstar)

# If "lag" is set to 12, this is equivalent to 1* seasonal differencing

adf.test(ChulwalarDiff_lag, alternative = "stationary")
kpss.test(ChulwalarDiff_lag)

tsdisplay(ChulwalarDiff)
tsdisplay(ChulwalarDiff_lag)

plot(ChulwalarDiff)
lines(ChulwalarDiff_lag, col="red") 
# The time series appears much more "stationary".

#################################################################################
#  7.2.1 ARIMA modelling						                                            #
#################################################################################

# The values for AIC, AICc and BIC should be minimised.
# We wil try a range of combinations.

# R uses the maximum likelihood estimation (MLE) in order to decide how good
# a certain model is. The parameters, which give the most likely model based on the given data, are chosen.
# Furthermore, R gives the log-likelihood, which should be maximised. 

summary(Model_ARIMA_1 )
plot(forecast(Model_ARIMA_1 ))
#AIC=2101.93   AICc=2101.99   BIC=2104.19

summary(Model_ARIMA_2)
plot(forecast(Model_ARIMA_2))
#AIC=2099.2   AICc=2099.38   BIC=2103.72

summary(Model_ARIMA_3)
plot(forecast(Model_ARIMA_3))
#AIC=2093.09   AICc=2093.45   BIC=2099.88

summary(Model_ARIMA_4)
plot(forecast(Model_ARIMA_4))
#AIC=2095.08   AICc=2095.68   BIC=2104.13

summary(Model_ARIMA_5)
plot(forecast(Model_ARIMA_5))
#AIC=2091.07   AICc=2092   BIC=2102.39

summary(Model_ARIMA_6)
plot(forecast(Model_ARIMA_6))
#AIC=2092.3   AICc=2093.61   BIC=2105.87

summary(Model_ARIMA_7)
plot(forecast(Model_ARIMA_7))
#AIC=2094.03   AICc=2095.81   BIC=2109.87

summary(Model_ARIMA_8)
plot(forecast(Model_ARIMA_8))
#AIC=2096.57   AICc=2097.5   BIC=2107.89

summary(Model_ARIMA_9)
plot(forecast(Model_ARIMA_9))
#AIC=2092.3   AICc=2093.61   BIC=2105.87

summary(Model_ARIMA_10)
plot(forecast(Model_ARIMA_10))
#AIC=2096.69   AICc=2097.61   BIC=2108

summary(Model_ARIMA_11)
plot(forecast(Model_ARIMA_11))
#AIC=2085.22   AICc=2086.53   BIC=2098.8

summary(Model_ARIMA_12)
plot(forecast(Model_ARIMA_12))
#AIC=2065.39   AICc=2066.72   BIC=2078.88

summary(Model_ARIMA_13)
plot(forecast(Model_ARIMA_13))
#AIC=2061.27   AICc=2062.22   BIC=2072.44

Acf(residuals(Model_ARIMA_13))
Box.test(residuals(Model_ARIMA_13), lag=12, fitdf=4, type="Ljung")
# The Ljung-Box Test has H0: The data are independently distributed 
# und Ha: The data are not independently distributed. 

# Just like the remainder showed before, there is a definite coherence#  

#################################################################################
#  7.2.2 Seasonal ARIMA modelling   				                                    #
#################################################################################

# This model integrates the seasonal aspect into the ARIMA model. As the previous
# models all had a peak in lag 12, it seems viable that the data are seasonal. 

tsdisplay(residuals(Model_Seasonal_ARIMA_0))
summary(Model_Seasonal_ARIMA_0)
#AIC=2105.79   AICc=2106.14   BIC=2112.62

summary(Model_Seasonal_ARIMA_1)
plot(forecast(Model_Seasonal_ARIMA_1))
#AIC=1672.88   AICc=1673.31   BIC=1679.11

# Insert the values from the previous chapter for the non-seasonal values. 
tsdisplay(residuals(Model_Seasonal_ARIMA_2))
summary(Model_Seasonal_ARIMA_2)
plot(forecast(Model_Seasonal_ARIMA_2))
# AIC=1630.23   AICc=1632.51   BIC=1644.53

# Good results when using drift.
tsdisplay(residuals(Model_Seasonal_ARIMA_3))
summary(Model_Seasonal_ARIMA_3)
plot(forecast(Model_Seasonal_ARIMA_3))
# AIC=1355.99   AICc=1357.58   BIC=1368.56

tsdisplay(residuals(Model_Seasonal_ARIMA_4))
summary(Model_Seasonal_ARIMA_4)
plot(forecast(Model_Seasonal_ARIMA_4))
# AIC=1630.23   AICc=1632.51   BIC=1644.53
# The stronger the seasonality is differenced, the better the results are. However the 
# plot shows that the data are being increasingly changed. 

tsdisplay(residuals(Model_Seasonal_ARIMA_5))
summary(Model_Seasonal_ARIMA_5)
plot(forecast(Model_Seasonal_ARIMA_5))
# AIC=765   AICc=777   BIC=773.36

# The more the seasonal aspect is changed, the better the results based on AIC,
# AICc and BIC. Theoretically the models should more and more suitable for the forecast.
# However, a look at the plot of the forecasts shows that the changes are making the 
# data less and less convincing and thus unuseable. 


#################################################################################
#  7.2.3 Auto-ARIMA modelling						                                        #
#################################################################################

# The automatic establishment of an ARIMA model shows that (2,0,1)(0,1,1)
# with drift delivers the best results. 
# AIC=1344.04   AICc=1345.62   BIC=1356.6
# For comparison, here are the results of ModelWithTrendAndSeasonalityOnly with tslm():
#          CV          AIC         AICc          BIC        AdjR2 
# 8.472378e+10    1810.912      1818.281    1842.786    0.9004392 

summary(Model_auto.arima)
CV(ModelWithTrendAndSeasonalityOnly)

Acf(residuals(Model_auto.arima))
Box.test(residuals(Model_auto.arima), lag=12, fitdf=4, type="Ljung")
# The Ljung-Box Test has H0: The data are independently distributed 
# and Ha: The data are not independently distributed. The results show: White noise

plot(Model_auto.arima_forecast)
Model_auto.arima_forecast

Model_auto.arima_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_auto.arima_PointForecast,file='Model_auto.arima_PointForecast.csv')

#################################################################################
#  7.3 Dynamic regression models					                                      #
#################################################################################

# Regression models are combined with ARIMA models on order to make sure that
# external factors are included and that the time series are not only forecasted 
# based on past values. A regression of the ARIMA errors should be aspired for. 

# We have to diffentiate, as the time series and the SIGov Indicator are not 
# stationary. So that a forecast can be produced, the indicator has to be lagged
# so that we have values for 2014. 

tsdisplay(arima.errors(Model_dynreg), main="ARIMA errors")
summary(Model_dynreg)

summary(Model_dynreg_auto.arima)
tsdisplay(arima.errors(Model_dynreg_auto.arima), main="ARIMA errors")
# ARIMA(2,0,1)(0,1,1)[12] with drift 
# AIC=1343.61   AICc=1345.76   BIC=1358.27


Acf(residuals(Model_dynreg_auto.arima))
Box.test(residuals(Model_dynreg_auto.arima), lag=12, fitdf=4, type="Ljung")
# The Ljung-Box Test has H0: The data are independently distributed 
# and Ha: The data are not independently distributed. The results show: 
# White noise

summary(Model_dynreg_auto.arima)
plot(Model_dynreg_auto.arima_forecast)
Model_dynreg_auto.arima_forecast

Model_dynreg_auto.arima_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_dynreg_auto.arima_PointForecast,file='Model_dynreg_auto.arima_PointForecast.csv')

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

ListOfIndicators

# library(foreach) # to use loops for possible combinations of indicators (introducing models)

#################################################################################
#   8.2   Create the names lists                                                #
#################################################################################


# names for 2 Chulwalar indicators

# names for 3 Chulwalar indicators


#################################################################################
#   8.3   Kappa calculation with 2 indicators                                   #
#################################################################################


kappasFor2CombinedIndicators[with(kappasFor2CombinedIndicators, order(allkappa)),]

#################################################################################
#   8.4  Kappa calculation with 3 indicators                                    #
#################################################################################

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
summary(ModelWithInflationAndNationalHolidays)
# Adjusted R²: 0.9099

# 2. Seasonality and Trend only (as comparison to 1.)
summary(ModelWithTrendAndSeasonalityOnly)
# Adjusted R²: 0,9004

# The Adjusted R² for ModelWithTrendAndSeasonalityOnly was 0,9004, hence the value for "Inflation and NationalHolidays", 
# is slightly better.
# We will forecast with the model and then compare 
# to the AsIs and Plan data for 2013.


#################################################################################
#  8.7 Forecasts with the new model                                             #
################################################################################# 

#################################################################################
#  ModelWithInflationAndNationalHolidays                                        #
#################################################################################

# Shorten ModelWithInflationAndNationalHolidays by one year in order to be able to produce a forecast for 2013. 
summary(ModelWithInflationAndNationalHolidays_2012) 

# Add "newdata" to the 2013 indicator values for the forecast 
plot(ModelWithInflationAndNationalHolidays_Forecast, main="ModelWithInflationAndNationalHolidays_Forecast")
ModelWithInflationAndNationalHolidays_Forecast

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan data. 
cor(ModelWithInflationAndNationalHolidays_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A comparison with linear regression also supports the result.
summary(ModelWithInflationAndNationalHolidays_forecast_lm)
summary(TotalAsIs_2013_lm)

#################################################################################
#  Trend and Seasonality only as benchmark                                      #
#################################################################################

# Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013.
summary(ModelWithTrendAndSeasonalityOnly_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithTrendAndSeasonalityOnly_Forecast, main="ModelWithTrendAndSeasonalityOnly_Forecast")
ModelWithTrendAndSeasonalityOnly_Forecast

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the point 
# estimator into a time series. 

# Correlation of the forecasts and As Is data. As a comparison, the correlation of the As Is Data for 2013 with the Plan data.
cor(ModelWithTrendAndSeasonalityOnly_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
summary(ModelWithTrendAndSeasonalityOnly_Forecast_lm)
summary(TotalAsIs_2013_lm)


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

summary(ModelWithInflationAndNationalHolidays)
plot(Forecast_ModelWithInflationAndNationalHolidays_2014,main="Forecast_ModelWithInflationAndNationalHolidays_2014")



Pointforecast_ModelWithInflationAndNationalHolidays_2014

TotalAsIsVector_2014
TotalAsIs_2014
cor(TotalAsIs_2014,Pointforecast_ModelWithInflationAndNationalHolidays_2014)



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

cor(TotalAsIs_2014,TotalPlan_2014)
# 0.9448221
cor(TotalAsIs_2014,PointForecast_ModelWithLowCorrelatingIndicators_2014)
# 0.9178468
cor(TotalAsIs_2014,PointForecast_TrendAndSeasonality_2014)
# 0.9349765
cor(TotalAsIs_2014,Model_ets_PointForecast)
# 0.9311129
cor(TotalAsIs_2014,Model_auto.arima_PointForecast)
# 0.9238591
cor(TotalAsIs_2014,Model_dynreg_auto.arima_PointForecast)
# 0.9259971
cor(TotalAsIs_2014,Pointforecast_ModelWithInflationAndNationalHolidays_2014)
# 0.917632

# Percentual differences

MAPE_AsIs_Plan
MAPE_AsIs_LowCorInd
MAPE_AsIs_TrendSeasonality
MAPE_AsIs_ETSHoltWinters
MAPE_AsIs_ARIMA
MAPE_AsIs_DynamicReg
MAPE_AsIs_Kappa

#################################################################################
###                                                                           ###
###  10. Summary of results        					                  ###
###                                                                           ###
#################################################################################


# Planning was already unusually exact before we introduced forecasting methods out of Rob Hyndman's toolbox to Chulwalar.
# The situation was very challenging. Finally, our efforts brought up two models, which are able to compete with Chulwalar's planners:
# We found one model based on trend, season, inflation and national holidays, which has a high explanatory potential and correlates highly
# with as-is-data on the one hand. A Holt-Winters model with trend and seasonality was able forecast more exactly than plan data in terms of percentual 
# differences on the other hand.

# Looking at the results from an explanatory perspective, the course of our analysis dropped too detailed 
# additional economic indicators. That makes Chulwalar a rather unusual island and seems surprising first.
# It might be the case, that this economy exports goods to a market, which very often just completely absorbes the goods.
# Internal planning has already a huge influence on the results under such circumstances. 
# In this case, planning would more an independent statement on what is intended to do and less a reaction to market expectations. 

# Anyway, the best performing models we found are either based on  
# historic sales only (as the Holt-Winters family) or only dependent on 
# influences (as inflation), which are more general than the very specific economic indicators
# collected and explored at the beginning of this case study. 

# Moreover, "traditional" planning in Chulwalar comes at a cost (as Chulwalar's experts conspiratively admitted). 
# It keeps several persons busy over months. Pretty much of the forecasts by the models 
# in this case study can be calculated automatedly instead. 
# Planning in Chulwalar was a repeated effort with fine-grained monthly adjustments and guesses, whereas we are able to 
# gain almost the same precision one year ahead in our simulation. 

# We had to include almost every approach from the ones presented in Hyndman's fpp this time. But applying the
# successful models for future forecasts should be quick and easy. From the perspective of
# automated decision support, our case study suggests a lean approach to planning. 
