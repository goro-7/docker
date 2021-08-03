CREATE USER goro;
CREATE DATABASE gorodb;
GRANT ALL PRIVILEGES ON DATABASE gorodb TO goro;
ALTER USER postgres with PASSWORD 'fill me please';
ALTER USER goro with PASSWORD 'fill me please';
