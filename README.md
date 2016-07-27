---
title: "Chulwalhar Flower Exports: Time Series Data Modeling and Forecasting"
authors: "Brian Less, Araya Messa, Tony Garza"
date: "July 24, 2016"
output: 
  html_document:
    keep_md: TRUE
---
# Introduction

Chulwalhar, part an of island group in the northern hemisphere, is known for the winter-blooming plants. They export Efak, Wuge, and Etel with known increases in exports toward end of year. We will be performing exploratory data analysis and determining the best forecasting model along this time series data. Some important points to note are that Chulwalhar celebrates independence on December 1st and the March equinox, so we will be evaluating these observations moving through our analysis. We will be determining which are influencing indicators for Prime Minister of Chulwalhar, who is the orignator of this request.

## Project Setup and Required Packages

```{r, message=FALSE, results="hide"}
setwd("C:/Users/thisi/OneDrive/git_repositories/CaseStudy10_LeeMessaGarza")
library(fpp) # must install.packages("fpp", repos = "https://cran.revolutionanalytics.com")
library(foreach) # must install.packages("foreach", repos = "https://cran.revolutionanalytics.com")
```

## Import and Data Cleanup

```{r}
source("ImportAndCleanupData.R")
```

Importing and tidying data from the files: ImportedAsIsDataChulwalar.csv, ImportedPlanDataChulwalar.csv, and ImportedIndicatorsChulwalar.csv.

## Defined Objects
```{r}
source("DefinedObjects.R")
```

All Objects loaded for exploration and analysis

# Exploration of Chulwalar Data

## Definition of the Indicators and Their Correlation with the Basic Data

### Monthly Change in Export Price Index (CEPI)

```{r}
plot(CEPI, main="CEPI")

cor(TotalAsIs, CEPI)
cor(EfakAsIs , CEPI)
cor(WugeAsIs, CEPI)
cor(TotalEtelAsIs, CEPI)
cor(BlueEtelAsIs , CEPI)
cor(RedEtelAsIs , CEPI)
```

The CEPI correlates very well with the efak exports.

### Monthly Satisfaction Index (SI) government based data

```{r}
plot(SIGov, main="SIGov")

cor(TotalAsIs, SIGov)
cor(EfakAsIs , SIGov)
cor(WugeAsIs, SIGov)
cor(TotalEtelAsIs, SIGov)
cor(BlueEtelAsIs , SIGov)
cor(RedEtelAsIs , SIGov)
```

The Satisfaction Index does not show any particular correlation with any of the exports data.

### Average monthly temperatures in Chulwalar

```{r}
plot(Temperature, main="Temperature")

cor(TotalAsIs, Temperature)
cor(EfakAsIs , Temperature)
cor(WugeAsIs, Temperature)
cor(TotalEtelAsIs, Temperature)
cor(BlueEtelAsIs , Temperature)
cor(RedEtelAsIs , Temperature)
```

The temperatures have a negative correlation, exports increase in the colder months. However, the relationship is only stronger with blue Etels.

### Monthly births in Chulwalar

```{r}
plot(Births, main="Births")

cor(TotalAsIs, Births)
cor(EfakAsIs , Births)
cor(WugeAsIs, Births)
cor(TotalEtelAsIs, Births)
cor(BlueEtelAsIs , Births)
cor(RedEtelAsIs , Births)
```

The consideration by Chulwalar's experts was that expecting new parents to try to export more products to pay for the cost of a new child. However, this could not be confirmed.  

### Monthly Satisfaction Index (SI) external index 

```{r}
plot(SIExtern, main="SIExtern")

cor(TotalAsIs, SIExtern)
cor(EfakAsIs , SIExtern)
cor(WugeAsIs, SIExtern)
cor(TotalEtelAsIs, SIExtern)
cor(BlueEtelAsIs , SIExtern)
cor(RedEtelAsIs , SIExtern)
```

This indicator also has a high correlation with Efak exports. 

### Yearly Exports from Urbano

```{r}
plot(UrbanoExports, main="UrbanoExports")

cor(TotalAsIs, UrbanoExports)
cor(EfakAsIs , UrbanoExports)
cor(WugeAsIs, UrbanoExports)
cor(TotalEtelAsIs, UrbanoExports)
cor(BlueEtelAsIs , UrbanoExports)
cor(RedEtelAsIs , UrbanoExports)
```

This indicator also has a high correlation with Efak exports. The Wuge exports also show a correlation. Unfortunatly it was not possible to find other useful indicators based on exports from Urbano, due to possible informers being very restrictive with information. 

### Yearly number of Globalisation Party members in Chulwalar

```{r}
plot(GlobalisationPartyMembers, main="GlobalisationPartyMembers")

cor(TotalAsIs, GlobalisationPartyMembers)
cor(EfakAsIs , GlobalisationPartyMembers)
cor(WugeAsIs, GlobalisationPartyMembers)
cor(TotalEtelAsIs, GlobalisationPartyMembers)
cor(BlueEtelAsIs , GlobalisationPartyMembers)
cor(RedEtelAsIs , GlobalisationPartyMembers)
```

There is a similar picture here to that of Urbano Exports. It should however be noted that there is a continuous growth here and that the yearly view could lead to the data appearing to correlate, although this could just be due to an increase in trend. Although this could also be true for the Urbano Exports, the trend seems logical due to the Chulwalar's exports growing in accordance with the Urbano's Exports.

### Monthly Average Export Price Index for Chulwalar

```{r}
plot(AEPI, main="AEPI")

cor(TotalAsIs, AEPI)
cor(EfakAsIs , AEPI)
cor(WugeAsIs, AEPI)
cor(TotalEtelAsIs, AEPI)
cor(BlueEtelAsIs , AEPI)
cor(RedEtelAsIs , AEPI)
```

The continuous growth leads to a good correlation here too.

### Monthly Producer Price Index (PPI) for Etel in Chulwalar

```{r}
plot(PPIEtel, main="PPIEtel")

cor(TotalAsIs, PPIEtel)
cor(EfakAsIs , PPIEtel)
cor(WugeAsIs, PPIEtel)
cor(TotalEtelAsIs, PPIEtel)
cor(BlueEtelAsIs , PPIEtel)
cor(RedEtelAsIs , PPIEtel)
```

This indicator does not give the expected results. It does not show any correlation worth mentioning, not even with the Etel segment. 

### National Holidays

```{r}
plot(NationalHolidays, main="NationalHolidays")

cor(TotalAsIs, NationalHolidays)
cor(EfakAsIs , NationalHolidays)
cor(WugeAsIs, NationalHolidays)
cor(TotalEtelAsIs, NationalHolidays)
cor(BlueEtelAsIs , NationalHolidays)
cor(RedEtelAsIs , NationalHolidays)
```

The months April and December do not correlate well with the exports data. However later tests will show that these are worth considering. The missing correlation is just due to the sparse structure of the NationalHolidays time series.

### Chulwalar Index (Total value of all companies in Chulwalar)

```{r}
plot(ChulwalarIndex, main="ChulwalarIndex")

cor(TotalAsIs, ChulwalarIndex)
cor(EfakAsIs , ChulwalarIndex)
cor(WugeAsIs, ChulwalarIndex)
cor(TotalEtelAsIs, ChulwalarIndex)
cor(BlueEtelAsIs , ChulwalarIndex)
cor(RedEtelAsIs , ChulwalarIndex)
```

No particular findings.

### Monthly Inflation rate in Chulwalar

```{r}
plot(Inflation, main="Inflation")

cor(TotalAsIs, Inflation)
cor(EfakAsIs , Inflation)
cor(WugeAsIs, Inflation)
cor(TotalEtelAsIs, Inflation)
cor(BlueEtelAsIs , Inflation)
cor(RedEtelAsIs , Inflation)
```

No particular findings.

### Proposed spending for National Holidays

