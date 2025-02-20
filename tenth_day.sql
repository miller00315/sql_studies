select * from customer order by customer_id asc;

update customer set last_name = 'BROWN' where customer_id = 2;

update customer set email = lower(email);

alter table customer add column initials varchar(10);

update customer set initials = concat(left(first_name, 1),'.', left(last_name, 1), '.');

update film set rental_rate = 1.99 where rental_rate = 0.99;

select * from songs;

insert into songs(song_name, genre, price, release_date)
values
('Have a talk with data','Chil out', 5.99, '01-06-2020'),
('Tame the data','Classical', 5.99, '01-06-2020');

delete from songs where song_id in (3, 4) returning song_id, song_name;

select * from payment;

delete from payment where payment_id in (17064, 17067) returning customer_id, rental_id, amount;

create table customer_addressed as 
	select first_name, last_name, email, address
		from customer as c 
		left join address as a 
		on c.address_id = a.address_id;

select * from customer_addressed;

create table customer_spendings as 
	select first_name || ' ' ||last_name as full_name, sum(amount) as total_amount
	from customer as c
	left join payment as p
	on c.customer_id = p.customer_id
	group by first_name || ' ' || last_name;

select * from customer_spendings;

create view customer_anonymous as
	select customer_id, initials
	from customer
	where first_name ilike 'c%';

select * from customer_anonymous;

CREATE OR REPLACE VIEW films_category AS
	SELECT title, name,	length
	FROM film f
		LEFT JOIN film_category fc
			ON f.film_id = fc.film_id
				LEFT JOIN category c
					ON c.category_id=fc.category_id
					WHERE name IN ('Action','Comedy')
					ORDER BY length DESC;

select * from films_category;

create materialized view mv_filed_category as
	SELECT title, name,	length
	FROM film f
		LEFT JOIN film_category fc
			ON f.film_id = fc.film_id
				LEFT JOIN category c
					ON c.category_id=fc.category_id
					WHERE name IN ('Action','Comedy')
					ORDER BY length DESC;

refresh materialized view mv_filed_category;

select * from mv_filed_category;

update film set length=192 where title = 'SATURN NAME';

drop view customer_anonymous;

alter view customer_anonymous rename to v_customer_anonymous;

CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id

ALTER VIEW v_customer_info
RENAME TO v_customer_information;

ALTER VIEW v_customer_information
RENAME COLUMN customer_id TO c_id;