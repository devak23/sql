--Q1: Find total sales for each product 
--Ans1:
select p.PRODUCT_NAME, sale
FROM (
  select PRODUCT_ID, sum(quantity * price) as sale
  from SALES
  GROUP BY PRODUCT_ID
) result
INNER JOIN PRODUCTS p ON p.PRODUCT_ID = result.PRODUCT_ID
order by sale desc;



--Q2: Find the product which does not have a sales at all
--Ans2:
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




--Q3: Write a SQL query to find the products whose sales decreased in 2012 compared to 2011? 
--Ans3:
SELECT P.PRODUCT_NAME
FROM  PRODUCTS P,
      SALES S_2011,
      SALES S_2012
WHERE S_2011.YEAR = 2011
AND S_2012.YEAR = 2012
AND (S_2012.PRODUCT_ID * S_2012.Quantity) < (S_2011.PRODUCT_ID * S_2011.Quantity) -- could just check the quantity alone!
AND S_2012.PRODUCT_ID = P.PRODUCT_ID
AND S_2011.PRODUCT_ID = P.PRODUCT_ID



--Q4: Write a query to select the top product sold in each year
--Ans4:
select p.PRODUCT_NAME, s.Quantity, s.year
FROM (
  select year, max(quantity) as quantity
  from SALES
  GROUP BY year
) A
INNER JOIN SALES s on (s.YEAR = A.year AND A.quantity = s.Quantity)
INNER JOIN PRODUCTS p on p.PRODUCT_ID = s.PRODUCT_ID
ORDER BY s.year desc;

