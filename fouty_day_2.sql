SELECT
	title,
	CASE
		WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
		WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
		WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
		WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
	END as tier_list
FROM film
	WHERE 
		CASE
			WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
			WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
			WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
			WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
		END is not null;

select 
rating,
	sum(case
		when rating in('PG', 'G') then 1
		else 0
	end) as no_of_rating_with_g_or_pg
from film
where rating in('PG', 'G') 
group by rating;

select
	sum(case when rating = 'G' then 1 else 0 end) as "G",
	sum(case when rating = 'PG' then 1 else 0 end) as "PG"
from film;

select rental_date, coalesce(cast(return_date as varchar), 'not returned')  
from rental order by rental_date desc;


	

 