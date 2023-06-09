-- Question 1 - Which actors have the first name "Scarlett"?
SELECT * from sakila.actor where first_name like "%Scarlett%";
-- Question 2 - Which actors have the last names that contain the word "son"?
Select * from sakila.actor where last_name like "%son%";
-- Question 3 - Return the full names (first and last) of actors with 'son' in their last name, ordered by their first name.
select concat(first_name, '', last_name) as full_name
FROM actor
WHERE last_name LIKE '%son%';
-- Question 4 - In total, how many last names occur in the "actor" table?
select last_name, COUNT(*) AS name_count
FROM actor
Group by last_name;
-- Question 5 - How many distinct countries are there?
select * from sakila.country LIMIT 10;
select DISTINCT country FROM country;
select count(distinct country) from country;
-- Question 6 - What are the names of all the languages in the language table (sorted alphabetically)?
select distinct name
from language
order by name ASC;
-- Question 7 - What is the sum of all the payment amounts and the avergage payment amount by customer?
select * from sakila.customer;
select * from sakila.payment;
select c.first_name, c.last_name, sum(amount) as Total_amt, avg(amount) as Avg_Amount
from sakila.customer c
join sakila.payment p
on c.customer_id = p.customer_id;

-- Question 8 - List the 5 customers who have paid the highest amounts.
select
c.first_name,
c.last_name,
sum(p.amount) as total_amount
FROM sakila.payment p
inner join sakila.customer c
on p.customer_id = c.customer_id
GROUP by
c.customer_id, c.first_name, c.last_name
order by
total_amount DESC
limit 5;

--- Question 9 - Create a list of actors and the number of movies by each actor, sorted by the number of movies in descending order.
select count(film_id) as Number_movies, concat(a.first_name, " ", a.last_name) as Actor
from actor a
join film_actor f
on a.actor_id = f.actor_id
group by a.first_name, a.last_name
order by number_movies DESC;
