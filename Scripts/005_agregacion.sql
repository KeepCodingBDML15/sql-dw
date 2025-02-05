-- ARRAY_AGG --> EN BIGQUERY HAY UN TIPO DE DATO QUE ES ARRAY PUDIENDO GUARDAR VARIOS OBJETOS EN UN MISMO REGISTRO
SELECT customer.customer_id
     , ARRAY_AGG(invoice.invoice_id ORDER BY invoice.invoice_id) AS invoices
  FROM keepcoding.customer 
  JOIN keepcoding.invoice
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

-- AVG --> MEDIA ARITMÉTICA DE LOS ELEMENTOS AGRUPADOS
SELECT customer.customer_id
     , AVG(invoice.total_amount) AS mean_amount
  FROM keepcoding.customer 
  JOIN keepcoding.invoice
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

-- COUNT --> CUENTA EL NÚMERO DE REGISTROS
SELECT customer.customer_id
     , COUNT(*) AS count_invoices
  FROM keepcoding.customer
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

SELECT customer.customer_id
     , COUNT(DISTINCT invoice.customer_id) AS count_invoices --DISTINCT
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

-- COUNT --> CUENTA EL NÚMERO DE REGISTROS CON UNA CONDICIÓN. SE PUEDE HACER CON COUNT + CONDICIONAL
SELECT customer.customer_id
     , COUNTIF(invoice.total_amount > 19) AS count_invoices
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

SELECT customer.customer_id
     , COUNT(IF(invoice.total_amount > 19, 1, NULL)) AS count_invoices
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

-- MAX --> DEVUELVE EL VALOR MÁXIMO DEL LA AGRUPACIÓN DE REGISTROS
SELECT customer.customer_id
     , MAX(invoice.total_amount) AS max_amount
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

SELECT MAX(numero) -- MAX CON NULOS
  FROM (SELECT 1 AS numero
         UNION ALL
        SELECT 2 AS numero
         UNION ALL
        SELECT NULL AS numero)

SELECT customer.customer_id
     , MAX(IF(invoice.total_amount > 19, 1, 0)) AS has_high_amount
     , COUNTIF(invoice.total_amount > 19) num_facturas_altas
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

SELECT customer.customer_id
     --, MAX(IF(invoice.total_amount > 19, 1, 0)) AS has_high_amount
     , IF(invoice.total_amount > 19, 1, 0) AS has_high_amount
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id


--MIN --> CONTRARIO A MAX
SELECT MIN(numero) -- MIN CON NULOS
  FROM (SELECT 1 AS numero
         UNION ALL
        SELECT 2 AS numero
         UNION ALL
        SELECT NULL AS numero)

-- STRING_AGG --> AGRUPA EN UN STRING TODOS LOS REGISTROS
SELECT customer.customer_id
     , STRING_AGG(invoice.month, '; ' ORDER BY invoice.month) AS invoices
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

-- SUM --> SUMA EL VALOR TODOS LOS REGISTROS DEL CAMPO
SELECT customer.customer_id
     , SUM(invoice.total_amount) AS total_amount
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

SELECT SUM(numero) -- SUM CON NULOS
  FROM (SELECT 1 AS numero
         UNION ALL
        SELECT 2 AS numero
         UNION ALL
        SELECT NULL AS numero)

SELECT customer.customer_id
     , SUM(IF(invoice.total_amount > 19, invoice.total_amount, 0)) AS total_amount_high_invoices
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1

SELECT customer.customer_id
     , SUM(IF(invoice.total_amount > 19, 1, 0)) AS count_high_invoices
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id
 GROUP BY customer_id
 ORDER BY 1