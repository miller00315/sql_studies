select flight_id, departure_airport,
	sum(actual_arrival - scheduled_arrival) 
	over(partition by departure_airport order by flight_id)
from bookings.flights;