-- Q1: Find total sales for each product
-- Ans1:
select p.PRODUCT_NAME, sale
FROM (
  select PRODUCT_ID, sum(quantity * price) as sale
  from SALES
  GROUP BY PRODUCT_ID
) result
INNER JOIN PRODUCTS p ON p.PRODUCT_ID = result.PRODUCT_ID
order by sale desc;


-- Q2: Find the product which does not have a sales at all
-- Ans2:
-- using not exists clause
SELECT PRODUCT_NAME, PRODUCT_ID
FROM PRODUCTS p1
where not exists (
  select PRODUCT_ID from SALES where PRODUCT_ID = p1.PRODUCT_ID
);

-- using left join
SELECT p.PRODUCT_NAME, p.PRODUCT_ID # using left join
FROM PRODUCTS p
LEFT JOIN SALES s on p.PRODUCT_ID = s.PRODUCT_ID
where s.PRODUCT_ID is NULL;

-- using not in clause
SELECT PRODUCT_NAME, PRODUCT_ID # using not in
FROM PRODUCTS p
WHERE p.PRODUCT_ID NOT in (
  SELECT PRODUCT_ID from SALES
);




-- Q3: Write a SQL query to find the products whose sales decreased in 2012 compared to 2011?
-- Ans3:
SELECT P.PRODUCT_NAME
FROM  PRODUCTS P,
      SALES S_2011,
      SALES S_2012
WHERE S_2011.YEAR = 2011
AND S_2012.YEAR = 2012
AND (S_2012.PRODUCT_ID * S_2012.Quantity) < (S_2011.PRODUCT_ID * S_2011.Quantity) -- could just check the quantity alone!
AND S_2012.PRODUCT_ID = P.PRODUCT_ID
AND S_2011.PRODUCT_ID = P.PRODUCT_ID;

-- Q4: Write a query to select the top product sold in each year
-- Ans4:
select p.PRODUCT_NAME, s.Quantity, s.year
FROM (
  select year, max(quantity) as quantity
  from SALES
  GROUP BY year
) A
INNER JOIN SALES s on (s.YEAR = A.year AND A.quantity = s.Quantity)
INNER JOIN PRODUCTS p on p.PRODUCT_ID = s.PRODUCT_ID
ORDER BY s.year desc;

-- Q5: Write a query to find the average quantity of product sold so far
-- Ans5:
SELECT P.PRODUCT_NAME, AVG.AVG_QTY
FROM (
     SELECT PRODUCT_ID, sum(quantity)/count(QUANTITY) as AVG_QTY
     FROM SALES
     GROUP BY PRODUCT_ID
) AVG
INNER JOIN PRODUCTS P ON P.PRODUCT_ID = AVG.PRODUCT_ID;

-- Q6: Write a query to find the products whose sold more than 10 quantities in a given year
-- Ans6:
SELECT p.PRODUCT_NAME, s.QUANTITY, s.YEAR
FROM PRODUCTS p
  INNER JOIN SALES s on p.PRODUCT_ID = s.PRODUCT_ID
WHERE QUANTITY > 10;

-- Q7: Write a query to find the products whose quantity sold in a year is greater than the average quantity of the product sold across all the years
-- Ans7: my answer is the first query. It's not efficient but works
SELECT p.PRODUCT_NAME, s.YEAR, s.QUANTITY
FROM PRODUCTS p
  INNER JOIN SALES s ON p.PRODUCT_ID = s.PRODUCT_ID
  INNER JOIN (
    SELECT s2.PRODUCT_ID, sum(QUANTITY)/count(QUANTITY) as AVG_QTY
    FROM SALES s2
    GROUP BY PRODUCT_ID
) AVG on AVG.PRODUCT_ID = s.PRODUCT_ID
WHERE s.QUANTITY > AVG.AVG_QTY;

-- more efficient approach
SELECT p.PRODUCT_NAME, s.YEAR, s.QUANTITY
FROM PRODUCTS p
INNER JOIN SALES s ON p.PRODUCT_ID = s.PRODUCT_ID
WHERE s.QUANTITY > (
  SELECT sum(QUANTITY)/count(QUANTITY)
  FROM SALES s2
  WHERE s2.PRODUCT_ID = s.PRODUCT_ID
);

-- Q8: Write a query to compare the products sales of "IPhone" and "Samsung" in each year
-- Ans:
SELECT
  ss.YEAR
  , si.QUANTITY as IPHONE_QUANT
  , ss.QUANTITY as SAM_QUANT
  , si.PRICE as IPHONE_PRICE
  , ss.PRICE as SAM_PRICE
FROM PRODUCTS pi, PRODUCTS ps, SALES si, SALES ss
WHERE pi.PRODUCT_ID = si.PRODUCT_ID
AND ps.PRODUCT_ID = ss.PRODUCT_ID
AND pi.PRODUCT_NAME = 'iPhone'
AND ps.PRODUCT_NAME = 'Samsung'
AND si.YEAR = ss.YEAR;

-- Q9: Write a query to find the number of products sold in each year
-- Ans:
SELECT year, count(QUANTITY)
from SALES
GROUP BY year;
