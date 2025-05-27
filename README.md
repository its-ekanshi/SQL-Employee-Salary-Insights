# 📊 Complex SQL Reporting — Employee Salary Insights

Welcome to a hands-on SQL project where I analyzed an **Employee Salary History** dataset and built a **real-world reporting system** using advanced SQL techniques like **CTEs**, **window functions**, and **query optimization**.

---

## 📁 Dataset Description

This project uses two tables:

### 🧑‍💼 `employees`
| Column       | Data Type | Description               |
|--------------|------------|---------------------------|
| employee_id  | INT        | Unique identifier         |
| name         | VARCHAR    | Employee name             |
| join_date    | DATE       | Date of joining           |
| department   | VARCHAR    | Department of the employee|

### 💰 `salary_history`
| Column        | Data Type | Description                        |
|---------------|-----------|------------------------------------|
| employee_id   | INT       | Foreign key to employees table     |
| change_date   | DATE      | Date of salary change or promotion |
| salary        | DECIMAL   | Salary after the change            |
| promotion     | VARCHAR   | 'Yes' or 'No' indicating promotion |

---

## ❓ Business Questions Solved

1. ✅ What is the **latest salary** of each employee?  
2. 📈 How many **promotions** have they received?  
3. 🚀 What is their **maximum salary growth %**?  
4. 📉 Did their salary **ever decrease**?  
5. 🕒 What's the **average time between salary changes**?  
6. 🏆 How do they **rank** based on salary growth ratio?

---

## 🧱 Step-by-Step SQL Approach

### ✔️ CTE-Based Query  
Structured the logic into multiple **CTEs (Common Table Expressions)** to calculate:
- Latest salary
- Promotion count
- Salary growth
- Salary never decreased flag
- Average months between changes
- Rank by salary growth

📎 *View Full Query:* [CTE Version](#)

---

### ⚙️ Optimized Version (Without CTEs)

Rewrote the same logic using a **single query**:
- Removed intermediate CTEs
- Used `CASE`, `LEAD()`, and `RANK()` smartly
- Improved readability and performance

📎 *View Full Query:* [Optimized Version](#)

---

## 📸 Output Preview

Here’s a snapshot of the final report generated:

| employee_id | name    | no_of_promotions | salary_growth | never_decreased | avg_months_between_changes | RankByGrowth |
|-------------|---------|------------------|----------------|------------------|-----------------------------|---------------|
| 1           | Alice   | 1                | 27.27%         | Y                | 17.5                        | 2             |
| ...         | ...     | ...              | ...            | ...              | ...                         | ...           |

*(This is a sample. Full output is visible in the notebook/script.)*

---

## 🎓 Key Learnings

- Practical application of **Window Functions**: `RANK()`, `LEAD()`
- Usage of **aggregations** across change history
- Comparison of **query design patterns**: CTEs vs Flat SQL
- Real-life **reporting KPIs** using SQL only

---

## 🔗 Connect with Me

- 💼 [LinkedIn](https://www.linkedin.com/in/ekanshisaxena)
- 💻 [GitHub](https://github.com/its-ekanshi)

---

## 🏷️ Tags

`#SQL` `#CTE` `#WindowFunctions` `#DataAnalytics` `#EmployeeInsights` `#QueryOptimization`
