SELECT
	art.artist_name AS artista,
    album.album_title AS album,
    COUNT(uf.user_id) AS pessoas_seguidoras
FROM
	SpotifyClone.artists AS art
    JOIN SpotifyClone.album AS album ON art.artist_id = album.artist_id
    JOIN SpotifyClone.user_follow AS uf ON art.artist_id = uf.artist_id
GROUP BY
	art.artist_name, album.album_title
ORDER BY COUNT(uf.user_id) DESC, art.artist_name, album.album_title