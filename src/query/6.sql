SELECT  DAY(Birthdate) AS DAY, MONTH(Birthdate) AS MONTH
FROM viewer
GROUP BY MONTH(Birthdate),DAY(Birthdate)
HAVING COUNT(MONTH(Birthdate))>5 AND COUNT(DAY(Birthdate))>5;