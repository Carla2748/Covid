/****** Data Analysis  ******/

-- View table content
SELECT TOP (10) *
FROM [Portfolio].[dbo].[CovidCases];

-- Overview of data by continent across time

SELECT continent
	,[date]
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

SELECT continent
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