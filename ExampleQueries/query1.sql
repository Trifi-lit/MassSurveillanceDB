SELECT `Social Security Number(1)`
FROM (SELECT citizen.`Social Security Number` FROM citizen WHERE C_List = 'Blacklist') AS A
  JOIN contacts ON contacts.`Social Security Number(2)` = A.`Social Security Number`
UNION
SELECT `Social Security Number(2)`
FROM (SELECT citizen.`Social Security Number` FROM citizen WHERE C_List = 'Blacklist') AS B
  JOIN contacts ON contacts.`Social Security Number(1)` = B.`Social Security Number`