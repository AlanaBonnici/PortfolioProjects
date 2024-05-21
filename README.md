# PortfolioProjects

### Project 1: Covid Data Exploration using SQL

Technologies Used: (MS)SQL and Azure Data Studio
Skills: database design, importing data from csv, queries, joins, temporary tables
Data Source: https://ourworldindata.org/covid-deaths
DATA: date range = 2020-02-24 to 2021-04-30. temporal resolution = daily

Database Name: PortfolioProject2
2 Tables called: CovidDeaths and CovidVaccinations
SQL queries filename: SQLQueryPortfolioProjects2.sql

- Query 1. Goal: Display all columns for CovidDeaths table
<img width="1009" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/5cbae314-7bc3-494b-b90a-192c503d5a7c">

  
- Query 2. Goal: Calculate % deaths from # infected people in Canada
<img width="649" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/388e003e-7b07-4c76-9714-ea71e5e37391">

  
- Query 3. Goal: Calculate % infections from total population
<img width="671" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/22d92da7-db84-4738-8668-857669bf01ae">

  
- Query 4. Goal: Display county with highes infection rate compared to population
<img width="711" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/9026beaf-790a-4331-8c45-d9d3c66c5e8b">

  
- Query 5. Goal: Display countries with highest death count per population
<img width="315" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/ac34d17a-3438-4dcb-bb8d-1277841ab871">


- Query 6. Realized there are aggregate locations such as World, Europe, Asia etc which is skewing data. Goal: Similar to #5 BUT removing aggregate locations
<img width="974" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/788f4bc3-10f5-4d77-af7d-da19908a015a">


- Query 7. Goal: Display countries with highest death count per population
<img width="319" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/aee50eb8-66a7-41df-a451-0d5e6181c6a5">


- Query 8. Goal: Display continents death count
<img width="313" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/54c2f066-0a96-4be7-a630-fc8429867d5b">


- Query 9. Goal: SAME AS #8, different methodology
<img width="322" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/1daa6863-e14e-4b17-8daa-a2770a2d5c8b">


- Query 10. Goal: Display continents with highest death count per population
<img width="314" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/2dbb3447-aa04-499f-907c-209b9dc4dce8">


- Query 11. Goal: Display global numbers of total cases, total deaths and death percentage
<img width="544" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/174b4736-681d-496a-9fa1-f1bddaa6f80e">


- Query 12. Goal: Global number for death percentage of entire Covid pandemic (until 2021-04-30)
<img width="424" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/7ee59fda-059e-4ee4-895b-07914dac35b9">


- Query 13. Goal: Display CovidVaccinations table
<img width="1010" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/2c18d3a8-5755-4905-9d64-f2ac90fad0e7">


- Query 14. Goal: Join tables to display how many people have been vaccinated
<img width="810" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/b1795a6a-4978-42ca-b199-86dc0d5d5301">


- Query 15. Goal: Use CTE to show % population vaccinated which is calculated in same query
<img width="976" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/13da3ce0-cb04-4f3d-ab1c-92df950d640e">


- Query 16. Goal: Show max % population vaccinated by country
<img width="703" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/7fd93398-397d-4841-80ef-41c4d6fc8cd6">


- Query 17. Goal: Same as #15 but new metholodoly: creating temporary table
<img width="1010" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/d8bfad36-7fcb-4f2d-bfcd-678c397fb00d">


- Query 18. Goal: Create a view to store data from output #15 for later visualization
<img width="811" alt="image" src="https://github.com/AlanaBonnici/PortfolioProjects/assets/76119171/6fb6645d-5ae9-4e94-9e4b-11a12199dbd7">


- Query 19. Goal: Display the view created in #18.
