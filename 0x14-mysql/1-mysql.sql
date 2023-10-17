-- Create a MySQL user named holberton_user on both web-01 and web-02 with the host name set to localhost
-- and the password projectcorrection280hbtn. This will allow us to access the replication status on both servers.
-- Make sure that holberton_user has permission to check the primary/replica status of your databases.
-- In addition to that, make sure that task #3 of your SSH project is completed for web-01 and web-02.
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
