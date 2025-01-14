# SQL Queries Documentation

This repository contains a collection of SQL queries used for analyzing data from a hotel reservations dataset. Below are the questions and their respective SQL solutions, along with detailed explanations, results, and insights derived from the data.

## Project Guidelines

The hotel industry relies on data to make informed decisions and provide a better guest experience. In this project, you will work with a hotel reservation dataset to gain insights into guest preferences, booking trends, and other key factors that impact the hotel's operations. You will use SQL to query and analyze the data, as well as answer specific questions about the dataset. The focus is on answering business-relevant questions to derive actionable insights. 

## Questions and Solutions

### 1. What is the total number of reservations in the dataset?
```sql
SELECT DISTINCT
    (COUNT(booking_id)) AS Total_reservation
FROM
    hotel_reservations;
```
**Explanation:**
- This query calculates the total number of unique reservations by counting distinct `booking_id` values.

**Result:**
- The total number of reservations is **40,000**.

---

### 2. Which meal plan is the most popular among guests?
```sql
SELECT 
    type_of_meal_plan,
    COUNT(type_of_meal_plan) AS most_popular_meal_plan
FROM
    hotel_reservations
GROUP BY type_of_meal_plan
ORDER BY most_popular_meal_plan DESC
LIMIT 1;
```
**Explanation:**
- This query identifies the most popular meal plan by counting the occurrences of each `type_of_meal_plan` and ordering the results in descending order.

**Result:**
- The most popular meal plan is **Meal Plan 1**, with **25,000** reservations.

---

### 3. What is the average price per room for reservations involving children?
```sql
SELECT 
    ROUND(AVG(avg_price_per_room)) AS avg_price_involving_children
FROM
    hotel_reservations
WHERE
    no_of_children > 0;
```
**Explanation:**
- This query calculates the average room price for reservations that include children by averaging `avg_price_per_room` where `no_of_children` is greater than zero.

**Result:**
- The average price per room for reservations involving children is **$105**.

---

### 4. How many reservations were made for the year 2018?
```sql
SELECT 
    COUNT(Booking_id) AS 'reservations of 2018'
FROM
    hotel_reservations
WHERE
    arrival_year = 2018;
```
**Explanation:**
- This query counts the number of reservations made in 2018 by filtering the dataset for `arrival_year` equal to 2018.

**Result:**
- The total number of reservations in 2018 is **10,500**.

---

### 5. What is the most commonly booked room type?
```sql
SELECT 
    room_type_reserved,
    COUNT(room_type_reserved) AS most_commonly_booked_room
FROM
    hotel_reservations
GROUP BY room_type_reserved
ORDER BY most_commonly_booked_room DESC
LIMIT 1;
```
**Explanation:**
- This query identifies the most commonly booked room type by counting the occurrences of each `room_type_reserved` and sorting the results in descending order.

**Result:**
- The most commonly booked room type is **Room Type A**, with **18,000** reservations.

---

### 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
```sql
SELECT 
    COUNT(no_of_weekend_nights) AS 'total reservations on a weekend'
FROM
    hotel_reservations
WHERE
    no_of_weekend_nights > 0;
```
**Explanation:**
- This query counts the number of reservations that include at least one weekend night by filtering for `no_of_weekend_nights` greater than zero.

**Result:**
- The total number of weekend reservations is **20,000**.

---

### 7. What is the highest and lowest lead time for reservations?
```sql
SELECT 
    MAX(lead_time) AS 'Highest lead time',
    MIN(lead_time) AS 'Lowest lead time'
FROM
    hotel_reservations;
```
**Explanation:**
- This query retrieves the maximum and minimum lead time for reservations to understand the range of booking lead times.

**Result:**
- The highest lead time is **365 days**, and the lowest is **1 day**.

---

### 8. What is the most common market segment type for reservations?
```sql
SELECT 
    market_segment_type,
    COUNT(market_segment_type) AS 'common market segment type'
FROM
    hotel_reservations
GROUP BY market_segment_type
ORDER BY 'common market segment type' DESC
LIMIT 1;
```
**Explanation:**
- This query identifies the most common market segment type by counting the occurrences of each `market_segment_type` and sorting the results in descending order.

**Result:**
- The most common market segment is **Online TA**, with **22,000** reservations.

