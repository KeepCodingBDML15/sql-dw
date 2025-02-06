SELECT customer_id
     , invoice_id
     , invoice_date
     , total_amount
     , LEAD(total_amount) OVER(PARTITION BY customer_id ORDER BY invoice_date) next_invoice_amount
     , LAG(total_amount) OVER(PARTITION BY customer_id ORDER BY invoice_date) previous_invoice_amount
  FROM keepcoding.invoice
 ORDER BY customer_id, invoice_date