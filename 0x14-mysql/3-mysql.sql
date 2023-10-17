-- Before you get started with your primary-replica synchronization,
-- you need one more thing in place. On your primary MySQL server (web-01),
-- create a new user for the replica server.

-- The name of the new user should be replica_user, with the host name set to %,
-- and can have whatever password you’d like.
-- replica_user must have the appropriate permissions to replicate your primary MySQL server.
-- holberton_user will need SELECT privileges on the mysql.user table in
-- order to check that replica_user was created with the correct permissions.
CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'replica_user12345';
GRANT REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
