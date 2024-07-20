-- Getting Familiar with the Dataset

SELECT 
	*
FROM 
	employee_survey_data;

SELECT 
	*
FROM 
	general_data;

SELECT 
	*
FROM 
	manager_survey_data;


-- Creating a Staging Table

CREATE TABLE 
	general_data_staging
LIKE 
	general_data;


INSERT INTO 
	general_data_staging
SELECT 
	*
FROM 
	general_data;


 -- Data Cleaning --
 
 -- 1. Remove Duplicates
 -- 2. Standardise Data
 -- 3.NULL or Blank Values
 
 
 -- 1. Remove Duplicates
 
 SELECT 
	*,
 ROW_NUMBER() OVER( 
 PARTITION BY
	Age,
	Attrition,
	BusinessTravel,
	Department,
	DistanceFromHome,
	Education,
	EducationField,
	EmployeeID,
	Gender,
	JobLevel,
	JobRole,
	MaritalStatus,
	MonthlyIncome,
	NumCompaniesWorked,
	PercentSalaryHike,
	TotalWorkingYears,
	TrainingTimesLastYear,
	YearsAtCompany,
	YearsSinceLastPromotion,
	YearsWithCurrManager
 ) AS 
	row_num
 FROM 
	general_data_staging;
 
 
 WITH duplicate_cte AS
 (
  SELECT 
	*,
 ROW_NUMBER() OVER(
 PARTITION BY
	Age,
	Attrition,
	BusinessTravel,
	Department,
	DistanceFromHome,
	Education,
	EducationField,
	EmployeeID,
	Gender,
	JobLevel,
	JobRole,
	MaritalStatus,
	MonthlyIncome,
	NumCompaniesWorked,
	PercentSalaryHike,
	TotalWorkingYears,
	TrainingTimesLastYear,
	YearsAtCompany,
	YearsSinceLastPromotion,
	YearsWithCurrManager
 ) AS 
	row_num
 FROM 
	general_data_staging
 )
 SELECT 
	*
 FROM 
	duplicate_cte
 WHERE 
	row_num > 1;
    
 
 WITH duplicate_cte AS
 (
  SELECT 
	*,
 ROW_NUMBER() OVER(
 PARTITION BY
	Age,
	Attrition,
	BusinessTravel,
	Department,
	DistanceFromHome,
	Education,
	EducationField,
	EmployeeID,
	Gender,
	JobLevel,
	JobRole,
	MaritalStatus,
	MonthlyIncome,
	NumCompaniesWorked,
	PercentSalaryHike,
	TotalWorkingYears,
	TrainingTimesLastYear,
	YearsAtCompany,
	YearsSinceLastPromotion,
	YearsWithCurrManager
 ) AS row_num
 FROM 
	general_data_staging
 )
DELETE FROM 
	general_data_staging
WHERE 
	EmployeeID IN (
    SELECT 
		EmployeeID
    FROM 
		duplicate_cte
    WHERE 
		row_num > 1);
 
 
 -- 2. Standardise Data --
 
 -- Renaming Columns for Clarity --
 
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	Age to age;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	Attrition to attrition;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	BusinessTravel to business_travel;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	Department to department;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	DistanceFromHome to distance_from_home;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	Education to education;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	EducationField to education_field;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	EmployeeID to employee_id;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	Gender to gender;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	JobLevel to job_level;
		
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	JobRole to job_role;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	MaritalStatus to marital_status;
    
ALTER TABLE 	
	general_data_staging
RENAME COLUMN 
	MonthlyIncome to monthly_income;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	NumCompaniesWorked to num_companies_worked;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	PercentSalaryHike to percent_salary_hike;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	TotalWorkingYears to total_working_years;
		
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	TrainingTimesLastYear to training_times_last_year;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	YearsAtCompany to years_at_company;
		
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	YearsSinceLastPromotion to years_since_last_promotion;
    
ALTER TABLE 
	general_data_staging
RENAME COLUMN 
	YearsWithCurrManager to years_with_curr_manager;


-- Deleting Extra Spaces --


SELECT 
	TRIM(age),
	TRIM(attrition),
	TRIM(business_travel),
	TRIM(department),
	TRIM(distance_from_home),
	TRIM(education),
	TRIM(education_field),
	TRIM(employee_id),
	TRIM(gender),
	TRIM(job_level),
	TRIM(job_role),
	TRIM(marital_status),
	TRIM(monthly_income),
	TRIM(num_companies_worked),
	TRIM(percent_salary_hike),
	TRIM(total_working_years),
	TRIM(training_times_last_year),
	TRIM(years_at_company),
	TRIM(years_since_last_promotion),
	TRIM(years_with_curr_manager)
FROM 
	general_data_staging;

-- Updating Columns without Extra Spaces --

UPDATE 
	general_data_staging
SET 
	age = TRIM(age);
    
UPDATE 
	general_data_staging
SET 
	attrition = TRIM(attrition);
    
UPDATE 
	general_data_staging
SET 
	business_travel = TRIM(business_travel);
    
UPDATE 
	general_data_staging
SET 
	department = TRIM(department);
    
UPDATE 
	general_data_staging
SET 
	distance_from_home = TRIM(distance_from_home);
    
UPDATE 
	general_data_staging
SET 
	education = TRIM(education);
    
UPDATE 
	general_data_staging
SET 
	education_field = TRIM(education_field);
    
UPDATE 
	general_data_staging
SET 
	employee_id = TRIM(employee_id);
    
