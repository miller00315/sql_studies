select first_name, 'actor' as origin from actor
union
select first_name, 'customer' as origin from customer
union  
select first_name, 'staff' as origin from staff 
order by 2 desc;

select * 
from payment
where amount > (select avg(amount) from payment);

select
* 
from payment
where customer_id in (select customer_id from customer where first_name ilike 'adam');

select title, length from film
where length > (select avg(length) from film);

select * 
from film 
where film_id in (select film_id from inventory
where store_id = 2
group by film_id
having count(*) > 3);

select first_name, last_name
from customer
where customer_id in (select customer_id 
		from payment 
		where DATE(payment_date) = '2020-01-25');

select first_name, email
from customer
where customer_id in (select customer_id 
		from payment 
		group by customer_id
		having sum(amount) > 100) and 
	customer_id in (select customer_id
		from customer
		inner join address
		on address.address_id = customer.address_id
		where district = 'California');

select round(avg(subquery.total_amount), 2) 
	from (select customer_id, sum(amount) as total_amount 
			from payment
			group by customer_id) as subquery;

select round(avg(subquery.daily_revenue), 2) as avg_per_day
	from (select sum(amount) as daily_revenue, DATE(payment_date)
			from payment
			group by DATE(payment_date)) as subquery;


select *, (select round(avg(amount),2) from payment) as average 
from payment;

select *, (select max(amount) from payment) - amount as diference 
from payment;

-- highest amount per customer
select * from payment p1
where amount = (select max(amount) from payment p2 
				where p1.customer_id = p2.customer_id)
order by customer_id;

select title, film_id, replacement_cost, rating
from film as f1
where replacement_cost = (select min(replacement_cost)
	from film as f2
	where f1.rating = f2.rating);

select title, film_id, length, rating
from film as f1
where length = (select max(length)
	from film as f2
	where f1.rating = f2.rating);

-- show the maximum amount for every customer
select *, (select max(amount) from payment p2 where p1.customer_id = p2.customer_id)
from payment p1;

select payment_id, customer_id, staff_id, amount,
	(select sum(amount) as sum_amount
		from payment as p2
		where p1.customer_id = p2.customer_id),
	(select count(amount) as count_payments
	from payment as p2
	where p1.customer_id = p2.customer_id)
	from payment as p1
	order by customer_id, amount desc;

select title, replacement_cost, rating,
	(select avg(replacement_cost) from film as f2 where f1.rating = f2.rating)
	from film as f1
	where replacement_cost = (select max(replacement_cost) from film as f3 where f1.rating = f3.rating); 
	
select first_name, amount, payment_id
	from payment as p1
	inner join customer as c
	on p1.customer_id = c.customer_id
	where amount = (select max(amount) from payment as p2
						where p1.customer_id = p2.customer_id);




