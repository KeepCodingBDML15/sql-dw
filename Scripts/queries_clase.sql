select 
	customer_id,
	name
from customer 
limit 10
;

select 
	name,
	lower(name) as minuscula_name,
	upper(name) as upper_name,
	surname
from customer 
--where lower(name) like 'a%'
--where name like 'A%'
--where name = 'Antonio' Comento esta línea para evitar este filtro específico
;


select 
	cus.name,
	cus.surname,
	res.reservation_id,
	res.start_date
from customer cus
left join reservation res 
on cus.customer_id = res.reservation_id
where cus.name = 'Antonio'
;


select 
	apartment_id,
	price,
	owner_id,
	location 
from apartment 
limit 5
;

select 
	apartment_id,
	price as original_numeric_price,
	cast(price as varchar(100)) as new_varchar_price,
	price::varchar as new_varchar_price_2 
from apartment 
limit 5
;

select 
	apartment_id,
	price as original_numeric_price,
	price::varchar as new_varchar_price
from apartment
order by price::varchar DESC
;
--CTE Common Table Expression
With price_new as (
	select 
		apartment_id,
		price::varchar as new_price_varchar
		from apartment
)
select price
from price_new 
order by new_price_varchar DESC;

select 
	owner_id,
	count(apartment_id) as total_apartment
from apartment 
group by owner_id 
order by total_apartment DESC 
;

select 
	owner_id,
	location,
	count(apartment_id) as total_apartment
from apartment 
group by owner_id, location
order by owner_id 
;

select 
	round(avg(price),2) as avg_price
from apartment 
;

select 
	max(price) as max_price,
	min(price) as min_price
from apartment
;

select 
	location,
	count(apartment_id) as total_apartment,
	max(price) as max_price,
	round(avg(price),2) as avg_price,
	min(price) as min_price
from apartment
group by location
order by location
;

select 
	max(start_date) as max_start_date,
	min(start_date) as min_start_date 
from reservation
;

select 
	owner_id,
	count(apartment_id) as total_apartment 
from apartment 
group by owner_id
order by total_apartment DESC
limit 1
;

select 
	location,
	count(apartment_id) as total_apartment 
from apartment 
group by location 
having count(apartment_id) >= 2 
order by total_apartment DESC
;

With apart_reser as (
	select 
		cus.name,
		cus.surname,
		count(res.reservation_id) as total_reservation
	from reservation res 
	inner join customer cus 
	on res.customer_id = cus.customer_id
	group by 1,2 
	having count(res.reservation_id) > 3
)
select *
from apart_reser
;

select 
	apa.apartment_id,
	apa.location,
	count(res.reservation_id) as total_reservations
from apartment apa 
left join reservation res 
on apa.apartment_id = res.apartment_id 
left join customer cus 
on res.customer_id = cus.customer_id
where cus.name = 'Antonio'
--where apa.location in ('Madrid', 'Barcelona')
--group by apa.apartment_id, apa.location 
group by 1,2
having count(res.reservation_id) >1
;



--CTE

With total_apartments as (
	select 
		apa.apartment_id as apartment_id,
		apa.location as location,
		count(res.reservation_id) as total_reservations
	from apartment apa 
	left join reservation res
	on apa.apartment_id = res.apartment_id
	group by 1,2 
)
select 
	apartment_id,
	location,
	total_reservations 
from total_apartments
where total_reservations > 2 
;


---reservas en un período
select 
	start_date,
	count(reservation_id) as total_reservation 
from reservation 
--where start_date >= '2024-01-01'
where start_date BETWEEN '2024-01-01' AND '2024-01-28'
group by start_date
order by start_date DESC
;

With avg_price as (
	select 
		round(avg(price),2) as avg_price 
	from apartment 
),
price_apartment as (
	select 
		apartment_id,
		price 
	from apartment
)
select 
	apartment_id,
	price 
from price_apartment pri 
inner join avg_price avp
on pri.price > avp.avg_price
;


---
select 
	apartment_id,
	price 
from apartment 
where price > (select avg(price) from apartment)
;


select 
	name,
	case 
		when substring(name from 1 for 1) in ('A', 'E', 'I', 'O', 'U') then 'vowel-name'
	else 'Other'
	end as category_name
from customer 
order by name 


;

--primera letra nombre
select 
	name,
	case 
		when name like 'A%' OR name like 'E%' OR name like 'I%' OR name like 'O%' OR name like 'U%' then 'Vowel'
	else 'Other'
	end as vowel_name
from customer 
;



select 
	name,
	left(name,1) as vowel_name,
	right(name,1) as final_name,
	substring(name from 1 for 2) as two_cha,
	substring(name,1,2) as two_ch
from customer 
--where left(name,1) in ('A', 'E', 'I', 'O', 'U')

;

select 
	name,
	surname,
	concat(name,' - ',surname) as name_surname,
	name|| ' - '|| surname as name_surname_2
from customer;