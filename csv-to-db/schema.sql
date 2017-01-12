DROP TABLE IF EXISTS ingredients_list;

CREATE TABLE ingredients_list(
  id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(255) NOT NULL
);
