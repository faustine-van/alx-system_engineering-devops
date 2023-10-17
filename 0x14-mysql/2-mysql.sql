-- Create a database named tyrell_corp.
-- Within the tyrell_corp database create a table named nexus6
-- and add at least one entry to it.
-- Make sure that holberton_user has SELECT permissions on your table so
-- that we can check that the table exists and is not empty.
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE IF NOT EXISTS nexus6(
id INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(256) NOT NULL
);
INSERT INTO nexus6 (name) VALUES('Leon');
GRANT SELECT ON tyrell_corp.* TO 'holberton_user'@'localhost';
