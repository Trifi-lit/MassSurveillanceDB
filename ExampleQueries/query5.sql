SELECT `URL Address`
FROM website
WHERE `Number of Visitors` >= 100000 AND W_List NOT IN ('Whitelist') 
