use shop;

-- check how our table looks in order to proceed with queries
select * from SALES1;

-- Find all sales records (and all columns) that took place in the London store, not in December,
-- but sales concluded by Bill or Frank for the amount higher than £50.
SELECT 
    *
FROM
    SALES1
WHERE
    STORE = 'LONDON' AND MONTH <> 'dec'
        AND SalesAmount > 50.00
        AND (SalesPerson = 'BILL'
        OR SalesPerson = 'FRANK');

-- Find out how many sales took place each week (in no particular order)
SELECT 
    WEEK, COUNT(*)
FROM
    SALES1
GROUP BY WEEK;


-- Find out how many sales took place each week (and present data by week in descending and then in ascending order)
SELECT 
    WEEK, COUNT(week) AS 'NUM_sales'
FROM
    SALES1
GROUP BY WEEK
ORDER BY WEEK;
-- ORDER BY WEEK DESC;

-- Find out how many sales were recorded each week on different days of the week
SELECT 
    WEEK, DAY, COUNT(week) AS 'NUM_sales'
FROM
    SALES1
GROUP BY WEEK , Day
ORDER BY WEEK , DAY;

-- We need to change salesperson's name Inga to Annette
UPDATE SALES1 
SET 
    SalesPerson = 'Anette'
WHERE
    SalesPerson = 'Inga';

-- Find out how many sales did Annete do
SELECT 
    *
FROM
    sales1
WHERE
    SalesPerson = 'Anette';


-- Find the total sales amount by each person by day
SELECT 
    SalesPerson, Day, SUM(SalesAmount) AS 'salesAmount'
FROM
    SALES1
GROUP BY SalesPerson , Day
ORDER BY SalesPerson , Day;


-- How much (sum) each person sold for the given period.
SELECT 
    SalesPerson, SUM(SalesAmount) AS 'salesAmount'
FROM
    SALES1
GROUP BY SalesPerson
ORDER BY salesAmount DESC;

-- How much (sum) each person sold for the given period, including
-- the number of sales per person, their average, lowest and highest sale amounts.  
SELECT 
    SalesPerson,
    SUM(SalesAmount) AS 'salesAmount',
    COUNT(SalesAmount) AS 'NUM_of_sales',
    AVG(SalesAmount) AS 'Average sale',
    MAX(SalesAmount) AS 'Highest Sale',
    MIN(SalesAmount) AS 'Lowest Sale'
FROM
    SALES1
GROUP BY SalesPerson
ORDER BY salesAmount DESC;

-- Find the total monetary sales amount achieved by each store 
SELECT 
    Store, SUM(SalesAmount) AS 'total sales'
FROM
    sales1
GROUP BY store;


-- Find the number of sales by each person if they did less than 3 sales for the past period
SELECT 
    SalesPerson, COUNT(salesAmount) AS 'Num of sales pp'
FROM
    sales1
GROUP BY SalesPerson
HAVING COUNT(salesAmount) < 3;

-- Find the total amount of sales by month where combined total is less than £100
SELECT 
    month, SUM(salesamount) AS 'Total Sales £'
FROM
    SALES1
GROUP BY month
HAVING SUM(salesamount) < 100; -- try to change this number to see what it does