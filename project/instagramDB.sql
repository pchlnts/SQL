DROP DATABASE Instagram;
-- in clear SQL  -->
CREATE DATABASE instagram;
-- in clear SQL  <--

-- -----------------------------------------------------
-- Table `Instagram`.`user`
-- -----------------------------------------------------
USE Instagram;
CREATE TABLE user (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(45) NOT NULL,
    password varchar(45) NOT NULL,
    PRIMARY KEY (id)
	);
-- -----------------------------------------------------
-- Table `Instagram`.`personal_data`
-- -----------------------------------------------------	
CREATE TABLE personal_data (
    
    name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
	phone VARCHAR(11) NOT NULL,
	user_id INT NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES user(id)
    
);
CREATE INDEX index_user
ON personal_data (user_id);
-- -----------------------------------------------------
-- Table `Instagram`.`post`
-- -----------------------------------------------------
CREATE TABLE post (
    id int NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id)
    
);
CREATE INDEX index_user
ON post (user_id);
-- -----------------------------------------------------
-- Table `Instagram`.`comment`
-- -----------------------------------------------------
CREATE TABLE comment (
    id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(45) ,
	user_id INT NOT NULL,
    post_id INT NOT NULL,
    text VARCHAR(145) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (post_id) REFERENCES post(id)
    
);
CREATE INDEX index_user
ON comment(user_id);
CREATE INDEX index_post
ON comment(post_id);
-- -----------------------------------------------------
-- Table `Instagram`.`file`
-- -----------------------------------------------------
CREATE TABLE file (
    id INT NOT NULL AUTO_INCREMENT,
	size INT NOT NULL,
	type VARCHAR(45) ,
    post_id INT NOT NULL,
	PRIMARY KEY (id),
	
	FOREIGN KEY (post_id) REFERENCES post(id)
    
);

CREATE INDEX index_post
ON file(post_id);
-- -----------------------------------------------------
-- Table `Instagram`.`dialog`
-- -----------------------------------------------------
CREATE TABLE dialog (
    id INT NOT NULL AUTO_INCREMENT,

	PRIMARY KEY (id) 
);
-- -----------------------------------------------------
-- Table `Instagram`.`message`
-- -----------------------------------------------------
CREATE TABLE message (
    id INT NOT NULL AUTO_INCREMENT,
	text VARCHAR(145) NOT NULL,
	user_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id)
	
    
);
CREATE INDEX index_user
ON message(user_id);
-- -----------------------------------------------------
-- Table `Instagram`.`dialog_user`
-- -----------------------------------------------------
CREATE TABLE dialog_user (
    dialog_id INT NOT NULL ,
	user_id INT NOT NULL,
	PRIMARY KEY (dialog_id, user_id  ),
	FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (dialog_id) REFERENCES dialog(id)
	
    
);
CREATE INDEX index_user
ON dialog_user(user_id);
CREATE INDEX index_dialog
ON dialog_user(dialog_id);
-- -----------------------------------------------------
-- Table `Instagram`.`dialog_message`
-- -----------------------------------------------------
CREATE TABLE dialog_message (
    dialog_id INT NOT NULL ,
	message_id INT NOT NULL,
	PRIMARY KEY (dialog_id, message_id  ),
	FOREIGN KEY (message_id) REFERENCES message(id),
	FOREIGN KEY (dialog_id) REFERENCES dialog(id)
	
    
);
CREATE INDEX index_message
ON dialog_message(message_id );
CREATE INDEX index_post_dialog
ON dialog_message(dialog_id);
-- -----------------------------------------------------
-- Table `Instagram`.`followers`
-- -----------------------------------------------------
CREATE TABLE followers (
    user_id INT NOT NULL ,
	user1_id INT NOT NULL,
	PRIMARY KEY (user_id, user1_id  ),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (user1_id) REFERENCES user(id)
	
    
);
CREATE INDEX index_user
ON followers(user_id );
CREATE INDEX index_user1
ON followers(user1_id);






























