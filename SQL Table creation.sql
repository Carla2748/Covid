USE [Portfolio]
GO


CREATE TABLE [dbo].[CovidTestVac](
	[Key] [nvarchar](50) NOT NULL,
	[iso_code] [nvarchar](50) NOT NULL,
	[continent] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[new_tests] [nvarchar](50) NOT NULL,
	[total_tests] [nvarchar](50) NOT NULL,
	[total_tests_per_thousand] [nvarchar](50) NOT NULL,
	[new_tests_per_thousand] [nvarchar](50) NOT NULL,
	[new_tests_smoothed] [nvarchar](50) NOT NULL,
	[new_tests_smoothed_per_thousand] [nvarchar](50) NOT NULL,
	[positive_rate] [nvarchar](50) NOT NULL,
	[total_vaccinations] [nvarchar](50) NOT NULL,
	[people_vaccinated] [nvarchar](50) NOT NULL,
	[people_fully_vaccinated] [nvarchar](50) NOT NULL,
	[total_vaccinations_per_hundred] [nvarchar](50) NOT NULL,
	[people_vaccinated_per_hundred] [nvarchar](50) NOT NULL,
	[people_fully_vaccinated_per_hundred] [nvarchar](50) NOT NULL
)

CREATE TABLE [dbo].[CovidPopulation](
	[Key] [nvarchar](50) NOT NULL,
	[iso_code] [nvarchar](50) NOT NULL,
	[continent] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[population] [nvarchar](50) NOT NULL,
	[population_density] [float] NOT NULL,
	[median_age] [float] NOT NULL,
	[aged_65_older] [float] NOT NULL,
	[aged_70_older] [float] NOT NULL,
	[gdp_per_capita] [float] NOT NULL,
	[stringency_index] [float] NOT NULL,
	[cardiovasc_death_rate] [float] NOT NULL,
	[diabetes_prevalence] [float] NOT NULL,
	[handwashing_facilities] [float] NOT NULL,
	[hospital_beds_per_thousand] [float] NOT NULL,
	[life_expectancy] [float] NOT NULL
) 


CREATE TABLE [dbo].[CovidCases](
	[Key] [nvarchar](50) NOT NULL,
	[iso_code] [nvarchar](50) NOT NULL,
	[continent] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[total_cases] [int] NOT NULL,
	[new_cases] [nvarchar](50) NOT NULL,
	[new_cases_smoothed] [nvarchar](50) NOT NULL,
	[total_deaths] [nvarchar](50) NOT NULL,
	[new_deaths] [nvarchar](50) NOT NULL,
	[new_deaths_smoothed] [nvarchar](50) NOT NULL,
	[total_cases_per_million] [float] NOT NULL,
	[new_cases_per_million] [nvarchar](50) NOT NULL,
	[new_cases_smoothed_per_million] [nvarchar](50) NOT NULL,
	[total_deaths_per_million] [nvarchar](50) NOT NULL,
	[new_deaths_per_million] [nvarchar](50) NOT NULL,
	[new_deaths_smoothed_per_million] [nvarchar](50) NOT NULL,
	[reproduction_rate] [nvarchar](50) NOT NULL,
	[icu_patients] [nvarchar](50) NOT NULL,
	[icu_patients_per_million] [nvarchar](50) NOT NULL,
	[hosp_patients] [nvarchar](50) NOT NULL,
	[hosp_patients_per_million] [nvarchar](50) NOT NULL,
	[weekly_icu_admissions] [nvarchar](50) NOT NULL,
	[weekly_icu_admissions_per_million] [nvarchar](50) NOT NULL,
	[weekly_hosp_admissions] [nvarchar](50) NOT NULL,
	[weekly_hosp_admissions_per_million] [nvarchar](50) NOT NULL
)


GO


