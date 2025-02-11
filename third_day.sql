select 
	upper(email) as email_upper, 
	email,
	length(email) as email_length
	from customer
	where length(email) < 30;

select lower(first_name), lower(last_name), lower(email)
	from customer
	where length(first_name) > 10 or length(last_name) > 10;

select left(first_name, 1), right(first_name, 1), first_name from customer;

select right(left(first_name, 2), 1), first_name from customer;

select left(right(email, 4),1) from customer;

select concat(first_name, ' ', last_name) from customer;

select left(first_name, 1) || left(last_name, 1) from customer;

select left(email, 1) || '***' || right(email, 19) as anonymized_email from customer;

select position('@' in email) from customer;

select left(email, position('@' in email) -1), email from customer;

select left(email, position(last_name in email)), email from customer;

select concat(last_name, ', ', left(email, position('.' in email) -1 )) from customer;

select substring(email from position('.' in email) + 1 for position('@' in email) - position('.' in email) -1) from customer;

select left(email, 1) || '***' || substring(email from position('.' in email) for 2) 
	|| '***' || substring(email from position('@' in email)) 
	from customer;

select '***' || right(left(email, position('.' in email) -1 ) , 1) 
	|| substring(email from position('.' in email) for 2) || '***'
	|| substring(email from position('@' in email)) 
	from customer;

select extract(day from rental_date), count(*) 
from rental
group by extract (day from rental_date)
order by count(*) desc;

select extract(month from payment_date) as selected_month, sum(amount) as total_amount
from payment
group by selected_month
order by total_amount desc
limit 1;

select customer_id, extract(dow from payment_date) as day_fo_week, sum(amount) as total_amount
from payment
group by day_fo_week, customer_id
order by total_amount desc
limit 1;

select customer_id, extract(week from payment_date) as week, sum(amount) as total_amount
from payment
group by week, customer_id
order by total_amount desc
limit 1;

select *, extract(month from payment_date) as month
from payment;

select *, to_char(payment_date, 'dd-mm-yyyy') as day_and_month
from payment;

select sum(amount) as total_amount, to_char(payment_date, 'Dy, DD/MM/YYYY') as day
from payment
group by day
order by total_amount desc;

select sum(amount) as total_amount, to_char(payment_date, 'Mon, YYYY') as mon_year
from payment
group by mon_year
order by total_amount desc;

select sum(amount) as total_amount, to_char(payment_date, 'Dy, HH:MI') as day_time
from payment
group by day_time
order by total_amount desc;

select current_timestamp, extract(day from current_timestamp - rental_date) from rental;

select current_timestamp, extract(day from current_timestamp - rental_date) * 24 || ' hours' from rental;

select customer_id,
avg(return_date - rental_date) as rental_duration_avg
from rental
group by customer_id
order by rental_duration_avg desc;




