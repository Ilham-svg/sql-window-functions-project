---Running Total of Sales
--with CTE
with total_sales as ( 

		  Select 
		  Order_id,
		  Order_date,
		  Sales,
		  Sum(sales) Over (Order by order_date) as running_sales
		  from superstore

)
-- Select order_id,order_date,sales,running_sales
Select Distinct * -- have to use function like distinct before *
FRom total_sales
order by order_date;

--- in CTE you don't need to repeat the column name again outside the CTE parenthesis just use * and it will thing the CTE as the main database and will bring only those columns mentioned under CTE

--Without CTE

Select Distinct

     order_id,
	 order_date,
	 sales,
	 sum(sales) Over ( 

		  Order By Order_date
	 ) As running_sales
From superstore;

---After using distinct two codes gave two types of results cause in CTE 
--- we materialize the result first
---Then DISTINCT * compares all columns
---If multiple rows end up exactly identical, they collapse
--- in NON CTE the distinct work on the indivitual columns and thats why 
---The row gets deleted when it hit the first column on the other hand
--in CTE the distinct think every thing under CTE as a single thing.