
-- Queries for TABLEAU
-- 1. Calculate % of deaths from # infected ppl
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, (SUM(new_deaths*1.0)/SUM(new_cases*1.0))*100 AS DeathPercentage
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
-- GROUP BY new_cases,
ORDER BY 1,2

-- 2. List Total death count per continent Europe, N and S America, Asia, Africa, Oceania
SELECT location, SUM(new_deaths) AS TotalDeathCount
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NULL
AND location NOT IN ('World','International','European Union')
GROUP BY location
ORDER BY TotalDeathCount DESC

-- 3. List location, population, highest infection count, percent population infected
SELECT location,population,MAX(total_cases) AS HighestInfectionCount, (MAX(total_cases)*1.0/population)*100 AS PercentPopulationInfected
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

-- 4.List location, population, date, highestinfection count, percent population infected
SELECT location, population, date, MAX(total_cases) AS HighestInfectionCount, (MAX(total_cases*1.0)/population)*100 AS PercentPopulationInfected
FROM PortfolioProject2..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population, date
ORDER BY PercentPopulationInfected DESC








