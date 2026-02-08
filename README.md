Retail Sales SQL Analysis

Project Overview

This project demonstrates the use of SQL for exploratory data analysis (EDA) and answering selected business questions using retail sales data. The goal is to understand sales performance, customer behaviour, and revenue trends through structured queries.

The analysis focuses on:

•	Data quality checks

•	Revenue and sales metrics

•	Customer segmentation

•	Product performance

•	Time-based trends and seasonality


Dataset Description

The dataset contains transactional retail sales data with the following attributes:

•	transactions_id – Unique transaction identifier

•	sale_date – Date of sale

•	sale_time – Time of sale

•	customer_id – Unique customer identifier

•	gender – Customer gender

•	age – Customer age

•	category – Product category

•	quantiy – Quantity sold

•	price_per_unit – Price per unit

•	cogs – Cost of goods sold

•	total_sale – Total transaction value


Tools & Technologies

•	MySQL

•	SQL (Data Definition Language, Data Manipulation Language, Aggregations, Subqueries, Date Functions)


Data Preparation & Cleaning

The following steps were performed to ensure data quality:

•	Verified table creation and structure

•	Checked total row count

•	Inspected sample records

•	Identified missing values

•	Checked for duplicate transactions

•	Converted sale_date from string to proper DATE format

•	Verified numerical ranges for quantity and price


Key Business Questions Answered

Sales Performance

•	What is the total revenue?

•	What is the average order value?

•	How many products were sold in total?

•	Which product categories generate the most revenue?

Customer Analysis

•	How many unique customers are there?

•	Who are the top 10 customers by total spend?

•	Which customers place the most orders?

•	Repeat vs one-time buyers analysis.

•	Identification of high lifetime value (LTV) customers.


Time-Based Analysis

•	Monthly revenue trends

•	Peak sales months

•	Seasonality patterns

•	Monthly order volume changes


Advanced Insights

•	Revenue contribution of the top 20% of customers

•	Identification of churn-risk customers

•	Analysis of whether a small number of products drive most revenue


Key Insights 

•	Revenue is concentrated among a small segment of high-value customers

•	The clothing product category dominates total sales whereas the electronic category contributes most revenue. 

•	Clear monthly trends and seasonal effects are present where sales volume spike from September until December across all years. 

•	Repeat customers contribute a significant share of the revenue of about 44%.

•	A small number of customers and products drive most sales

SQL Concepts Demonstrated

•	Table creation and schema inspection

•	Data cleaning and validation

•	Aggregate functions (SUM, AVG, COUNT)

•	Grouping and ordering

•	Subqueries

•	Case statements

•	Date and time functions

•	Business-driven analytical queries




