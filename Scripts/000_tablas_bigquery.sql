-- CREAMOS LA TABLA invoices

CREATE OR REPLACE TABLE keepcoding.invoice AS
SELECT 1000001 AS invoice_id, 1234 AS customer_id, 'ENERO' AS month, 25.5 AS total_amount, DATETIME('2021-01-01') AS invoice_date UNION ALL
SELECT 1000002 AS invoice_id, 1234 AS customer_id, 'FEBRERO' AS month, 25.5 AS total_amount, DATETIME('2021-02-01') AS invoice_date UNION ALL
SELECT 1000003 AS invoice_id, 1234 AS customer_id, 'MARZO' AS month, 18 AS total_amount, DATETIME('2021-03-01') AS invoice_date UNION ALL 
SELECT 1000004 AS invoice_id, 1234 AS customer_id, 'ABRIL' AS month, 25.5 AS total_amount, DATETIME('2021-04-01') AS invoice_date UNION ALL
SELECT 1000005 AS invoice_id, 1234 AS customer_id, 'MAYO' AS month, 18 AS total_amount, DATETIME('2021-05-01') AS invoice_date UNION ALL
SELECT 1000006 AS invoice_id, 1234 AS customer_id, 'JUNIO' AS month, 18 AS total_amount, DATETIME('2021-06-01') AS invoice_date UNION ALL
SELECT 1000007 AS invoice_id, 1234 AS customer_id, 'JULIO' AS month, 25.5 AS total_amount, DATETIME('2021-07-01') AS invoice_date UNION ALL
SELECT 1000008 AS invoice_id, 1234 AS customer_id, 'AGOSTO' AS month, 25.5 AS total_amount, DATETIME('2021-08-01') AS invoice_date UNION ALL
SELECT 1000009 AS invoice_id, 1234 AS customer_id, 'SEPTIEMBRE' AS month, 25.5 AS total_amount, DATETIME('2021-09-01') AS invoice_date UNION ALL
SELECT 10000010 AS invoice_id, 1234 AS customer_id, 'OCTUBRE' AS month, 25.5 AS total_amount, DATETIME('2021-10-01') AS invoice_date UNION ALL
SELECT 10000011 AS invoice_id, 1234 AS customer_id, 'NOVIEMBRE' AS month, 32.4 AS total_amount, DATETIME('2021-11-01') AS invoice_date UNION ALL
SELECT 10000012 AS invoice_id, 1234 AS customer_id, 'DICIEMBRE' AS month, 32.4 AS total_amount, DATETIME('2021-12-01') AS invoice_date UNION ALL
SELECT 10000013 AS invoice_id, 4321 AS customer_id, 'ENERO' AS month, 12 AS total_amount, DATETIME('2021-01-01')   AS invoice_date UNION ALL
SELECT 10000014 AS invoice_id, 4321 AS customer_id, 'FEBRERO' AS month, 12 AS total_amount, DATETIME('2021-02-01')  AS invoice_date UNION ALL
SELECT 10000015 AS invoice_id, 4321 AS customer_id, 'MARZO' AS month, 12 AS total_amount, DATETIME('2021-03-01')  AS invoice_date UNION ALL
SELECT 10000016 AS invoice_id, 4321 AS customer_id, 'ABRIL' AS month, 12 AS total_amount, DATETIME('2021-04-01')  AS invoice_date UNION ALL
SELECT 10000017 AS invoice_id, 4321 AS customer_id, 'MAYO' AS month, 45 AS total_amount, DATETIME('2021-05-01')  AS invoice_date UNION ALL
SELECT 10000018 AS invoice_id, 4321 AS customer_id, 'JUNIO' AS month, 12 AS total_amount, DATETIME('2021-06-01')  AS invoice_date UNION ALL
SELECT 10000019 AS invoice_id, 4321 AS customer_id, 'JULIO' AS month, 12 AS total_amount, DATETIME('2021-07-01')  AS invoice_date UNION ALL
SELECT 10000020 AS invoice_id, 4321 AS customer_id, 'AGOSTO' AS month, 12 AS total_amount, DATETIME('2021-08-01')  AS invoice_date UNION ALL
SELECT 10000021 AS invoice_id, 4321 AS customer_id, 'SEPTIEMBRE' AS month, 12 AS total_amount, DATETIME('2021-09-01')  AS invoice_date UNION ALL
SELECT 10000022 AS invoice_id, 4321 AS customer_id, 'OCTUBRE' AS month, 12 AS total_amount, DATETIME('2021-10-01')  AS invoice_date UNION ALL
SELECT 10000023 AS invoice_id, 4321 AS customer_id, 'NOVIEMBRE' AS month, 12 AS total_amount, DATETIME('2021-11-01')  AS invoice_date UNION ALL
SELECT 10000024 AS invoice_id, 4321 AS customer_id, 'DICIEMBRE' AS month, 12 AS total_amount, DATETIME('2021-12-01')  AS invoice_date UNION ALL
SELECT 10000025 AS invoice_id, 9999 AS customer_id, 'ENERO' AS month, 33 AS total_amount, DATETIME('2021-01-01')   AS invoice_date UNION ALL
SELECT 10000026 AS invoice_id, 9999 AS customer_id, 'FEBRERO' AS month, 33 AS total_amount, DATETIME('2021-02-01')  AS invoice_date UNION ALL
SELECT 10000027 AS invoice_id, 9999 AS customer_id, 'MARZO' AS month, 12 AS total_amount, DATETIME('2021-03-01')  AS invoice_date UNION ALL
SELECT 10000028 AS invoice_id, 9999 AS customer_id, 'ABRIL' AS month, 33 AS total_amount, DATETIME('2021-04-01')  AS invoice_date UNION ALL
SELECT 10000029 AS invoice_id, 9999 AS customer_id, 'MAYO' AS month, 33 AS total_amount, DATETIME('2021-05-01')  AS invoice_date UNION ALL
SELECT 10000030 AS invoice_id, 9999 AS customer_id, 'JUNIO' AS month, 21 AS total_amount, DATETIME('2021-06-01')  AS invoice_date UNION ALL
SELECT 10000031 AS invoice_id, 9999 AS customer_id, 'JULIO' AS month, 33 AS total_amount, DATETIME('2021-07-01')  AS invoice_date UNION ALL
SELECT 10000032 AS invoice_id, 9999 AS customer_id, 'AGOSTO' AS month, 13 AS total_amount, DATETIME('2021-08-01')  AS invoice_date UNION ALL
SELECT 10000033 AS invoice_id, 9999 AS customer_id, 'SEPTIEMBRE' AS month, 33 AS total_amount, DATETIME('2021-09-01')  AS invoice_date UNION ALL
SELECT 10000034 AS invoice_id, 9999 AS customer_id, 'OCTUBRE' AS month, 33 AS total_amount, DATETIME('2021-10-01')  AS invoice_date UNION ALL
SELECT 10000035 AS invoice_id, 9999 AS customer_id, 'NOVIEMBRE' AS month, 33 AS total_amount, DATETIME('2021-11-01')  AS invoice_date UNION ALL
SELECT 10000036 AS invoice_id, 9999 AS customer_id, 'DICIEMBRE' AS month, 33  AS total_amount, DATETIME('2021-12-01') AS invoice_date;

-- CREAMOS LA TABLA CUSTOMER

CREATE OR REPLACE TABLE keepcoding.customer AS
SELECT 9999 customer_id, 'Estela Muñoz' AS name, '666778898' AS phone_number, 31 AS age
UNION ALL
SELECT 1234 customer_id, 'Antonio Grande' AS name, 'NA' AS phone_number, 56 AS age
UNION ALL
SELECT 4321 customer_id, 'Helena Vela' AS name, '666223344' AS phone_number, 19 AS age
UNION ALL
SELECT 9876 customer_id, 'Enzo López' AS name, '666117733' AS phone_number, 25 AS age;