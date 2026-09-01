# Swiggy Restaurant Dataset Analysis 🍽️

![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

## Project Overview

This project performs a comprehensive SQL-based analysis of the **Swiggy restaurant dataset**, covering over **61,000+ restaurants** across multiple Indian cities. The analysis explores restaurant distribution, cuisine popularity, pricing patterns, revenue estimation, and city-level performance to derive actionable business insights from one of India's largest food delivery platforms.

---

## Dataset

- **Source:** Swiggy Restaurant Dataset (Kaggle)
- **Total Records:** 61,425 restaurants
- **Coverage:** Multiple Indian cities including Bangalore, Chennai, Delhi, Hyderabad, Pune, and more
- **Key Columns:** `name`, `city`, `cuisine`, `rating`, `rating_count`, `cost`

---

## Tools Used

- **Microsoft SQL Server / SSMS**
- **MySQL**

---

## Project Structure

```
Swiggy_dataset_Analysis/
│
├── Swiggy_dataset_sql_analysis.sql   # Complete SQL analysis file
└── README.md
```

---

## Analysis Sections

### 1. Basic Exploration (Q1–Q12)
Foundational queries covering restaurant filtering, sorting, distinct cuisines, rating thresholds, cost filtering, and basic aggregations.

### 2. Aggregations & Group Analysis (Q13–Q25)
City-level and cuisine-level aggregations including average ratings, restaurant counts, cost ranges, and window function-based rankings.

### 3. Subquery & Business Analysis (Q1–Q12)
Advanced business questions using subqueries and CTEs to answer real-world food delivery business problems.

---

## Key Findings

### Restaurant Distribution
- **61,425 total restaurants** across the platform
- **Bangalore** has the highest number of restaurants at **6,580**, followed by Chennai (4,849), Delhi (4,592), Hyderabad (4,489), and Pune (3,765)
- **113 restaurants** have a rating count greater than 1,000 — indicating high customer engagement

### Ratings & Quality
- The **average cost** across restaurants is approximately **₹298**, calculated after filtering out outliers below ₹50
- **Chopda** has the highest average restaurant rating at **4.82**, followed by Kumta (4.80), Kadayanallur (4.52), and Dhanbad (4.40)
- **36,722 restaurants** (approximately 60%) have a rating above the platform average
- Multiple restaurants including **Gelato Vinto, Bronies, and Lassi Pub** hold perfect ratings of 5.0

### Cuisine Insights
- **Paan** is the highest-rated cuisine category on the platform, followed by Greek, South American, and Ice Cream
- **Most expensive cuisines:** Malaysian, Tribal, Greek, Steakhouse, Japanese, Korean, Persian, and Vietnamese
- **Least expensive cuisines:** Paan, Chaat, Juices, African, Bangladeshi, and Home Food
- **Bangalore** leads in Biryani restaurant count with **614 restaurants** serving the cuisine

### Revenue Analysis
- **Hyderabad** generated the highest estimated revenue at **₹40,12,95,710** — demonstrating that revenue leadership doesn't always align with restaurant count, as Hyderabad ranks 4th in restaurant numbers but 1st in revenue. Contributing factors may include higher footfall, premium pricing, and restaurant popularity.
- **McDonald's** generated the highest combined chain revenue at approximately **₹5.05 crore**, suggesting strong footfall and consistent pricing across locations
- **Domino's Pizza** has the maximum number of chain outlets in India at **409**, followed by Pizza Hut (318), KFC (306), Kwality Walls (236), and Baskin Robbins (228)
- **Gulab Wala** generated the highest revenue among Delhi restaurants at **₹17,50,000**, followed by Fullon Punjab and Just Punjabi

### Unique Restaurant Insights
- Top unique-name restaurants by revenue include **Capital Multi Cuisine Restaurant, Zaitoon, Meridian Restaurant, Mujtaba Grill**, and **Eaters Stop**

---

## How to Reproduce

1. Install **Microsoft SQL Server** and **SSMS** (or use the SQL Server extension in VS Code)
2. Download the Swiggy dataset from Kaggle and import it into your SQL Server instance
3. Open `Swiggy_dataset_sql_analysis.sql`
4. Each query is **self-contained and independent** — copy any individual query and run it directly in your SQL environment to reproduce the result

---

## Dataset Limitations

- Revenue figures are **estimated** using `rating_count × cost` as a proxy — actual revenue data is not available in the dataset
- Rating count reflects the number of reviews on the platform and may not represent actual footfall accurately
- Dataset represents a snapshot in time and may not reflect the current state of restaurants on the platform

---

## Author

**Rahul Datta Roy**
Aspiring Data Analyst | SQL | Python | Power BI
[GitHub](https://github.com/rahuldattaroy2727-cmd) | [LinkedIn](https://www.linkedin.com/in/rahul-datta-roy-0340a7209)
