--ORDER
-----------

SELECT * FROM subjects ORDER BY subject ASC;

SELECT * FROM subjects ORDER BY location ASC;

--WHERE
-----------

SELECT * FROM books WHERE title='Little Women';

SELECT * FROM books WHERE title LIKE '%Python%';
--ILIKE is case insensitve

SELECT subject FROM subjects WHERE location='Main St' ORDER BY subject;

--JOINS
-----------

--SELECT title FROM public.books WHERE subject_id=4;
SELECT books.title FROM books INNER JOIN subjects ON books.subject_id=subjects.id WHERE subjects.subject='Computers';

SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books INNER JOIN authors ON books.author_id=authors.id INNER JOIN subjects ON books.subject_id=subjects.id;

SELECT books.title, stock.retail FROM books INNER JOIN editions ON books.id=editions.book_id INNER JOIN stock ON editions.isbn=stock.isbn ORDER BY stock.retail DESC;

SELECT books.title, editions.isbn, publishers.name, stock.retail FROM editions INNER JOIN books ON books.id=editions.book_id INNER JOIN publishers ON publishers.id=editions.publisher_id INNER JOIN stock ON stock.isbn=editions.isbn WHERE books.title='Dune';

SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM books INNER JOIN editions ON books.id=editions.book_id INNER JOIN stock ON editions.isbn=stock.isbn INNER JOIN shipments ON stock.isbn=shipments.isbn INNER JOIN customers ON customers.id=shipments.customer_id ORDER BY shipments.ship_date;

--Grouping and Counting
-----------------------------

SELECT COUNT(*) FROM books;

SELECT COUNT(location) FROM subjects;

SELECT COUNT(location), location FROM subjects GROUP BY location;

SELECT books.id, books.title, COUNT(editions.edition) FROM editions INNER JOIN books ON books.id=editions.book_id GROUP BY books.title, books.id;
