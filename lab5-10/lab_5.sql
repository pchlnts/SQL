

CREATE dateBASE bookstore;
USE bookstore;



-- -----------------------------------------------------
-- Table bookstore.publisher
-- -----------------------------------------------------
CREATE TABLE publisher (
  id INT NOT NULL AUTO_INCREMENT ,
  publisher VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bookstore.category
-- -----------------------------------------------------

CREATE TABLE category (
  id INT NOT NULL AUTO_INCREMENT ,
  category VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bookstore.topic
-- -----------------------------------------------------

CREATE TABLE topic (
  id INT NOT NULL AUTO_INCREMENT ,
  topic VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bookstore.book
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS book (
    id INT NOT NULL AUTO_INCREMENT,
    id_book INT NOT NULL,
    title VARCHAR(75) NOT NULL,
    price DOUBLE NOT NULL,
    pages INT NOT NULL,
    format VARCHAR(10) ,
    circulation INT NOT NULL,
    date DATE NOT NULL,
    new BOOL NOT NULL,
	publisher_id INT NOT NULL,
	category_id INT NOT NULL,
	topic_id INT NOT NULL,
    PRIMARY KEY (id),
	
	 FOREIGN KEY (publisher_id) REFERENCES publisher(id),
	 FOREIGN KEY (category_id) REFERENCES category(id),
	 FOREIGN KEY (topic_id) REFERENCES topic(id)
);


ALTER TABLE
    book
    CHANGE title title
    VARCHAR(90)
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
	
ALTER TABLE
    book
    CHANGE format format
    VARCHAR(90)
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
	
ALTER TABLE
    publisher
    CHANGE publisher publisher
    VARCHAR(90)
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
	
ALTER TABLE
    category
    CHANGE category category
    VARCHAR(90)
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
	
ALTER TABLE
    topic
    CHANGE topic topic
    VARCHAR(90)
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
	
	
-- ----------------------------------------------------------- 
-- INSERT 
-- -----------------------------------------------------------




INSERT INTO book (id_book, title, price, pages, format, circulation, date, new, publisher_id, category_id, topic_id)
VALUES (5110, 'Аппаратные средства мультимедия. Видеосистема РС', 15.51, 400, '70х100/16', 5000,'200-07-24', 0, 2,1,1);

INSERT INTO book (id_book, title, price, pages, format, circulation, date, new, publisher_id, category_id, topic_id)
VALUES (4985, 'Аппаратные средства мультимедия. Видеосистема РС', 15.51, 400, '70х100/16', 5000,'2000-07-24', 0, 1, 1,1 );
INSERT INTO book (id_book, title, price, pages, format, circulation, date, new, publisher_id, category_id, topic_id)
VALUES (5141, 'Освой самостоятельно модернизацию и ремонт ПК за 24 часа, 2-е изд.', 18.90, 288, '70х100/16', 5000,'2000-07-07', 0, 1, 1,1 );
INSERT INTO book (id_book, title, price, pages, format, circulation, date, new, publisher_id, category_id, topic_id)
VALUES (5127, 'Автоматизация инженерно- графических работ', 11.58, 256, '70х100/16', 5000,'2000-07-07', 1, 3, 1,1 );
INSERT INTO book (id_book, title, price, pages, format, circulation, date, new, publisher_id, category_id, topic_id)
VALUES (5199, 'Железо IBM 2001. ', 30.07, 368, '70х100/16', 5000,'200-02-12', 0, 4,2,1 );

-- ----------------------------------------------------------- 
-- INSERT INTO publisher
-- -----------------------------------------------------------
INSERT INTO publisher(publisher)
VALUES('Вильямс');
INSERT INTO publisher(publisher)
VALUES('BHV С.-Петербург');
INSERT INTO publisher(publisher)
VALUES('Питер');
INSERT INTO publisher(publisher)
VALUES('МикроАрт');
INSERT INTO publisher(publisher)
VALUES('DiaSoft');
INSERT INTO publisher(publisher)
VALUES('ДМК');
INSERT INTO publisher(publisher)
VALUES('Эком');
INSERT INTO publisher(publisher)
VALUES('Русская редакция');


-- ----------------------------------------------------------- 
-- INSERT INTO category
-- -----------------------------------------------------------

INSERT INTO category(category)
VALUES('Підручники');
INSERT INTO category(category)
VALUES('Апаратні засоби ПК');
INSERT INTO category(category)
VALUES('Захист і безпека ПК');
INSERT INTO category(category)
VALUES('Windows 2000');
INSERT INTO category(category)
VALUES('Linux');
INSERT INTO category(category)
VALUES('C&C++');
INSERT INTO category(category)
VALUES('Інші операційні системи');
INSERT INTO category(category)
VALUES('Інші книги');


-- ----------------------------------------------------------- 
-- INSERT INTO topic
-- -----------------------------------------------------------


INSERT INTO topic(topic)
VALUES('Використання ПК в цілому');
INSERT INTO topic(topic)
VALUES('Операційні системи');
INSERT INTO topic(topic)
VALUES('Програмування');























