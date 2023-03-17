-- Q1: Write query to return the email,first name,last name,& Genre 
--     of all Rock Music listener. 
--     Return your list ordered alphabetically by email starting with A.

sol:
select a.email,a.first_name,a.last_name from customer a
join invoice b on a.customer_id=b.customer_id
join invoice_line c on b.invoice_id = c.invoice_id
where track_id in(
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;

-- Q2: Lets invite the artists who have written the most rock music 
--     in our dataset. write a query that returns the Artist name and
--     total track count of the top 10 rock bands.

sol:
select artist.artist_id, artist.name,count(artist.artist_id) as number_of_songs from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
Limit 10;

-- Q3: Return all the track names that have a song length longer 
--     than the average song length. Return the Name and Milliseconds
--     for each track. order by the song length with the longest songs
--     listed first.

sol:
select name, milliseconds from track
where milliseconds >(select avg(milliseconds) as avg_track_length
from track)
order by milliseconds desc;
