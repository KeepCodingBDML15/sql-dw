select 
  current_datetime('Europe/Madrid') as madrid_time,
  current_datetime('America/Lima') as lime_time,
  timestamp(current_datetime('Europe/Madrid')) as madrid_time_tmz,
  timestamp(current_datetime('America/Lima')) as lime_time_tmz
  ;
  


select
format_timestamp("%Y-%m-%d %H:%M:%S",current_datetime('Europe/Madrid')) as formatted_datetime,
format_timestamp("%d-%m-%Y %H:%M:%S", current_datetime('Europe/Madrid')) as formatted_datetime2,
format_date('%d-%b-%Y', DATE(current_date('Europe/Madrid'))) as formatted_date,
format_date('%d-%m-%Y', DATE(current_date('Europe/Madrid'))) as formatted_date2,
format_timestamp("%Y-%m-%d", timestamp('2025-02-01 20:30:00')) as testing_varchar;


select 
  invoice_date,
  format_date('%d-%m-%y', invoice_date) as format1,
  format_date('%d-%m-%Y', invoice_date) as format2,
  format_date('%A', invoice_date) as weekday,
  format_date('%B', invoice_date) as month
from `keepcoding.invoice`;

select 
  extract(day from invoice_date) as day,
  extract(month from invoice_date) as month,
  extract(year from invoice_date) as year 
from `keepcoding.invoice`;

select 
  datetime_trunc('2022-12-05 15:30:23', day) as day,
  datetime_trunc('2022-12-05 15:30:23', month) as month
  ;

select datetime_trunc(invoice_date, month) as month,
sum(total_amount) as monthly_amount
from `keepcoding.invoice`
group by 1
order by 1;

with flights as (
select flight_identifier,
local_departure_date --'%Y-%m-%d %H-%M-%S'
from flights
),
enquiry as (
  select enquir_id,
  create_date --'%Y-%m-%d'
  from enquiries
)
select fli.flight_identifier,
fli.local_departure_date,
enq.enquiry_id,
enq.create_date 
from flights fli
left join enquiry enq
on format_date('%Y-%m-%d', fli.local_departure_date) = enq.create_date;

select 
  invoice_id,
  invoice_date,
  date_add(invoice_date, interval 1 day) as add_one_day,
  date_add(invoice_date, interval -1 day) as sub_one_day,
  date_sub(invoice_date, interval 1 month) as sub_one_month,
  date_add(invoice_date, interval -1 month) as sub_one_month2
from `keepcoding.invoice`;

select date_add(max(invoice_date), interval 1 month) as maxdate_add_one_month,
date_sub(min(invoice_date), interval 1 day) as mindate_sub_one_day
from `keepcoding.invoice`;

select 
  '1971-01-01' as start_date,
  '1981-02-01' as end_date,
  date_diff('1981-02-01', '1971-01-01', day) as daydif,
  date_diff('1981-02-01', '1971-01-01', year) as yeardif


  ;

select 
customer_id,
invoice_id,
  concat( customer_id , ' - ', invoice_id) as customer_invoice_id,
  customer_id || ' - ' || invoice_id as customer_invoice_idd,
  concat('ES - ',invoice_id) as country_invoice_id
  from `keepcoding.invoice`;


with county_invoice as (
  select 
    customer_id,
    invoice_id,
  concat('      ES - ',invoice_id, '*') as country_invoice_id
  from `keepcoding.invoice`

)
select country_invoice_id,
trim(country_invoice_id, '*') as clean_cus_inv_id,
ltrim(country_invoice_id) as clean_cus_inv_id_2,
replace(country_invoice_id, '*', '+') as country_invoice_id_replace
from county_invoice;

with name_surname as (
  select 
    name
  from `keepcoding.customer`
)
select name,
split(name, ' ')[OFFSET(0)] as name,
split(name, ' ')[OFFSET(1)] as surname

from name_surname;

select invoice_id,
substr(cast(invoice_id as string), 2) as invoice_id,
substr(cast(invoice_id as string),2,3) as city_id
--substr(cast(invoice_id as string) from 2 for 3) as city_id_2
from `keepcoding.invoice`;


select 
total_amount,
total_amount/2 as half_amount,
div(cast(total_amount as int64),2) as half_amount2,
mod(div(cast(total_amount as int64),2),2) as half_test
from `keepcoding.invoice`;

select 
greatest(2,4),
greatest(5,5),
least(2,4),
least('1990-01-01', '1980-01-01') as date,
least('11', '2') varchar_test,
cus.age,
inv.total_amount,
greatest(cus.age, inv.total_amount, 10) as compare
from `keepcoding.customer` cus 
inner join `keepcoding.invoice` inv 
on cus.customer_id = inv.customer_id


