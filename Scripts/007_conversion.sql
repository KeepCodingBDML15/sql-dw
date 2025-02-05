-- CAST
SELECT CAST(invoice_id AS STRING)
     , CAST(invoice_date AS STRING)
     , CAST(invoice_date AS TIMESTAMP)
     , CAST(invoice_date AS DATE)
     , CAST(total_amount AS INT64) -- OJO QUE REDONDEA
     , CAST(customer_id AS FLOAT64)
     , CAST(customer_id AS NUMERIC)
  FROM keepcoding.invoice

SELECT name
     , CAST(phone_number AS INT64)
  FROM keepcoding.customer

-- SAFE_CAST
SELECT name
     , SAFE_CAST(phone_number AS INT64)
  FROM keepcoding.customer

SELECT name
     , phone_number
  FROM keepcoding.customer
 WHERE SAFE_CAST(phone_number AS INT64) IS NOT NULL


