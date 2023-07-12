SELECT 
	art.artist_name AS artista,
    album.album_title AS album
FROM
	SpotifyClone.artists AS art
    INNER JOIN SpotifyClone.album AS album ON art.artist_id = album.artist_id
WHERE
	artist_name = 'Elis Regina';
    