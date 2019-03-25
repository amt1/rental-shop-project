DROP TABLE IF EXISTS past_rentals;
DROP TABLE IF EXISTS current_rentals;
DROP TABLE IF EXISTS stock_items;
DROP TABLE IF EXISTS customers;

CREATE TYPE warnings AS ENUM ('0','1','2');
-- 0 = 'All ok', 1 = 'Returned items late or damaged', 2 = 'Banned after previous loss written off'

CREATE EXTENSION citext;
CREATE DOMAIN valid_email AS citext
  CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  phone VARCHAR(255),
  email valid_email,
  address VARCHAR(255),
  account_balance INT2,
  flag warnings
);
