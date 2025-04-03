# Pizza Hut Sales Analysis Project

This project analyzes pizza sales data from a Pizza Hut database to provide key insights into order patterns, revenue generation, and customer preferences.

## Project Description

This project utilizes SQL queries to extract and analyze data from a Pizza Hut database. The analysis focuses on:

* Calculating total orders and revenue.
* Identifying the highest-priced pizza and most common pizza size.
* Determining the top 5 most ordered pizza types.
* Calculating the percentage contribution of each pizza type to total revenue.

The results of this analysis can be used to inform business decisions related to pricing, marketing, and inventory management.

## Database Schema

The project assumes the following database schema:

* `orders`: Contains order information (order_id, order_date, order_time).
* `orders_detail`: Contains order details (order_details_id, order_id, pizza_id, Quantity).
* `pizza_types`: Contains pizza type information (pizza_type_id, name, category, ingredients).
* `pizzas`: Contains pizza information (pizza_id, pizza_type_id, size, price).

## SQL Queries

The following SQL queries are used in the analysis:

* **Total Orders:**
    ```sql
    SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;
    ```
* **Total Revenue:**
    ```sql
    SELECT ROUND(SUM(pizzas.price * orders_detail.Quantity), 2) AS total_revenue FROM pizzas JOIN orders_detail ON pizzas.pizza_id = orders_detail.pizza_id;
    ```
* **Highest-Priced Pizza:**
    ```sql
    SELECT pizza_id, price FROM pizzas ORDER BY price DESC LIMIT 1;
    ```
* **Most Common Pizza Size:**
    ```sql
    SELECT size, COUNT(*) AS size_count FROM pizzas JOIN orders_detail ON pizzas.pizza_id = orders_detail.pizza_id GROUP BY size ORDER BY size_count DESC LIMIT 1;
    ```
* **Top 5 Pizza Types:**
    ```sql
    SELECT pizza_types.name, SUM(orders_detail.Quantity) AS total_quantity FROM pizza_types JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN orders_detail ON pizzas.pizza_id = orders_detail.pizza_id GROUP BY pizza_types.name ORDER BY total_quantity DESC LIMIT 5;
    ```
* **Percentage Contribution of Pizza Types to Revenue:**
    ```sql
    SELECT pizza_types.category, SUM(pizzas.price * orders_detail.Quantity) AS category_revenue, (SUM(pizzas.price * orders_detail.Quantity) / (SELECT SUM(p2.price * od2.Quantity) FROM pizzas p2 JOIN orders_detail od2 ON p2.pizza_id = od2.pizza_id)) * 100 AS percentage_contribution FROM pizza_types JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN orders_detail ON pizzas.pizza_id = orders_detail.pizza_id GROUP BY pizza_types.category ORDER BY percentage_contribution DESC;
    ```

## How to Use

1.  **Database Setup:** Ensure you have a MySQL database set up with the specified schema and populated with pizza sales data.
2.  **Run Queries:** Execute the SQL queries in your preferred MySQL client.
3.  **Analyze Results:** Interpret the results to gain insights into pizza sales trends.

## Potential Enhancements

* Implement data visualization to present the analysis in a more user-friendly format.
* Add more detailed analysis, such as time-based trends and regional sales comparisons.
* Create a dashboard to display key metrics in real-time.
* Add python scripts to automate the data retrieval, and analysis.


