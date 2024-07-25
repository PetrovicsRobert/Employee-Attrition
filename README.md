# Employee Attrition Analysis

## Project Overview
This project analyzes employee attrition using a dataset cleaned and explored with SQL. The insights are visualized through a PowerBI dashboard.

## Table of Contents
- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Data Cleaning and Exploration](#data-cleaning-and-exploration)
- [PowerBI Dashboard](#powerbi-dashboard)
- [Insights](#insights)
- [Recommendations](#recommendations)
- [How to Use](#how-to-use)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Dataset
The dataset used (`Employee-Attrition
/data`) for this project includes various attributes of employees such as age, department, job role, years at the company, etc. It helps understand patterns and factors contributing to employee attrition.

## Data Cleaning and Exploration
Data cleaning and exploratory data analysis (EDA) were performed using SQL. The SQL scripts used are available in the `Employee-Attrition/sql_scripts` folder. The main tasks in data cleaning included removing duplicates, standarising the dataset and checking for blank and NULL values.

## PowerBI Dashboard
The PowerBI dashboard visualizes key insights from the dataset, focusing on various factors that influence employee attrition.

![Employee Attrition Dashboard](https://github.com/PetrovicsRobert/Employee-Attrition/blob/5704e1d0b76e51a33dfb58850e494e3f6364896a/Attrition_Dashboard_Picture.png)

## Insights
From the PowerBI dashboard, the following insights were observed based on total attrition by departments:

**Total Attrition by Departments:**
- Human Resources: 57 
- Research & Development: 453
- Sales: 201

  - The most significant attrition rate occured in the Human Resources department ( 30.16 % ) due to the low number of employees and high attrition count.

  To better understand the reasons behind the attrition rates in each department, make sure to filter the data down to individual departments. This showcases a more detailed analysis of the specific factors contributing to attrition within each department.
  
**Total Employees and Attrition Count:**
  - Total Employees: 4,410
  - Total Attrition Count: 711
  - Attrition Rate: 16.12%
  - Male Attrition Count: 441
  - Female Attrition Count: 270

- **Total Attrition by Job Satisfaction:**
  - Job satisfaction is ranked from 1 to 4, with 1 being the worst and 4 being the best. The data shows that employees with a job satisfaction rating of 3 have the highest attrition count (219), followed by those with a rating of 1 (198). This suggests that while extremely dissatisfied employees leave at a high rate, those who are moderately satisfied also exhibit significant attrition. 

- **Total Attrition by Income:**
  - Income levels are categorized into three groups: High, Medium, and Low. The data shows that employees with high income exhibit the highest attrition rate at 47.26%, followed by those with low income at 29.11%, and medium income at 23.63%.

- **Total Attrition by Years at the Company:**
  - A line chart clearly illustrates that attrition peaks in the first year and gradually decreases to a more stable level after year 12. This trend indicates a significant drop in attrition as employees gain more experience with the company.

- **Total Attrition by Work-Life Balance:**
  - Work-life balance is ranked from 1 to 4, with 1 being the worst and 4 being the best. The data reveals that employees with a work-life balance rating of 3 have the highest attrition count (380), followed by those with a rating of 2 (171), then those with a rating of 4, and finally those with a rating of 1.

- **Total Attrition by Marital Status:**
  - The data reveals that attrition rates vary significantly by marital status. Single employees have the highest attrition rate at 50.6%, followed by married employees at 35.4%, and divorced employees with the lowest attrition rate.

- **Total Attrition by Age Group:**
  - Employees are grouped by age ranges in tens (e.g., 10-19, 20-29, etc.). The data shows that the highest attrition rate is among employees in their 30s at 37.55%, followed by those in their 20s at 34.18%. The attrition rates then decrease with employees in their 40s and 50s having lower attrition rates, and the lowest attrition in the youngest age group (10-19).

## Recommendations
Based on the insights derived from the dashboard, the following recommendations are proposed to reduce employee attrition:

1. **Job Satisfaction:**
   - Investigate each department individually to find out and address specific issues contributing to moderate job satisfaction and high attrition. Elevate overall job satisfaction by providing growth opportunities, fair compensation, and a supportive work environment. 

2. **Employee Income:**
   - Investigate other factors within each department that lead to high-income employees to leave the company. After identifying these factors, perform further analysis to create specific solutions. 

3. **Years at the Company:**
   - Investigate and redefine onboarding processes to help new employees blend in smoothly and feel valued from the beginning. Provide continuous support and mentorship during the initial years of employment. Provide clear career progression paths to encourage long-term commitment. If necessary, conduct satisfaction  surveys to reveal employee needs.

4. **Work-Life Balance:**
   - Regularly assess work-life balance through employee feedback and make recommendations about policies and practices as needed. Further investigate why the highest attrition happens amongst employees with a work-life balance rating of 3. Apply this information to improve work-life balance.

5. **Age Group:**
   - Develop age-specific retention strategies. For employees in their 20s, focus on provide them job experiences and skill-building opportunities. For employees in their 30s, emphasise career advancement and leadership development. 


