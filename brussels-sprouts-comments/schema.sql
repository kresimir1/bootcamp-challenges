DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  recipe_name VARCHAR(255) NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment VARCHAR(255),
  recipe_name VARCHAR(255),
  recipe_id INT REFERENCES recipes(id)
);
