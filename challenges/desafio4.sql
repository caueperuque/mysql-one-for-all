SELECT 
	u.user_name AS pessoa_usuaria,
    IF(YEAR(max(uh.played_timestamp)) <= 2020, 'Inativa', 'Ativa') AS status_pessoa_usuaria
FROM SpotifyClone.users AS u
	INNER JOIN SpotifyClone.user_history AS uh ON u.user_id = uh.user_id
GROUP BY
	u.user_name
ORDER BY
	u.user_name;
