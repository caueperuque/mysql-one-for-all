SELECT
    u.user_name AS pessoa_usuaria,
    COUNT(uh.song_id) AS musicas_ouvidas,
    ROUND(SUM(s.song_length) / 60.0, 2) AS total_minutos
FROM
    SpotifyClone.users AS u
    INNER JOIN SpotifyClone.user_history AS uh ON u.user_id = uh.user_id
    INNER JOIN SpotifyClone.songs AS s ON uh.song_id = s.song_id
GROUP BY
    u.user_name
ORDER BY
    u.user_name;
