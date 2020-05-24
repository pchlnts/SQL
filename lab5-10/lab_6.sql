-- 1.	Вивести значення наступних колонок: назва книги, ціна, назва видавництва. Використовувати внутрішнє з'єднання, застосовуючи where.
SELECT title, price, publisher.publisher FROM book, publisher
WHERE book.publisher_id = publisher.id; 
-- 2.	Вивести значення наступних колонок: назва книги, назва категорії. Використовувати внутрішнє з'єднання, застосовуючи inner join.
SELECT title, category.category FROM book INNER JOIN category on book.category_id = category.id;
-- 3.	Вивести значення наступних колонок: назва книги, ціна, назва видавництва, формат.
SELECT title, price, format, publisher.publisher FROM book , publisher 
WHERE book.publisher_id = publisher.id;
-- 4.	Вивести значення наступних колонок: тема, категорія, назва книги, назва видавництва. Фільтр по темам і категоріям.
SELECT topic.topic, category.category, title, publisher.publisher FROM book,topic,category, publisher 
WHERE book.topic_id = topic.id AND
book.category_id = category.id AND book.publisher_id = publisher.id 
ORDER BY topic.topic,category.category
-- 5.	Вивести книги видавництва 'BHV', видані після 2000 р
SELECT title ,price, publisher.publisher FROM book, publisher 
WHERE book.publisher_id = publisher.id AND 
publisher.publisher LIKE '%BHV%%' AND Extract(Year from book.date)>2000;
-- 6.	Вивести загальну кількість сторінок по кожній назві категорії. Фільтр по спадаючій кількості сторінок.
SELECT SUM(price),category.category From book,category 
WHERE book.category_id = category.id Group by category.category



-- 7.	Вивести середню вартість книг по темі 'Використання ПК' і категорії 'Linux'.
SELECT AVG(price) FROM book,topic,category 
WHERE book.topic_id = topic.id 
AND book.category_id = category.id
AND topic.topic LIKE '%%Використання ПК%%' 
AND category.category 
LIKE '%%Linux%%'
-- 8.	Вивести всі дані універсального відношення. Використовувати внутрішнє з'єднання, застосовуючи where.
SELECT topic.topic,category.category,publisher.publisher
FROM book,topic,category,publisher
WHERE book.topic_id = topic.id
AND book.category_id = category.id 
AND book.publisher_id = publisher.id
-- 9.	Вивести всі дані універсального відношення. Використовувати внутрішнє з'єднання, застосовуючи inner join.
SELECT topic.topic,category.category,publisher.publisher FROM book 
INNER JOIN topic on book.topic_id = topic.id
INNER JOIN category on book.category_id = category.id 
INNER JOIN publisher on book.publisher_id = publisher.id
-- 10.	Вивести всі дані універсального відношення. Використовувати зовнішнє з'єднання, застосовуючи left join / rigth join.
SELECT topic.topic,category.category,publisher.publisher FROM book 
LEFT OUTER JOIN topic on book.topic_id = topic.id
LEFT OUTER JOIN category on book.category_id = category.id 
LEFT OUTER Join publisher on book.publisher_id = publisher.id

SELECT topic.topic,category.category,publisher.publisher FROM book 
Right OUTER JOIN topic on book.topic_id = topic.id
Right OUTER JOIN category on book.category_id = category.id 
Right OUTER JOIN publisher on book.publisher_id = publisher.id
-- 11.	Вивести пари книг, що мають однакову кількість сторінок. Використовувати само об’єднання і аліаси (self join).
SELECT a.title as title_1 , 
      a.pages as Amount_of_pages_1,
 	  b.title as title_2,
      b.pages as Amount_of_pages_2 
FROM book a ,book b  
WHERE   a.pages=b.pages AND a.id_book <> b.id_book
-- 12.	Вивести тріади книг, що мають однакову ціну. Використовувати самооб'єднання і аліаси (self join).
SELECT a.title as title_1 ,
 a.price as price_1,
 b.title as title_2,
b.price as price_2,c.title 
as title_3, c.price as price_3 
FROM book a ,book b,book c  
WHERE   a.price=b.price AND b.price =c.price 
AND a.price=c.price AND a.id_book <> b.id_book and a.id_book <>c.id_book AND b.id_book<>c.id_book
-- 13.	Вивести всі книги категорії 'C ++'. Використовувати підзапити (subquery).
SELECT  * FROM book  
WHERE category_id in (SELECT id FROM category WHERE category LIKE '%%C ++%%')
-- 14.	Вивести книги видавництва 'BHV', видані після 2000 р Використовувати підзапити (subquery).
SELECT  * FROM book  
WHERE publisher_id in (SELECT id FROM publisher
WHERE publisher LIKE '%BHV%%' AND Extract(Year from book.date)>2000)
-- 15.	Вивести список видавництв, у яких розмір книг перевищує 400 сторінок. Використовувати пов'язані підзапити (correlated subquery).
SELECT distinct(publisher.publisher) 
FROM publisher  INNER JOIN book  on  publisher.id = book.publisher_id
  WHERE book.publisher_id in (SELECT publisher_id FROM book 
  WHERE pages >400);
-- 16.	Вивести список категорій в яких більше 3-х книг. Використовувати пов'язані підзапити (correlated subquery).
SELECT c.category as Категорія,count(*) as Кількість_книг 
FROM category c INNER JOIN book b on c.id=b.category_id 
  WHERE (select count(*) FROM  book b 
  WHERE b.category_id=c.id ) >= 3 GROUP BY category;
-- 17.	Вивести список книг видавництва 'BHV', якщо в списку є хоча б одна книга цього видавництва. Використовувати exists.
SELECT * FROM book 
WHERE  EXISTS(SELECT 1 FROM publisher 
WHERE publisher LIKE '%BHV%%' )
-- 18.	Вивести список книг видавництва 'BHV', якщо в списку немає жодної книги цього видавництва. Використовувати not exists.
SELECT * FROM book 
WHERE  NOT EXISTS (SELECT 1 FROM publisher WHERE book.publisher_id= publisher.id 
AND publisher LIKE '%BHV%%' )
-- 19.	Вивести відсортований загальний список назв тем і категорій. Використовувати union.
SELECT 'book' as type,title  
FROM book union select 'topic' as type, topic 
FROM topic union select 'category' as type, 
category FROM category order by title
-- 20.	Вивести відсортований в зворотному порядку загальний список перших слів, назв книг і категорій що не повторюються. Використовувати union.

SELECT DISTINCT  'book' AS TYPE,substring(title FROM 0 for position(' ' in title))  
FROM book UNION SELECT 'category' AS TYPE, 
category FROM category 
