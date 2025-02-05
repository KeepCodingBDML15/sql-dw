-- EN MUCHAS DE LAS FUNCIONES SE PUEDEN USAR INDISTINTAMENTE DATE, DATETIME, TIME, TIMESTAMP

-- FECHA ACTUAL
SELECT CURRENT_DATETIME()
     , CURRENT_DATETIME('Europe/Madrid')
  FROM keepcoding.invoice

-- EXTRAER
SELECT EXTRACT(DAY FROM CURRENT_DATETIME())

SELECT EXTRACT(MONTH FROM CURRENT_DATETIME())

-- CONSTRUIR FECHA
SELECT DATETIME(2023, 5, 15, 10, 30, 15)
SELECT DATETIME('2023-5-15 10:30:15')
SELECT DATETIME(TIMESTAMP('2023-5-15 10:30:15', 'Europe/Madrid'))

-- SUMAR Y RESTAR FECHA
SELECT invoice_id 
     , invoice_date 
     , DATE_ADD(invoice_date, INTERVAL 1 DAY) AS add_one_day
     , DATE_SUB(invoice_date, INTERVAL 1 DAY) AS sub_one_day
     , DATE_ADD(invoice_date, INTERVAL 1 MONTH) AS add_one_month
     , DATE_SUB(invoice_date, INTERVAL 1 MONTH) AS sub_one_month
     , DATE_ADD(invoice_date, INTERVAL -1 MONTH) AS sub_one_month
  FROM keepcoding.invoice

-- DIFEENCIA ENTRE DOS FECHAS
SELECT DATETIME_DIFF('2022-12-05 15:30:23', '2022-12-04 23:30:23', HOUR)

-- TRUNCADO FECHA
SELECT DATETIME_TRUNC('2022-12-05 15:30:23', DAY)
     , DATETIME_TRUNC('2022-12-05 15:30:23', HOUR)

-- FORMATO DE FECHA
SELECT invoice_id
     , invoice_date
     , FORMAT_DATE('%d-%m-%y', invoice_date)
     , FORMAT_DATE('%d-%m-%Y', invoice_date)
     , FORMAT_DATE('%A', invoice_date)
     , FORMAT_DATE('%B', invoice_date)
  FROM keepcoding.invoice

-- ÚLTIMO DÍA
SELECT invoice_id
     , invoice_date
     , LAST_DAY(invoice_date, MONTH)
     , LAST_DAY(invoice_date, WEEK)
  FROM keepcoding.invoice

-- PARSEAR FECHAS
SELECT PARSE_DATE('%Y%m%d', '20220525')
     , PARSE_DATE('%d/%m/%Y', '13/07/2022')