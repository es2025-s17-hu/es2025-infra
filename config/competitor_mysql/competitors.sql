CREATE DATABASE IF NOT EXISTS competitor-4621;
CREATE DATABASE IF NOT EXISTS competitor-7552;
CREATE DATABASE IF NOT EXISTS competitor-6513;
CREATE DATABASE IF NOT EXISTS competitor-2494;
CREATE DATABASE IF NOT EXISTS competitor-6455;
CREATE DATABASE IF NOT EXISTS competitor-9546;
CREATE DATABASE IF NOT EXISTS competitor-9999;


CREATE USER 'competitor-4621'@'%' IDENTIFIED BY '4621';
CREATE USER 'competitor-7552'@'%' IDENTIFIED BY '7552';
CREATE USER 'competitor-6513'@'%' IDENTIFIED BY '6513';
CREATE USER 'competitor-2494'@'%' IDENTIFIED BY '2494';
CREATE USER 'competitor-6455'@'%' IDENTIFIED BY '6455';
CREATE USER 'competitor-9546'@'%' IDENTIFIED BY '9546';
CREATE USER 'competitor-9999'@'%' IDENTIFIED BY '9999';

GRANT ALL PRIVILEGES ON competitor-4621.* TO 'competitor-4621'@'%';
GRANT ALL PRIVILEGES ON competitor-7552.* TO 'competitor-7552'@'%';
GRANT ALL PRIVILEGES ON competitor-6513.* TO 'competitor-6513'@'%';
GRANT ALL PRIVILEGES ON competitor-2494.* TO 'competitor-2494'@'%';
GRANT ALL PRIVILEGES ON competitor-6455.* TO 'competitor-6455'@'%';
GRANT ALL PRIVILEGES ON competitor-9546.* TO 'competitor-9546'@'%';
GRANT ALL PRIVILEGES ON competitor-9546.* TO 'competitor-9999'@'%';