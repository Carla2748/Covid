/****** Data Analysis  ******/

-- View table content
SELECT TOP (10) *
FROM [Portfolio].[dbo].[CovidCases];

SELECT TOP (10) *
FROM [Portfolio].[dbo].[CovidPopulation];

SELECT TOP (10) *
FROM [Portfolio].[dbo].[CovidTestVac];

-- Overview of data by continent across time (excel output CasesTS)

SELECT continent												AS Continent
	,[date]														AS [Date]
	,SUM(CAST(new_cases AS float))								AS NewCases
	,ROUND(SUM(CAST(new_cases_per_million AS float)),0)			AS CasesPerMillion
	,SUM(CAST(new_deaths AS float))								AS NewDeaths
	,ROUND(SUM(CAST(new_deaths_per_million AS float)),0)		AS DeathsPerMillion
	,SUM(CAST(hosp_patients AS float))							AS HopsitalizedPatients
	,ROUND(SUM(CAST(hosp_patients_per_million AS float)),0)		AS HopsitalizedPerMillion
FROM [Portfolio].[dbo].[CovidCases]
WHERE continent IN ('North America','Asia','Africa','Oceania','South America','Europe')
GROUP BY continent
	,[date]
ORDER BY continent ASC
;

-- Overview of data by continent (excel output CasesCont)

SELECT continent												AS Continent
	,SUM(CAST(new_cases AS float))								AS NewCases
	,ROUND(SUM(CAST(new_cases_per_million AS float)),0)			AS CasesPerMillion
	,SUM(CAST(new_deaths AS float))								AS NewDeaths
	,ROUND(SUM(CAST(new_deaths_per_million AS float)),0)		AS DeathsPerMillion
	,SUM(CAST(hosp_patients AS float))							AS HopsitalizedPatients
	,ROUND(SUM(CAST(hosp_patients_per_million AS float)),0)		AS HopsitalizedPerMillion
FROM [Portfolio].[dbo].[CovidCases]
WHERE continent IN ('North America','Asia','Africa','Oceania','South America','Europe')
GROUP BY continent
ORDER BY continent ASC
;

-- Overview of worldwide cases across time for Time Series (excel output TS)

SELECT [date] 													AS [Date]
	,SUM(CAST(new_cases AS float))								AS NewCases
	,SUM(CAST(new_deaths AS float))								AS NewDeaths
	,SUM(CAST(hosp_patients AS float))							AS HopsitalizedPatients
	,SUM(CAST(icu_patients AS float))							AS ICUPatients
FROM [Portfolio].[dbo].[CovidCases]
GROUP BY [date]
ORDER BY [date]
;

-- Covid cases in relation to population information with dates for TS by continent (excel output PopulationTS)

SELECT cc.continent											AS Continent
	,cc.[location]											AS Country
	,cc.[date]												AS [Date]
	,cc.new_cases											AS NewCases
	,cc.new_deaths											AS NewDeaths
	,cc.hosp_patients										AS HopsitalizedPatients
	,cc.icu_patients										AS ICUPatients
	,cp.population											AS Population
	,cp.population_density									AS Density
	,cp.diabetes_prevalence 								AS DiabetesPrevalence
	,cp.cardiovasc_death_rate								AS CardioVascularDeath
FROM [Portfolio].[dbo].[CovidCases] AS cc
LEFT JOIN [Portfolio].[dbo].[CovidPopulation] AS cp
ON cc.[Key] = cp.[Key]
WHERE cc.continent IN ('Europe')
ORDER BY cc.continent
	,cc.location
;

-- Covid cases in relation to population information

SELECT cc.continent											AS Continent
	,cc.[location]											AS Country
	,SUM(CAST(cc.new_cases AS float))						AS NewCases
	,SUM(CAST(cc.new_deaths AS float))						AS NewDeaths
	,CASE WHEN SUM(CAST(cc.hosp_patients AS float))	= '0' 	
	THEN 'NA' ELSE SUM(CAST(cc.hosp_patients AS float)) END AS HopsitalizedPatients
	,CASE WHEN SUM(CAST(cc.icu_patients AS float)) = '0' 			
	THEN 'NA' ELSE SUM(CAST(cc.icu_patients AS float)) END	AS ICUPatients
	,cp.population											AS Population
	,cp.population_density									AS Density
	,cp.diabetes_prevalence 								AS DiabetesPrevalence
	,cp.cardiovasc_death_rate								AS CardioVascularDeath
FROM [Portfolio].[dbo].[CovidCases] AS cc
LEFT JOIN [Portfolio].[dbo].[CovidPopulation] AS cp
ON cc.[Key] = cp.[Key]
WHERE cc.continent IN ('North America','Asia','Africa','Oceania','South America','Europe')
GROUP BY cc.continent										
	,cc.[location]																						
	,cp.population											
	,cp.population_density									
	,cp.diabetes_prevalence 								
	,cp.cardiovasc_death_rate	
ORDER BY cc.continent
	,cc.location
;

-- Top data by location (excel output Location)

SELECT cc.continent											AS Continent
	,cc.[location]											AS Country
	,MAX(CAST(cc.total_cases AS float))						AS Cases
	,MAX(CAST(cc.total_deaths AS float))					AS Deaths
	,MAX(CAST(cp.population AS Bigint))						AS Population
	,MAX(CAST(ctv.total_tests AS float))					AS Tests
	,MAX(CAST(ctv.total_vaccinations AS float))				AS Vaccinations
FROM [Portfolio].[dbo].[CovidCases] AS cc
LEFT JOIN [Portfolio].[dbo].[CovidTestVac] AS ctv
ON cc.[Key] = ctv.[Key]
LEFT JOIN [Portfolio].[dbo].[CovidPopulation] AS cp
ON cc.[Key] = cp.[Key]
WHERE cc.continent IN ('North America','Asia','Africa','Oceania','South America','Europe')
GROUP BY cc.continent										
	,cc.location
;

-- Top data by continent (excel output Continent)

WITH countrydata AS (
SELECT cc.continent											AS Continent
	,cc.[location]											AS Country
	,MAX(CAST(cc.total_cases AS float))						AS Cases
	,MAX(CAST(cc.total_deaths AS float))					AS Deaths
	,MAX(CAST(cp.population AS Bigint))						AS Population
	,MAX(CAST(ctv.total_tests AS float))					AS Tests
	,MAX(CAST(ctv.total_vaccinations AS float))				AS Vaccinations
FROM [Portfolio].[dbo].[CovidCases] AS cc
LEFT JOIN [Portfolio].[dbo].[CovidTestVac] AS ctv
ON cc.[Key] = ctv.[Key]
LEFT JOIN [Portfolio].[dbo].[CovidPopulation] AS cp
ON cc.[Key] = cp.[Key]
WHERE cc.continent IN ('North America','Asia','Africa','Oceania','South America','Europe')
GROUP BY cc.continent										
	,cc.location
)

SELECT Continent
	,SUM(Cases)				AS TotalCases
	,SUM(Deaths)			AS TotalDeaths
	,SUM(Population)		AS TotalPopulation
	,SUM(Tests)				AS TotalTests
	,SUM(Vaccinations)		AS TotalVaccinations
FROM countrydata
GROUP BY Continent	
ORDER BY SUM(Cases) DESC
;