--- Top 3 Customers by Total Sales (With Ties)

--solve with CTE
-- with customer_sales as (

--        select *, sum(sales) Over (partition by customer_id) as total_sales
-- 	   from superstore
-- 	   ),
-- 	  ranked_customers as (

-- 	      select*,Dense_rank() Over (order by total_sales DESC) as rnk
-- 		  From customer_sales
-- 	  )
-- Select Distinct customer_id,customer_name,total_sales
-- From ranked_customers 
-- where rnk <= 3;

-- Solve without CTE & window

-- Select 
--      customer_id,
-- 	 customer_name,
-- 	 Sum(sales) as Total_sales 
-- from superstore
-- Group By customer_id,customer_name
-- Order By Total_sales DESC
-- Limit 3;

--When using aggregates, all non-aggregated columns must appear in the GROUP BY clause.

-- simplified version

with customer_sale as (

       select 
	   customer_id,
	   customer_name,
	   Sum(sales) Over (partition by customer_id) as total_sales
	   From superstore
)
select distinct customer_id,customer_name,total_sales
From customer_sale
Order By total_sales DESC
Limit 3;

--CTEs using window functions don’t require GROUP BY because window functions compute aggregates over partitions while preserving row-level detail, whereas GROUP BY collapses rows.