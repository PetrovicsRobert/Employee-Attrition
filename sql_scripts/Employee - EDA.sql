SELECT *
FROM general_data_staging;

-- 1-Attrition and Age: --
-- How does the age of employees correlate with attrition rates? --
-- Are younger or older employees more likely to leave the company? --

SELECT DISTINCT 
	age
FROM 
	general_data_staging
ORDER BY 
	age DESC;

-- Young 18-30 --
-- Old 31-60 --

SELECT 
	employee_id,
	attrition,
CASE 
	WHEN 
		age BETWEEN '18' AND '30' THEN 'Young' 
	ELSE 'Old' 
	END AS age_group
FROM 
	general_data_staging;

SELECT 
	COUNT(employee_id) AS total_count,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(employee_id)) * 100 AS attrition_rate
FROM 
	general_data_staging;


WITH age_grouped_data AS 
(
SELECT 
	employee_id,
	attrition,
CASE 
	WHEN age BETWEEN 18 AND 30 THEN 'Young' 
	ELSE 'Old' 
	END AS age_group
FROM 
	general_data_staging
)
SELECT 
    age_group,
    COUNT(employee_id) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND((SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(employee_id)) * 100,2) AS attrition_rate
FROM 
	age_grouped_data
GROUP BY 
	age_group;

-- 2-Attrition and Monthly Income: --
-- Is there a significant relationship between employees' monthly income and their likelihood of attrition? --
-- Do higher earners tend to stay longer? --


-- Retrieve Income Statistics --
SELECT 
	MAX(monthly_income) AS max_income, 
	MIN(monthly_income) AS min_income, 
    ROUND(AVG(monthly_income), 2) AS avg_income
FROM 
	general_data_staging;


-- Categorize Employees into Income Groups--
SELECT
	employee_id,
	attrition,
	monthly_income,
CASE
	WHEN monthly_income BETWEEN '10090' AND '50000' THEN '10K-50K'
	WHEN monthly_income BETWEEN '50001' AND '100000' THEN '50K-100K'
	WHEN monthly_income BETWEEN '100001' AND '150000' THEN '100K-150K'
	WHEN monthly_income BETWEEN '150001' AND '200000' THEN '150K-200K'
END AS income_group
FROM 
	general_data_staging;

-- Calculate Attrition Rate by Income Group--
WITH income_grouped_data AS
(
SELECT
	employee_id,
	attrition,
	monthly_income,
CASE
	WHEN monthly_income BETWEEN '10090' AND '50000' THEN '10K-50K'
	WHEN monthly_income BETWEEN '50001' AND '100000' THEN '50K-100K'
	WHEN monthly_income BETWEEN '100001' AND '150000' THEN '100K-150K'
	WHEN monthly_income BETWEEN '150001' AND '200000' THEN '150K-200K'
	ELSE '200K+'
END AS income_group
FROM 
	general_data_staging
)
SELECT
	income_group,
    COUNT(employee_id) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND((SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(employee_id)) * 100,2) AS attrition_rate
FROM 
	income_grouped_data
GROUP BY 
	income_group
ORDER BY 
	attrition_rate DESC;

-- 3-Attrition and Job Role: --
-- Which job roles have the highest attrition rates? --
-- Are there specific roles that are more prone to turnover? --

SELECT 
	DISTINCT job_role
FROM 
	general_data_staging;

SELECT
	job_role,
	COUNT(employee_id) AS total_count,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM 
	general_data_staging
GROUP BY 
	job_role
ORDER BY 
	attrition_rate DESC;

-- 4-Business Travel and Attrition: --
-- Does the frequency of business travel affect employee attrition rates? --
-- Are employees who travel frequently more likely to leave? --
		
SELECT
	business_travel,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM 
	general_data_staging
GROUP BY 
	business_travel
ORDER BY 
	attrition_rate DESC;

-- 5-Department and Attrition: --
-- How do attrition rates vary across different departments? --
-- Are there departments with significantly higher turnover rates? --

SELECT 
	DISTINCT department
FROM 
	general_data_staging;

SELECT
	department,
	COUNT(*) AS total_count,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM 
	general_data_staging
GROUP BY 
	department
ORDER BY 
	attrition_rate DESC;

-- 6-Distance from Home and Attrition: --
-- Does the distance employees live from their workplace impact their likelihood of leaving the company? --

SELECT 
	MIN(distance_from_home) AS min_distance, 
	MAX(distance_from_home) AS max_distance
FROM 
	general_data_staging;

-- Categorize Employees by Distance from Home --
SELECT 
	*,
CASE
	WHEN distance_from_home BETWEEN 1 AND 10 THEN '0-10'
	WHEN distance_from_home BETWEEN 11 AND 20 THEN '11-20'
	WHEN distance_from_home BETWEEN 21 AND 30 THEN '21-30'
	ELSE '31+'
END AS distance_range
FROM 
	general_data_staging;

WITH distance_category AS
(
SELECT 
	*,
CASE
	WHEN distance_from_home BETWEEN 1 AND 10 THEN '0-10'
	WHEN distance_from_home BETWEEN 11 AND 20 THEN '11-20'
	WHEN distance_from_home BETWEEN 21 AND 30 THEN '21-30'
	ELSE '31+'
END AS distance_range
FROM 
	general_data_staging
)
SELECT
	distance_range,
    COUNT(*) AS total_count,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM 
	distance_category
