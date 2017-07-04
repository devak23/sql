CREATE TABLE PRODUCTS
(
  PRODUCT_ID     INTEGER PRIMARY KEY AUTO_INCREMENT,
  PRODUCT_NAME   VARCHAR(30)
);

CREATE TABLE SALES
(
  SALE_ID        INTEGER PRIMARY KEY AUTO_INCREMENT,
  PRODUCT_ID     INTEGER,
  YEAR           INTEGER,
  QUANTITY       INTEGER,
  PRICE          INTEGER
);


INSERT INTO PRODUCTS VALUES ( 100, 'Nokia');
INSERT INTO PRODUCTS VALUES ( 200, 'IPhone');
INSERT INTO PRODUCTS VALUES ( 300, 'Samsung');
INSERT INTO PRODUCTS VALUES ( 400, 'LG');

INSERT INTO SALES VALUES ( 1, 100, 2010, 25, 5000);
INSERT INTO SALES VALUES ( 2, 100, 2011, 16, 5000);
INSERT INTO SALES VALUES ( 3, 100, 2012, 8,  5000);
INSERT INTO SALES VALUES ( 4, 200, 2010, 10, 9000);
INSERT INTO SALES VALUES ( 5, 200, 2011, 15, 9000);
INSERT INTO SALES VALUES ( 6, 200, 2012, 20, 9000);
INSERT INTO SALES VALUES ( 7, 300, 2010, 20, 7000);
INSERT INTO SALES VALUES ( 8, 300, 2011, 18, 7000);
INSERT INTO SALES VALUES ( 9, 300, 2012, 20, 7000);


