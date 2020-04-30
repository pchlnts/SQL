--insert new records in a table user

USE instagram;

--insert new records in a table user

INSERT INTO user ( username, password)
VALUES ('pchlnts', 12345678);
INSERT INTO user ( username, password)
VALUES ('yana.kuchinskaya', 595797599);
INSERT INTO user ( username, password)
VALUES ('alexpchelintsev', 88888888);
INSERT INTO user ( username, password)
VALUES ('sttsnk.l', 36378);
INSERT INTO user ( username, password)
VALUES ('marisha_radul', 7777777);

--insert new records in a table personal_data

INSERT INTO personal_data ( name, email, phone, user_id)
VALUES ('Yana Kuchinskaya', 'yanakuchinskaya123@gmail.com', '195127392', 3);
INSERT INTO personal_data ( name, email, phone, user_id)
VALUES ('Tatiana Pchelintseva', 'taniapcholka@gmail.com', '1445599656', 1);
INSERT INTO personal_data ( name, email, phone, user_id)
VALUES ('Alex Pchelintsev', 'alexpchelintsev@gmail.com', '1123432167', 4);
INSERT INTO personal_data ( name, email, phone, user_id)
VALUES ('Elizaveta Statsenko', 'lizazaza@gmail.com', '1545637255', 10);
INSERT INTO personal_data ( name, email, phone, user_id)
VALUES ('Marina Radul', 'marisharadul@gmail.com', '12346852566', 11);
--insert new records in a table followers

INSERT INTO followers ( user_id, user1_id)
VALUES (1, 3);
INSERT INTO followers ( user_id, user1_id)
VALUES (1, 4);
INSERT INTO followers ( user_id, user1_id)
VALUES (3, 4);
INSERT INTO followers ( user_id, user1_id)
VALUES (3, 1);
INSERT INTO followers ( user_id, user1_id)
VALUES (10, 4);
INSERT INTO followers ( user_id, user1_id)
VALUES (10, 3);
INSERT INTO followers ( user_id, user1_id)
VALUES (3, 10);
INSERT INTO followers ( user_id, user1_id)
VALUES (3, 11);
INSERT INTO followers ( user_id, user1_id)
VALUES (11, 3);
INSERT INTO followers ( user_id, user1_id)
VALUES (11, 1);
INSERT INTO followers ( user_id, user1_id)
VALUES (1, 11);

--insert new records in a table post

INSERT INTO post (user_id)
VALUES ( 10);
INSERT INTO post (user_id)
VALUES ( 10);
INSERT INTO post ( user_id)
VALUES ( 10);
INSERT INTO post (user_id)
VALUES ( 10);
INSERT INTO post (user_id)
VALUES ( 10);
INSERT INTO post (user_id)
VALUES ( 10);
INSERT INTO post ( user_id)
VALUES ( 10);
INSERT INTO post (user_id)
VALUES ( 10);
INSERT INTO post (user_id)
VALUES ( 1);
INSERT INTO post (user_id)
VALUES ( 3);
INSERT INTO post (user_id)
VALUES ( 3);
INSERT INTO post (user_id)
VALUES ( 11);
INSERT INTO post (user_id)
VALUES (11);
INSERT INTO post (user_id)
VALUES ( 11);


--insert new records in a table comment

INSERT INTO comment (user_id, post_id, text)
VALUES ( 1, 3, "beautiful");
INSERT INTO comment (user_id, post_id, text)
VALUES ( 10, 11, "delightfully");

INSERT INTO comment (user_id, post_id, text)
VALUES ( 1, 14, "OMG");
INSERT INTO comment (user_id, post_id, text)
VALUES ( 3, 13, "CUTIES :)))");
INSERT INTO comment (user_id, post_id, text)
VALUES ( 10, 14, "This took my breath away!!");
INSERT INTO comment (user_id, post_id, text)
VALUES ( 3, 14, "woowwww");


--insert new records in a table file

