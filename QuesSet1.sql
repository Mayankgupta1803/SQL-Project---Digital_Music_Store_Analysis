					QUESTION SET 1 - EASY LEVEL
	
-- Q1: Who is the senior most employee based on job title?

sol:
	select * from employee
	order by levels desc
	limit 1;

-- Q2: Which country have the more Invoices?

sol:
	select count(*) as c, billing_country from invoice
	group by billing_country
	order by c desc
	limit 1;

-- Q3: What are the top 3 values to total invoice?

sol:
	select total from invoice
	order by total desc
	limit 3;

-- Q4: Which city has the best customer?
-- 	   we would like to throw a promotional Music Festival in the city
-- 	   we made the most money. write a query that returns one city that 
-- 	   has the highest sum of invoice totals. 
-- 	   Return both the city name & sum of all invoice totals.

sol:
	select sum(total) as Invoice_total, billing_city from invoice
	group by billing_city
	order by Invoice_total desc
	limit 1;


-- Q5: Who is the best customer? The customer who has spend the
-- 	   most money will be declared the best customer. 
-- 	   Write a query that return the person who had spend the most money.

sol:
	select a.customer_id,a.first_name,a.last_name,a.city, sum(b.total) as amt_spend from customer a 
	join invoice b on a.customer_id= b.customer_id
	group by a.customer_id
	order by amt_spend desc
	limit 1;
