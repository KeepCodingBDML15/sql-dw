with leads as (
  select 
  case when lea.booking_ref = 'TDPAD5' and lea.origin = 'AGP' then  concat(lea.booking_ref, '_test')
  else lea.booking_ref
  end as booking_reference,
  lea.origin,
  lea.destination,
  lea.created_at
from `leadsflights.leads` lea

),
itineraries as (
  select 
case when iti.booking_ref = 'TDPAD5' and iti.origin = 'AGP' then  concat(iti.booking_ref, '_test')
  else iti.booking_ref
  end as customer_booking_reference,
  iti.client_id,
  iti.origin,
  iti.destination,
  iti.flight,
  iti.purchased_at
from `leadsflights.itineraries` iti
)
select
lea.booking_reference,
iti.customer_booking_reference,
iti.client_id,
iti.origin,
iti.destination,
iti.flight,
lea.created_at,
iti.purchased_at
from leads lea 
left join itineraries iti
on lea.booking_reference = iti.customer_booking_reference