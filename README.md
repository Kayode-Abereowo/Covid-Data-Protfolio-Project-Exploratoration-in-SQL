# COVID-19 Data Exploration

## Introduction
This repository contains SQL queries for exploring and analyzing the COVID-19 dataset obtained from [Our World in Data](https://ourworldindata.org/covid-deaths). The dataset includes information about COVID-19 cases, deaths, vaccinations, and more.

## Data Structure
The dataset is organized into multiple tables, including:
- **CovidDeaths:** Information about COVID-19 cases and deaths.
- **CovidVaccinations:** Information about COVID-19 vaccinations.
- Other related tables.

## Queries and Analysis

### General Exploration
1. **List of Columns:**
   - Queries to retrieve the list of columns in the `CovidDeaths` and `CovidVaccinations` tables.

2. **Display all Columns in `CovidDeaths`:**
   - Query to display all columns in the `CovidDeaths` table.

3. **Count of Unique Countries and Continents:**
   - Queries to count the number of unique countries and continents in the dataset.

4. **List of Continents:**
   - Query to retrieve the list of all continents in the `CovidDeaths` table.

5. **Countries with Null Continent:**
   - Query to list countries that have null values in the continent column.

### Top Countries Analysis
6. **Top 10 Countries by Total Cases:**
   - Query to identify the top 10 countries with the highest number of COVID-19 cases.

7. **Countries with No Reported Cases:**
   - Query to identify countries with no reported COVID-19 cases.

8. **Top 10 Countries by Total Deaths:**
   - Query to identify the top 10 countries with the highest number of COVID-19 deaths.

9. **Top 10 Countries by Death Percentage:**
   - Query to identify the top 10 countries with the highest death percentage compared to total cases.

10. **Top 10 Countries by Population to Cases Percentage:**
   - Query to identify the top 10 countries with the highest population to cases percentage.

11. **Top 10 Countries by Population to Deaths Percentage:**
   - Query to identify the top 10 countries with the highest population to deaths percentage.

### Temporal Trends Analysis
12. **Trend of Total Cases per Year:**
   - Query to analyze the trend of total COVID-19 cases per year.

13. **Trend of Total Deaths per Year:**
   - Query to analyze the trend of total COVID-19 deaths per year.

14. **Trend of Total Cases per Month of Each Year:**
   - Query to analyze the trend of total COVID-19 cases per month of each year.

15. **Trend of Total Deaths per Month of Each Year:**
   - Query to analyze the trend of total COVID-19 deaths per month of each year.

### Continent-Level Analysis
16. **Continent with Highest Number of Cases:**
    - Query to identify the continent with the highest number of COVID-19 cases.

17. **Continent with Highest Number of Deaths:**
    - Query to identify the continent with the highest number of COVID-19 deaths.

18. **Continent with Highest Death Percentage:**
    - Query to identify the continent with the highest death percentage compared to total cases.

19. **Continents with Population to Cases Percentage:**
    - Query to identify continents with the highest population to cases percentage.

20. **Continents with Population to Deaths Percentage:**
    - Query to identify continents with the highest population to deaths percentage.

### Global Numbers
21. **Global Numbers:**
    - Query to retrieve global numbers, including total cases, total deaths, and death percentage.

### Vaccination Comparison
22. **Comparison of Total Population vs Vaccinations:**
    - Query to compare total population and new vaccinations in each location.

23. **Percentage of Population Vaccinated:**
    - Query to calculate the percentage of the population that has received at least one COVID-19 vaccine.

### Africa-Specific Analysis
24. **Total Cases, Deaths, and Percentages in Africa:**
    - Queries to analyze total cases, deaths, and various percentages in Africa.

25. **Comparison of Africa's COVID Numbers to Global Figures:**
    - Queries to compare Africa's COVID-19 numbers to global figures.

26. **Total Vaccinations in Africa:**
    - Query to retrieve the total number of vaccinations in Africa.

## Conclusion
These SQL queries provide a comprehensive exploration of the COVID-19 dataset, covering various aspects such as total cases, deaths, temporal trends, continent-level analysis, and vaccination comparisons. The results can be utilized to gain insights into the impact of COVID-19 on different regions and populations.

Feel free to explore and adapt these queries for further analysis or specific research questions. If you have any additional information or specific requirements, please let me know.
