-- Checking structure of my table
SELECT *  FROM customer_churn_records LIMIT 10 ;

 -- HOW BIG IS MY DATA
 SELECT COUNT(*) FROM customer_churn_records;
 
 -- CHECKING IF THERE IS DUPLICATE 
SELECT COUNT(DISTINCT CustomerId) AS unique_customers
FROM customer_churn_records;

-- CHECKING FOR NULLS
SELECT COUNT(*) AS Total_count_null,
SUM( CASE  WHEN RowNumber IS NULL THEN 1 ELSE 0 END) AS RowNumber_Count_null,
SUM( CASE WHEN CustomerId IS NULL THEN 1 ELSE 0 END) AS CustomerId_Count_null,
SUM( CASE WHEN Surname IS NULL THEN 1 ELSE 0 END) AS Surname_Count_null,
SUM( CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) CreditScore_Count_null,
SUM( CASE WHEN Geography IS NULL THEN 1 ELSE 0 END) AS Geography_Count_null,
SUM( CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Count_null,
SUM( CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Count_null,
SUM( CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS Tenure_Count_null,
SUM( CASE WHEN Balance IS NULL THEN 1 ELSE 0 END) AS Balance_Count_null,
SUM(CASE WHEN NumOfProducts IS NULL THEN 1 ELSE 0 END) AS NumOfProducts_Count_null,
SUM( CASE WHEN HasCrCard IS NULL THEN 1 ELSE 0 END) AS HasCrCard_Count_NULL,
SUM( CASE WHEN IsActiveMember IS NULL THEN 1 ELSE 0 END) AS IsActiveMember_Count_null,
SUM(CASE WHEN EstimatedSalary IS NULL THEN 1 ELSE 0 END) AS EstimatedSalary_Count_null,
SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS Exited_Count_null,
SUM(CASE WHEN Complain IS NULL THEN 1 ELSE 0 END) AS Complain_null,
SUM(CASE WHEN `Satisfaction Score` IS NULL THEN 1 ELSE 0 END) AS Satisfaction_Score_NULL,
SUM(CASE WHEN `Card Type` IS NULL THEN 1 ELSE 0 END) AS Card_Type_NULL,
SUM(CASE WHEN `Point Earned` IS NULL THEN 1 ELSE 0 END) AS PointEarned_NULL
FROM customer_churn_records;

-- checking for outliers
SELECT
min(Age) AS Min_Age,
max(Age) AS Max_Age,
min(CreditScore) AS Min_CreditScore,
max(CreditScore) AS Max_CreditScore,
min(Balance) AS Min_Balance,
max(Balance) AS Max_Balance,
min(EstimatedSalary) AS Min_EstimatedSalary,
max(EstimatedSalary) AS Max_EstimatedSalary
FROM customer_churn_records;

-- Total number of customers
SELECT count(CustomerId) AS Total_customers
FROM customer_churn_records;

-- Total number of churn customers
SELECT COUNT(Exited) AS Churn_customers
FROM customer_churn_records
WHERE Exited=1;
-- Churn by percentage
SELECT AVG(Exited)*100 AS Churn_percentage
FROM customer_churn_records;
-- Churn by country
SELECT Geography, COUNT(Exited) AS Churn_customers
FROM customer_churn_records
WHERE Exited=1
group by Geography;
-- Churn by Age_group
SELECT
CASE
 WHEN Age BETWEEN 18 AND 29 THEN 'Young AdultS'
WHEN Age BETWEEN 30 AND 39 THEN 'Adults'
WHEN Age BETWEEN 40 AND 49 THEN 'Middle-Aged Adults'
WHEN Age BETWEEN 50 AND 59 THEN 'Mature Adults'
WHEN Age BETWEEN 60 AND 69 THEN 'Seniors'
WHEN AGE >=70 THEN 'Elderly'
ELSE 'Unkown'
END AS Age_Group, 
COUNT(*) AS Churn_customers
FROM customer_churn_records
WHERE Exited=1
group by Age_Group
ORDER BY churn_customers DESC;
-- churn by tenuture
SELECT Tenure, COUNT(Exited) AS customers_churn
FROM customer_churn_records
WHERE Exited = 1
GROUP BY Tenure
ORDER BY Tenure ASC;
-- Churn by ActiveMember status
SELECT IsActiveMember, COUNT(Exited) AS Churn_customers
FROM customer_churn_records
WHERE Exited=1
GROUP BY IsActiveMember;
-- CHURN BY NumOfProducts
SELECT NumOfProducts,COUNT(Exited) AS Churn_customers
FROM customer_churn_records
WHERE Exited=1
GROUP BY NumOfProducts
order by NumOfProducts ASC;
-- Average of churn customers
SELECT AVG(Exited) AVG_customers_churned
FROM customer_churn_records
WHERE Exited=1;
-- Average salary by churn status
SELECT Exited, AVG(EstimatedSalary) AS Avg_Salary
FROM customer_churn_records
GROUP BY Exited;
-- Retained customers
SELECT COUNT(*) AS Retained_Customers
FROM customer_churn_records
WHERE Exited = 0;


