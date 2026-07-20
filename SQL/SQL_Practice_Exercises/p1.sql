
-- .....................................SQL Practice Exercises..................................


create database p1;
use p1;
create table Products  
( product_id int primary key,
product_name varchar(100),
category varchar(50),
unit_price decimal(10,2)
);

insert into Products  (product_id, product_name, category, unit_price)  values 
 (101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

select * from Products;

create table Sales (
sale_id int primary key,
product_id int, foreign key (product_id) references Products (product_id) ,
quantity_sold int,
sale_date date,
total_price decimal(10,2));

insert into Sales values
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);

-- ...............................Beginners.......................
-- 1. Retrieve all columns from the Sales table.
select * from Sales;

-- 2. Retrieve the product_name and unit_price from the Products table.
select product_name,unit_price from Products;

-- 3. Retrieve the sale_id and sale_date from the Sales table.
select sale_id,sale_date from Sales;

-- 4. Filter the Sales table to show only sales with a total_price greater than $100.
select * from Sales where total_price>100;

-- 5. Filter the Products table to show only products in the 'Electronics' category.
select * from products where category='Electronics';

-- 6. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.
select sale_id,total_price from Sales where sale_date='2024-01-03';

-- 7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.
select product_id , product_name from Products  where unit_price > 100;

-- 8. Calculate the total revenue generated from all sales in the Sales table.
select sum(total_price) as total_revenue from Sales;

-- 9. Calculate the average unit_price of products in the Products table.
select avg(unit_price) AS average_unit_price  from Products;

-- 10. Calculate the total quantity_sold from the Sales table.
select sum(quantity_sold) as quantity_sold from Sales;

-- 11. Count Sales Per Day from the Sales table
select sale_date, count(sale_id) from Sales group by sale_date;

-- 12. Retrieve product_name and unit_price from the Products table with the Highest Unit Price
SELECT product_name, unit_price FROM Products ORDER BY unit_price DESC LIMIT 1;

-- 13. Retrieve the sale_id, product_id and total_price from the Sales table for sales with a quantity_sold greater than 4.
select sale_id, product_id , total_price from Sales  where quantity_sold > 4;

-- 14. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
select product_name,unit_price from Products order by unit_price desc ;

-- 15. Retrieve the total_price of all sales, rounding the values to two decimal places.
SELECT ROUND(SUM(total_price), 2) AS total_sales FROM Sales;

-- 16. Calculate the average total_price of sales in the Sales table.
select avg(total_price) AS average_total_price from Sales;

-- 17. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'.
select sale_id, date_format(sale_date,'%Y-%M-%D')  AS formatted_date  from Sales;

SELECT sale_id, DATE_FORMAT(sale_date, '%Y-%m-%d') AS formatted_date FROM Sales;

-- 18. Calculate the total revenue generated from sales of products in the 'Electronics' category.
select sum(sales.total_price) as total_revenue ,  products.category from  sales join products on products.product_id = sales.product_id where products.category='Electronics' ;

-- 19. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
select product_name,unit_price from Products where unit_price between 20 and 600;

-- 20. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.
select product_name,category from Products order by category asc;

-- .......................Intermediate..................................
-- 1. Calculate the total quantity_sold of products in the 'Electronics' category.
select sum(quantity_sold) 
from Sales join products 
on products.product_id=Sales.product_id   where products.category= 'Electronics' ;

-- 2. Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.
select Products.product_name,Sales.total_price 
from Sales join Products
on products.product_id=Sales.product_id ;

SELECT product_name, quantity_sold * unit_price AS total_price 
FROM Sales 
JOIN Products ON Sales.product_id = Products.product_id;

-- 3. Identify the Most Frequently Sold Product from Sales table
select product_id,sum(quantity_sold )from Sales group by product_id order by sum(quantity_sold)desc limit 1;

SELECT product_id, COUNT(*) AS sales_count 
FROM Sales 
GROUP BY product_id 
ORDER BY sales_count DESC 
LIMIT 1;

-- 4. Find the Products Not Sold from Products table
select Products.product_id 
from Products join Sales
on products.product_id=Sales.product_id where Sales.quantity_sold= null ;

SELECT p.product_id, p.product_name 
FROM Products p 
LEFT JOIN Sales s ON p.product_id = s.product_id 
WHERE s.product_id IS NULL;

SELECT product_id, product_name 
FROM Products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Sales);
 
 -- 5. Calculate the total revenue generated from sales for each product category.
