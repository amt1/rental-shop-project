DROP TABLE IF EXISTS past_rentals;
DROP TABLE IF EXISTS current_rentals;
DROP TABLE IF EXISTS stock_items;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sizes;
DROP TABLE IF EXISTS item_status_codes;

CREATE TYPE flag AS ENUM ('0','1','2');
-- 0 = 'All ok', 1 = 'Returned items late or damaged', 2 = 'Banned after previous loss written off'
-- CREATE TYPE item_status_code AS ENUM ('0','1','2','3','4','5','6','7');
-- these are getting too complex and likely to change, going for a lookup table instead
CREATE TYPE size_type AS ENUM ('Baby', 'Kids','Adult', 'Women', 'Men');

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
  warnings flag
);

CREATE TABLE sizes (
  id SERIAL2 PRIMARY KEY,
  sizing size_type,
  standard_size VARCHAR(255)
);

CREATE TABLE item_status_codes (
  id SERIAL2 PRIMARY KEY,
  meaning VARCHAR(255)
);

CREATE TABLE stock_items (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  size INT2 REFERENCES sizes(id),
  measurements TEXT,
  cleaning_instructions VARCHAR(255),
  status INT2 REFERENCES item_status_codes(id)
);
