select f.title, c.name, f.length,
rank() over(order by length desc)
from film f
left join film_category as fc
	on f.film_id = fc.film_id
	left join category as c
		on fc.category_id = c.category_id;

select * from
 (select f.title, c.name, f.length,
	dense_rank() over(partition by name order by length desc) as rank
	from film f
	left join film_category as fc
		on f.film_id = fc.film_id
		left join category as c
			on fc.category_id = c.category_id) a
where rank = 1;

select * from (
	select name, country, count(*),
	rank() over (partition by country order by count(*) desc) rank
		from customer_list
		left join payment
		on id = customer_id
		group by name, country) a
where rank between 1 and 3;

select name, country, count(*),
first_value(count(*)) over (partition by country order by count(*) asc) rank,
count(*) - first_value(count(*)) over (partition by country order by count(*) asc) first_user
	from customer_list
	left join payment
	on id = customer_id
	group by name, country;

	
select name, country, count(*),
lead(name) over (partition by country order by count(*) asc) rank
	from customer_list
	left join payment
	on id = customer_id
	group by name, country;

select name, country, count(*),
	lead(count(*)) over (partition by country order by count(*) asc) rank,
	lead(count(*)) over (partition by country order by count(*) asc) - count(*)
	from customer_list
	left join payment
	on id = customer_id
	group by name, country;

select name, country, count(*),
	lag(count(*)) over (partition by country order by count(*) asc) rank,
	lag(count(*)) over (partition by country order by count(*) asc) - count(*)
	from customer_list
	left join payment
	on id = customer_id
	group by name, country;

select 
	sum(amount),
	date(payment_date) as day,
	lag(sum(amount)) over(order by date(payment_date)) as previous_day,
	sum(amount) - lag(sum(amount)) over(order by date(payment_date)) as difference,
	round((sum(amount) - lag(sum(amount)) over(order by date(payment_date)))
		/ lag(sum(amount)) over(order by date(payment_date)) * 100, 2) as previous_day
	from payment
	group by date(payment_date);