```{r}
plot(IndependenceDayPresents, main="IndependenceDayPresents")

cor(TotalAsIs, IndependenceDayPresents)
cor(EfakAsIs , IndependenceDayPresents)
cor(WugeAsIs, IndependenceDayPresents)
cor(TotalEtelAsIs, IndependenceDayPresents)
cor(BlueEtelAsIs , IndependenceDayPresents)
cor(RedEtelAsIs , IndependenceDayPresents)
```

No particular findings.

### Influence of National Holiday

```{r}
plot(InfluenceNationalHolidays, main="InfluenceNationalHolidays")

cor(TotalAsIs, InfluenceNationalHolidays)
cor(EfakAsIs , InfluenceNationalHolidays)
cor(WugeAsIs, InfluenceNationalHolidays)
cor(TotalEtelAsIs, InfluenceNationalHolidays)
cor(BlueEtelAsIs , InfluenceNationalHolidays)
cor(RedEtelAsIs , InfluenceNationalHolidays)
```

This indicator is an experiment where the influence of National Holidays is extended into the months leading up to the holiday. However later tests show that this indicator is no better for forecasting than the orignial National Holidays indicator.   

## Correlation of the indicators with each another 

```{r, results="hide"}
IndicatorsmatrixStandardised
```

Establish the standardised data matrix

```{r}
NumberOfIndicators
```

The dimensions of the matrix are determined by the number of indicators.

```{r}
IndicatorsCorrelationCoefficientMatrix
```

Produce the IndicatorsCorrelationCoefficientMatrix.

## ModelWithAlllIndicators and With Each Indicator Individually

### All Indiators in one model:

```{r}
summary(ModelWithAlllIndicators)
```

### CEPI:

```{r}
summary(ModelWithCEPI)
```

The CEPI Indicator correlated best with total exports. Indeed the multiple R² improved the model slighltly compared to the simple ModelWithTrendAndSeasonalityOnly. However, the adjusted R² remains the same.


### SIGov:

```{r}
summary(ModelWithSIGov) 
```
   
The Satisfaction Index (gov)  hardly changes the function of the model.

### Temperature:

```{r}
summary(ModelWithTemperature)
```

### Births:

```{r}
summary(ModelWithBirths) 
```

### SIExtern:

```{r}
summary(ModelWithSIExtern) 
```

### UrbanoExports:

```{r}
summary(ModelWithTotalUrbanoExports) 
```

Indicator with adjusted R² shows a better result than the reference model (ModelWithTrendAndSeasonalityOnly). The individual months are also very significant.

### GlobalisationPartyMembers:

```{r}
summary(ModelWithGlobalisationPartyMembers) 
```

### AEPI:

```{r}
summary(ModelWithAEPI)
```

### PPIEtel:
```{r}
summary(ModelWithPPIEtel)
```


### NationalHolidays:
```{r}
summary(ModelWithNationalHolidays)
```

### ChulwalarIndex:

```{r}
summary(ModelWithChulwalarIndex) 
```

### Inflation:

```{r}
summary(ModelWithInflation)
```

### IndependenceDayPresents:

```{r}
summary(ModelWithIndependenceDayPresents)
```

### InfluenceNationalHolidays:

```{r}
summary(ModelWithInfluenceNationalHolidays)
```

Indicator with the best adjusted R². The months remain very significant and the indicator itself has a p-value of 0.00636

## *Results Summary*  
CEPI: Adjusted R² = 0.9004  
SIGov: Adjusted R² = 0.8994  
Temperature: Adjusted R² = 0.8993  
Births: Adjusted R² = 0.9088  
SIExtern: Adjusted R² = 0.8998  
UrbanoExports: Adjusted R² = 0.9005  
GlobalisationPartyMembers: Adjusted R² = 0.8991  
AEPI: Adjusted R² = 0.8999  
PPIEtel: Adjusted R² = 0.9003  
**NationalHolidays: Adjusted R² = 0.9110**  
ChulwalarIndex: Adjusted R² = 0.9001  
Inflation: Adjusted R² = 0.8989  
IndependenceDayPresents: Adjusted R² = 0.8993  
**InfluenceNationalHolidays: Adjusted R² = 0.9110**  

## ModelWithHighCorrelatingIndicators 

```{r}
IndicatorsCorrelationCoefficientMatrix
summary(ModelWithHighCorrelatingIndicators)
```

## ModelWithLowCorrelatingIndicators  

```{r}
IndicatorsCorrelationCoefficientMatrix
summary(ModelWithLowCorrelatingIndicators)
```

## ModelWithTrendAndSeasonalityOnly

```{r}
summary(ModelWithTrendAndSeasonalityOnly)
```

## ModelWithoutTrendAndSeasonality

```{r}
summary(ModelWithoutTrendAndSeasonality)
```

## ModelWithEfakExportsIndicators

```{r}
summary(ModelWithEfakExportsIndicators)
summary(ModelEfakSalesWithCEPI)
summary(ModelEfakSalesWithTrendAnsSeasonalityOnly)
summary(ModelWithCEPIOnly)

```

## ModelWithWugeExportsIndicators

```{r}
summary(ModelWithWugeExportsIndicators)
summary(ModelWugeWithCEPI)
summary(ModelWugeWithTrendAndSeasonalityOnly)
```

## ModelTotalEtel 

```{r}
summary(ModelTotalEtel)
summary(ModelBlueEtel)
summary(ModelRedEtel)
```

## *Results Summary*  
ModelWithHighCorrelatingIndicators: Adjusted R² = 0,8941  
ModelWithLowCorrelatingIndicators: Adjusted R² = 0.9097  
ModelWithTrendAndSeasonalityOnly: Adjusted R² = 0.9004  
ModelWithoutTrendAndSeasonality: Adjusted R² = 0.415  
**ModelWithEfakExportsIndicators: Adjusted R² = 0.923**  
ModelEfakSalesWithCEPI: Adjusted R² = 0.9125  
ModelEfakSalesWithTrendAnsSeasonalityOnly: Adjusted R² = 0.8881  
ModelWithCEPIOnly: Adjusted R² = 0.8636  
ModelWithWugeExportsIndicators: Adjusted R² = 0.8758  
ModelWugeWithCEPI: Adjusted R² = 0.8771  
ModelWugeWithTrendAndSeasonalityOnly: Adjusted R² = 0.8789  
ModelTotalEtel: Adjusted R² = 0.8683  
ModelBlueEtel: Adjusted R² = 0.6937  
ModelRedEtel: Adjusted R² = 0.85  


##############################

# Analysis

This section will include forecasting/testing of different models as well as with analyzing alternative model approaches.

## Basic Data and Time Series

```{r}
par(mfrow=c(3,2))

plot(TotalAsIs, col="black", main="TotalAsIs")
plot(EfakAsIs , col="red",main="EfakAsIs")
plot(WugeAsIs, col="blue", main="WugeAsIs")
plot(TotalEtelAsIs, col="green",main="TotalEtelAsIs")
plot(BlueEtelAsIs, col="orange", main="BlueEtelAsIs")
plot(RedEtelAsIs, col="purple", main="RedEtelAsIs")

plot(TotalPlan , col="black", main="TotalPlan")
plot(EfakPlan , col="red",main="EfakPlan")
plot(WugePlan, col="blue", main="WugePlan")
plot(TotalEtelPlan, col="green",main="TotalEtelPlan")
plot(BlueEtelPlan, col="orange", main="BlueEtelPlan")
plot(RedEtelPlan, col="purple", main="RedEtelPlan")
```

```{r}
cor(TotalAsIs, TotalPlan )
cor(EfakAsIs , EfakPlan)
cor(WugeAsIs, WugePlan)
cor(TotalEtelAsIs, TotalEtelPlan)
cor(BlueEtelAsIs , BlueEtelPlan)
cor(RedEtelAsIs , RedEtelPlan)
cor(YearAsIs, YearPlan)
```

