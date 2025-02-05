-- LOS 32 PRIMEROS CARACTERES NO SON IMPRIMIBLES
SELECT CHR(65)

-- EN MUCHAS OCASIONES SE USA PARA GENERAR PRIMARY KEYS
SELECT CONCAT(customer_id, '-', invoice_id) AS customer_invoice
  FROM keepcoding.invoice

-- BÚSQUEDA DE SUBCADENAS
SELECT *
  FROM keepcoding.invoice
 WHERE CONTAINS_SUBSTR(month, 'DIC')

-- EMPIEZA O ACABA POR
SELECT *
  FROM keepcoding.invoice
 WHERE STARTS_WITH(month, 'DIC')

SELECT *
  FROM keepcoding.invoice
 WHERE ENDS_WITH(month, 'BRE')

-- RECORTA POR LA DERECHA O IZQUIERDA
SELECT invoice_id
     , LEFT(month, 3) AS init_month
     , RIGHT(month, 3) AS end_month
  FROM keepcoding.invoice
 WHERE ENDS_WITH(month, 'BRE')

-- LONGITUD STRING
SELECT invoice_id
     , month
     , LENGTH(month) AS longitud_mes
  FROM keepcoding.invoice
 WHERE ENDS_WITH(month, 'BRE')

-- RELLENAR POR LA DERECHA O IZQUIERDA
SELECT invoice_id
     , LPAD(CAST(invoice_id AS STRING), 16, '0') AS long_invoice_id
     , RPAD(CAST(invoice_id AS STRING), 16, '0') AS long_invoice_id
     , CONCAT('FRA-',LPAD(CAST(invoice_id AS STRING), 16, '0')) AS long_invoice_id
  FROM keepcoding.invoice

-- MAYÚSCULAS Y MINÚSCULAS
SELECT invoice_id
     , LOWER(month) AS month
     , UPPER(month) AS month
  FROM keepcoding.invoice

-- QUITAR ESPACIOS
SELECT LTRIM('            RAMÓN PÉREZ           ') AS name
     , RTRIM('           RAMÓN PÉREZ           ') AS name
     , TRIM('        RAMÓN PÉREZ         ') AS name
  FROM keepcoding.invoice

-- REEMPLAZAR SUBCADENAS
SELECT invoice.invoice_id
     , REPLACE(name, ' ', '-') name
     , REPLACE(name, ' ', '') name
  FROM keepcoding.invoice
  LEFT 
  JOIN keepcoding.customer
    ON invoice.customer_id = customer.customer_id

-- DAR LA VUELTA 
SELECT REVERSE(name) AS name
     , name
  FROM keepcoding.customer

-- SEPARAR STRING
SELECT name
     , SPLIT(name, ' ') AS name_split
  FROM keepcoding.customer

SELECT name
     , SPLIT(name, ' ')[OFFSET(0)] AS first_name
     , SPLIT(name, ' ')[OFFSET(1)] AS last_name
  FROM keepcoding.customer

-- BUSCAR POSICIÓN SUBSTRING
SELECT invoice_id
     , month
     , STRPOS(month, 'X') _x
     , STRPOS(month, 'E') _e
  FROM keepcoding.invoice
 ORDER BY invoice_id

-- OBTENER SUBSTRING
SELECT invoice_id
     , SUBSTR(CAST(invoice_id AS STRING), 2) AS invoice_id
     , SUBSTR(CAST(invoice_id AS STRING), 2, 3) AS city_id
  FROM keepcoding.invoice

-- EXPRESIONES REGULARES

