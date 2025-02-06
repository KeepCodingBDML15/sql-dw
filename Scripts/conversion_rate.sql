--conversion rate
with leads as (
  select * 
  from `leadsflights.leads`
)
select count(*) as total_records,
count(distinct booking_ref) as unique_records
from leads 
;

select booking_ref
from `leadsflights.leads`
group by all
having count(*) > 1
;

select *
from `leadsflights.leads`
where booking_ref = 'TDPAD5'
;

select 
booking_ref,
case when booking_ref = 'TDPAD5' and origin = 'AGP' then  concat(booking_ref, '_test')
else booking_ref
end as booking_reference
from `leadsflights.leads`
;

select count(*) as total_records,
count(distinct booking_ref) as unique_booking,
count(distinct client_id) as unique_clients
from `leadsflights.itineraries`
;

with leads as (
  select 
  case when booking_ref = 'TDPAD5' and origin = 'AGP' then  concat(booking_ref, '_test')
  else booking_ref
  end as booking_reference
from `leadsflights.leads`
),
customers as (
  select distinct booking_ref as client_reference
  from `leadsflights.itineraries`
)
select count(lea.booking_reference) as leads_bookings,
count(cus.client_reference) as clients_bookings,
count(cus.client_reference)/count(lea.booking_reference) as convrsion_rate
from leads lea 
left join customers cus 
on lea.booking_reference = cus.client_reference


