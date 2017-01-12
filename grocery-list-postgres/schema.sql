-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

DROP TABLE IF EXISTS groceries CASCADE;
DROP TABLE IF EXISTS comments CASCADE;


CREATE TABLE groceries (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body TEXT NOT NULL,
  grocery_id INTEGER

);
