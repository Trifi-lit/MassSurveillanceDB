SELECT C_Name
FROM citizen JOIN uses ON citizen.`Social Security Number` = uses.`Social Security Number`
             JOIN keyphrase ON keyphrase.`ID` = uses.`ID`
WHERE keyphrase.`Content` = 'YoLo' AND citizen.`C_List` NOT IN ('Whitelist')            