DROP TABLE IF EXISTS past_rentals;
DROP TABLE IF EXISTS current_rentals;
DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS stock_items;
DROP TABLE IF EXISTS credit_cards;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sizes;
DROP TABLE IF EXISTS item_status_codes;
DROP TABLE IF EXISTS item_themes;
DROP TABLE IF EXISTS rental_return_codes;

CREATE TYPE flag AS ENUM ('0','1','2');
-- 0 = 'All ok', 1 = 'Returned items late or damaged', 2 = 'Banned after previous loss written off'
-- CREATE TYPE item_status_code AS ENUM ('0','1','2','3','4','5','6','7');
-- these are getting too complex and likely to change, going for a lookup table instead
CREATE TYPE size_types AS ENUM ('Baby', 'Kids','Adult', 'Women', 'Men');
CREATE TYPE colour_names AS ENUM ('Red', 'Blue', 'Orange', 'Yellow','Green','Brown','Black','White');
CREATE TYPE theme_types AS ENUM ('Seasonal', 'Theatre','Adult','Special Occasion', 'Fandom');

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
  sizing size_types,
  standard_size VARCHAR(255)
);

CREATE TABLE item_status_codes (
  id SERIAL2 PRIMARY KEY,
  meaning VARCHAR(255)
);

CREATE TABLE theme_codes (
  id SERIAL2 PRIMARY KEY,
  theme_type theme_types,
  theme VARCHAR(255)
);

CREATE TABLE stock_items (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  size INT2 REFERENCES sizes(id),
  measurements TEXT,
  cleaning_instructions VARCHAR(255),
  status INT2 REFERENCES item_status_codes(id),
--  themes INT2[],
--  themes VARCHAR,
  colour colour_names
);

CREATE TABLE item_themes (
  id SERIAL2 PRIMARY KEY,
  theme_code INT2 REFERENCES theme_codes(id) ON DELETE CASCADE,
  item_id INT4 REFERENCES stock_items(id) ON DELETE CASCADE
);

CREATE TABLE rental_return_codes (
  id SERIAL2 PRIMARY KEY,
  meaning VARCHAR(255)
);

CREATE TABLE credit_cards (
  -- these should be deleted when the transaction is closed
  -- all this table's data should be encrypted, stored somewhere safe and deleted asap
  id SERIAL2 PRIMARY KEY,
  totally_safe_number VARCHAR(255),
  start_date DATE,
  end_date DATE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE
);

CREATE TABLE transactions (
  -- this table should periodically be archived
  id SERIAL8 PRIMARY KEY,
  transaction_date DATE,
  customer_id INT4 REFERENCES customers(id) NOT NULL,
  credit_card INT2 REFERENCES credit_cards(id) ON DELETE SET NULL,
  other_payment VARCHAR(255),
  deposit_paid INT4,
  balance_paid INT4,
  refund_paid INT4
);

CREATE TABLE rentals (
  id SERIAL8 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) NOT NULL,
  stock_item_id INT4 REFERENCES stock_items(id) NOT NULL,
  rental_date DATE,
  return_due_date DATE,
  return_code INT2 REFERENCES rental_return_codes(id),
  transaction_id INT8 REFERENCES transactions(id) ON DELETE SET NULL
);