INSERT INTO file (size, type, post_id)
VALUES ( 82657, 'PNG', 1);
INSERT INTO file (size, type, post_id)
VALUES ( 52657, 'PNG', 2);
INSERT INTO file (size, type, post_id)
VALUES ( 22657, 'PNG', 3);
INSERT INTO file (size, type, post_id)
VALUES ( 72657, 'PNG', 4);
INSERT INTO file (size, type, post_id)
VALUES ( 33657, 'PNG', 5);
INSERT INTO file (size, type, post_id)
VALUES ( 42657, 'PNG', 6);
INSERT INTO file (size, type, post_id)
VALUES ( 80657, 'PNG', 7);
INSERT INTO file (size, type, post_id)
VALUES ( 82657, 'PNG', 8);
INSERT INTO file (size, type, post_id)
VALUES ( 22657, 'PNG', 9);
INSERT INTO file (size, type, post_id)
VALUES ( 55657, 'PNG', 10);
INSERT INTO file (size, type, post_id)
VALUES ( 72657, 'PNG', 11);

INSERT INTO file (size, type, post_id)
VALUES ( 66657, 'PNG', 12);
INSERT INTO file (size, type, post_id)
VALUES ( 35453, 'PNG', 13);
INSERT INTO file (size, type, post_id)
VALUES ( 34545, 'PNG', 14);

--insert new records in a table dialog
INSERT INTO dialog ( id)
VALUES ( 1);
INSERT INTO dialog ( id)
VALUES ( 2);

INSERT INTO dialog ( id)
VALUES ( 3);
INSERT INTO dialog ( id)
VALUES ( 4);
INSERT INTO dialog ( id)
VALUES ( 5);
INSERT INTO dialog ( id)
VALUES ( 6);

--insert new records in a table dialog_user


INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 1, 1);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 2, 3);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 2, 1);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 2, 10);

INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 3, 3);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 3, 11);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 4, 11);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 4, 1);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 5, 10);
INSERT INTO dialog_user ( dialog_id, user_id)
VALUES ( 6, 11);

--insert new records in a table massage


INSERT INTO message ( text, user_id)
VALUES ( 'Do not forget to buy avocados!!!!!' , 1);
INSERT INTO message ( text, user_id)
VALUES ( 'Hello!', 3);


INSERT INTO message ( text, user_id)
VALUES ( 'Do not forget to buy milk!!!' ,11 );
INSERT INTO message ( text, user_id)
VALUES ( 'Hello!', 10);
INSERT INTO message ( text, user_id)
VALUES ( 'Call me' , 1);
INSERT INTO message ( text, user_id)
VALUES ( 'Hello!', 11);

--insert new records in a table dialod_massage 

INSERT INTO dialog_message ( dialog_id, message_id)
VALUES ( 1,1);
INSERT INTO dialog_message ( dialog_id, message_id)
VALUES ( 2, 2);
INSERT INTO dialog_message ( dialog_id, message_id)
VALUES ( 6, 3);
INSERT INTO dialog_message ( dialog_id, message_id)
VALUES ( 3, 4);
INSERT INTO dialog_message ( dialog_id, message_id)
VALUES ( 4, 5);
INSERT INTO dialog_message ( dialog_id, message_id)
VALUES ( 5, 6);





--FUNCTIONALITIES


-- 1 -- 
SELECT * FROM personal_data;

-- 2 --
SELECT * FROM followers


--3 -- INNER JOIN Example 2 tables

SELECT user.username, personal_data.name, personal_data.phone
FROM user
INNER JOIN personal_data
ON user.id = personal_data.user_id;

--4 -- INNER JOIN Three Tables


SELECT user.username, personal_data.name,  post.id
FROM ((user
INNER JOIN personal_data ON user.id = personal_data.user_id)
INNER JOIN post ON user.id = post.user_id);

-- 5 -- RIGHT JOIN Example

SELECT user.username, comment.post_id, comment.text
FROM user
RIGHT JOIN comment
ON user.id = comment.user_id;

-- 6 -- 

SELECT user.username,  COUNT(post.id)
FROM user
LEFT JOIN post ON user.id = post.user_id
GROUP BY user.username;

-- 7 --

SELECT dialog_user.dialog_id,  user.username
FROM dialog_user
JOIN user ON dialog_user.user_id = user.id
ORDER BY  dialog_user.dialog_id