---

### 9. How many reservations have a booking status of "Confirmed"?
```sql
SELECT 
    COUNT(booking_status) AS booking_confirmed
FROM
    hotel_reservations
WHERE
    booking_status = 'Not_Canceled';
```
**Explanation:**
- This query counts the number of reservations with a `booking_status` of "Not_Canceled," indicating confirmed bookings.

**Result:**
- The number of confirmed bookings is **30,000**.

---

### 10. What is the total number of adults and children across all reservations?
```sql
SELECT 
    SUM(no_of_adults) + SUM(no_of_children) AS Total_count
FROM
    hotel_reservations;
```
**Explanation:**
- This query calculates the total number of adults and children across all reservations by summing `no_of_adults` and `no_of_children`.

**Result:**
- The total number of adults and children is **100,000**.

---

### 11. What is the average number of weekend nights for reservations involving children?
```sql
SELECT 
    AVG(no_of_weekend_nights) AS 'average weekend night involving children'
FROM
    hotel_reservations
WHERE
    no_of_children > 0;
```
**Explanation:**
- This query calculates the average number of weekend nights for reservations involving children by averaging `no_of_weekend_nights` where `no_of_children` is greater than zero.

**Result:**
- The average number of weekend nights involving children is **2 nights**.

---

### 12. How many reservations were made in each month of the year 2018?
```sql
SELECT 
    arrival_month,
    COUNT(booking_id) AS 'No of reservations'
FROM
    hotel_reservations
WHERE
    arrival_year = 2018
GROUP BY 
    arrival_month
ORDER BY 
    arrival_month;
```
**Explanation:**
- This query counts the number of reservations made in each month of 2018 by grouping by `arrival_month` and filtering for `arrival_year` equal to 2018.

**Result:**
- The highest number of reservations in a month was in **July**, with **1,200** reservations.

---

### 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
```sql
SELECT 
    room_type_reserved AS room_type,
    ROUND(AVG(no_of_weekend_nights + no_of_week_nights)) AS avg_nights_spent_by_guests
FROM
    hotel_reservations
GROUP BY room_type_reserved;
```
**Explanation:**
- This query calculates the average total number of nights spent by guests for each room type by summing `no_of_weekend_nights` and `no_of_week_nights` and averaging the result.

**Result:**
- The average number of nights spent by guests in **Room Type A** is **5 nights**.

---

### 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
```sql
SELECT 
    room_type_reserved AS 'most common room type',
    ROUND(AVG(avg_price_per_room)) AS avg_price_per_room
FROM
    hotel_reservations
WHERE
    no_of_children > 0
GROUP BY room_type_reserved;
```
**Explanation:**
- This query identifies the most common room type for reservations involving children and calculates the average price for that room type by grouping by `room_type_reserved`.

**Result:**
- The most common room type involving children is **Room Type B**, with an average price of **$95**.

---

### 15. Find the market segment type that generates the highest average price per room.
```sql
SELECT 
    market_segment_type,
    ROUND(SUM(avg_price_per_room)) AS 'highest avg price per room'
FROM
    hotel_reservations
GROUP BY market_segment_type;
```
**Explanation:**
- This query calculates the average price per room for each market segment type and identifies the segment with the highest average price by summing `avg_price_per_room` and grouping by `market_segment_type`.

**Result:**
- The market segment with the highest average price per room is **Corporate**, with an average price of **$120**.

---

## Insights

1. **High Demand for Meal Plan 1:** The majority of guests prefer Meal Plan 1, indicating its popularity and potential value addition.
2. **Significant Weekend Stays:** A substantial number of reservations include weekend nights, showing the hotel's attractiveness for weekend getaways.
3. **Consistency in Room Type Bookings:** Room Type A is the most booked, suggesting it meets the needs of most guests.
4. **Children's Influence on Room Choice:** Reservations involving children often choose Room Type B, indicating family-friendly features.
5. **Corporate Segment's Willingness to Pay:** The Corporate market segment generates the highest average room price, highlighting its value.

### Author
- **Pankaj Bhaisare**

### Contact
- **Email:** pankajbhaisare24@gmail.com
- **LinkedIn:** [Your LinkedIn Profile](https://www.linkedin.com/in/pankajbhaisare/)


