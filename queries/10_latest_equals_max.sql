---Latest order is highest sales 

With ranked_order as (

        select *, row_number() over (partition by customer_id
		                             order by order_date DESC) as rn,
		max(sales) OVER (partition by customer_id) as max_sales

		From superstore		

)

Select order_id,order_date,max_sales from ranked_order
--where rn = 1
Where sales = max_sales
Order by order_date DESC;