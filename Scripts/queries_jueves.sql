--Queries jueves 
select *
from `leadsflights.flights`
limit 10;

select count(*) as total_records,
count(distinct unique_identifier) as unique_records
from `leadsflights.flights`
;

select unique_identifier,
count(*) as total_records
from `leadsflights.flights`
group by 1 
order by 2 DESC;


select unique_identifier,
local_departure_at,
local_arrival_at,
arrival_status,
created_at,
updated_at,
row_number() over(partition by unique_identifier order by updated_at DESC) as rn 
from `leadsflights.flights`
where unique_identifier in ('IB-5214-20220714-MAD-IBZ', 'MU-1848-20240410-MAD-AMS', 'DY-1805-20240531-AGP-OSL')
order by 1,6 DESC
;

With flights_updated as (
  select unique_identifier,
local_departure_at,
local_arrival_at,
arrival_status,
created_at,
updated_at,
row_number() over(partition by unique_identifier order by updated_at DESC) as rn 
from `leadsflights.flights`
where unique_identifier in ('IB-5214-20220714-MAD-IBZ', 'MU-1848-20240410-MAD-AMS', 'DY-1805-20240531-AGP-OSL')
)
select *
from flights_updated
where rn = 1;


select unique_identifier,
local_departure_at,
local_arrival_at,
arrival_status,
created_at,
updated_at
from `leadsflights.flights`
where unique_identifier in ('IB-5214-20220714-MAD-IBZ', 'MU-1848-20240410-MAD-AMS', 'DY-1805-20240531-AGP-OSL')
qualify row_number() over(partition by unique_identifier order by updated_at DESC) = 1
;


with flight_status as (
select unique_identifier,
local_departure_at,
local_arrival_at,
arrival_status,
lag(arrival_status) over(partition by unique_identifier order by updated_at ASC) as previous_status,
created_at,
updated_at
--row_number() over(partition by unique_identifier order by updated_at DESC) as rn
from `leadsflights.flights`
where unique_identifier in ('IB-5214-20220714-MAD-IBZ', 'MU-1848-20240410-MAD-AMS', 'DY-1805-20240531-AGP-OSL')
qualify row_number() over(partition by unique_identifier order by updated_at DESC) = 1
) 
select *,
case when arrival_status != coalesce(previous_status, 'Other')  then TRUE 
else FALSE 
end as has_arrival_changed
from flight_status