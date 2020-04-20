-- 1 Trivial query for personal_data table 

SELECT * FROM personal_data;

-- 2 --
SELECT * FROM followers;


-- 3  INNER JOIN Example 2 tables
CREATE VIEW third_table AS
SELECT user.username, personal_data.name, personal_data.phone
FROM user
INNER JOIN personal_data
ON user.id = personal_data.user_id;

-- 4  INNER JOIN Three Tables --

CREATE VIEW fourth_table AS
SELECT user.username, personal_data.name,  post.id
FROM ((user
INNER JOIN personal_data ON user.id = personal_data.user_id)
INNER JOIN post ON user.id = post.user_id);

-- 5 -- RIGHT JOIN Example
CREATE VIEW fifth_table AS
SELECT user.username, comment.post_id, comment.text
FROM user
RIGHT JOIN comment
ON user.id = comment.user_id;

-- 6 -- 
CREATE VIEW s_table AS
SELECT user.username,  COUNT(post.id)
FROM user
LEFT JOIN post ON user.id = post.user_id
GROUP BY user.username;

-- 7 --
CREATE VIEW third_table AS
SELECT dialog_user.dialog_id,  user.username
FROM dialog_user
JOIN user ON dialog_user.user_id = user.id
ORDER BY  dialog_user.dialog_id;


SELECT * FROM third_table;
SELECT * FROM fourth_table;
SELECT * FROM fifth_table;
SELECT * FROM sixth_table;
SELECT * FROM seventh_table;