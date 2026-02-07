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