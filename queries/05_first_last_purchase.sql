--- First & Last Purchase per Customer
---Without CTE
Select distinct

    customer_id,
	customer_name,
	First_Value(order_date) OVER (

          partition By customer_id
		  Order by order_id
	) as first_purchase,

    Last_value(order_date) Over (

          partition by customer_id
		  Order By order_id
		  ROWS BETWEEN UNBOUNDED PRECEDING and UNBOUNDED Following
	) as last_purchase

From superstore;

---With CTE

With f_purchase AS ( 

        Select *, First_value(Order_date) Over
		(partition By customer_id
		Order By order_id) as first_purchase
		From superstore
),

L_purchase as (
         select *,
         Last_value(order_date) Over (

          partition by customer_id
		  Order By order_id
		  ROWS BETWEEN UNBOUNDED PRECEDING and UNBOUNDED Following
	) as last_purchase
	From superstore
)

Select Distinct first_purchase
From f_purchase;

---in multiple CTE can't bring multiple CTE together without usign JOIN just like normal sql as CTE itself work like a indivitual table
---so we have to use Join to like normal sql.

With f_purchase AS ( 

        Select *, First_value(Order_date) Over
		(partition By customer_id
		Order By order_id) as first_purchase,
		
         Last_value(order_date) Over (

          partition by customer_id
		  Order By order_id
		  ROWS BETWEEN UNBOUNDED PRECEDING and UNBOUNDED Following
	) as last_purchase
	From superstore
)

Select Distinct customer_id,Customer_name, first_purchase,last_purchase
From f_purchase;

----If I use * inside CTE then I can bring any column I want for the answer beside the alliases