```{r}
par(mfrow=c(3,2))

plot(TotalAsIs_stl, col="black", main="TotalAsIs_stl")
TotalAsIs_stl

plot(EfakAsIs_stl, col="black", main="EfakAsIs_stl")
EfakAsIs_stl

plot(WugeAsIs_stl, col="black", main="WugeAsIs_stl")
WugeAsIs_stl

plot(TotalEtelAsIs_stl, col="black", main="TotalEtelAsIs_stl")
TotalEtelAsIs_stl

plot(BlueEtelAsIs_stl, col="black", main="BlueEtelAsIs_stl")
BlueEtelAsIs_stl

plot(RedEtelAsIs_stl, col="black", main="RedEtelAsIs_stl")
RedEtelAsIs_stl

par(mfrow=c(3,2))

plot(TotalAsIs_stl$time.series[,"trend"], col="black")
plot(EfakAsIs_stl$time.series[,"trend"], col="red")
plot(WugeAsIs_stl$time.series[,"trend"], col="blue")
plot(TotalEtelAsIs_stl$time.series[,"trend"], col="green")
plot(BlueEtelAsIs_stl$time.series[,"trend"], col="orange")
plot(RedEtelAsIs_stl$time.series[,"trend"], col="purple")
```

## Forecasts with the models 

First shorten the time series in order to test the forecasts. Shortening the exports data and indicators in the Time Series in order to be able to compare the produced forecasts with the As Is data.
```{r, echo=FALSE, results="hide"}
# Shorten exports data
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
```
## Forecasting and testing the models                                      
###  Forecast ModelWithHighCorrelatingIndicators                          
Shorten ModelWithHighCorrelatingIndicators by one year in order to be able to produce a forecast for 2013. 

```{r}
ModelWithHighCorrelatingIndicators_2012 <- tslm(TotalAsIs_2012 ~ trend + season + CEPI_2012 + SIExtern_2012 + UrbanoExports_2012 + GlobalisationPartyMembers_2012 + AEPI_2012)
summary(ModelWithHighCorrelatingIndicators_2012) 

# Add "newdata" to the 2013 indicator values for the forecast 
ModelWithHighCorrelatingIndicators_Forecast <- forecast(ModelWithHighCorrelatingIndicators_2012,newdata=data.frame(CEPI_2012=CEPI_2013, SIExtern_2012=SIExtern_2013, UrbanoExports_2012= UrbanoExports_2013, GlobalisationPartyMembers_2012=GlobalisationPartyMembers_2013, AEPI_2012=AEPI_2013),h=12)
plot(ModelWithHighCorrelatingIndicators_Forecast, main="ModelWithHighCorrelatingIndicators_Forecast")
ModelWithHighCorrelatingIndicators_Forecast

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithHighCorrelatingIndicators_Forecast_df <-as.data.frame(ModelWithHighCorrelatingIndicators_Forecast) 
ModelWithHighCorrelatingIndicators_PointForecast <- ts(ModelWithHighCorrelatingIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data. 
cor(ModelWithHighCorrelatingIndicators_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
ModelWithHighCorrelatingIndicators_forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithHighCorrelatingIndicators_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)
summary(ModelWithHighCorrelatingIndicators_forecast_lm)
summary(TotalAsIs_2013_lm)
```

### Forecast ModelWithLowCorrelatingIndicators                         

Shorten ModelWithLowCorrelatingIndicators by one year in order to be able to produce a forecast for 2013. 

```{r}
ModelWithLowCorrelatingIndicators_2012 <- tslm(TotalAsIs_2012 ~ trend + season + NationalHolidays_2012 + UrbanoExports_2012 + GlobalisationPartyMembers_2012)
summary(ModelWithLowCorrelatingIndicators_2012) 

# Add "newdata" to the 2013 indicator values for the forecast 
ModelWithLowCorrelatingIndicators_Forecast <- forecast(ModelWithLowCorrelatingIndicators_2012,newdata=data.frame(NationalHolidays_2012=NationalHolidays_2013, UrbanoExports_2012= UrbanoExports_2013, GlobalisationPartyMembers_2012=GlobalisationPartyMembers_2013),h=12)
plot(ModelWithLowCorrelatingIndicators_Forecast, main="ModelWithLowCorrelatingIndicators_Forecast")
ModelWithLowCorrelatingIndicators_Forecast

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithLowCorrelatingIndicators_Forecast_df <-as.data.frame(ModelWithLowCorrelatingIndicators_Forecast) 
ModelWithLowCorrelatingIndicators_PointForecast <- ts(ModelWithLowCorrelatingIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data. 
cor(ModelWithLowCorrelatingIndicators_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
ModelWithLowCorrelatingIndicators_forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithLowCorrelatingIndicators_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)
summary(ModelWithLowCorrelatingIndicators_forecast_lm)
summary(TotalAsIs_2013_lm)
```

### Forecast ModelWithTrendAndSeasonalityOnly                            

Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013.

```{r}
ModelWithTrendAndSeasonalityOnly_2012 <- tslm(TotalAsIs_2012 ~ trend + season)
summary(ModelWithTrendAndSeasonalityOnly_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithTrendAndSeasonalityOnly_Forecast <- forecast(ModelWithTrendAndSeasonalityOnly_2012,h=12)
plot(ModelWithTrendAndSeasonalityOnly_Forecast, main="ModelWithTrendAndSeasonalityOnly_Forecast")
ModelWithTrendAndSeasonalityOnly_Forecast

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithTrendAndSeasonalityOnly_Forecast_df <-as.data.frame(ModelWithTrendAndSeasonalityOnly_Forecast) 
ModelWithTrendAndSeasonalityOnly_PointForecast <- ts(ModelWithTrendAndSeasonalityOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithTrendAndSeasonalityOnly_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
ModelWithTrendAndSeasonalityOnly_Forecast_lm <- lm(TotalAsIs_2013 ~ ModelWithTrendAndSeasonalityOnly_PointForecast, data = TotalAsIs_2013)
TotalAsIs_2013_lm <- lm(TotalAsIs_2013 ~ TotalPlan_2013, data = TotalAsIs_2013)
summary(ModelWithTrendAndSeasonalityOnly_Forecast_lm)
summary(TotalAsIs_2013_lm)
```

### Forecast ModelWithEfakExportsIndicators                        

Shorten the variables in ModelWithEfakExportsIndicators by one year in order to be able to produce a forecast for 2013.

```{r}
ModelWithEfakExportsIndicators_2012 <- tslm(EfakAsIs_2012 ~ trend + season + CEPI_2012 + UrbanoExports_2012 + AEPI_2012)
ModelEfakSalesWithCEPI_2012 <- tslm(EfakAsIs_2012 ~ trend + season + CEPI_2012)
ModelEfakSalesWithTrendAnsSeasonalityOnly_2012 <- tslm(EfakAsIs_2012 ~ trend + season)
ModelWithCEPIOnly_2012 <- tslm(EfakAsIs_2012 ~ CEPI_2012)
summary(ModelWithEfakExportsIndicators_2012) 
summary(ModelEfakSalesWithCEPI_2012) 
summary(ModelEfakSalesWithTrendAnsSeasonalityOnly_2012) 
summary(ModelWithCEPIOnly_2012)

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithEfakExportsIndicators_Forecast <- forecast(ModelWithEfakExportsIndicators_2012, newdata=data.frame(CEPI_2012=CEPI_2013, UrbanoExports_2012 = UrbanoExports_2013, AEPI_2012 = AEPI_2013),h=12)
ModelEfakSalesWithCEPI_Forecast <- forecast(ModelEfakSalesWithCEPI_2012,newdata=data.frame(CEPI_2012=CEPI_2013), h=12)
ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast <- forecast(ModelEfakSalesWithTrendAnsSeasonalityOnly_2012,h=12)
ModelWithCEPIOnly_Forecast <- forecast(ModelWithCEPIOnly_2012,newdata=data.frame(CEPI_2012=CEPI_2013), h=12)

par(mfrow=c(2,2))

plot(ModelWithEfakExportsIndicators_Forecast, main="ModelWithEfakExportsIndicators_Forecast")
plot(ModelEfakSalesWithCEPI_Forecast, main="ModelEfakSalesWithCEPI_Forecast")
plot(ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast, main="ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast")
plot(ModelWithCEPIOnly_Forecast, main="ModelWithCEPIOnly_Forecast")
ModelWithEfakExportsIndicators_Forecast
ModelEfakSalesWithCEPI_Forecast
ModelEfakSalesWithTrendAnsSeasonalityOnly_Forecast
ModelWithCEPIOnly_Forecast


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

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithEfakExportsIndicators_PointForecast, EfakAsIs_2013) 
cor(ModelEfakSalesWithCEPI_PointForecast, EfakAsIs_2013) 
cor(ModelEfakSalesWithTrendAnsSeasonalityOnly_PointForecast, EfakAsIs_2013) 
cor(ModelWithCEPIOnly_PointForecast, EfakAsIs_2013)
cor(EfakAsIs_2013, EfakPlan_2013)
```

