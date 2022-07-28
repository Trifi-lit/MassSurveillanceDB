SELECT C_Name, citizen.`Social Security Number`, supports.P_Name
FROM citizen JOIN supports  ON citizen.`Social Security Number` = supports.`Social Security Number`
WHERE supports.P_Name = 'Centrist'