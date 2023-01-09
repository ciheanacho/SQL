Select *
From PortfolioProject..['Covid Deaths$']
order by 3,4

--Select *
--From PortfolioProject..['Covid Vaccinations$']
--order by 3,4

--Select the Data that We are Going to be Using


--Covid Death Table Data 
Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..['Covid Deaths$']
order by 1,2

--Looking at Total Cases vs Total Deaths
--Shows the likelihood of dying if you contract Covid in the United States
Select location, date, total_cases, total_deaths, (total_deaths/total_cases) *100 as DeathPercentage
From PortfolioProject..['Covid Deaths$']
Where location like '%States'
order by 1,2 --(1,2 is location and date respectively)

--Looking at the Total Cases vs. The Population 
Select location, date, population, total_cases, (total_cases/population) *100 as CasePercentage
From PortfolioProject..['Covid Deaths$']
Where location like '%States'
order by 1,2 --(1,2 is location and date respectively 

--Looking at countries with the highest infection rate vs. Population
Select location,MAX(total_cases)as HighestInfectionCount, MAX((total_cases/population))*100 as CasePercentage
From PortfolioProject..['Covid Deaths$']
--Where location like '%States'
group by location, population
order by CasePercentage desc

--Breaking things down by continent
--Showing the continents with the highest death counts per population
Select continent, MAX(cast(total_deaths as int))as HighestTotalDeathCount
from PortfolioProject..['Covid Deaths$']
where continent is not null
group by continent
order by HighestTotalDeathCount desc



--Showing the Countries with the Highest Death Count Per Population.  
Select location, MAX(cast(total_deaths as int))as HighestTotalDeathCount
from PortfolioProject..['Covid Deaths$']
where continent is not null
group by location
order by HighestTotalDeathCount desc

--Global Numbers
Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..['Covid Deaths$']
--Where location like '%States'
where continent is not null
group by date
order by 1,2 --(1,2 is location and date respectively)

--Total Global Deaths All Together
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..['Covid Deaths$']
--Where location like '%States'
where continent is not null
--group by date
order by 1,2 --(1,2 is location and date respectively)


Select * 
from PortfolioProject..['Covid Deaths$'] dea
Join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date

--Looking at Total Population vs Vaccination
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from PortfolioProject..['Covid Deaths$'] dea
join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

--Looking at New Vaccinations Per Day(Rolling Count)
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER(Partition by dea.location Order by dea.location, dea.date) as RollingVaccinations
from PortfolioProject..['Covid Deaths$'] dea
join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER(Partition by dea.location Order by dea.location, dea.date) as RollingVaccinations, 
from PortfolioProject..['Covid Deaths$'] dea
join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

--USE CTE
With PVac (Continent, Location, Date, Population, New_Vaccinations, RollingVaccinations)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER(Partition by dea.location Order by dea.location, dea.date) as RollingVaccinations
from PortfolioProject..['Covid Deaths$'] dea
join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)

Select*, (RollingVaccinations/Population)*100 as RollingPercentage
From PVac

--TEMP TABLE
DROP TABLE IF exists #PercentofVaccinatedPopulation
Create Table #PercentofVaccinatedPopulation
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingVaccinations numeric
)
Insert into #PercentofVaccinatedPopulation
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER(Partition by dea.location Order by dea.location, dea.date) as RollingVaccinations
from PortfolioProject..['Covid Deaths$'] dea
join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

Select*, (RollingVaccinations/Population)*100 as RollingPercentage
From #PercentofVaccinatedPopulation

--Creating View to Store Date for Later 
Create View PercentofVaccinatedPopulation as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER(Partition by dea.location Order by dea.location, dea.date) as RollingVaccinations
from PortfolioProject..['Covid Deaths$'] dea
join PortfolioProject..['Covid Vaccinations$'] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

Select *
from PercentofVaccinatedPopulation