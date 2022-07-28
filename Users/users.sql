CREATE USER 'admin'@'localhost' IDENTIFIED BY '123';
CREATE USER 'admin'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON `db mass`.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `db mass`.* TO 'admin'@'%';

CREATE USER 'analyst'@'localhost' IDENTIFIED BY '123';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db mass`.* TO 'analyst'@'localhost';

CREATE USER 'officer'@'localhost' IDENTIFIED BY '123';
CREATE USER 'officer'@'%' IDENTIFIED BY '123';
GRANT SELECT(C_List,`Social Security Number`) ON `db mass`.citizen TO 'officer'@'localhost';
GRANT SELECT(C_List,`Social Security Number`) ON `db mass`.citizen TO 'officer'@'%';
GRANT SELECT ON `db mass`.website TO 'officer'@'localhost';
GRANT SELECT ON `db mass`.website TO 'officer'@'%';
GRANT SELECT ON `db mass`.contacts TO 'officer'@'localhost';
GRANT SELECT ON `db mass`.contacts TO 'officer'@'%';