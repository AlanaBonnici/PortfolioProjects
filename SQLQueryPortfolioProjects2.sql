-- 1. Look at all the columns
SELECT *
FROM PortfolioProject2..CovidDeaths
ORDER BY 3,4

-- 2. Calculate % of deaths from # infected ppl
SELECT location,date,total_cases,total_deaths, (total_deaths*1.0/total_cases*1.0)*100 AS DeathPercentage
FROM PortfolioProject2..CovidDeaths
WHERE location LIKE '%Canada%'
ORDER BY 1,2

-- 3. Calculate % of infection from population
SELECT location,date,population,total_cases,(total_cases*1.0/population*1.0)*100 as CovidPercent
FROM PortfolioProject2..CovidDeaths
ORDER BY 1,2

-- 4. Country with highest infection rate compared to population
SELECT location,population,MAX(total_cases) as HighestInfectionCount,MAX((total_cases*1.0/population*1.0))*100 AS 
    MaxPecentPopulationInfected
FROM PortfolioProject2..CovidDeaths
GROUP BY location, population
ORDER BY MaxPecentPopulationInfected DESC

-- 5. Show countries with the highest death count per population
SELECT location,MAX(total_deaths) as TotalDeathCount
-- SELECT location, MAX(cast(total_deaths AS INT)) AS TotalDeathCount <<<--- to change datatype in line
FROM PortfolioProject2..CovidDeaths
GROUP BY location
ORDER BY TotalDeathCount DESC

-- 6. we have locations like World, Europe, Asia.. when looking through data we find that some data has continent =NULL
-- an location = Africa, Asia, North America, etc
SELECT * 
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 2

-- 7. Show countries with the highest death count per population AFTER REMOVING NULL CONTINENTS
SELECT location,MAX(total_deaths) as TotalDeathCount
-- SELECT location, MAX(cast(total_deaths AS INT)) AS TotalDeathCount <<<--- to change datatype in line
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

-- 8. BREAKING THINGS DOWN BY CONTINENT   -- result is not correct ex North America is not including Canada But NEXT one is correct
SELECT continent, MAX(total_deaths) AS TotalDeathCount
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- 9. BREAK THINGS DOWN BY CONTINENT WHERE CONTINENT IS NULL
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM PortfolioProject2..CovidDeaths
WHERE continent IS null
GROUP BY location
ORDER BY TotalDeathCount DESC


-- 10. SHOWING THE CONTINENTS WITH HIGHEST DEATH COUNT PER POPULATION
SELECT continent,MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- 11. GLOBAL NUMBERS
SELECT date, SUM(new_cases) AS NewCases, SUM(new_deaths) AS NewDeaths, SUM(new_deaths*1.0)/SUM(new_cases*1.0)*100 AS DeathPercentage--total_cases,total_deaths, (total_deaths*1.0/total_cases*1.0)*100 AS DeathPercentage
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2
-- if we only group by date the query returns an error
-- reason is because we need to start using aggregate fns for specific dates
-- we can use new cases so that we can sum it, this gives us for each day the total across the world
-- adding sum of new deaths....this entire query is per day..if we remove grouping by day we can get the total cases
-- total deaths and % death of the entire world for the entire covid pandemic

-- 12. GLOBAL NUMBER for death percentage of entire covid pandemic
SELECT SUM(new_cases) AS NewCases, SUM(new_deaths) AS NewDeaths, SUM(new_deaths*1.0)/SUM(new_cases*1.0)*100 AS DeathPercentage--total_cases,total_deaths, (total_deaths*1.0/total_cases*1.0)*100 AS DeathPercentage
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

-- 13. MOVING ON TO COVID VACCINATIONS TABLE
SELECT *
FROM PortfolioProject2..CovidVaccinations

-- 14. JOIN the 2 tables - LOOKING AT TOTAL POPULATION VS VACCINATION. HOW MANY PPL IN WORLD HAVE BEEN VACCINATED?
SELECT dea.continent,dea.location,dea.date,dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,dea.date) AS RollingPplVaccinated
-- , (RollingPplVaccinated/population)*100   can't use a new column to calculate another var/col...move to next example
FROM PortfolioProject2..CovidDeaths dea
JOIN PortfolioProject2..CovidVaccinations vac
    ON dea.location = vac.location
    and dea.date=vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

-- 15. USING CTE   ; #cols in CTE has to be same as #cols in main query otherwise error
-- goal: show % of population that is vaccinated
WITH PopvsVac(continent,location,date,population,new_vaccinations, RollingPplVaccinated)
AS
(
SELECT dea.continent,dea.location,dea.date,dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,dea.date) AS RollingPplVaccinated
-- , (RollingPplVaccinated/population)*100   can't use a new column to calculate another var/col...move to next example
FROM PortfolioProject2..CovidDeaths dea
JOIN PortfolioProject2..CovidVaccinations vac
    ON dea.location = vac.location
    and dea.date=vac.date
WHERE dea.continent IS NOT NULL
-- ORDER BY 2,3
)
SELECT *, (RollingPplVaccinated/population)*100
FROM PopvsVac

-- 16. show MAX % population vaccinated by country  : Using above code as basis
WITH PopvsVac(continent,location,date,population,new_vaccinations, RollingPplVaccinated)
AS
(
SELECT dea.continent,dea.location,dea.date,dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,dea.date) AS RollingPplVaccinated
-- , (RollingPplVaccinated/population)*100   can't use a new column to calculate another var/col...move to next example
FROM PortfolioProject2..CovidDeaths dea
JOIN PortfolioProject2..CovidVaccinations vac
    ON dea.location = vac.location
    and dea.date=vac.date
WHERE dea.continent IS NOT NULL
-- ORDER BY 2,3
)
SELECT continent,location,population,MAX(RollingPplVaccinated) AS NumPplVacc,
MAX((RollingPplVaccinated/population)*100) AS PercPopVacc
FROM PopvsVac
GROUP BY continent,location,population
ORDER BY PercPopVacc DESC

-- 17. SAME AS 15. But new methodology : CREATING TEMP TABLE
-- SHOW #NEW VACCINATIONS, ROLLING # PPL VACCINATED, ROLLING % OF POPULATION VACCINATED
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
    Continent NVARCHAR(255),
    Location NVARCHAR(255),
    Date datetime,
    Population NUMERIC,
    New_vaccinations numeric,
    RollingPplVaccinated NUMERIC
)
INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent,dea.location,dea.date,dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,dea.date) AS RollingPplVaccinated
FROM PortfolioProject2..CovidDeaths dea
JOIN PortfolioProject2..CovidVaccinations vac
    ON dea.location = vac.location
    and dea.date=vac.date
WHERE dea.continent IS NOT NULL
SELECT *, (RollingPplVaccinated/population)*100
FROM #PercentPopulationVaccinated

-- 18. CREATING A VIEW TO STORE DATA FROM OUTPUT #15 FOR LATER VISUALIZATIONS
CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent,dea.location,dea.date,dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,dea.date) AS RollingPplVaccinated
-- , (RollingPplVaccinated/population)*100   can't use a new column to calculate another var/col...move to next example
FROM PortfolioProject2..CovidDeaths dea
JOIN PortfolioProject2..CovidVaccinations vac
    ON dea.location = vac.location
    and dea.date=vac.date
WHERE dea.continent IS NOT NULL
-- ORDER BY 2,3

-- 19. QUERY THE VIEW WE CREATED IN #18
SELECT *, MAX((RollingPplVaccinated/population)*100
FROM PercentPopulationVaccinated