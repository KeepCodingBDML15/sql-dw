-- ABS
SELECT ABS(5)
     , ABS(-5)

-- DIV
SELECT invoice_id 
     , total_amount / 2
     --, total_amount / 0
     , IEEE_DIVIDE(total_amount, 0)
     , DIV(invoice_id, 2)
  FROM keepcoding.invoice

-- RAND
SELECT customer_id
     , RAND()
     , FLOOR(RAND()*10)
     , FLOOR(RAND()*(5-1)+1)
     , -- FLOOR(RAND()*(end-start)+start) Valor entre start y end, end no incluido.
  FROM keepcoding.customer

-- SQRT
SELECT SQRT(4)
     , SQRT(5)
     --, SQRT(-4)

--POW
SELECT POW(2,2)
     , POW(4, 1/2) -- IGUAL QUE SQRT
     , POW(-2, 2) -- AL SER EXPONENTE PAR TIENE RESULTADO POSITIVO
     , POW(-2, 3) -- AL SER EXPONENTE IMPAR TIENE RESULTADO NEGATIVO
     , POW(2, -2) -- ES EQUIVALENTE A HACER 1/4

-- GREATEST, LEAST
SELECT GREATEST(2,4)
     , GREATEST(5, 5)
     , LEAST(2,4)
     , LEAST(2, 1.9, 1.99)
     , LEAST(2, 1.9, 0, -1)
     , LEAST(DATE('2022-01-01'), DATE('2022-01-10'))
     , LEAST('11', '2') --OJO AL ORDERNAR NUMEROS COMO STRING

-- SAFE_OPERATION
SELECT SAFE_DIVIDE(8, 0)
     , SAFE_MULTIPLY(8, 10)
     , SAFE_MULTIPLY(9999, 99999999999999999)

-- MOD
SELECT MOD(4,2)
     , MOD(5,2)
     , MOD(-5,2)

-- REDONDEO
SELECT ROUND(2.1)
     , FLOOR(2.1)
     , CEIL(2.1)
     , ROUND(2.9)
     , FLOOR(2.9)
     , CEIL(2.9)
     , ROUND(-2.1)
     , FLOOR(-2.1)
     , CEIL(-2.1)
     , TRUNC(-2.8)
     , TRUNC(2.8)






