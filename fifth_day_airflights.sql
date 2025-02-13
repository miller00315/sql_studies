SELECT
    s.fare_conditions AS "Fare Conditions",
    COUNT(*) AS "Count"
FROM
    bookings.boarding_passes bp
INNER JOIN
    bookings.flights f ON bp.flight_id = f.flight_id
INNER JOIN
    bookings.seats s ON f.aircraft_code = s.aircraft_code AND bp.seat_no = s.seat_no
GROUP BY
    s.fare_conditions
ORDER BY 2 DESC;

select count(*) from bookings.boarding_passes as bp
	full outer join bookings.tickets as ti
	on bp.ticket_no = ti.ticket_no
	where bp.ticket_no is null;

select * from bookings.aircrafts_data as a
	left outer join bookings.flights as f
	on f.aircraft_code = a.aircraft_code
	where f.flight_id is null;

select fare_conditions, count(*) as total
	from bookings.seats as s
	left join bookings.boarding_passes as b
	on s.seat_no = b.seat_no
	group by fare_conditions
	order by total desc;

select * from bookings.aircrafts_data as a
	right outer join bookings.flights as f
	on a.aircraft_code = f.aircraft_code
	where f.aircraft_code is null;

select seat_no, round(avg(amount), 2) from bookings.boarding_passes as bp
	left join bookings.ticket_flights as tf
	on bp.ticket_no = tf.ticket_no and bp.flight_id = tf.flight_id
	group by seat_no 
	order by 2 desc;

select t.ticket_no, tf.flight_id, scheduled_departure  from bookings.tickets as t
	inner join bookings.ticket_flights as tf
	on t.ticket_no = tf.ticket_no
	inner join bookings.flights as f 
	on f.flight_id = tf.flight_id;