UPDATE 
	general_data_staging
SET 
	gender = TRIM(gender);
    
UPDATE 
	general_data_staging
SET 
	job_level = TRIM(job_level);
    
UPDATE 
	general_data_staging
SET 
	job_role = TRIM(job_role);
    
UPDATE 
	general_data_staging
SET 
	marital_status = TRIM(marital_status);
    
UPDATE 
	general_data_staging
SET 
	monthly_income = TRIM(monthly_income);
    
UPDATE 
	general_data_staging
SET 
	num_companies_worked = TRIM(num_companies_worked);
    
UPDATE 
	general_data_staging
SET 
	percent_salary_hike = TRIM(percent_salary_hike);
    
UPDATE 
	general_data_staging
SET 
	total_working_years = TRIM(total_working_years);
    
UPDATE 
	general_data_staging
SET 
	training_times_last_year = TRIM(training_times_last_year);
    
UPDATE 
	general_data_staging
SET 
	years_at_company = TRIM(years_at_company);
    
UPDATE 
	general_data_staging
SET 
	years_since_last_promotion = TRIM(years_since_last_promotion);
    
UPDATE 
	general_data_staging
SET 
	years_with_curr_manager = TRIM(years_with_curr_manager);


-- 3. Checking for NULL and/or Blank Values

SELECT 
	age
FROM 
	general_data_staging
WHERE 
	age IS NULL OR age = '';

SELECT 
	attrition
FROM 
	general_data_staging
WHERE 
	attrition IS NULL OR age = '';

SELECT 
	business_travel
FROM 
	general_data_staging
WHERE 
	business_travel IS NULL OR age = '';

SELECT 
	department
FROM 
	general_data_staging
WHERE 
	department IS NULL OR age = '';

SELECT 
	distance_from_home
FROM 
	general_data_staging
WHERE 
	distance_from_home IS NULL OR age = '';

SELECT 
	education
FROM 
	general_data_staging
WHERE 
	education IS NULL OR age = '';

SELECT 
	education_field
FROM 
	general_data_staging
WHERE 
	education_field IS NULL OR age = '';

SELECT 
	employee_id
FROM 
	general_data_staging
WHERE 
	employee_id IS NULL OR age = '';

SELECT 
	gender
FROM 
	general_data_staging
WHERE 
	gender IS NULL OR age = '';

SELECT 
	job_level
FROM 
	general_data_staging
WHERE 
	job_level IS NULL OR age = '';

SELECT 
	job_role
FROM 
	general_data_staging
WHERE 
	job_role IS NULL OR age = '';

SELECT 
	marital_status
FROM 
	general_data_staging
WHERE 
	marital_status IS NULL OR age = '';

SELECT 
	monthly_income
FROM 
	general_data_staging
WHERE 
	monthly_income IS NULL OR age = '';

SELECT 
	num_companies_worked
FROM 
	general_data_staging
WHERE 
	num_companies_worked IS NULL OR age = '';

SELECT 
	percent_salary_hike
FROM 
	general_data_staging
WHERE 
percent_salary_hike IS NULL OR age = '';

SELECT 
	total_working_years
FROM 
	general_data_staging
WHERE 
	total_working_years IS NULL OR age = '';

SELECT 
	training_times_last_year
FROM 
	general_data_staging
WHERE 
	training_times_last_year IS NULL OR age = '';

SELECT 
	years_at_company
FROM 
	general_data_staging
WHERE 
	years_at_company IS NULL OR age = '';

SELECT 
	years_since_last_promotion
FROM 
	general_data_staging
WHERE 
	years_since_last_promotion IS NULL OR age = '';

SELECT 
	years_with_curr_manager
FROM 
	general_data_staging
WHERE 
	years_with_curr_manager IS NULL OR age = '';


-- Creating a Reference Table fot the Surveys and for the General Table--


CREATE TABLE `general_table_reference` (
  `number` int DEFAULT NULL,
  `education`  text,
  `job_level`  text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO general_table_reference VALUES
(1, 'Below College', 'Entry'),
(2, 'College', 'Intermediate'),
(3, 'Bachelor', 'Experienced'),
(4, 'Master', 'Advanced'),
(5, 'Doctor', 'Expert');

SELECT 
	*
FROM 
	general_table_reference;

CREATE TABLE `survey_reference` (
  `number` int DEFAULT NULL,
  `level`  text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT 
	*
FROM 
	survey_reference;

INSERT INTO survey_reference VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Very High');
		

-- Data Cleaning Remaining Tables --


SELECT 
	*
FROM 
	employee_survey_data;

ALTER TABLE 
	employee_survey_data
RENAME COLUMN 
	EmployeeID to employee_id;
    
ALTER TABLE 
	employee_survey_data
RENAME COLUMN 
	EnvironmentSatisfaction to environment_satisfaction;
    
ALTER TABLE 
	employee_survey_data
RENAME COLUMN 
	JobSatisfaction to job_satisfaction;
    
ALTER TABLE 
	employee_survey_data
RENAME COLUMN 
	WorkLifeBalance to work_life_balance;

SELECT 
	*
FROM 
	manager_survey_data;

ALTER TABLE 
	manager_survey_data
RENAME COLUMN 
	EmployeeID to employee_id;
    
ALTER TABLE 
	manager_survey_data
RENAME COLUMN 
	Job_involvement to job_involvement;
    
ALTER TABLE 
	manager_survey_data
RENAME COLUMN 
	PerformanceRating to performance_rating;







