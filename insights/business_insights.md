# Business Insights – SQL Window Functions Project

This document summarizes key business insights derived using PostgreSQL window functions.

---

## Module 1: Latest Order per Customer

### Insight -1 
Here we find out the latest orders per customer by USING window Function ROW_Number() only 

#### Learnings : 
 Window Function ROW_num() add serial number to every customer order according to the customer_id 
 for example if a customer ordered 4 times the four orders were ranked as 1,2,3,4 starting from the 
 latest one. So we used Where clause to filter out the latest ones only

 Also learned the use of CTE and how effectively it can reduce the sql complexity

 ## Module 2: Top 3 Customers by Total Sales (With Ties)

 ### Insight -2
 Here we find out the top 3 customer by total sales using Sum() Over() window function

 #### Learnings :

 Window SUM() and aggregate SUM() function basically the same thing just the different is in window we are using partitioning 
 which stop collapsing of row and keep every detail
 Group By is using mandatory when usign only aggregate function SUM()
 on the other hand CTEs using window functions doesn't need GROUP BY because window functions compute aggregates over partitions while preserving row-level detail, whereas GROUP BY collapses rows.