-- Operações matemáticas
select 
	film_id,
	rental_rate as old_rental_rate,
	round(rental_rate * 1.1, 2) as new_rental_rate
	from film;

select
film_id,
round(rental_rate / replacement_cost * 100, 2) as percentage
from film
where round(rental_rate / replacement_cost * 100, 2) < 4
order by 2 asc;

-- Case when



