select count(*) from payment where amount = 0;

select count(*) from payment where customer_id = 100;

select last_name from customer where first_name = 'ERICA';

select first_name from customer where first_name is not null;

select count(*) from rental where return_date is not null;

select payment_id, amount from payment where amount <= 2 order by amount desc;

select * from payment where amount > 3 and (customer_id = 30 or customer_id = 31);

select * from payment where customer_id in (322, 346, 354) and (amount > 2 and amount < 10) order by customer_id asc, amount desc;

ALTER DATABASE greencycles SET timezone TO 'Europe/Berlin';

select payment_id, payment_date from payment where amount between 1.99 and 6.99;

select * from payment
where payment_date between '2020-01-26' and '2020-01-28' 
and amount between 1.99 and 3.99
order by payment_date desc;

select * from customer where customer_id in (123, 212, 323, 243, 353, 432);

select distinct * from payment 
where (customer_id in (12, 25, 67, 93, 124, 234)) 
	and (amount in (4.99, 7.99, 9.99))
	and (payment_date  between '2020-01-01' and '2020-02-01');

select first_name from actor where first_name like 'A%';

select first_name from actor where first_name like '%A%';

select first_name from actor where first_name like '_A%';

select first_name from actor where first_name like '__A%';

select first_name from actor where first_name ilike 'a%';

select first_name from actor where first_name not like '%A%';

select * from film where description like '%Drama%' and title ilike '_t%';

select count(*) from customer 
	where first_name like '___' 
		and (last_name like '%X' or last_name like '%Y');

select count(*) from film where description like '%Documentary%';

/**/

select concat(title, ' ',description) as film_information from film where description like '%Documentary%';

select count(*) as no_of_movies from film where description ilike '%saga%' and (title like 'A%' or title like '%R');

select * from customer where first_name like '%ER%' and first_name like '_A%' order by last_name desc;

select * from payment 
	where (amount = 0 or amount between 3.99 and 7.99) 
		and payment_date between '2020-05-01' and '2020-05-02';

-- Aggregation functions

select count(*) as payment_count, sum(amount) as total_payment, round(avg(amount), 2) as average from payment;

select min(replacement_cost), max(replacement_cost),
round(avg(replacement_cost), 2) 
as AVG, sum(replacement_cost) from film;

 select customer_id, sum(amount) as total_amount
 from payment where customer_id > 3 
 group by customer_id 
 order by total_amount desc;

select staff_id, sum(amount) as total_amount, count(*) as total
 from payment 
 group by staff_id 
 order by total_amount desc
 limit 2;

select staff_id, sum(amount) as total_amount, count(*) as total
 from payment
 where amount != 0
 group by staff_id 
 order by total_amount desc
 limit 2;

select staff_id, customer_id, sum(amount) as total_amount, count(*) as total
	from payment
	group by staff_id, customer_id
	order by total_amount desc, total asc;
	
select staff_id, DATE(payment_date), sum(amount) as total_amount, count(*) as total
	from payment
	where amount != 0
	group by staff_id, DATE(payment_date)
	having count(*) > 400;
	order by sum(amount) desc;

select customer_id, sum(amount) as total_amount
	from payment
	group by customer_id
	having sum(amount) > 200;

select customer_id, DATE(payment_date), round(avg(amount),2) as avg_amount, count(*)
from payment
where DATE(payment_date) in ('2020-04-08', '2020-04-29', '2020-04-30')
group by customer_id, DATE(payment_date)
having count(*) > 1
order by round(avg(amount),2) desc;

 


