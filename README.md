# SQL-Data-Warehouse-Project

A hands-on data engineering project that builds a data warehouse from raw CRM and ERP data. The project brings the source files together,cleans and standardizes the data, and prepares business-ready tables for
analysis.

```
sql-data-warehouse-project/
├── docs/                   the diagrams
├── scripts/                the project scripts
│   ├── init_database.sql   creates the database
│   ├── bronze/             loads the raw files
│   ├── silver/             cleans and prepares the data
│   └── gold/               builds the tables for analysis
└── tests/                  checks the quality of the silver and gold data
```
---
## Data Architecture

![Data Architecture](docs/Data%20Architecture.png)

The project follows the Medallion Architecture, separating data
processing into three layers:

    Bronze Layer --- Raw data : Stores source data with minimal transformation. CSV files from the CRM and ERP systems are loaded into PostgreSQL tables.
    Silver Layer --- Cleaned data: Cleans, standardizes, and validates the raw data. This layer handles  issues such as inconsistent formats, missing values, and duplicate records where appropriate.
    Gold Layer --- Business-ready data: Organizes the prepared data into analytical tables, typically using fact and dimension tables in a star schema. These tables support reporting and SQL-based analysis.
---
## Project Overview

The main objectives are to:
1. Design the warehouse architecture: organize the data into
   Bronze, Silver, and Gold layers.
2. Build the ETL workflow: extract data from CSV files, load it
   into PostgreSQL, and transform it between layers.
3. Improve data quality: clean and standardize source data before
   using it for analysis.
4. Model analytical data: create fact and dimension tables for
   business reporting.
5. Validate the results: run SQL checks to identify duplicate keys
   and other data quality issues.
6. Analyze the data: use SQL queries to answer business questions.
---
## Tools and Technologies

- PostgreSQL : relational database used to store and transform the warehouse data.
- pgAdmin : graphical interface for connecting to PostgreSQL and running SQL scripts.
- SQL : data loading, transformation, modeling, and validation.
- CSV : source data format for the CRM and ERP systems.
- Git and GitHub : version control and project sharing.
- draw.io : creating architecture and data-model diagrams.

## About me
### Imane Rheffari

Master's Graduate in Big Data and Artificial Intelligence

Interested in Data Science, Data Engineering, Data Analytics, and Artificial Intelligence.

