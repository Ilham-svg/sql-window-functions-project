--Latest order per customer 
-- With ranked_orders as (

--      select *, Row_number() over (partition By customer_id 
-- 	  ) as ranked
--  From superstore
-- )
-- Select * From ranked_orders
-- Where ranked = 1
-- Order By order_date DESC;

---without CTE

-- Select 
--    customer_name,
--    customer_id,
--    order_date
-- From (

--    select
--    customer_name,
--    customer_id,
--    order_date,
--    Row_number() over (partition By customer_id Order By 
--                       order_date DESC) as r
--    From superstore
					  
-- )superstore
-- Where r = 1
-- Order By order_date DESC;

---comparison to see the efficiency of CTE(less code more flexibility)
---Rank by Highest quantity bought by a customer
-- With ranked_orders as (

--    select
--    customer_name,
--    customer_id,
--    quantity,
--    Row_number() over (partition By customer_id Order By 
--                       quantity DESC) as ranked
--    From superstore
-- )
-- Select * From ranked_orders
-- Where ranked = 1
-- Order By quantity DESC;

With ranked_orders as (

   select
   customer_name,
   customer_id,
   Order_date,
   Row_number() over (partition By Order_date) as ranked
   From superstore
)
Select * From ranked_orders
Where ranked = 1
Order By order_date;