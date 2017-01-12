-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS sales CASCADE;




CREATE TABLE employees(
  id SERIAL PRIMARY KEY,
  employee_name VARCHAR(255),
  employee_email VARCHAR(320)
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  customer VARCHAR(255),
  customer_account_no VARCHAR(255)
);



CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  employee_id INT REFERENCES employees(id),
  customer_id INT REFERENCES customers(id),
  product_name VARCHAR(255),
  sale_date DATE,
  sale_amount DECIMAL(19,2),
  units_sold INT,
  invoice_no INT,
  invoice_frequency VARCHAR(255)
);
