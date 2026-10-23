/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.
*/


-- Supprimer la base DataWarehouse si elle existe déjà
DROP DATABASE IF EXISTS "DataWarehouse";

-- Créer la base DataWarehouse
CREATE DATABASE "DataWarehouse";


-- Create Schemas

CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;