select Products.category, sum(Sales.total_price) as total_revenue
from Sales join Products 
on products.product_id=Sales.product_id group by Products.category;
 
-- 6. Find the product category with the highest average unit price.
select category,avg(unit_price) from Products group by category order by avg(unit_price) desc limit 1;

-- 7. Identify products with total sales exceeding 30.
select p.product_name, s.total_price
from products p join sales s
on p.product_id=s.product_id where s.total_price>30;

SELECT p.product_name
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.total_price) > 30;

-- 8. Count the number of sales made in each month.
select date_format(s.sale_date, '%Y-%M') as sales_month ,count(sale_id) as sales_count from Sales s group by sales_month;

-- 9. Retrieve Sales Details for Products with 'Smart' in Their Name
select p.* ,s.*
from Products p join Sales s
on p.product_id=s.product_id where p.product_name like '%Smart%';

-- 10. Determine the average quantity sold for products with a unit price greater than $100.
select avg(s.quantity_sold) 
from Products p join Sales s 
on p.product_id=s.product_id where p.unit_price>100;

-- 11. Retrieve the product name and total sales revenue for each product.
SELECT p.product_name, SUM(s.total_price) AS total_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 12. List all sales along with the corresponding product names.
SELECT s.*,p.product_name 
FROM Sales s
join Products p ON s.product_id = p.product_id;

-- 13. Retrieve the product name and total sales revenue for each product.
SELECT p.category, 
       SUM(s.total_price) AS category_revenue,
       (SUM(s.total_price) / (SELECT SUM(total_price) FROM Sales)) * 100 AS revenue_percentage
FROM Sales s JOIN Products p 
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue_percentage DESC
LIMIT 3;

-- 14. Rank products based on total sales revenue.
SELECT p.product_name, SUM(s.total_price) AS total_revenue,rank() over (order by SUM(s.total_price) desc) as revenue_rank
from  Products p join Sales s 
ON s.product_id = p.product_id
GROUP BY 
    p.product_id, 
    p.product_name;

-- 15. Calculate the running total revenue for each product category.


-- 16. Categorize sales as "High", "Medium" or "Low" based on total price (e.g., > $200 is High, $100-$200 is Medium, < $100 is Low).
select p.product_name,s.total_price,
case
  when s.total_price > 200 then "High"
  when s.total_price between 100 and 200 then "Medium"
  when s.total_price < 100 then "Low"
    END AS SalaryBracket
from  Products p join Sales s 
ON s.product_id = p.product_id;

-- 17. Identify sales where the quantity sold is greater than the average quantity sold.
select * from Sales where quantity_sold >(select avg(quantity_sold) from Sales ); 

-- 18. Extract the month and year from the sale date and count the number of sales for each month.
select date_format(sale_date , "%Y,%M") as sales_month,count(sale_id) from Sales group by sales_month;

-- 19. Calculate the number of days between the current date and the sale date for each sale.
select sale_id,datediff(now(),sale_date) as date_diff from Sales;

-- 20. Identify sales made during weekdays versus weekends.
select sale_date,
 case
           WHEN DAYOFWEEK(sale_date) IN (1, 7) THEN 'Weekend'
           else "weekdays"
end as day_type
from Sales;

-- ........................................Advanced...................................

-- 1. List the Top 3 Products by Revenue Contribution Percentage
SELECT p.product_name, 
       SUM(s.total_price) AS total_revenue, 
       (SUM(s.total_price) / (SELECT SUM(total_price) FROM Sales)) * 100 AS revenue_percentage 
FROM Sales s 
JOIN Products p ON s.product_id = p.product_id 
GROUP BY p.product_name 
ORDER BY revenue_percentage DESC 
LIMIT 3;

-- view
-- 2. Write a query to create a view named Total_Sales that displays the total sales amount for each product along with their names and categories.
select p.product_name,p.category,sum(s.total_price) as Total_Sales
FROM Sales s JOIN Products p 
ON s.product_id = p.product_id 
GROUP BY p.product_name ,p.category;
SELECT * FROM Total_Sales;
drop view Total_Sales;

CREATE VIEW Total_Sales AS
SELECT p.product_name, p.category, SUM(s.total_price) AS total_sales_amount
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name, p.category;
SELECT * FROM Total_Sales;

-- 3. Retrieve the product details (name, category, unit price) for products that have a quantity sold greater than the average quantity sold across all products.

SELECT product_name, category, unit_price
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Sales
    GROUP BY product_id
    HAVING SUM(quantity_sold) > (SELECT AVG(quantity_sold) FROM Sales)
);