### Forecast ModelWithWugeExportsIndicators                                

Shorten the variable in ModelWithWugeExportsIndicators by one year in order to be able to produce a forecast for 2013.

```{r}
ModelWithWugeExportsIndicators_2012 <- tslm(WugeAsIs_2012 ~ trend + season + CEPI_2012 + UrbanoExports_2012 + AEPI_2012 + GlobalisationPartyMembers_2012)
ModelWugeWithCEPI_2012 <- tslm(WugeAsIs_2012 ~ trend + season + CEPI_2012)
ModelWugeWithTrendAndSeasonalityOnly_2012 <- tslm(WugeAsIs_2012 ~ trend + season)
summary(ModelWithWugeExportsIndicators_2012) 
summary(ModelWugeWithCEPI_2012) 
summary(ModelWugeWithTrendAndSeasonalityOnly_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithWugeExportsIndicators_Forecast <- forecast(ModelWithWugeExportsIndicators_2012, newdata=data.frame(CEPI_2012=CEPI_2013, UrbanoExports_2012 = UrbanoExports_2013, AEPI_2012 = AEPI_2013, GlobalisationPartyMembers_2012 = GlobalisationPartyMembers_2013),h=12)
ModelWugeWithCEPI_Forecast <- forecast(ModelWugeWithCEPI_2012,newdata=data.frame(CEPI_2012=CEPI_2013), h=12)
ModelWugeWithTrendAndSeasonalityOnly_Forecast <- forecast(ModelWugeWithTrendAndSeasonalityOnly_2012,h=12)

plot(ModelWithWugeExportsIndicators_Forecast, main="ModelWithWugeExportsIndicators_Forecast")
plot(ModelWugeWithCEPI_Forecast, main="ModelWugeWithEPI_Forecast")
plot(ModelWugeWithTrendAndSeasonalityOnly_Forecast, main="ModelWugeWithTrendAndSeasonalityOnly_Forecast")
ModelWithWugeExportsIndicators_Forecast
ModelWugeWithCEPI_Forecast
ModelWugeWithTrendAndSeasonalityOnly_Forecast


# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithWugeExportsIndicators_Forecast_df <-as.data.frame(ModelWithWugeExportsIndicators_Forecast) 
ModelWugeWithCEPI_Forecast_df <-as.data.frame(ModelWugeWithCEPI_Forecast) 
ModelWugeWithTrendAndSeasonalityOnly_Forecast_df <-as.data.frame(ModelWugeWithTrendAndSeasonalityOnly_Forecast)
ModelWithWugeExportsIndicators_PointForecast <- ts(ModelWithWugeExportsIndicators_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelWugeWithCEPI_PointForecast <- ts(ModelWugeWithCEPI_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelWugeWithTrendAndSeasonalityOnly_PointForecast <- ts(ModelWugeWithTrendAndSeasonalityOnly_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is data. As a comparison, the correlation of the As Is data for 2013 with the Plan Data.
cor(ModelWithWugeExportsIndicators_PointForecast, WugeAsIs_2013) 
cor(ModelWugeWithCEPI_PointForecast, WugeAsIs_2013) 
cor(ModelWugeWithTrendAndSeasonalityOnly_PointForecast, WugeAsIs_2013) 
cor(WugeAsIs_2013, WugePlan_2013)
```

### Forecast ModelTotalEtel                                                 
Shorten the variables in ModelTotalEtel by one year in order to be able to produce a forecast for 2013.

```{r}
ModelTotalEtel_2012 <- tslm(TotalEtelAsIs_2012 ~ trend + season)
ModelBlueEtel_2012 <- tslm(BlueEtelAsIs_2012 ~ trend + season)
ModelRedEtel_2012 <- tslm(RedEtelAsIs_2012 ~ trend + season)
summary(ModelTotalEtel_2012) 
summary(ModelBlueEtel_2012) 
summary(ModelRedEtel_2012) 

# Forecast
ModelTotalEtel_Forecast <- forecast(ModelTotalEtel_2012,h=12)
ModelBlueEtel_Forecast <- forecast(ModelBlueEtel_2012,h=12)
ModelRedEtel_Forecast <- forecast(ModelRedEtel_2012,h=12)


plot(ModelTotalEtel_Forecast,main="ModelTotalEtel_Forecast")
plot(ModelBlueEtel_Forecast,main="ModelBlueEtel_Forecast")
plot(ModelRedEtel_Forecast,main="ModelRedEtel_Forecast")
ModelTotalEtel_Forecast
ModelBlueEtel_Forecast
ModelRedEtel_Forecast


# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.
ModelTotalEtel_Forecast_df <-as.data.frame(ModelTotalEtel_Forecast) 
ModelBlueEtel_Forecast_df <-as.data.frame(ModelBlueEtel_Forecast) 
ModelRedEtel_Forecast_df <-as.data.frame(ModelRedEtel_Forecast) 
ModelTotalEtel_PointForecast <- ts(ModelTotalEtel_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelBlueEtel_PointForecast <- ts(ModelBlueEtel_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)
ModelRedEtel_PointForecast <- ts(ModelRedEtel_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelTotalEtel_PointForecast, TotalEtelAsIs_2013) 
cor(TotalEtelPlan_2013, TotalEtelAsIs_2013)
cor(ModelBlueEtel_PointForecast, BlueEtelAsIs_2013) 
cor(BlueEtelPlan_2013, BlueEtelAsIs_2013)
cor(ModelRedEtel_PointForecast, RedEtelAsIs_2013) 
cor(RedEtelPlan_2013, RedEtelAsIs_2013)
```

### Forecast ModelWithTotalUrbanoExports                                   
Shorten the variables in ModelWithTotalUrbanoExports by one year in order to be able to produce a forecast for 2013.

```{r}
ModelWithTotalUrbanoExports_2012 <- tslm(TotalAsIs_2012 ~ trend + season + UrbanoExports_2012)
summary(ModelWithTotalUrbanoExports_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithTotalUrbanoExports_Forecast <- forecast(ModelWithTotalUrbanoExports_2012, newdata=data.frame(UrbanoExports_2012=UrbanoExports_2013), h=12)
plot(ModelWithTotalUrbanoExports_Forecast,main="ModelWithTotalUrbanoExports_Forecast")
ModelWithTotalUrbanoExports_Forecast


# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series. 
ModelWithTotalUrbanoExports_Forecast_df <-as.data.frame(ModelWithTotalUrbanoExports_Forecast) 
ModelWithTotalUrbanoExports_PointForecast <- ts(ModelWithTotalUrbanoExports_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithTotalUrbanoExports_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)
```

### Forecast ModelWithNationalHolidays                                      
Shorten the variables in ModelWithNationalHolidays by one year in order to be able to produce a forecast for 2013.

```{r}
ModelWithNationalHolidays_2012 <- tslm(TotalAsIs_2012 ~ trend + season + NationalHolidays_2012)
summary(ModelWithNationalHolidays_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithNationalHolidays_Forecast <- forecast(ModelWithNationalHolidays_2012, newdata=data.frame(NationalHolidays_2012=NationalHolidays_2013), h=12)
plot(ModelWithNationalHolidays_Forecast,main="ModelWithNationalHolidays_Forecast")
ModelWithNationalHolidays_Forecast


# In order to be able to correlate the Forecast with the As Is data, it is necessary to convert the Point 
# Estimator into a time series.
ModelWithNationalHolidays_Forecast_df <-as.data.frame(ModelWithNationalHolidays_Forecast) 
ModelWithNationalHolidays_PointForecast <- ts(ModelWithNationalHolidays_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is data for 2013 with the Plan Data.
cor(ModelWithNationalHolidays_PointForecast, TotalAsIs_2013) 
```

