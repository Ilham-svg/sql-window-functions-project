---Customers With More Than 3 Orders

---Without CTE

SELECT 
FROM (
    SELECT *,
           COUNT(*) OVER (
               PARTITION BY customer_id
           ) AS order_count
    FROM superstore
) t
WHERE order_count > 3;
--Refined Using Subquery

Select customer_name,customer_id,Order_count from (

       Select customer_name,customer_id,count(order_id) as Order_count
	   From superstore       
	   Group By customer_name,customer_id --- very important : when using aggregated function + group By every non-aggregated column in SELECT must appear in the GROUP BY.
	   --cause Group By can't filter though one column when multiple is mentioned
	   --"Where Order_count > 3" --- Where always run before select that's why the order_count doesn't exist yet
	   --The subquery runs first as it is under the from of the main query; the columns used in subquery will be use
	   --used in mainqury so first have to design the subquery then according to that the main query will be formed
)superstore
Order By Order_count DESC;



