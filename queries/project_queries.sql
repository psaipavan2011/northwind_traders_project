-- 1. Retrieve the names of all customers who have placed more than 5 orders. 
 
select orders.customerID,customers.companyName,count(orderID) as count_of_orders from orders 
join customers on customers.customerID = orders.customerID 
group by customers.companyName,orders.customerID 
having count_of_orders > 5; 
 
-- List the total revenue generated from each product. 
SELECT products.productname, 
SUM (order_details.quantity * order_details.unitprice) AS totalprice 
FROM products 
INNER JOIN order_details ON order_details.productID = products.productID 
GROUP BY products.productname 
ORDER BY totalprice DESC; 
 
-- Find the top 5 products by revenue. 
select products.productname,sum(order_details.quantity * order_details.unitprice) as totalprice from order_details 
join products on products.productID = order_details.productID 
group by productname 
order by totalprice desc  
limit 5 
 
 
 
 
 
-- Calculate the percentage contribution of each product to the total revenue. 
SELECT  
	products.productname, 
	SUM(order_details.unitprice) /  
	(SELECT SUM(order_details.quantity * order_details.unitprice) FROM order_details) * 100 AS percentage 
FROM order_details 
JOIN products ON order_details.productID = products.productID 
GROUP BY products.productname 
ORDER BY percentage DESC; 
 
-- Identify the customer who has spent the most money. 
select customers.companyname,sum(order_details.unitprice*order_details.quantity ) as total from customers 
join orders on orders.customerID = customers.customerID 
join order_details on order_details.orderID = orders.orderID 
group by customers.companyname 
order by total desc 
limit 1 
 
 
 
-- Joins 
-- List the names of employees and the names of their corresponding supervisors. 
elect e1.employeename as name_emp,
	      e2.reportsTO as supervisor
 from employee e1 
 join employees e2 ON e1.supervisorID = e2.employeeID
ORDER BY 
    e1.employeename;


 
-- Retrieve the list of orders along with the shipper name who delivered them. 
select orders.orderID,shippers.companyName from orders  
join shippers on shippers.shipperID = orders.shipperID

-- Retrieve a list of employees and the total number of orders they handled. 
select employees.employeeID,employees.employeename,count(orders.orderID) as no_of_orders from employees  
join orders on employees.employeeID = orders.employeeID 
group by employees.employeeID,employees.employeename 
 
-- Subqueries 
-- Find the product that has the highest unit price. 
select productname,max(unitprice) from products 
group by productname 
order by max(unitprice) desc 
limit 1 

-- Identify customers who have placed orders but have never ordered products from a specific category (e.g., 'Beverages'). 
select distinct orders.customerID from order_details  
inner join products on order_details.productID  = products.productID 
inner join orders on orders.orderID = order_details.orderID 
where products.categoryID not in (1); 


-- Aggregations 
-- Calculate the total revenue generated for each category. 
select sum(products.unitprice*quantityperunit) as total_revune, categories.categoryname from categories  
join products on categories.categoryID = products.categoryID 
group by categories.categoryname 

-- Find the average order value for each customer. 
select avg(order_details.unitprice*quantity) as avg_ordervalue,customers.customerID,customers.companyname from order_details 
join orders on orders.orderID = order_details.orderID 
join customers on orders.customerID = customers.customerID 
group by customers.companyname,customers.customerID 

-- Retrieve the total number of products sold in each category.
select count(order_details.quantity),products.productID,categories.categoryname from order_details 
   join products on products.productID = order_details.productID  
   join categories on categories.categoryID = products.categoryID 
   group by products.productID,categories.categoryname 
 
 
 
 
 
4. Find the monthly revenue for the past year. 
WITH RECURSIVE numbers AS ( 
	SELECT 1 AS num -- Starting number 
	UNION ALL 
	SELECT num + 1 
	FROM numbers 
	WHERE num < 10  -- Limit the sequence to 10 
) 
SELECT num, sum(order_details.quantity * unitprice) as  revune 
FROM numbers 
inner join orders on month(orderdate)  = numbers.num 
inner join order_details on order_details.orderID = orders.orderid 
group by num 
5. Calculate the average shipping time for each shipper. 
 


CTEs (Common Table Expressions) 
Window Functions 
1. Rank products based on the total revenue generated. 
select products.productname,
SUM(order_details.quantity * order_details.unitprice) AS total_revenue,
RANK() OVER (ORDER BY SUM(order_details.quantity * order_details.unitprice) DESC) AS revenue_rank
FROM 
    products
JOIN 
    order_details ON products.productid = order_details.productid
GROUP BY 
    products.productname
ORDER BY 
    revenue_rank;
     
   2. Find the top 5 employees by the number of orders handled, using RANK(). 
    SELECT 
    orders.orderID,
    employees.employeeID,
    employees.employeename,
    COUNT(orders.orderID) AS counthandled,
    RANK() OVER (PARTITION BY employees.employeename ORDER BY COUNT(orders.orderID) DESC) AS rank_handled
FROM 
    employees
JOIN 
    orders ON orders.employeeID = employees.employeeID
GROUP BY 
    orders.orderID, employees.employeeID, employees.employeename
ORDER BY 
    employees.employeename, rank_handled;
    
3 Compute the running total of the number of orders by date.
SELECT 
    Date(orderdate),
    COUNT(orders.OrderID) AS Total_Orders,
    SUM(COUNT(orders.OrderID)) OVER (ORDER BY  Date(orderdate)) AS Running_Total
FROM Orders
GROUP BY  Date(orderdate)
ORDER BY  Date(orderdate);


4. Use a window function to find the average unit price of products within each category
SELECT 
    products.productname,
    categories.categoryname,
    AVG(products.unitprice) 
        OVER (PARTITION BY categories.categoryname ORDER BY products.unitprice DESC) AS category_avg_price
FROM 
    products
JOIN 
    categories ON products.categoryID = categories.categoryID
ORDER BY 
    categories.categoryname, category_avg_price DESC;
