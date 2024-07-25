# SQL Data Cleaning and EDA Project


## Overview

This project involves cleaning the dataset to prepare it for analysis. After the data cleaning, exploratory data analysis (EDA) was conducted to investigate the link between factors that lead to employee attrition. Additionally, four business questions were answered to provide a celarer view of certain reasons which cause employee attrition.

## Data Cleaning Steps


#### 1. Creating Staging Table

A staging table was created to preserve the raw dataset before any transformations. 

#### 2. Removing Duplicates

Duplicate records were identified and removed to ensure each entry in the dataset is unique, which is crucial for having precise answers during exploratory data analysis.

#### 3. Standardizing Dataset

Renamed column headers for clarity and consistency.

#### 4. Deleting Extra Spacing

Trimmed leading and trailing spaces from each record to ensure clean and consistent data entries.

#### 5. Checking for NULL and Blank Values

Checking for NULL and Blank Values is cruical to ensure the accuracy of the dataset. No Null and Blank Values were found.

#### 6. Creating Reference Table

Creating a reference table to explain the meanings behind numbered values in the dataset.

## Exploratory Data Analysis (EDA)

After cleaning the data, an exploratory data analysis was performed. Please, find each code for the below questions in `Employee-Attrition
/sql_scripts` folder:

#### 1. Attrition and Age

How does the age of employees correlate with attrition rates?
Are younger or older employees more likely to leave the company?

#### 2. Attrition and Monthly Income

Is there a significant relationship between employees' monthly income and their likelihood of attrition?
Do higher earners tend to stay longer?

#### 3. Attrition and Job Role

Which job roles have the highest attrition rates?
Are there specific roles that are more prone to turnover?

#### 4. Business Travel and Attrition

Does the frequency of business travel affect employee attrition rates?
Are employees who travel frequently more likely to leave?

#### 5. Department and Attrition

How do attrition rates vary across different departments?
Are there departments with significantly higher turnover rates?

#### 6. Distance from Home and Attrition

Does the distance employees live from their workplace impact their likelihood of leaving the company?

#### 7. Education and Attrition

Is there a correlation between employees' educational background and attrition?
Do employees with certain education levels or fields leave more frequently?

#### 8. Years at Company and Attrition

How does the length of time an employee has been with the company affect their attrition rate?
Are newer employees more likely to leave compared to long-term employees?

#### 9. Marital Status and Attrition

Does marital status play a role in employee attrition?
Are single, married, or divorced employees more likely to leave?

#### 10. Training and Attrition

Is there a relationship between the number of training sessions employees attend and their likelihood of attrition?
Do employees who receive more training tend to stay longer?
Additional Analyses

## Business Questions

### 1. How do job satisfaction and environment satisfaction impact employee attrition?
### 2. What is the correlation between work-life balance and attrition across different departments?
### 3. How do performance ratings and job involvement from manager surveys relate to employee attrition?
### 4. What is the relationship between training frequency and job satisfaction in relation to employee attrition?
