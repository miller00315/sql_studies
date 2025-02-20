select *,
	sum(amount) over(partition by customer_id)
	from payment
	order by 1;

select *,
	count(*) over(partition by customer_id, staff_id)
	from payment;
	order by 1;

select *,
	round(avg(amount) over(), 2)
	from payment;
	order by 1;

select f.film_id, f.title, name as category, length as length_of_movie,
	round(avg(length) over(partition by name), 2) as avg_length_in_category
	from film f
	left join film_category fc
	on f.film_id = fc.film_id
	left join category as c
	on fc.category_id = c.category_id
	order by 1;

select *, 
	count(*) over(partition by amount, customer_id)
	from payment
	order by customer_id;

select *,
sum(amount) over(order by payment_date)
from payment;


select *,
sum(amount) 
	over(partition by customer_id 
		order by payment_date asc, payment_id desc)
from payment;




	

