CREATE TEMPORARY TABLE D AS SELECT * FROM citizen;
SELECT citizen.`Social Security Number`, citizen.C_Name , citizen.Gender , citizen.`Date of Birth` , citizen.`IP Address`, citizen.`Phone Number`, citizen.`Physical Address`
FROM citizen JOIN D ON D.`Physical Address` = citizen.`Physical Address` AND D.`Social Security Number` != citizen.`Social Security Number`