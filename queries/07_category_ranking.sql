--- Rank Orders by Sales Within Category

Select 
 order_id,
 category,
 sales,
 Rank() Over ( 
     partition By category
	 Order By sales
 ) as sales_rank

 From superstore;


---Using Subquery
Select * From (
Select 
  order_id,
  category,
  Sales

  From superstore
) as sales_rank
Group By order_id,category,sales --- Group by don't support aliases it only support column name
Order By sales ASC;

-- If you use GROUP BY, then every selected column must:
--Be inside an aggregate(Group By doesn't accept aggregated) OR Appear in GROUP BY (All non-aggregated must be in group by)

Select 
  order_id,
  category,
  Sum(Sales) as total_sales

  From superstore
Group By order_id,category
Order By total_sales ASC;
  