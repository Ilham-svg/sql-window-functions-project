--- 7-Day Moving Average of Sales
Select 
   order_date,
   sales,
   Avg(sales) Over (Order by order_date
   Rows between 6 Preceding and current row) as Moving_avg_7
From superstore;

--with CTE

With mv_avg_7 as (

       Select 

	         *,
			 avg(sales) Over (Order by order_date Rows between 6 Preceding and current row) as seven_avg
		From superstore	 

) 

Select Ship_mode,customer_name,seven_avg From mv_avg_7
Limit 7;