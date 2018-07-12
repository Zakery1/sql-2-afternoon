-- 1
select *
FROM Invoice i
JOIN InvoiceLine il ON il.invoiceId = i.invoiceId
WHERE il.UnitPrice > 0.99;

-- 2
select Invoice.InvoiceDate, Customer.FirstName, Customer.LastName, Invoice.Total
from Invoice 
join Customer ON Invoice.customerid = Customer.customerId

-- 3
select Customer.firstname, Customer.lastname, Employee.firstname, Employee.lastname
from Customer
join Employee On Customer.Supportrepid = Employee.employeeid

--4
select Album.title, Artist.name
from Album
join Artist On Album.artistid = Artist.artistid

--5
select PlaylistTrack.trackid
from PlaylistTrack
Join Playlist ON Playlist.PlaylistId = PlaylistTrack.Playlistid
where Playlist.name = 'Music'

--6
select Track.name
from Track
Join PlaylistTrack ON PlaylistTrack.trackid = Track.trackid
where PlaylistTrack.PlaylistId = 5;

--7
select Track.name, Playlist.name
from Track
join PlaylistTrack ON Track.trackid = PlaylistTrack.trackid
join Playlist ON PlaylistTrack.playlistid = Playlist.playlistid

--8
select Track.name, Album.title
from Track
join Album ON Track.albumid = Album.albumid
join Genre ON Genre.genreid = Track.genreid
where Genre.name = "Alternative";

--1
select * 
from Invoice
where InvoiceID IN (select InvoiceId from InvoiceLine WHERE UnitPrice > .99); */

--2
SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId FROM Playlist WHERE Name = "Music" );

--3
select Name
from Track
where TrackId IN ( Select TrackId from PlaylistTrack where PlaylistId = 5);

--4
select *
from Track
where GenreId IN ( Select GenreId from Genre where Name ="Comedy")

--5
select *
from Track
where AlbumId IN ( select AlbumId from Album where Title="Fireball")

--6
select *
from Track 
where AlbumId IN ( select AlbumId from Album where ArtistId IN (select ArtistId from Artist where Name = "Queen"));

--1
update Customer
set Fax = null
where Fax is not null;

--2
UPDATE Customer 
Set Company = "Self"
WHERE Company IS null;

--3
Update Customer 
Set LastName = "Thompson"
WHERE  FirstName = "Julia" AND LastName = "Barnett";

---4
update Customer
Set SupportRepId = "4"
Where Email = "luisrojas@yahoo.cl";

--5
Update Tracks
set composer = "The darkness around us"
WHERE GenreId IN ( SELECT GenreId FROM Genre WHERE Name = "Metal" )
AND Composer is NULL;

--1
SELECT Count(*), Genre.Name
FROM Track 
JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name;

--2
SELECT Count(*), Genre.Name
FROM Track 
JOIN Genre ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = 'Pop' OR Genre.Name = 'Rock'
GROUP BY Genre.Name;

--3
SELECT Artist.Name, Count(*)
FROM Artist 
JOIN Album  ON Artist.ArtistId = Album.ArtistId
GROUP BY Album.ArtistId;

--1
SELECT DISTINCT Composer
FROM Track;

--2
SELECT DISTINCT BillingPostalCode
FROM Invoice;

--3
SELECT DISTINCT Company
FROM Customer;

--1

DELETE 
FROM practice_delete 
WHERE Type = "bronze";

--2
DELETE 
FROM practice_delete 
WHERE Type = "silver";

--3 
FROM practice_delete 
WHERE Value = 150

--eCommerce
SELECT SUM(price) FROM
Products  JOIN Orders
ON Products.Name = Orders.product
WHERE Orders.Product = 'car'

ALTER TABLE Orders
ADD Email REFERENCES Users(Email);

UPDATE Orders
SET Name = 'zak@earth'
WHERE Product = 'shoe';

SELECT * FROM Orders;

SELECT * FROM Orders
WHERE Name = 'eric@earth'

SELECT Count(*), Name FROM Orders
GROUP BY Name






