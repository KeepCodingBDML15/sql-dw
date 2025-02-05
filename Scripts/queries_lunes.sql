SELECT *  
FROM `keepcoding-bigdata15.keepcoding.customer` 
LIMIT 10;

select *
from keepcoding.customer
limit 10;

select count(*) as total,
count(distinct customer_id) as unique_customer
from keepcoding.customer;

select *
from keepcoding.invoice
limit 10;

select 
  invoice_id,
  total_amount,
  case 
  when total_amount < 20 then 'Low'
    when total_amount between 20 and 30 then 'Medium'
    else 'High'
  end as invoice_category
from keepcoding.invoice;

select 
  invoice_id,
  total_amount,
  month,
  case 
    when total_amount > 30 and month = 'FEBRERO' then TRUE
    when total_amount > 25 and month = 'ENERO' then TRUE
  else FALSE
  end as category_invoice,
  concat('Invoice_tests', ' - ',invoice_id) as invoice_test,
  null as nullable_test
from keepcoding.invoice;


select 
   invoice_id,
   total_amount,
   if(total_amount > 30, 'High', 'Low') as invoice_category
  from keepcoding.invoice;


  With young_customer as (
    select 
      *
    from keepcoding.customer
    where age < 30
  )
  select inv.customer_id,
  inv.month,
  inv.total_amount,
  ifnull(you.name, 'Desconocido') as name
  from keepcoding.invoice inv
  left join young_customer you
  on inv.customer_id = you.customer_id;

  select invoice_id,
  total_amount,
  total_amount * 2 as doubl_price 
  from `keepcoding.invoice`
  group by all;


  select invoice_id,
  month,
  nullif(month, 'ENERO') as new_month 
  from keepcoding.invoice;

  select invoice_id,
  month,
  case 
    when month in ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL') then 1
 else 0
 end as new_month_flag
 from keepcoding.invoice;

 with flag as (
  select invoice_id,
  month,
  total_amount,
  case when month in('ENERO', 'FEBRERO', 'MARZO', 'ABRIL') then 1 
  else 0 
  end as new_month_flag
  from keepcoding.invoice
 ), invoice_month as (
  select 
    month,
    sum(case when new_month_flag = 1 then total_amount else 0 end) as monthly_invoice
  from flag
  group by month
 )
 select *
 from invoice_month
 order by 1;

 with flag as (
  select invoice_id,
  month,
  total_amount,
  case when month in('ENERO', 'FEBRERO', 'MARZO', 'ABRIL') then 1 
  else 0 
  end as new_month_flag
  from keepcoding.invoice
 ), invoice_month as (
  select 
    if(new_month_flag = 1, 'Mes ok', 'Not apply') as aggreg,
    sum(case when new_month_flag = 1 then total_amount else 0 end) as monthly_invoice
  from flag
  group by 1
 )
 select *
 from invoice_month
 order by 1;

 select raw.airline_raw,
coalesce(dim.name, map.airline_name) as airline_name
from raw_data raw 
left join dim_airline dim 
on raw.airline_identifier = dim.airline_identifier
left join mapping_airline map
on raw.airline_identifer = map.airline_id;

select fli.flight_identifier,
fli.aircraft_type,
coalesce(air.seats, 145) as passengers
from flights fli 
left join aircrafts air 
on fli.aircraft_type = air.aircraft_type;

select name,
replace(name, ' ', ' - ') name_slash,
replace(name, ' ', '') as name_without_space 
from keepcoding.customer;

select 
  count(customer_id) as total_customer
from keepcoding.customer;

select 
  cus.customer_id,
  count(inv.invoice_id) as total_invoices,
  sum(inv.total_amount) as total_amount,
  avg(inv.total_amount) as avg_amoung_per_client
from keepcoding.customer cus
left join keepcoding.invoice inv 
on cus.customer_id = inv.customer_id
group by cus.customer_id;

select min(customer_id) as registro_viejo,
max(customer_id) as registro_nuevo
from keepcoding.customer;

select cus.name,
min(inv.invoice_date) as min_date,
max(inv.invoice_date) as max_date
from keepcoding.customer cus 
left join keepcoding.invoice inv
on cus.customer_id = inv.customer_id
group by 1;

select cus.name,
from keepcoding.invoice  inv
inner join keepcoding.customer cus
on inv.customer_id = cus.customer_id
order by inv.invoice_date
limit 1;

select cus.customer_id,
count(inv.total_amount) as total_invoices,
countif(inv.total_amount > 20) as total_invoices_20,
count(if(inv.total_amount > 30,1,null)) as total_invoices_30 
from keepcoding.customer cus 
left join keepcoding.invoice inv 
on cus.customer_id = inv.customer_id 
group by 1
order by 2 DESC;

select 
cus.customer_id,
array_agg(inv.invoice_id order by inv.invoice_id) as invoices 
from keepcoding.customer cus 
inner join keepcoding.invoice inv 
on cus.customer_id = inv.customer_id 
group by cus.customer_id
order by 1;



