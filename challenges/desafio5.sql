SELECT
	s.song_title AS cancao,
    COUNT(uh.user_id) AS reproducoes
FROM
	SpotifyClone.songs AS s
    INNER JOIN SpotifyClone.user_history AS uh ON s.song_id = uh.song_id
GROUP BY
	s.song_id
ORDER BY
	reproducoes DESC, cancao ASC
LIMIT 2;