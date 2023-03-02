--- Write a query to display for each store its store ID, city, and country.
use sakila;
SELECT store.store_id, city.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;
select * from store;
-- 2-Write a query to display how much business, in dollars, each store brought in.

SELECT store_id, SUM(sale_amount) as total_sales
FROM sales
GROUP BY store_id;
-- Which film categories are longest?
SELECT c.name, MAX(f.length) as 'longest film'
FROM category c
JOIN film_category fc USING(category_id)
JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name
ORDER BY MAX(f.length) DESC;

-- Display the most frequently rented movies in descending order.

SELECT rental_id, COUNT(*) as rental_count
FROM rental
GROUP BY rental_id
ORDER BY rental_count DESC;

select * from film;
select * from payment;
-- List the top five genres in gross revenue in descending order.
SELECT title, SUM(amount) as total_revenue
FROM film f
join payment p
GROUP BY title
ORDER BY total_revenue DESC
LIMIT 5;

-- 6 Is "Academy Dinosaur" available for rent from Store 1?
select * from store;
select * from inventory;
select count(f.title) as number_available,s.store_id
from film f
join inventory i
using(film_id)
join store s
on s.store_id=i.store_id
where (f.title = "Academy Dinosaur")  and (s.store_id=1)
group by store_id
order by  number_available
;
select title from film where title="Academy Dinosaur" ;
