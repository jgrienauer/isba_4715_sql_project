# Project Name
sql_project_isba_4715 - MLB contract analysis

## Project Objective
Research long term MLB player contracts.

## What problem are you solving?
Helping determine whether or not long contracts are worthwhile, which improves team strategy.

## How are you solving this problem?
Analyzing offensive performance compared to other players with similar contract lengths at their position.

## Job Description
I choose the analytics fellowship job posting with the Miami Marlins because it seems like an exciting opportunity. At this position I would be responsible for contributing to strategic decision-making by working with analysts, software engineers, and by manipulating complex data sets. Ultimantly in the hopes to contribute directly to on field success.

## Relation to Job Posting
This project incorporates real MLB data and the job listing is for an MLB analyst position. Furthermore, this project reflects my strategic decision making.

## Data
### Source
SPORTSRADAR API - MLB Player Profile Endpoint


### Characteristics
Sportsradar has API access to data from a variety of different sports and leagues from around the world. The MLB API/Player Profile endpoint I was working with gave access to a Players biological infromation and historical statistics. 

### Source
spotrac.com

### Characteristics
This website gave me access to athlete contract information for a variety of sports across the world. This allowed me to filter athletes by sport and position so I could find highest paid athletes at each position in the MLB. 

## Notebooks
- [web_scrape_etl_jacksong_with_charts](https://colab.research.google.com/drive/1kqzUxNsqbVrSNTafeh3wXEiYYF0RvIR2): This notebook scrapes contract data off of spotrac, inserts into data frame, and uploads csv to database. It also uses data frame to create charts.
- [api_sql_analysis-with charts](https://colab.research.google.com/drive/12tSmP_SYM5cK-gkW6hTpz5QNsiAPlIpv): Runs queries analyzing the data inserted into the database, also creates graphs from the dataframes created from the queries.
- [api_etl_jacksong](https://colab.research.google.com/drive/158CZ1QFdov5PMS-w69w8P12FBMH1kvkW): This notebook contacts the api and gets historical data on specified players, inserts data into dataframe, and uploads csv to database.
- [web_scrape_sql_analysis](https://colab.research.google.com/drive/1vumGk9I_twWreAwxpUxD-lYCeWuMNvpV): Runs Queries against data in the database.

## Future Improvements
If I had more time with this project I would've liked to increase the size of the data pool to increase accuracy and usability.
