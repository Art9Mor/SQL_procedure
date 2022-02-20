-- DROP DATABASE shopsue;

CREATE DATABASE shopSue;

USE shopSue;

CREATE TABLE categories
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(200) NOT NULL
);

CREATE TABLE products
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(225) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	categoryId INT NOT NULL,
	FOREIGN KEY (categoryId) REFERENCES categories (id)
);

DELIMITER $$ 
CREATE PROCEDURE prepare_data() 
BEGIN 
	DECLARE i INT DEFAULT 1;
	DECLARE j INT DEFAULT 1;
    
	WHILE i <= 100 DO 
		INSERT INTO categories(name) 
		VALUES (CONCAT('Category ', i));
        
		SET i = i + 1;
	END WHILE;
	
    WHILE j <= 300 DO 
		INSERT INTO products(categoryId, name, price)
		VALUES (RAND() * 99 + 1, CONCAT('Product ', j), RAND() * 1000 + 1);
        
		SET j = j + 1; 
	END WHILE;
END$$ 
DELIMITER ;

CALL prepare_data();

