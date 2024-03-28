CREATE DATABASE IF NOT EXISTS competitor1;
CREATE DATABASE IF NOT EXISTS competitor2;
CREATE DATABASE IF NOT EXISTS competitor3;
CREATE DATABASE IF NOT EXISTS competitor4;
CREATE DATABASE IF NOT EXISTS competitor5;
CREATE DATABASE IF NOT EXISTS competitor6;

CREATE USER 'competitor1'@'%' IDENTIFIED BY 'competitor1';
CREATE USER 'competitor2'@'%' IDENTIFIED BY 'competitor2';
CREATE USER 'competitor3'@'%' IDENTIFIED BY 'competitor3';
CREATE USER 'competitor4'@'%' IDENTIFIED BY 'competitor4';
CREATE USER 'competitor5'@'%' IDENTIFIED BY 'competitor5';
CREATE USER 'competitor6'@'%' IDENTIFIED BY 'competitor6';

GRANT ALL PRIVILEGES ON competitor1.* TO 'competitor1'@'%';
GRANT ALL PRIVILEGES ON competitor2.* TO 'competitor2'@'%';
GRANT ALL PRIVILEGES ON competitor3.* TO 'competitor3'@'%';
GRANT ALL PRIVILEGES ON competitor4.* TO 'competitor4'@'%';
GRANT ALL PRIVILEGES ON competitor5.* TO 'competitor5'@'%';
GRANT ALL PRIVILEGES ON competitor6.* TO 'competitor6'@'%';