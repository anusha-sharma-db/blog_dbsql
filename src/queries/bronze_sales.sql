-- Parameterized bronze table creation
USE CATALOG IDENTIFIER(:catalog_name);
USE SCHEMA IDENTIFIER(:schema_name);

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS bronze_sales (
  order_id STRING,
  customer_id INT,
  amount DECIMAL(10,2),
  order_date DATE,
  region STRING,
  file_load_ts TIMESTAMP
)
USING DELTA;

-- MERGE
MERGE INTO bronze_sales AS target
USING (
  SELECT 
    order_id,
    customer_id::INT,
    amount::DECIMAL(10,2),
    order_date::DATE,
    region,
    current_timestamp() AS file_load_ts
  FROM IDENTIFIER('csv.`abfss://' || :container || '@' || :storage_account || '.dfs.core.windows.net/sales/`')
  WITH (header = "true")
) AS source
ON target.order_id = source.order_id
WHEN NOT MATCHED THEN INSERT *;