GROUP BY 
	distance_range
ORDER BY 
	attrition_rate DESC;

-- 7-Education and Attrition: --
-- Is there a correlation between employees' educational background and attrition? --
-- Do employees with certain education levels or fields leave more frequently? --

SELECT 
	COUNT(*) AS total_employees,
    t2.education,
    t1.attrition
FROM 
	general_data_staging t1
JOIN 
	general_table_reference t2
	ON  
		t1.education = t2.number
GROUP BY 
	t2.education, t1.attrition
ORDER BY
	2 DESC;

WITH education_category AS
(
SELECT 
	COUNT(*) AS total_employees,
    t1.attrition,
    t2.education
FROM 
	general_data_staging t1
JOIN 
	general_table_reference t2
	ON  
		t1.education = t2.number
GROUP BY 
	t2.education, t1.attrition
) 
SELECT
	education,
    SUM(total_employees) AS total_count,
    SUM(CASE WHEN attrition = 'Yes' THEN total_employees ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN total_employees ELSE 0 END) / SUM(total_employees) * 100,2) AS attrition_rate
FROM 
	education_category
GROUP BY 
	education
ORDER BY 
	attrition_rate DESC;

-- 8-Years at Company and Attrition: --
-- How does the length of time an employee has been with the company affect their attrition rate? --
-- Are newer employees more likely to leave compared to long-term employees? --

SELECT 
	MIN(years_at_company) AS min_years,
	MAX(years_at_company) AS max_years
FROM 
	general_data_staging;


SELECT
	COUNt(*) AS total_employees,
	attrition,
CASE
	WHEN years_at_company BETWEEN 0 AND 2 THEN '0-2'
	WHEN years_at_company BETWEEN 3 AND 5 THEN '3-5'
	WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10'
	ELSE '11+'
END AS years_grouped
FROM 
	general_data_staging
GROUP BY 
	attrition, years_grouped
ORDER BY 
	attrition , total_employees DESC;


SELECT
	COUNT(*) AS total_employees,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100,2 ) AS attrition_rate,
CASE
	WHEN years_at_company BETWEEN 0 AND 2 THEN '0-2'
	WHEN years_at_company BETWEEN 3 AND 5 THEN '3-5'
	WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10'
	ELSE '11+'
END AS years_grouped
FROM 
	general_data_staging
GROUP BY
	years_grouped
ORDER BY
	3 DESC;

-- 9-Marital Status and Attrition:  --
-- Does marital status play a role in employee attrition? --
-- Are single, married, or divorced employees more likely to leave? --

SELECT
	COUNT(*) AS total_employees,
	marital_status,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM 
	general_data_staging
GROUP BY 
	marital_status
ORDER BY 
	attrition_rate DESC;

-- 10-Training and Attrition: --
-- Is there a relationship between the number of training sessions employees attend and their likelihood of attrition? --
-- Do employees who receive more training tend to stay longer? --

SELECT 
	MIN(training_times_last_year) AS min_training_count, 
	MAX(training_times_last_year) AS max_training_count
FROM 
	general_data_staging;


SELECT
    training_times_last_year,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM 
	general_data_staging
GROUP BY 
	training_times_last_year
ORDER BY 
	attrition_rate DESC;


-- 1.1. How do job satisfaction and environment satisfaction impact employee attrition? --


SELECT 
	t1.attrition, 
	ROUND(AVG(t2. environment_satisfaction), 2) AS avg_environment_satisfaction, 
	ROUND(AVG(t2.job_satisfaction), 2) AS avg_job_satisfaction
FROM 
	general_data_staging t1
JOIN 
	employee_survey_data t2
	ON 
		t1.employee_id = t2.employee_id
GROUP BY 
	t1.attrition
ORDER BY
	3 DESC;


-- 1.2. What is the correlation between work-life balance and attrition across different departments? --

SELECT 
	t1.attrition,
	t1.department,
	COUNT(t1.employee_id) AS total_employee,
	ROUND(AVG(t2.work_life_balance), 2) AS avg_work_balance
FROM 
	general_data_staging t1
JOIN 
	employee_survey_data t2
	ON 
		t1.employee_id = t2.employee_id
GROUP BY 
	t1.attrition, t1.department
ORDER BY 
	2 DESC;


-- 1.3. How do performance ratings and job involvement from manager surveys relate to employee attrition? --

SELECT
	t1.attrition,
	COUNT(t1.employee_id) AS total_employees,
	ROUND(AVG(t2.job_involvement), 2) AS avg_mng_job_involvement,
	ROUND(AVG(t2.performance_rating), 2) AS avg_mng_performance_rating
FROM 
	general_data_staging t1
JOIN 
	manager_survey_data t2
	ON 
		t1.employee_id = t2.employee_id
GROUP BY 
	t1.attrition;
        

-- 1.4. What is the relationship between training frequency and job satisfaction in relation to employee attrition? --

SELECT 
	t1.attrition, 
	t1.training_times_last_year, 
	ROUND(AVG(t2.job_satisfaction), 2) AS avg_job_satisfaction
FROM 
	general_data_staging t1
JOIN 
	employee_survey_data t2
	ON 
		t1.employee_id = t2.employee_id
GROUP BY 
	t1.attrition, t1.training_times_last_year
ORDER BY 
	t1.training_times_last_year DESC, t1.attrition DESC;




