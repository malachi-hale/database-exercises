USE albums_db;
SELECT * 
	FROM albums;
SELECT 
	DISTINCT artist
	FROM albums;
DESCRIBE albums;
SELECT 
	MAX(release_date) 
	FROM albums;
SELECT 
	MIN(release_date) 
	FROM albums;
SELECT name
	FROM albums 
	WHERE artist = 'Pink Floyd';
SELECT release_date 
	FROM albums 
	WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
SELECT genre 
	FROM albums 
	WHERE name = 'Nevermind';
SELECT * 
	FROM albums 
	WHERE release_date BETWEEN 1990 and 1999; 
SELECT * 
	FROM albums 
	WHERE sales < 20;
SELECT * 
	FROM albums 
	WHERE genre = 'Rock';
	