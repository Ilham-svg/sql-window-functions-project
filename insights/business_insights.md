# Business Insights – SQL Window Functions Project

This document summarizes key business insights derived using PostgreSQL window functions.

---

## Module 1: Latest Order per Customer

### Insight -1 
Here find out the latest orders per customer by USING window Function ROW_Number() only 

#### Learnings : 
 Window Function ROW_num() add serial number to every customer order according to the customer_id 
 for example if a customer ordered 4 times the four orders were ranked as 1,2,3,4 starting from the 
 latest one. So we used Where clause to filter out the latest ones only

 Also learned the use of CTE and how effectively it can reduce the sql complexity

 ## Module 2: Top 3 Customers by Total Sales (With Ties)

 ### Insight -2
 Here find out the top 3 customer by total sales using Sum() Over() window function

 #### Learnings :

 Window SUM() and aggregate SUM() function basically the same thing just the different is in window we are using partitioning 
 which stop collapsing of row and keep every detail
 Group By is using mandatory when usign only aggregate function SUM()
 on the other hand CTEs using window functions doesn't need GROUP BY because window functions compute aggregates over partitions while preserving row-level detail, whereas GROUP BY collapses rows.

 ## Module 3: Runnine Total of Sales

 ### Insight -3 
 Here find out how much sales is running till present period.

 #### Learnings :
 Today's key lesson was learning the difference of using DISTINCT in NON-CTE and CTE as both produce different results. 
 CTE worked as a whole thats' why distinct treat the Content under CTE as a one column on the other hand in NON CTE the columns are considered as separate
 Data and get removed by distinct so the row is already reduced when it will reach the desired column in resulty many data will be deleted.

 ## Module 4: Month-over-Month Growth

 ### Insight -4 
 here find out the growth or monthly difference of the sales using Sum()Over()and Lag() window function

#### Learnings :
LAG() window function able tp look at a previous row’s value without using a self-join and that make 
the work lot's easier though there are some complexities.As we are using two window function here first 
sum then Lag it is important to know the fact that both function uses column aliases and A column alias cannot be reused inside another expression in the same SELECT.
SQL processes expressions at the same level simultaneously, so monthly_total does not yet exist when LAG() tries to use it.
that's why we need CTE to establish the sum() window fuction as it is the main thing to see and then work with the lag() function separately
same would be applicable for sum() as aggregated function.

### Insight -5
Here find out the First & Last Purchase per Customer using First() and Last() window function

#### Learnings :
CTE works like a temporary table or database like you took what you need from a the main database and turn that into a separtae database
and all the sql rules apply on that temporary database also. If you are using multiple CTE you have to tread like seperate tables and have to use
Join to make a connection among two CTE's.
CTE usulally used so that in vast database so we can take out the columns we need and work around them but if we use Select * inside the 
CTE then we can bring any column from the main database we want beside the Aliases.
