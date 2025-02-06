-- RANK, DENSE_RANK, ROW_NUMBER
SELECT customer.customer_id
     , customer.name
     , invoice.invoice_id
     , invoice.total_amount
     , RANK() OVER(PARTITION BY customer.customer_id ORDER BY total_amount) AS rnk
     , DENSE_RANK() OVER(PARTITION BY customer.customer_id ORDER BY total_amount) AS drnk
     , ROW_NUMBER() OVER(PARTITION BY customer.customer_id ORDER BY total_amount) AS rn
  FROM keepcoding.customer
  LEFT
  JOIN keepcoding.invoice 
    ON customer.customer_id = invoice.customer_id

WITH tmp_table
  AS (SELECT customer.customer_id
           , customer.name
           , invoice.invoice_id
           , invoice.total_amount
           , RANK() OVER(PARTITION BY customer.customer_id ORDER BY total_amount) AS rnk
           , DENSE_RANK() OVER(PARTITION BY customer.customer_id ORDER BY total_amount) AS drnk
           , ROW_NUMBER() OVER(PARTITION BY customer.customer_id ORDER BY total_amount) AS rn
        FROM keepcoding.customer
        LEFT
        JOIN keepcoding.invoice 
          ON customer.customer_id = invoice.customer_id)
SELECT *
  FROM tmp_table
 WHERE rnk = 1

----------------------------
SELECT *
     --, ROW_NUMBER() OVER(PARTITION BY cliente ORDER BY fecha DESC) AS rn
  FROM `data-warehouse-377016.keepcoding.clientes`
QUALIFY ROW_NUMBER() OVER(PARTITION BY cliente ORDER BY fecha DESC) = 1