### Forecast ModelWithInfluenceNationalHolidays 

Shorten the variables in ModelWithInfluenceNationalHolidays by one year in order to be able to produce a forecast for 2013.

```{r}
ModelWithInfluenceNationalHolidays_2012 <- tslm(TotalAsIs_2012 ~ trend + season + InfluenceNationalHolidays_2012)
summary(ModelWithInfluenceNationalHolidays_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
ModelWithInfluenceNationalHolidays_Forecast <- forecast(ModelWithInfluenceNationalHolidays_2012, newdata=data.frame(InfluenceNationalHolidays_2012=InfluenceNationalHolidaysVector_2013), h=12)
plot(ModelWithInfluenceNationalHolidays_Forecast,main="ModelWithInfluenceNationalHolidays_Forecast")
ModelWithInfluenceNationalHolidays_Forecast

# In order to be able to correlate the Forecast with the As Is Data, it is necessary to convert the Point 
# Estimator into a time series.
ModelWithInfluenceNationalHolidays_Forecast_df <-as.data.frame(ModelWithInfluenceNationalHolidays_Forecast) 
ModelWithInfluenceNationalHolidays_PointForecast <- ts(ModelWithInfluenceNationalHolidays_Forecast_df$"Point Forecast", start=c(2013,1), end=c(2013,12), frequency=12)

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan Data.
cor(ModelWithInfluenceNationalHolidays_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

cor(TotalAsIs_2013, TotalPlan_2013)
```

## Forecast for 2014                                                     

As ModelWithLowCorrelatingIndicators was the one of best fitting model for a forecast, the exports data for 2014 will be forecast based on trend and seasonality and NationalHolidays, UrbanoExports and GlobalisationPartyMembers. 

```{r}
summary(ModelWithLowCorrelatingIndicators) 
Forecast_ModelWithLowCorrelatingIndicators_2014 <- forecast(ModelWithLowCorrelatingIndicators,newdata=data.frame(NationalHolidays=NationalHolidays_2014, UrbanoExports= UrbanoExports_2014, GlobalisationPartyMembers=GlobalisationPartyMembers_2014),h=12)
plot(Forecast_ModelWithLowCorrelatingIndicators_2014, main="Forecast_2014")


Forecast_ModelWithLowCorrelatingIndicators_2014_df <-as.data.frame(Forecast_ModelWithLowCorrelatingIndicators_2014) 
PointForecast_ModelWithLowCorrelatingIndicators_2014 <- ts(Forecast_ModelWithLowCorrelatingIndicators_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
PointForecast_ModelWithLowCorrelatingIndicators_2014

cor(TotalAsIs_2014,TotalPlan_2014)
cor(TotalAsIs_2014,PointForecast_ModelWithLowCorrelatingIndicators_2014)


# As ModelWithTrendAndSeasonalityOnly also gave a well fitting model for a forecast, the exports data for 2014 will be forecast
# based on trend and seasonality. 
summary(ModelWithTrendAndSeasonalityOnly) 
Forecast_2014 <- forecast(ModelWithTrendAndSeasonalityOnly,h=12)
plot(Forecast_2014, main="Forecast_2014")


Forecast_2014_df <-as.data.frame(Forecast_2014) 
PointForecast_TrendAndSeasonality_2014 <- ts(Forecast_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
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
Forecast_2014_alternative <- forecast(ModelWithNationalHolidays, newdata=data.frame(NationalHolidays=NationalHolidays_2014),h=12)
plot(Forecast_2014_alternative,main="Forecast_2014_alternative")


Forecast_2014_alternative_df <-as.data.frame(Forecast_2014_alternative) 
PointForecast_2014_alternative <- ts(Forecast_2014_alternative_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
PointForecast_2014_alternative

# Output instruction for the data export of the results for further use in Excel.
#write.csv(PointForecast_2014_alternative,file='PointForecast_2014_alternative.csv')
```

## Developing forecasting models with alternative model approaches
We are going to develop different forecasting models and determine which we believe to be the best model by anayzing the Akaike's Information Criterion(AIC/AICc) and the Bayesian Information Criterion (BIC) for each as well as looking at the various error indicators. The minimum values of each will be desired.

### Simple Exponential Smoothing

