# PortfolioProjects

This repository details a few projects I've built recently, including a summary of the goals and screenshots of the results.

* Exploring the Covid pandemic data death and vaccination rates using (MS)SQL.
* Assembling data for use in Tableau Public: https://public.tableau.com/app/profile/alana.bonnici/viz/CovidDataPortfolioProject_17164338355220/Dashboard1?publish=yes

## Project 1: Covid Data Exploration using SQL

* **Technologies used:** (MS)SQL, Azure Data Studio
* **Skills:** database design, importing data from csv, queries, joins, temporary tables
* **Data Source:** https://ourworldindata.org/covid-deaths
* **Data:** date range: 2020-02-24 to 2021-04-30, temporal resolution: daily

### Summary

The goal of this project was to examine the Covid pandemic death and vaccination rates around the world and extract any valuable insights by country, continent, % death rates, % vaccination rates, etc.

For this project the database name is 'PorfolioProject2'. There are two tables: 'CovidDeaths' and 'CovidVaccinations'.

### Queries
See [SQLQueryPortfolioProjects2.sql](SQLQueryPortfolioProjects2.sql) for all queries.

  
#### Query 2. Calculate % deaths from # infected people in Canada
<img width="649" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/388e003e-7b07-4c76-9714-ea71e5e37391">

  
#### Query 4. Display county with highest infection rate compared to population
<img width="711" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/9026beaf-790a-4331-8c45-d9d3c66c5e8b">

  
#### Query 5. Display countries with highest death count per population
<img width="315" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/ac34d17a-3438-4dcb-bb8d-1277841ab871">


#### Query 7. Display countries with highest death count
I realized there are aggregate locations such as World, Europe, Asia etc which is skewing data. Goal: Similar to #5 BUT removing aggregate locations.

<img width="319" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/aee50eb8-66a7-41df-a451-0d5e6181c6a5">


#### Query 10. Display continents with highest death count per population
<img width="314" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/2dbb3447-aa04-499f-907c-209b9dc4dce8">


#### Query 12. Global number for death percentage of entire Covid pandemic (until 2021-04-30)
<img width="424" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/7ee59fda-059e-4ee4-895b-07914dac35b9">


#### Query 15. Use Common Table Expression (CTE) to show % population vaccinated which is calculated in same query
<img width="976" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/13da3ce0-cb04-4f3d-ab1c-92df950d640e">


#### Query 16. Show max % population vaccinated by country
Insights gained: Small countries like Gibraltar have cross-border workers which would have got vaccinated there due to more availability of vaccinations in these places that have lower population numbers. Hence why certain small countries have vaccination rates over 100%.
<img width="703" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/7fd93398-397d-4841-80ef-41c4d6fc8cd6">


#### Query 19. In #18 created a view to store data from output #15. Display the view created in #18.
<img width="811" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/6fb6645d-5ae9-4e94-9e4b-11a12199dbd7">

** Interesting Insights: Global death rates for COVID-19 was about 2.1% of people infected. Smaller countries vaccination rates were higher, some like Gibraltar were over 100%. The country with a population overe 10 million that had the highest vaccination rate (77%) was Chile. The continent with the highest death count per population was North America. The countries with the highest death count per population were United States, followed by Brazil, then Mexico.

## Project 2: Covid Data SQL Queries for Insertion in Tableau

* **Technologies used:** (MS)SQL, Azure Data Studio, Tableau Public
* **Skills:** sql queries, exporting data to .xls, Tableau Public
* **Data Source:** https://ourworldindata.org/covid-deaths
* **Data:** date range: 2020-02-24 to 2021-04-30, temporal resolution: daily
  
### Summary

The goal of this project was to write a few queries, export the output to .xls, import that data into Tableau Public, and visualize the Covid pandemic data in Tableau Public.

For this project the database name is 'PorfolioProject2'. There are two tables: 'CovidDeaths' and 'CovidVaccinations'.

### Queries
See [2SQLQueryForTableau.sql](2SQLQueryForTableau.sql) for all queries.

### Tableau Dashboard
See    https://public.tableau.com/app/profile/alana.bonnici/viz/CovidDataPortfolioProject_17164338355220/Dashboard1?publish=yes


#### Query 1. Display worldwide total cases, total deaths, percentage of deaths
<img width="466" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/a69738b3-6af3-4d78-bc64-9114483c94c4">


#### Query 2. Display location and total death count. Ordered by death count.
<img width="305" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/fba01960-6f02-4bc2-95f0-78447268bedc">


#### Query 3. Display location, population, highest infection count, percent population infected. Ordered by percentage of population infected.
<img width="690" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/748cdfda-b317-459b-822b-260ee587b1f5">


#### Query 4. Display location, population, date, highest infection count, percent of population infected. Ordered by date.
<img width="769" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/f847e4f0-969e-4f22-bfb5-6c0a856a837d">

** Results: 
![image](https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/7cfe8a35-c56e-4047-9a2a-a9ed9cd92565)


