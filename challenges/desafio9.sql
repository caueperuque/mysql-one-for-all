SELECT
	COUNT(uh.user_id) AS musicas_no_historico
FROM
	SpotifyClone.user_history AS uh
    INNER JOIN SpotifyClone.users AS u ON uh.user_id = u.user_id
WHERE
	u.user_name = 'Barbara Liskov';