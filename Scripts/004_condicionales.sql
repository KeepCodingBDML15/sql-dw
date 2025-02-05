-- CASE WHEN COMPARA UN CAMPO CON CIERTOS CRITERIOS
SELECT invoice.invoice_id
     , invoice.total_amount
     , CASE WHEN invoice.total_amount > 30 THEN 'HIGH'
            WHEN invoice.total_amount > 25 THEN 'MEDIUM'
            ELSE 'LOW'
       END AS amount_type
  FROM keepcoding.invoice;

SELECT invoice.invoice_id
     , invoice.total_amount
     , CASE WHEN invoice.total_amount > 30 THEN 'HIGH'
            WHEN invoice.total_amount > 25 THEN 'MEDIUM'
            ELSE 'LOW'
       END AS amount_type
     , CASE WHEN invoice.total_amount > 30 THEN 1 
            ELSE 0 
       END high
     , CASE WHEN invoice.total_amount <= 30 AND invoice.total_amount > 25  THEN 1 
            ELSE 0 
       END medium
     , CASE WHEN invoice.total_amount < 25 THEN 1 
            ELSE 0 
       END low
  FROM keepcoding.invoice;

-- CASE WHEN COMPARA UN CAMPO CON VARIAS CONDICIONES USANDO AND COMO OPERADOR DE UNIÓN
SELECT invoice.invoice_id
     , invoice.total_amount
     , invoice.month
     , CASE WHEN invoice.total_amount > 30 THEN 'HIGH'
            WHEN invoice.total_amount > 25 THEN 'MEDIUM'
            ELSE 'LOW'
       END AS amount_type
     , CASE WHEN invoice.total_amount > 30 AND month = "FEBRERO" THEN TRUE
            WHEN invoice.total_amount > 25 AND month = "ENERO" THEN TRUE
            ELSE FALSE
       END AS top_invoice
  FROM keepcoding.invoice;

-- CASE WHEN COMPARA UN CAMPO CON VARIAS CONDICIONES USANDO OR COMO OPERADOR DE UNIÓN
SELECT invoice.invoice_id
     , invoice.total_amount
     , invoice.month
     , CASE WHEN invoice.total_amount > 30 THEN 'HIGH'
            WHEN invoice.total_amount > 25 THEN 'MEDIUM'
            ELSE 'LOW'
       END AS amount_type
     , CASE WHEN invoice.total_amount > 30 OR month = "FEBRERO" THEN TRUE
            WHEN invoice.total_amount > 25 OR month = "ENERO" THEN TRUE
            ELSE FALSE
       END AS top_invoice
  FROM keepcoding.invoice;

-- CASE WHEN COMPARA UN CAMPO CON UNA IGUALDAD
SELECT invoice.invoice_id
     , invoice.total_amount
     , invoice.month
     , CASE invoice.total_amount 
            WHEN 33 THEN 'HIGH'
            WHEN 12 THEN 'LOW'
            ELSE 'UNKNOWN'
       END AS amount_type
  FROM keepcoding.invoice;

-- IF CONDICIONAL --> BIFUCARDOR 
SELECT invoice.invoice_id
     , invoice.total_amount
     , invoice.month
     , IF(invoice.total_amount > 30, 'HIGH', 'LOW') AS amount_type
  FROM keepcoding.invoice;

SELECT invoice.invoice_id
     , invoice.total_amount
     , invoice.month
     , IF(invoice.total_amount > 30, 'HIGH', 'LOW') AS amount_type
     , CASE WHEN invoice.total_amount > 30 THEN 'HIGH'
            ELSE 'LOW'
       END AS amount_type_2
  FROM keepcoding.invoice;

-- IFNULL --> COMPRUEBA CAMPOS NULOS Y DA UN VALOR DEFAULT
WITH young_customer 
  AS (SELECT *
        FROM keepcoding.customer
       WHERE age < 30)

SELECT invoice.customer_id
     , invoice.month
     , invoice.total_amount
     , IFNULL(young_customer.name, 'DESCONOCIDO') AS name
  FROM keepcoding.invoice
  LEFT
  JOIN young_customer
    ON invoice.customer_id = young_customer.customer_id;

-- COALESCE --> TOMA EL PRIMER VALOR NO NULO
WITH young_customer 
  AS (SELECT *
        FROM keepcoding.customer
       WHERE age < 30)

SELECT invoice.customer_id
     , invoice.month
     , invoice.total_amount
     , COALESCE(young_customer.name, customer_bis.name, 'DESCONOCIDO') AS name
  FROM keepcoding.invoice
  LEFT
  JOIN young_customer
    ON invoice.customer_id = young_customer.customer_id
  LEFT 
  JOIN (SELECT 1234 AS customer_id, 'Dani Perez' AS name) customer_bis
    ON invoice.customer_id = customer_bis.customer_id;

-- NULLIF TOMA UN VALOR Y LO CONVIERTE EN NULO, ES ÚTIL JUNTO A COALESCE O PARA ORDENACIONES
SELECT invoice.customer_id
     , invoice.month
     , invoice.total_amount
     , NULLIF(invoice.month, 'ENERO') AS mont_bis
  FROM keepcoding.invoice


WITH young_customer 
  AS (SELECT *
        FROM keepcoding.customer
       WHERE age < 30)
SELECT invoice.customer_id
     , invoice.month
     , invoice.total_amount
     , COALESCE(young_customer.name, NULLIF(customer_bis.name, 'NULL'), 'DESCONOCIDO') AS name
  FROM keepcoding.invoice
  LEFT
  JOIN young_customer
    ON invoice.customer_id = young_customer.customer_id
  LEFT 
  JOIN (SELECT 1234 AS customer_id, 'NULL' AS name) customer_bis
    ON invoice.customer_id = customer_bis.customer_id;

