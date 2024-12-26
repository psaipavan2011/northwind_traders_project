# Northwind Traders SQL Project

This project is a comprehensive exploration of the Northwind Traders dataset using SQL. It involves querying, analyzing, and deriving insights from the dataset to simulate real-world business scenarios. The project demonstrates proficiency in database design, querying, and analysis techniques.

## Table of Contents

- [About the Northwind Dataset](#about-the-northwind-dataset)
- [Objectives](#objectives)
- [Skills Demonstrated](#skills-demonstrated)
- [Project Structure](#project-structure)
- [SQL Topics Covered](#sql-topics-covered)
- [Queries and Scenarios](#queries-and-scenarios)
- [How to Use This Project](#how-to-use-this-project)
- [Future Enhancements](#future-enhancements)

## About the Northwind Dataset

The Northwind dataset is a sample database designed for learning and practice. It represents a fictitious company, Northwind Traders, that imports and exports specialty foods from around the world. The database includes several tables such as:

- **Customers**: Customer details
- **Orders**: Information about customer orders
- **Products**: Product catalog
- **Employees**: Employee details
- **Suppliers**: Supplier information
- **Categories**: Product categories
- **Order Details**: Detailed information about each order

## Objectives

The primary goal of this project is to:

- Analyze and understand the structure of the Northwind database.
- Perform advanced SQL queries to extract meaningful business insights.
- Build analytical scenarios mimicking real-world business requirements.

## Skills Demonstrated

- Writing complex SQL queries
- Data filtering, sorting, and aggregation
- Using joins (INNER, OUTER, CROSS, and SELF)
- Subqueries and CTEs (Common Table Expressions)
- Window functions for advanced analytics
- Data cleaning and preparation
- Creating views and stored procedures

## Project Structure

The project is organized into the following directories and files:

```
.
|-- README.md                 # Project overview
|-- northwind_database.sql    # SQL script to set up the database
|-- queries
|   |-- project_queries.sql   # SQL queries
```

## SQL Topics Covered

1. **Database Design**: Understanding relationships between tables.
2. **Joins**: Combining data from multiple tables.
3. **Aggregations**: Using functions like `SUM()`, `AVG()`, `COUNT()`, etc.
4. **Subqueries**: Nested queries to handle complex requirements.
5. **CTEs and Window Functions**: Advanced analytics and ranking.
6. **Data Manipulation**: Updating, deleting, and inserting data.

## Queries and Scenarios

Here are some business questions and scenarios solved using SQL:

### Sales Analysis:

- Total sales revenue per month
- Top 5 best-selling products

### Customer Insights:

- List of loyal customers with more than 5 orders
- Average order value by region

### Employee Performance:

- Total sales handled by each employee
- Ranking employees based on order counts

### Supplier Contributions:

- Products supplied by each supplier
- Supplier with the most product variety

### Inventory Management:

- Products with low stock levels
- Average time taken to fulfill orders

## How to Use This Project

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/northwind_traders_project.git
   ```

2. Set up the database:
   - Install a relational database system (MySQL, PostgreSQL, SQL Server, etc.).
   - Import `northwind_database.sql` to your database.

3. Run the queries:
   - Navigate to the `queries` folder and execute SQL files in your database environment.

4. Explore insights:
   - Review the `insights.md` file for documented observations and results.

## Future Enhancements

- Integrate SQL queries with a visualization tool like Power BI or Tableau.
- Build a dashboard showcasing key business metrics.
- Add more complex queries and advanced analytics scenarios.

