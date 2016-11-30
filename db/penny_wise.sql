DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;

CREATE TABLE categories
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE merchants
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE transactions
(
  id SERIAL8 primary key,
  merchant_id INT8 references merchants(id),
  category_id INT8 references categories(id),
  value FLOAT,
  item VARCHAR(255) not null,
  transaction_date date
);