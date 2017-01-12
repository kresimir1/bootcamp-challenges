

INSERT INTO groceries (name)
VALUES ('rice');




INSERT INTO comments (body, grocery_id)
SELECT 'it makes great sushi' AS body , groceries.id AS grocery_id
FROM groceries WHERE groceries.name = 'rice';

INSERT INTO comments (body, grocery_id)
SELECT 'rice is nice' AS body , groceries.id AS grocery_id
FROM groceries WHERE groceries.name = 'rice';
