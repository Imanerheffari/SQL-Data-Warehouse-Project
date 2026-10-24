/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
      This stored procedure does not accept any parameters or return any values.

===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time       TIMESTAMP;
    end_time         TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time   TIMESTAMP;
    load_duration    INTERVAL;
BEGIN
    batch_start_time := clock_timestamp();

    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    BEGIN
        RAISE NOTICE '------------------------------------------------';
        RAISE NOTICE 'Loading CRM Tables';
        RAISE NOTICE '------------------------------------------------';

        start_time := clock_timestamp();

        RAISE NOTICE 'Truncating table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        RAISE NOTICE 'Loading table: bronze.crm_cust_info';

        COPY bronze.crm_cust_info
        FROM '/tmp/pg_import/cust_info.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        load_duration := end_time - start_time;

        RAISE NOTICE 'Load duration crm_cust_info: %', load_duration;


        start_time := clock_timestamp();

        RAISE NOTICE 'Truncating table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        RAISE NOTICE 'Loading table: bronze.crm_prd_info';

        COPY bronze.crm_prd_info
        FROM '/tmp/pg_import/prd_info.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        load_duration := end_time - start_time;

        RAISE NOTICE 'Load duration crm_prd_info: %', load_duration;


        start_time := clock_timestamp();

        RAISE NOTICE 'Truncating table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        RAISE NOTICE 'Loading table: bronze.crm_sales_details';

        COPY bronze.crm_sales_details
        FROM '/tmp/pg_import/sales_details.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        load_duration := end_time - start_time;

        RAISE NOTICE 'Load duration crm_sales_details: %', load_duration;


        RAISE NOTICE '------------------------------------------------';
        RAISE NOTICE 'Loading ERP Tables';
        RAISE NOTICE '------------------------------------------------';


        start_time := clock_timestamp();

        RAISE NOTICE 'Truncating table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        RAISE NOTICE 'Loading table: bronze.erp_loc_a101';

        COPY bronze.erp_loc_a101
        FROM '/tmp/pg_import/LOC_A101.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        load_duration := end_time - start_time;

        RAISE NOTICE 'Load duration erp_loc_a101: %', load_duration;


        start_time := clock_timestamp();

        RAISE NOTICE 'Truncating table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        RAISE NOTICE 'Loading table: bronze.erp_cust_az12';

        COPY bronze.erp_cust_az12
        FROM '/tmp/pg_import/CUST_AZ12.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        load_duration := end_time - start_time;

        RAISE NOTICE 'Load duration erp_cust_az12: %', load_duration;


        start_time := clock_timestamp();

        RAISE NOTICE 'Truncating table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        RAISE NOTICE 'Loading table: bronze.erp_px_cat_g1v2';

        COPY bronze.erp_px_cat_g1v2
        FROM '/tmp/pg_import/PX_CAT_G1V2.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        load_duration := end_time - start_time;

        RAISE NOTICE 'Load duration erp_px_cat_g1v2: %', load_duration;


        batch_end_time := clock_timestamp();

        RAISE NOTICE '===============================================';
        RAISE NOTICE 'Loading Bronze Layer is Completed';
        RAISE NOTICE 'Total duration: %',
            batch_end_time - batch_start_time;
        RAISE NOTICE '===============================================';

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE '===============================================';
            RAISE NOTICE 'ERROR OCCURRED DURING BRONZE LOADING';
            RAISE NOTICE 'Error message: %', SQLERRM;
            RAISE NOTICE '===============================================';

            RAISE;
    END;
END;
$$;

CALL bronze.load_bronze();
