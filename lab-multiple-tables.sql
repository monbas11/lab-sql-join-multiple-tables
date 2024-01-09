#Write a query to display for each store its store ID, city, and country
select c.store_id, d.address, a.city, f.country
from store as c
join address as d on c.address_id = d.address_id
join city as a on a.city_id = d.city_id
join country AS f on f.country_id = a.country_id
group by c.store_id, d.address, a.city, f.country;


#Write a query to display how much business, in dollars, each store brought in.
select c.store_id, sum(f.amount) as total_amount
from store as c
join staff as s on c.store_id = s.store_id
join payment AS f on s.staff_id = f.staff_id
join rental as r on f.rental_id = r.rental_id
group by c.store_id;

#What is the average running time of films by category?
select s.name, avg(d.length) as average_length
from film as d
join film_category as c on d.film_id = c.film_id
join category as s on c.category_id = s.category_id
group by s.name;

#Which film categories are longest?
select s.name, avg(d.length) as average_length
from film as d
join film_category as c on d.film_id = c.film_id
join category as s on c.category_id = s.category_id
group by s.name
order by average_length desc;

#Display the most frequently rented movies in descending order.
select a.title, count(distinct r.rental_id) as n_rentals
from film as a
join inventory as i on a.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
group by a.title
order by n_rentals desc;

#List the top five genres in gross revenue in descending order.
select a.name, sum(p.amount) as revenues
from category as a
join film_category as fc on a.category_id = fc.category_id
join film as f on fc.film_id = f.film_id
join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
join payment as p on r.rental_id = p.rental_id
group by a.name
order by revenues desc;

#Is "Academy Dinosaur" available for rent from Store 1?
select
    f.title,
    s.store_id,
    count(*) as availability
from film as f
join inventory as i on f.film_id = i.film_id
join store as s on i.store_id = s.store_id
where
    f.title = 'Academy Dinosaur' and s.store_id = 1
group by f.title, s.store_id;

#yes!!!!! it is avalable 