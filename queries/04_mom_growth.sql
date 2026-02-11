-- ---Month-over-Month Growth
-- -- With CTE

with monthly_sales as (
   select 
   date_trunc('Month',order_date) as month, --The DATE_TRUNC function in SQL is used to truncate a date, time, or timestamp to a specified unit of precision (e.g., year, month, day, hour)
   sum(sales)Over(partition by date_trunc('Month',order_date)) as monthly_total
   from superstore

),

distinct_months as (
select distinct month,monthly_total
From monthly_sales
)

Select 
    month,
	monthly_total,
	LAG(monthly_total) Over (order by Month) as previous_month_sales,
	ROUND(
	(monthly_total- LAG(monthly_total) Over (order by Month))/LAG(monthly_total) Over (order by Month) * 100,
	2
	 )as mom_growt_pct
From distinct_months;

--without CTE
-- Select Distinct
--       date_trunc('Month',order_date) as month,
-- 	  Sum(sales) Over (partition By date_trunc('Month',order_date)) as monthly_total,
-- 	  LAG(monthly_total) Over (order by Month) as previous_month_sales,
-- 	  ROUND(
-- 	(monthly_total- LAG(monthly_total) Over (order by Month))/LAG(monthly_total) Over (order by Month) * 100,
-- 	2
-- 	 )as mom_growt_pct
-- From superstore
-- Order by month;

--A column alias cannot be reused inside another expression in the same SELECT.
--SQL processes expressions at the same level simultaneously, so
--monthly_total does not yet exist when LAG() tries to use it.
--That's why we need CTE to establish the first window fuction and then 
-- work with the 2nd window function separately
