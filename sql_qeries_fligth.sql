SELECT
	count(*) as flights,
	case
		when actual_departure is null then 'no departure time'
		when actual_departure - scheduled_departure < '00:05' then 'On time'
		when actual_departure - scheduled_departure < '01:00' then 'Less that one hour late'
		else 'very late'
	end as is_late
FROM bookings.flights
group by is_late
order by flights desc;

SELECT ticket_price, count(1)
	FROM(SELECT
		book_ref,
		CASE
			WHEN total_amount < 20000 THEN 'low price ticket'
			WHEN total_amount < 150000 THEN 'mid price ticket'
			ELSE 'high price ticket'
		END as ticket_price
		FROM bookings.bookings
		) a
GROUP BY ticket_price;

SELECT 
	COUNT(*) as flights,
	CASE
		WHEN EXTRACT(month from scheduled_departure) IN (12,1,2) THEN 'Winter'
		WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring'
		WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
		ELSE 'Fall' 
	END as season
FROM bookings.flights
GROUP BY season;

select coalesce(actual_departure - scheduled_departure , '0:00') 
from bookings.flights;

select coalesce(cast(actual_departure as varchar), 'Not arived' ) from  bookings.flights;

select cast(ticket_no as bigint) from bookings.tickets;

select cast(replace(flight_no, 'PG', '') as int) as flight_no from  bookings.flights;

select cast(replace(passenger_id, ' ', '') as bigint) as passenger_id from  bookings.tickets;

