SELECT f.idFilms, f.Name, t.profit
FROM (
		SELECT MAX(profit) AS max_number
		FROM
		(
			SELECT idFilm, SUM(price) AS profit
			FROM tickets
			GROUP BY idFilm
		) AS xz
	) AS max_sub
JOIN
(
	SELECT idFilm, SUM(price) AS profit
	FROM tickets
	GROUP BY idFilm
) AS t ON (max_sub.max_number = t.profit)
JOIN
	films f ON (f.idFilms = t.idFilm) WHERE QUARTER(CURTIME());