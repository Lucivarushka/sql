SELECT f.idFilms, f.Name, t.profit
FROM (
         SELECT MIN(profit) AS min_number
         FROM
              (
             SELECT idFilm, SUM(price) AS profit
             FROM tickets
             GROUP BY idFilm
              ) AS xz
     ) AS min_sub
JOIN
     (
         SELECT idFilm, SUM(price) AS profit
         FROM tickets
         GROUP BY idFilm
     ) AS t ON (min_sub.min_number = t.profit)
JOIN
     films f ON (f.idFilms = t.idFilm) WHERE QUARTER(CURTIME());