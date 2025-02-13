select p.customer_id, amount, concat(first_name, ' ', last_name ) as full_name
	from payment as p
	inner join customer as c
	on p.customer_id = c.customer_id;

select p.*, first_name, last_name, email 
	from payment as p
	inner join staff as s
	on s.staff_id = p.staff_id
	where s.staff_id = 2;

select first_name, last_name, phone, district from customer as c
	left join address as a
	on c.address_id = a.address_id
	where district = 'Texas';

select * from address as a
	left join customer as c
	on c.address_id = a.address_id
	where c.customer_id is null;

select first_name, last_name, email, ad.city_id, district, city, country
	from customer as c
	left join address as ad
		on c.address_id = ad.address_id
			left join city as ct
				on ad.city_id = ct.city_id
					left join country  as co
						on ct.country_id = co.country_id
	where country = 'Brazil';
