-- --------- ЛР №7
-- --------- Проектування і перевірка збережених процедур (stored procedure): 
-- --------- без параметрів, з вхідними параметрами, з вхідними параметрами за замовчуванням, з вихідними параметрами
-- 1.	Вивести значення наступних колонок: назва книги, ціна, назва видавництва, формат.
-- (title text, price money,publisher text, format text )
CREATE PROCEDURE T1()
BEGIN
SELECT Title, Price, Publisher, Format FROM book;
END

EXEC T1();
-- 2.	Вивести значення наступних колонок: тема, категорія, назва книги, назва видавництва. Фільтр по темам і категоріям.
CREATE PROCEDURE gettopicCategoryTitlePublisherGroupedByCategory()
BEGIN
SELECT topic, Category, Title, Publisher FROM book GROUP BY Category
END

EXEC gettopicCategoryTitlePublisherGroupedByCategory();
-- 3.	Вивести книги видавництва 'BHV', видані після 2000 р
CREATE PROCEDURE T3
(IN Publisher varchar(30), IN afterYear int)
BEGIN
SELECT * FROM book WHERE book.Publisher = Publisher AND YEAR(date) > afterYear;
END

EXEC T3('BHV', 2000);

-- 4.	Вивести загальну кількість сторінок по кожній назві категорії. Фільтр по спадаючій / зростанню кількості сторінок.
CREATE PROCEDURE T4
(IN ascending tinyint)
BEGIN
IF ascending = 0 THEN
	SELECT SUM(Pages) FROM book GROUP BY Category ORDER BY Category DESC;  
ELSE
    SELECT SUM(Pages) FROM book GROUP BY Category ORDER BY Category ASC;
END IF;
END

EXEC getSummedPagesGroupedByCategory(1);
-- 5.	Вивести середню вартість книг по темі 'Використання ПК' і категорії 'Linux'.
CREATE PROCEDURE T5
(IN topic varchar(50), IN category varchar(50))
BEGIN
SELECT AVG(Price) FROM book WHERE book.topic = topic AND book.category = category;
END


EXEC T5;
-- 6.	Вивести всі дані універсального відношення.
CREATE PROCEDURE T6
BEGIN
SELECT * FROM book;
END
EXEC T6;
-- 7.	Вивести пари книг, що мають однакову кількість сторінок.
CREATE PROCEDURE T7
AS
SELECT cast(a.title as text)  , cast( a.pages as text),
cast(b.title as text) , cast( b.pages as text)
FROM book a ,book b  
WHERE   a.pages=b.pages and a.id_book <> b.id_book
GO;

EXEC T7;
-- 8.	Вивести тріади книг, що мають однакову ціну.
CREATE PROCEDURE T8
AS
SELECT cast(a.title as text)  ,cast(a.price as money) , cast(b.title as text) ,
cast(b.price as money) ,cast(c.title as text) , cast(c.price as money) 
FROM book a ,book b,book c  
WHERE   a.price=b.price and b.price =c.price 
and a.price=c.price and a.id_book <> b.id_book and a.id_book <>c.id_book and b.id_book<>c.id_book
GO;


-- 9.	Вивести всі книги категорії 'C ++'.
CREATE PROCEDURE T9
(IN cat varchar(50))
BEGIN
SELECT * FROM book WHERE Category = cat;
END


-- 10.	Вивести список видавництв, у яких розмір книг перевищує 400 сторінок.
CREATE PROCEDURE T10
(IN pages int)
BEGIN
SELECT Publisher AS Pub FROM book WHERE (SELECT MIN(Pages) FROM book WHERE Publisher = Pub) > pages;
END

-- 11.	Вивести список категорій за якими більше 3-х книг.
CREATE PROCEDURE getCategoriesWhichHavebookAtLeast
(IN num int)
BEGIN
SELECT Category AS cat FROM book WHERE (SELECT COUNT(*) FROM book WHERE Category = cat) > num;
SELECT
EXEC T11;
-- 12.	Вивести список книг видавництва 'BHV', якщо в списку є хоча б одна книга цього видавництва.
CREATE PROCEDURE T12
(IN cat varchar(50))
BEGIN
DECLARE number INT DEFAULT 0;
SET  number = (SELECT COUNT(*) FROM book WHERE Category = cat);
IF number >= 1 THEN
SELECT * book WHERE Category = cat;
END IF;
END


-- 13.	Вивести список книг видавництва 'BHV', якщо в списку немає жодної книги цього видавництва.
CREATE PROCEDURE T13
AS
SELECT * FROM book WHERE  NOT EXISTS (SELECT 1 FROM publisher WHERE book.publisher_id= publisher.id 
									  and publisher like '%BHV%%' )
GO;

EXEC T14;
-- 14.	Вивести відсортоване загальний список назв тем і категорій.
CREATE PROCEDURE getCategoriesAndtopics
(IN ascending tinyint)
BEGIN
IF ascending THEN
    SELECT DISTINCT `Тема` AS Item FROM book UNION SELECT DISTINCT `Категория` FROM book ORDER BY Item asc
ELSE
    SELECT DISTINCT `Тема` AS Item FROM book UNION SELECT DISTINCT `Категория` FROM book ORDER BY Item desc
END IF;
SELECT Category FROM book UNION SELECT topic FROM book ORDER BY
SELECT 
END

-- 15.	Вивести відсортований в зворотному порядку загальний список перших слів назв книг і категорій що не повторюються

CREATE PROCEDURE T15
(IN ascending tinyint)
IF ascending THEN
	SELECT DISTINCT SUBSTRING_INDEX(book.Название, ' ', 1) AS Item FROM book
	 UNION SELECT DISTINCT `Категория` FROM book ORDER BY Item ASC
ELSE 
	SELECT DISTINCT SUBSTRING_INDEX(book.Название, ' ', 1) AS Item FROM book
	 UNION SELECT DISTINCT `Категория` FROM book ORDER BY Item DESC
END IF;
END

