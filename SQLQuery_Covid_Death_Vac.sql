USE [Portfolio Project]
--Query the list of columns in the Coviddeath and CovidVacinnation table
Select *
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = N'CovidDeaths'

Select *
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = N'CovidVaccinations'

--Select all columns from the Coviddeath Table
Select * 
From CovidDeaths
Order By 3,4

--Select the count of every unique country in the location column
Select Count(Distinct(location))
From CovidDeaths

--Select the count of every unique continent in the location column
Select Count(Distinct(continent))
From CovidDeaths

--Get the list of all continents in the CovidDeaths table
Select Distinct(continent)
From CovidDeaths

--Get the list of countries that have null values as continent
Select distinct(location)
From CovidDeaths
Where continent is null

-- Select data we will be working with

Select location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
order by 1,2

--Top 10 countries with highest number of Covid cases
Select Top(10) location, MAX(total_cases) as HighestCases
From CovidDeaths
Where continent is not null
Group by location
Order by 2 desc

--Countries with no report of covid cases
Select Top(20) location, SUM(new_cases) as Lowestcases
From CovidDeaths
Where continent is not null
Group by location
Order by 2

--Top 10 countries with highest number of Covid Deaths
Select Top(10) location, MAX(CAST(total_deaths as int)) as HighestDeaths
From CovidDeaths
Where continent is not null
Group by location
Order by 2 Desc

--Top 10 countries with highest number of Cases and death percentage 
Select Top(10) location, MAX(CAST(total_deaths as int)) as TotalDeaths, MAX(total_cases) as TotalCases, (MAX(CAST(total_deaths as int))/MAX(total_cases))*100 as percentDeath2cases
From CovidDeaths
Where continent is not null
Group by location
Order by 3 desc,4 desc

--Top 10 countries with population to cases
Select Top(10) location, MAX(population) as TotalPopulation, MAX(total_cases) as TotalCases, (MAX(total_cases)/MAX(population))*100 as PercentPopulation2Cases
From CovidDeaths
Where continent is not null
Group by location
Order by 4 desc

--Top 10 countries with population to Deaths
Select Top(10) location, MAX(population) as TotalPopulation, MAX(CAST(total_deaths as int)) as TotalCases, (MAX(CAST(total_deaths as int))/MAX(population))*100 as PercentPopulation2Deaths
From CovidDeaths
Where continent is not null
Group by location
Order by 4 desc

--Trend of total cases per year

Select YEAR(date) as Caseyear, SUM(new_cases) as TotalCases
From CovidDeaths
Where continent is not null
Group by YEAR(Date)
Order by 1

--Trend of total deaths per year

Select YEAR(date) as Caseyear, SUM(CAST(new_deaths as int)) as TotalDeaths
From CovidDeaths
Where continent is not null
Group by YEAR(Date)
Order by 1

--Trend of total cases per month of each year

Select YEAR(date) as Caseyear, MONTH(date) as CaseMonth, SUM(new_cases) as TotalCases
From CovidDeaths
Where continent is not null
Group by YEAR(Date), MONTH(Date)
Order by 1,2

--Trend of total Deaths per month of each year

Select YEAR(date) as Caseyear, MONTH(date) as CaseMonth, SUM(CAST(new_deaths as int)) as TotalDeaths
From CovidDeaths
Where continent is not null
Group by YEAR(Date), MONTH(Date)
Order by 1,2

-- Grouping by continent

--Continent with highest number of Covid cases
Select location, MAX(total_cases) as TotalCases
From CovidDeaths
Where continent is null
and location NOT IN ('World', 'International', 'European Union')
Group by location
Order by 2 desc

--Continent with highest number of Covid cases
Select location, MAX(CAST(total_deaths as int)) as TotalDeaths
From CovidDeaths
Where continent is null
and location NOT IN ('World', 'International', 'European Union')
Group by location
Order by 2 desc


--Continent with highest number of Cases and death percentage 
Select location, MAX(CAST(total_deaths as int)) as TotalDeaths, MAX(total_cases) as TotalCases, (MAX(CAST(total_deaths as int))/MAX(total_cases))*100 as percentDeath2cases
From CovidDeaths
Where continent is null
and location NOT IN ('World', 'International', 'European Union')
Group by location
Order by 4 desc

