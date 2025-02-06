select  * from public.actor order by first_name;

select  first_name, last_name, email, amount  
from customer 
join payment on (payment.customer_id = customer.customer_id)
where amount > 10
order by (first_name, last_name, email, amount)
limit 5;

select first_name, last_name from customer order by (last_name, first_name) desc;

select distinct rating, rental_duration  from film order by rating;

select distinct amount from payment order by amount desc;

select * from rental order by rental_date desc limit 100;

select count(staff_id) from rental where inventory_id = 3987;

select count(first_name) from actor;

select count(distinct first_name) from actor;



 