Exponential Smoothing uses past values to calculate a forecast. The strength with which each value influences the forecast is weakened with help of a smoothing parameter. Thus we are dealing with a weighted average, whose values fade out the longer ago they were in the past.
Formula: ses(). It must be decided if alpha (the smoothing parameter should be automatically calculated. If initial=simple, the alpha value can be set to any chosen value, if initial=optimal (or nothing, as this is the 
default), alpha will be set to the optimal value based on ets().
h=12 gives the number of cycles for the forecast.

```{r}
Model_ses <- ses(TotalAsIs, h=12)
summary(Model_ses)
plot(Model_ses)

# The Akaike's Information Criterion(AIC/AICc) or the Bayesian Information 
# Criterion (BIC) should be at minimum.

plot(Model_ses, plot.conf=FALSE, ylab="Exports Chulwalar  )", xlab="Year", main="", fcol="white", type="o")
lines(fitted(Model_ses), col="green", type="o")
lines(Model_ses$mean, col="blue", type="o")
legend("topleft",lty=1, col=c(1,"green"), c("data", expression(alpha == 0.671)),pch=1)
```

###  Holt's linear trend method                                             
Holt added to the model in order to forecast using trends as well. For this it is necessary to add a beta, which determines the trend. If neither alpha nor beta is stated, both parameters will be optimised using ets(). 

```{r}
Model_holt_1 <- holt(TotalAsIs,h=12)
summary(Model_holt_1)
plot(Model_holt_1)

# The trend is exponential if the intercepts(level) and the gradient (slope) are
# multiplied with each other. The values are worse. As the Beta was very low in 
# the optimization, the forecast is very similar to the ses() model. 


Model_holt_2<- holt(TotalAsIs, exponential=TRUE,h=12)
summary(Model_holt_2)
plot(Model_holt_2)

# As such simple trends tend to forecast the future too positively, we have added
# a dampener.
# Similar values to that of Model_holt_1 

Model_holt_3 <- holt(TotalAsIs, damped=TRUE,h=12)
summary(Model_holt_3)
plot(Model_holt_3)

# This also works for exponential trends. 
# The values remain worse. 

Model_holt_4 <- holt(TotalAsIs, exponential=TRUE, damped=TRUE,h=12)
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
```

### Holt-Winter's seasonal method                                          

Holt and Winters have expanded Holt's model further to include the seasonality aspect. The parameter gamma, which is for smoothing the seasonality, was added to achieve this. The values are better than the models without seasonality. This logically matches our results from the regression approaches, the data is strongly influenced by seasonality. In the following model, none of the parameters are given so that they will be optimised automatically. There are two models: one using an additive error model method and one using a multiplicative error model.

```{r}
Model_hw_1 <- hw(TotalAsIs ,seasonal="additive",h=12)
summary(Model_hw_1)
plot(Model_hw_1)

Model_hw_2 <- hw(TotalAsIs ,seasonal="multiplicative",h=12)
summary(Model_hw_2)
plot(Model_hw_2)

# The additive model gives slightly better results than the multiplicative model.

plot(Model_hw_1, ylab="Exports Chulwalar  ", plot.conf=FALSE, type="o", fcol="white", xlab="Year")
lines(fitted(Model_hw_1), col="red", lty=2)
lines(fitted(Model_hw_2), col="green", lty=2)
lines(Model_hw_1$mean, type="o", col="red")
lines(Model_hw_2$mean, type="o", col="green")
legend("topleft",lty=1, pch=1, col=1:3, c("data","Holt Winters' Additive","Holt Winters' Multiplicative"))
```

SES AIC:       2230.058
SES RMSE:    609507.0
HOLT AIC:      2235.888
HOLT RMSE:   608787.2
HOLT_E AIC:    2253.216
HOLT_E RMSE: 609906.7
###HW_A AIC:     2124.856 HW Additive Model is our choice for best model
HW_A RMSE:  241685.0
HW_M AIC:     2128.303
HW_M RMSE:  235296.6
### The HW additive model gives slightly better AIC results than the multiplicative model. One can make a case for the multiplicative model as AICs are similar and the RMSE for the multiplicative model is 3% less than the additive. However, the seasonal data is roughly constant throughout the series it is best to go with the additive model.

```{r}
# In order to use the results later, they need to be converted into point forcasts.
Model_hw_1_df <-as.data.frame(Model_hw_1) 
Model_hw_1_PointForecast <- ts(Model_hw_1_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Model_hw_1_PointForecast
Model_hw_2_df <-as.data.frame(Model_hw_2) 
Model_hw_2_PointForecast <- ts(Model_hw_2_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Model_hw_2_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_hw_1_PointForecast,file='Model_hw_1_PointForecast.csv')
#write.csv(Model_hw_2_PointForecast,file='Model_hw_2_PointForecast.csv')
```

### Innovations state space models for exponential smoothing               

The funktion ets() produces a model with the same values as Model_hw_1. The reason for this is that all of the parameters in this model were optimised using the ets() function. The results are a ets(A,A,A) model which is an  additive method for trend, seasonality and errors. The previous models also showed the type of ets() model in their summary. In this case the user parameters were either accepted or rejected. As the model has been set to "ZZZ", the best model will be automatically chosen. 

```{r}
Model_ets <-ets(TotalAsIs, model="ZZZ", damped=NULL, alpha=NULL, beta=NULL, gamma=NULL, phi=NULL, additive.only=FALSE, lambda=NULL, lower=c(rep(0.0001,3), 0.8), upper=c(rep(0.9999,3),0.98), opt.crit=c("lik","amse","mse","sigma","mae"), nmse=3, bounds=c("both","usual","admissible"), ic=c("aicc","aic","bic"), restrict=TRUE)
summary(Model_ets)

plot(Model_ets)
Model_ets_forecast <- forecast(Model_ets,h=12)
plot(Model_ets_forecast)
#     AIC     AICc      BIC 
#2127.984 2137.875 2164.411 

# In order to use the results later, they need to be converted into point forcasts.
Model_ets_forecast_df <-as.data.frame(Model_ets_forecast) 
Model_ets_PointForecast <- ts(Model_ets_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Model_ets_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_ets_PointForecast,file='Model_ets_PointForecast.csv')
```

## ARIMA       							                                              

AR = Autoregression
A Regression of a variable with itself. The autoregressive model specifies that the output variable depends linearly on its own previous values.
<br/>
MA = Moving Average
The rolling average of past forecast errors. This model should not be confused with moving average smoothing, which is used for establishing trends and is based on past values. 
<br/>
ARIMA = AutoRegressive Integrated Moving Average model
A combination of Differencing, Autoregression and Moving Average. Integration is the opposite of differencing.

Differencing
In order to make the time series stationary, it is necessary to difference. Firstly, we need to check if the data are already stationary. This can be done with help of the Augmented Dickey-Fuller Test
```{r}
adf.test(TotalAsIs, alternative = "stationary")
#The p-value is less than 0,05. This means that the data is stationary, 
# as the 0-Hypothesis of the test is "The data are not stationary".

# Another possibility is the Kwiatkowski-Phillips-Schmidt-Shin Test
kpss.test(TotalAsIs)
# This test swaps the hypothesis so that a low p-value means that it
# is necessary to difference. The p-value here is under 0,01 and a warning
# is shown.

# As the test failed to deliver a clear result, the data will be differenced 
# and then retested. 

ChulwalarDiff <- diff(TotalAsIs)

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

nd # Number of normal differencing rounds
ns # Number of seasonal differencing rounds
xstar # The output "xstar" has been differenced correctly. 
tsdisplay(xstar)

# If "lag" is set to 12, this is equivalent to 1* seasonal differencing
ChulwalarDiff_lag <- diff(TotalAsIs,lag=12)

adf.test(ChulwalarDiff_lag, alternative = "stationary")
kpss.test(ChulwalarDiff_lag)

tsdisplay(ChulwalarDiff)
tsdisplay(ChulwalarDiff_lag)

plot(ChulwalarDiff)
lines(ChulwalarDiff_lag, col="red") 
# The time series appears much more "stationary".
```

###  ARIMA modeling						                                            
The values for AIC, AICc and BIC should be minimised. We wil try a range of combinations.
R uses the maximum likelihood estimation (MLE) in order to decide how good a certain model is. The parameters, which give the most likely model based on the given data, are chosen. Furthermore, R gives the log-likelihood, which should be maximised. 

```{r}
Model_ARIMA_1  <- Arima(TotalAsIs, order=c(0,1,0))
summary(Model_ARIMA_1 )
plot(forecast(Model_ARIMA_1 ))
#AIC=2101.93   AICc=2101.99   BIC=2104.19

Model_ARIMA_2 <- Arima(TotalAsIs, order=c(1,1,0))
summary(Model_ARIMA_2)
plot(forecast(Model_ARIMA_2))
#AIC=2099.2   AICc=2099.38   BIC=2103.72

Model_ARIMA_3 <- Arima(TotalAsIs, order=c(1,1,1))
summary(Model_ARIMA_3)
plot(forecast(Model_ARIMA_3))
#AIC=2093.09   AICc=2093.45   BIC=2099.88

Model_ARIMA_4 <- Arima(TotalAsIs, order=c(2,1,1))
summary(Model_ARIMA_4)
plot(forecast(Model_ARIMA_4))
#AIC=2095.08   AICc=2095.68   BIC=2104.13

Model_ARIMA_5 <- Arima(TotalAsIs, order=c(2,1,2))
summary(Model_ARIMA_5)
plot(forecast(Model_ARIMA_5))
#AIC=2091.07   AICc=2092   BIC=2102.39

Model_ARIMA_6 <- Arima(TotalAsIs, order=c(3,1,2))
summary(Model_ARIMA_6)
plot(forecast(Model_ARIMA_6))
#AIC=2092.3   AICc=2093.61   BIC=2105.87

Model_ARIMA_7 <- Arima(TotalAsIs, order=c(3,1,3))
summary(Model_ARIMA_7)
plot(forecast(Model_ARIMA_7))
#AIC=2094.03   AICc=2095.81   BIC=2109.87

Model_ARIMA_8 <- Arima(TotalAsIs, order=c(3,1,1))
summary(Model_ARIMA_8)
plot(forecast(Model_ARIMA_8))
#AIC=2096.57   AICc=2097.5   BIC=2107.89

Model_ARIMA_9 <- Arima(TotalAsIs, order=c(3,1,2))
summary(Model_ARIMA_9)
plot(forecast(Model_ARIMA_9))
#AIC=2092.3   AICc=2093.61   BIC=2105.87

Model_ARIMA_10 <- Arima(TotalAsIs, order=c(1,1,3))
summary(Model_ARIMA_10)
plot(forecast(Model_ARIMA_10))
#AIC=2096.69   AICc=2097.61   BIC=2108

Model_ARIMA_11 <- Arima(TotalAsIs, order=c(2,1,3))
summary(Model_ARIMA_11)
plot(forecast(Model_ARIMA_11))
#AIC=2085.22   AICc=2086.53   BIC=2098.8

Model_ARIMA_12 <- Arima(TotalAsIs, order=c(2,2,3))
summary(Model_ARIMA_12)
plot(forecast(Model_ARIMA_12))
#AIC=2065.39   AICc=2066.72   BIC=2078.88

Model_ARIMA_13 <- Arima(TotalAsIs, order=c(2,3,2))
summary(Model_ARIMA_13)
plot(forecast(Model_ARIMA_13))
#AIC=2061.27   AICc=2062.22   BIC=2072.44

Acf(residuals(Model_ARIMA_13))
Box.test(residuals(Model_ARIMA_13), lag=12, fitdf=4, type="Ljung")
# The Ljung-Box Test has H0: The data are independently distributed 
# und Ha: The data are not independently distributed. 

# Just like the remainder showed before, there is a definite coherence#  
```

### Seasonal ARIMA modeling   				                                    
This model integrates the seasonal aspect into the ARIMA model. As the previous models all had a peak in lag 12, it seems viable that the data are seasonal. 

```{r}
Model_Seasonal_ARIMA_0 <- Arima(TotalAsIs, order=c(0,0,0), seasonal=c(1,0,0))
tsdisplay(residuals(Model_Seasonal_ARIMA_0))
summary(Model_Seasonal_ARIMA_0)
#AIC=2105.79   AICc=2106.14   BIC=2112.62

Model_Seasonal_ARIMA_1 <- Arima(TotalAsIs, order=c(0,1,1), seasonal=c(0,1,1))
summary(Model_Seasonal_ARIMA_1)
plot(forecast(Model_Seasonal_ARIMA_1))
#AIC=1672.88   AICc=1673.31   BIC=1679.11

# Insert the values from the previous chapter for the non-seasonal values. 
Model_Seasonal_ARIMA_2 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,1,1))
tsdisplay(residuals(Model_Seasonal_ARIMA_2))
summary(Model_Seasonal_ARIMA_2)
plot(forecast(Model_Seasonal_ARIMA_2))
# AIC=1630.23   AICc=1632.51   BIC=1644.53

# Good results when using drift.
Model_Seasonal_ARIMA_3 <- Arima(TotalAsIs, order=c(1,0,1), seasonal=c(1,1,1),include.drift=TRUE)
tsdisplay(residuals(Model_Seasonal_ARIMA_3))
summary(Model_Seasonal_ARIMA_3)
plot(forecast(Model_Seasonal_ARIMA_3))
# AIC=1355.99   AICc=1357.58   BIC=1368.56

Model_Seasonal_ARIMA_4 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,3,2))
tsdisplay(residuals(Model_Seasonal_ARIMA_4))
summary(Model_Seasonal_ARIMA_4)
plot(forecast(Model_Seasonal_ARIMA_4))
# AIC=1630.23   AICc=1632.51   BIC=1644.53
# The stronger the seasonality is differenced, the better the results are. However the 
# plot shows that the data are being increasingly changed. 

Model_Seasonal_ARIMA_5 <- Arima(TotalAsIs, order=c(2,3,2), seasonal=c(1,4,2))
tsdisplay(residuals(Model_Seasonal_ARIMA_5))
summary(Model_Seasonal_ARIMA_5)
plot(forecast(Model_Seasonal_ARIMA_5))
# AIC=765   AICc=777   BIC=773.36

# The more the seasonal aspect is changed, the better the results based on AIC,
# AICc and BIC. Theoretically the models should more and more suitable for the forecast.
# However, a look at the plot of the forecasts shows that the changes are making the 
# data less and less convincing and thus unuseable. 
```

###  Auto-ARIMA modeling						                                        

The automatic establishment of an ARIMA model shows that (2,0,1)(0,1,1) with drift delivers the best results. 
AIC=1344.04   AICc=1345.62   BIC=1356.6
For comparison, here are the results of ModelWithTrendAndSeasonalityOnly with tslm():
          CV          AIC         AICc          BIC        AdjR2 
 8.472378e+10    1810.912      1818.281    1842.786    0.9004392 

```{r}
Model_auto.arima <- auto.arima(TotalAsIs)
summary(Model_auto.arima)
CV(ModelWithTrendAndSeasonalityOnly)

Acf(residuals(Model_auto.arima))
Box.test(residuals(Model_auto.arima), lag=12, fitdf=4, type="Ljung")
# The Ljung-Box Test has H0: The data are independently distributed 
# and Ha: The data are not independently distributed. The results show: White noise

Model_auto.arima_forecast <- forecast(Model_auto.arima,h=12)
plot(Model_auto.arima_forecast)
Model_auto.arima_forecast

Model_auto.arima_forecast_df <-as.data.frame(Model_auto.arima_forecast) 
Model_auto.arima_PointForecast <- ts(Model_auto.arima_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Model_auto.arima_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_auto.arima_PointForecast,file='Model_auto.arima_PointForecast.csv')
```

## Dynamic regression models					                                      
Regression models are combined with ARIMA models on order to make sure that external factors are included and that the time series are not only forecasted based on past values. A regression of the ARIMA errors should be aspired for. 
We have to diffentiate, as the time series and the SIGov Indicator are not stationary. So that a forecast can be produced, the indicator has to be lagged so that we have values for 2014. 

```{r}
CEPI_lagged <- ts(c(rep(NA,12),CEPIVector),start=c(2008,1), end=c(2013,12), frequency=12)
CEPI_2014_lagged <- ts(CEPI_2013, start=c(2014,1), end=c(2014,12), frequency=12)

Model_dynreg <- Arima(TotalAsIs, xreg=CEPI_lagged, order=c(2,2,0))
tsdisplay(arima.errors(Model_dynreg), main="ARIMA errors")
summary(Model_dynreg)

Model_dynreg_auto.arima <- auto.arima(TotalAsIs, xreg=CEPI_lagged)
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
Model_dynreg_auto.arima_forecast <- forecast(Model_dynreg_auto.arima, xreg=CEPI_2014_lagged,h=12)
plot(Model_dynreg_auto.arima_forecast)
Model_dynreg_auto.arima_forecast

Model_dynreg_auto.arima_forecast_df <-as.data.frame(Model_dynreg_auto.arima_forecast) 
Model_dynreg_auto.arima_PointForecast <- ts(Model_dynreg_auto.arima_forecast_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Model_dynreg_auto.arima_PointForecast

# Output instruction for the data export of the results for further use in Excel.
#write.csv(Model_dynreg_auto.arima_PointForecast,file='Model_dynreg_auto.arima_PointForecast.csv')
```

## Kappa                                                                  

## Kappa calculation with 2 indicators                                   

```{r, eval=FALSE}
allkappa <- foreach (y = indicators[1:13], .combine = c)  %do% {
  foreach( z = indicators[1:13], .combine =c) %do% {
    kappa(model.matrix(~ y + z))
  }
}

kappasFor2CombinedIndicators <- cbind(allkappa,newnames2)
```

```{r, results="hide"}
kappasFor2CombinedIndicators[with(kappasFor2CombinedIndicators, order(allkappa)),]
```

## Kappa calculation with 3 indicators                                   
```{r, eval=FALSE}
allkappa <- foreach(x = indicators[1:13], .combine = c) %do% {foreach(y = indicators[1:13], .combine = c)  %do% {
  foreach( z = indicators[1:13], .combine =c) %do% {
    kappa(model.matrix(~ x + y + z))
  }
}
}

kappasFor3CombinedIndicators <- cbind(allkappa,newnames3)
```

```{r, results="hide"}
kappasFor3CombinedIndicators[with(kappasFor3CombinedIndicators, order(allkappa)),]
```

## Interpretation of the kappa values                                     

As a rough guide for regression, values should be below 30 to establish low multicollinearity. The combinations that symmetrically return values of less than 30 when using 2 indicators are "jl", "bc" and "ec" (see clipboard). These could form new models. As Chulwalr's experts' feedback showed most interest in the influence of national holidays and inflation, we also included that model for further investigations. There are no values which are below 30 when using 3 indicators. Therefore, it is not necessary to try out 3 or 4 or more indicators.

## New model                                                              
```{r}
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
```

## Forecasts with the new model                                             


### ModelWithInflationAndNationalHolidays                                        
```{r}
# Shorten ModelWithInflationAndNationalHolidays by one year in order to be able to produce a forecast for 2013. 
summary(ModelWithInflationAndNationalHolidays_2012) 

# Add "newdata" to the 2013 indicator values for the forecast 
plot(ModelWithInflationAndNationalHolidays_Forecast, main="ModelWithInflationAndNationalHolidays_Forecast")
ModelWithInflationAndNationalHolidays_Forecast

# Correlation of the forecasts and As Is Data. As a comparison, the correlation of the As Is Data for 2013 with the Plan data. 
cor(ModelWithInflationAndNationalHolidays_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A comparison with linear regression also supports the result.
summary(ModelWithInflationAndNationalHolidays_forecast_lm)
summary(TotalAsIs_2013_lm)
```

### Trend and Seasonality only as benchmark                                    
```{r}
# Shorten ModelWithTrendAndSeasonalityOnly by one year in order to be able to produce a forecast for 2013.
summary(ModelWithTrendAndSeasonalityOnly_2012) 

# Add "newdata" to the 2013 indicator values for the forecast.
plot(ModelWithTrendAndSeasonalityOnly_Forecast, main="ModelWithTrendAndSeasonalityOnly_Forecast")
ModelWithTrendAndSeasonalityOnly_Forecast

# Correlation of the forecasts and As Is data. As a comparison, the correlation of the As Is Data for 2013 with the Plan data.
cor(ModelWithTrendAndSeasonalityOnly_PointForecast, TotalAsIs_2013) 
cor(TotalAsIs_2013, TotalPlan_2013)

# A Comparison with linear regression also supports the result.
summary(ModelWithTrendAndSeasonalityOnly_Forecast_lm)
summary(TotalAsIs_2013_lm)
```

### Interpretation of the forecasts
Below are the results of the forecasts with the new model
<br/>
AsIs Data for 2013
summary(TotalAsIs_2013_lm)
Adjusted R²: 0.8509

### ModelWithInflationAndNationalHolidays 

cor(ModelWithInflationAndNationalHolidays_PointForecast, TotalAsIs_2013) 
<br/>
[1] 0.9598657
<br/>
cor(TotalAsIs_2013, TotalPlan_2013)
<br/>
[1] 0.929769
<br/>
Adjusted R²: 0.9135 
<br/>
### ModelwithTrendAndSeasonalityOnly

cor(ModelWithTrendAndSeasonalityOnly_PointForecast, TotalAsIs_2013) 
<br/>
[1] 0.9138049
<br/>
cor(TotalAsIs_2013, TotalPlan_2013)
<br/>
[1] 0.929769
<br/>
Adjusted R²: 0.8185
<br/>
The better model is ModelWithInflationAndNationalHolidays. It finally outperforms the plan data and provides explanatory potential.
<br/>
We will now use the ModelWithInflationAndNationalHolidays to forecast the year 2014

## Forecast for 2014 w/ Inflation and National Holidays                                                     

```{r}
summary(ModelWithInflationAndNationalHolidays)
Forecast_ModelWithInflationAndNationalHolidays_2014 <- forecast(ModelWithInflationAndNationalHolidays, newdata=data.frame(Inflation=Inflation_2014, NationalHolidays=NationalHolidays_2014),h=12)
plot(Forecast_ModelWithInflationAndNationalHolidays_2014,main="Forecast_ModelWithInflationAndNationalHolidays_2014")


Forecast_ModelWithInflationAndNationalHolidays_2014_df <-as.data.frame(Forecast_ModelWithInflationAndNationalHolidays_2014) 
Pointforecast_ModelWithInflationAndNationalHolidays_2014 <- ts(Forecast_ModelWithInflationAndNationalHolidays_2014_df$"Point Forecast", start=c(2014,1), end=c(2014,12), frequency=12)
Pointforecast_ModelWithInflationAndNationalHolidays_2014

TotalAsIsVector_2014 <- c(ImportedAsIsData[2:13,8])
TotalAsIsVector_2014
TotalAsIs_2014 <- ts(TotalAsIsVector_2014, start=c(2014,1), end=c(2014,12), frequency=12)
TotalAsIs_2014
cor(TotalAsIs_2014,Pointforecast_ModelWithInflationAndNationalHolidays_2014)
```

## Comparison of the models						            
```{r}
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

# Percent differences

MAPE_AsIs_Plan <- mean(abs(TotalAsIs_2014-TotalPlan_2014)/(TotalAsIs_2014))*100
MAPE_AsIs_LowCorInd <- mean(abs(TotalAsIs_2014-PointForecast_ModelWithLowCorrelatingIndicators_2014)/(TotalAsIs_2014))*100
MAPE_AsIs_TrendSeasonality <- mean(abs(TotalAsIs_2014-PointForecast_TrendAndSeasonality_2014)/(TotalAsIs_2014))*100
MAPE_AsIs_ETSHoltWinters <- mean(abs(TotalAsIs_2014-Model_ets_PointForecast)/(TotalAsIs_2014))*100
MAPE_AsIs_ARIMA <- mean(abs(TotalAsIs_2014-Model_auto.arima_PointForecast)/(TotalAsIs_2014))*100
MAPE_AsIs_DynamicReg <- mean(abs(TotalAsIs_2014-Model_dynreg_auto.arima_PointForecast)/(TotalAsIs_2014))*100
MAPE_AsIs_Kappa <- mean(abs(TotalAsIs_2014-Pointforecast_ModelWithInflationAndNationalHolidays_2014)/(TotalAsIs_2014))*100

MAPE_AsIs_Plan
MAPE_AsIs_LowCorInd
MAPE_AsIs_TrendSeasonality
MAPE_AsIs_ETSHoltWinters
MAPE_AsIs_ARIMA
MAPE_AsIs_DynamicReg
MAPE_AsIs_Kappa
```

# Case Study 10 Questions

## What is the best model for the export data? 

In the section with the analysis of the correlation between indicators, we find that NationalHolidays and InfluenceNationalHolidays have the best adjusted r-square values of .9110. With this information we decide that using either of the two models will work for our purposes, but in the context of the problem, we will go with the NationalHolidays model for forcasting. In addition, seeing correlation values for inflation, trend, and seasonsonality gives the best context. So, a model including these indicators will work best.

## How well does forecast meet planned exports?  

This is examined using correlation between the chosen model and the planned export data of 2014. We chose the additive model (Modelhw-1) that was analyzed using Holt-Winter's seasonal method for two reasons. Firstly the plot of seasonal variation show that the variation across the time series is very much uniform. Secondly the AIC is smaller than any other models. The multiplicative model (Modelhw-1) is also a good model that we see next to the additive one. Even the multiplicative model has the smallest RMSE error. However, that solo criteria doesn't get the best model. Although our decision is to suggest the additive model we performed the correlation for both additive and multiplicative models.

```{r}
x1<-Model_hw_1_PointForecast # Additive model
x1
x2<-Model_hw_2_PointForecast # multiplecative model
x2
y<-TotalPlan_2014 # Total planned for 2014
y
cor(x1,y)
cor(x2,y)
```  

```{r}
plot(c(x1,x2),c(y,y),xlab="forcasted data",ylab="planned data",main="Forcasted vs, Planned",type="n")
points(x1,y,col="red",pch=21,bg="red")
points(x2,y,col="blue",pch=21,bg="blue")
```  

Both additive and multiplecative results show a very strong correlation with the planned data. The multiplicative model has even more correlation with planned data but is too conservative which might comparatively less practical.

## Which forecast model is the best?

In the STL decomposition the trend of the total exports is almost linear. A relatively uniform seaonality can be seen, therefore, we will select the Holt-Winters additive model as the best choice. 

## More than one model may be equally good. How do you choose among equally good models?

Picking between models that may be equally good can be done based on other statistical factors involved in making the decision or the context of the problem at hand. In the context of the our problem, simply finding the best model, we will be going with the Holt-Winters additive model, but in a different context, the "best"" model could change.

# Conclusion

Based on the analysis of correlations and adjusted r-squared values we can see that the best model will be based on a model inclusive of the trend, seasonality, inflation, and NationalHoliday giving us the best model in terms of both correlated values (precision) and context to the problem. Among forcasting models, we find the Holt Winters additive model to be the best given the correlation of the model. Further analysis of the STL decomposition suggests that the additive model rather than the multiplicative model would be best for this our situation due to the lack of variation in the magnitude along the seasonal patterns.