--Continents with population to cases percentage
Select Top(10) location, MAX(population) as TotalPopulation, MAX(total_cases) as TotalCases, (MAX(total_cases)/MAX(population))*100 as PercentPopulation2Cases
From CovidDeaths
Where continent is null
and location NOT IN ('World', 'International', 'European Union')
Group by location
Order by 4 desc

--Continents with population to Deaths percentage
Select location, MAX(population) as TotalPopulation, MAX(CAST(total_deaths as int)) as TotalCases, (MAX(CAST(total_deaths as int))/MAX(population))*100 as PercentPopulation2Deaths
From CovidDeaths
Where continent is null
and location NOT IN ('World', 'International', 'European Union')
Group by location
Order by 4 desc

-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
where continent is not null 
order by 1,2


--Comparing Total population vs Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
From CovidDeaths dea
Join CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
Order by 2,3

-- Shows Percentage of Population that has recieved at least one Covid Vaccine
With PopVaac(continent, location, date, population, new_vaccinations, RollingCountPeoplevaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingCountPeoplevaccinated
--, (RollingCountPeoplevaccinated/population)*100 as percentVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)	
Select *, (RollingCountPeoplevaccinated/population)*100 as percentVaccinated
From PopVaac

--Narrowing down our Exploration to Africa

--Lets see the total cases, total deaths, percent death per cases, percent cases to population, percent death to population, % cases per global values
-- % deaths per global values

--Return the total cases in Africa
Select location, MAX(total_cases) as TotalCases
From CovidDeaths
Where continent is null
and location = 'Africa'
Group by location
Order by 2 desc

--Total deaths in Africa
Select location, MAX(CAST(total_deaths as int)) as TotalDeaths
From CovidDeaths
Where continent is null
and location = 'Africa'
Group by location
Order by 2 desc


--% of Total covid case to deaths in Africa 
Select location, MAX(CAST(total_deaths as int)) as TotalDeaths, MAX(total_cases) as TotalCases, (MAX(CAST(total_deaths as int))/MAX(total_cases))*100 as percentDeath2cases
From CovidDeaths
Where continent is null
and location = 'Africa'
Group by location
Order by 4 desc

--% of total population to cases in Africa, population to death in Africa
Select location, MAX(population) as TotalPopulation, MAX(total_cases) as TotalCases, (MAX(total_cases)/MAX(population))*100 as PercentPopulation2Cases
, (MAX(CAST(total_deaths as int))/MAX(population))*100 as PercentPopulation2Deaths
From CovidDeaths
Where continent is null
and location = 'Africa'
Group by location
Order by 4 desc

--% of Africa's Covid cases compared to to Global figures
Select 
	location,
	SUM(new_cases) as TotalCases,
	SUM(CAST(new_deaths as int)) as TotalDeaths,
	SUM(new_cases)/ (Select SUM(new_cases) FROM CovidDeaths WHERE continent is not null)*100 as percentage_of_global_cases
From
	CovidDeaths
Where
	location = 'Africa'
Group by 
	location


--% of Africa's Covid deaths compared to to Global figures
Select 
	location,
	SUM(new_cases) as TotalCases,
	SUM(CAST(new_deaths as int)) as TotalDeaths,
	SUM(CAST(new_deaths as float))/ (Select SUM(CAST(new_deaths as float)) FROM CovidDeaths WHERE continent is not null)*100 as percentage_of_global_deaths
From
	CovidDeaths
Where
	location = 'Africa'
Group by 
	location

--Include the total vaccinations in Africa
Select 
	dea.location,
	SUM(dea.new_cases) as TotalCases,
	SUM(CAST(dea.new_deaths as int)) as TotalDeaths,
	SUM(CAST(vac.new_vaccinations as int)) as TotalVaccinations
	--SUM(CAST(dea.new_deaths as float))/ (Select SUM(CAST(dea.new_deaths as float)) FROM CovidDeaths WHERE dea.continent is not null)*100 as percentage_of_global_deaths
From CovidDeaths dea
Join CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.location = 'Africa'
Group by dea.location


