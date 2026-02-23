---Duplicate Order Detection

Select * From (

    select *,row_number() OVer (partition by customer_id,order_id,sales
	                            Order By order_id) as rn
	From superstore
) superstore

where rn > 1;

--- With CTE

with rn as ( 

	 Select customer_id,Order_id,sales,
	 Row_number() OVer (Partition by customer_id
	                    Order By order_id) as row_no
	 From superstore

) 
Select * From rn 
--Where row_no > 1;
--- CTE reduce the table complexity significantlely
--- When working with large dataset and need to use 
--- lots of function we can use CTE to create a temporary 
-- table and just take the columns we need and work on them


