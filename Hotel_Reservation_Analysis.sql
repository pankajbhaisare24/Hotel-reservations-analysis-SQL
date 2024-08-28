USE hotel_reservations;
SELECT * FROM hotel_reservations;
DESC hotel_reservations;

#1. What is the total number of reservations in the dataset?
SELECT DISTINCT
    (COUNT(booking_id)) AS Total_reservation
FROM
    hotel_reservations;
    

#2. Which meal plan is the most popular among guests?
SELECT 
    type_of_meal_plan,
    COUNT(type_of_meal_plan) AS most_popular_meal_plan
FROM
    hotel_reservations
GROUP BY type_of_meal_plan
ORDER BY most_popular_meal_plan DESC
LIMIT 1;


#3. What is the average price per room for reservations involving children?
SELECT 
    ROUND(AVG(avg_price_per_room)) AS avg_price_involving_children
FROM
    hotel_reservations
WHERE
    no_of_children > 0;


#4. How many reservations were made for the year 2018?
SELECT 
    COUNT(Booking_id) AS 'reservations of 2018'
FROM
    hotel_reservations
WHERE
    arrival_year = 2018;
    

#5. What is the most commonly booked room type?
SELECT 
    room_type_reserved,
    COUNT(room_type_reserved) AS most_commonly_booked_room
FROM
    hotel_reservations
GROUP BY room_type_reserved
ORDER BY most_commonly_booked_room DESC
LIMIT 1;



#6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT 
    COUNT(no_of_weekend_nights) AS 'total reservations on a weekend'
FROM
    hotel_reservations
WHERE
    no_of_weekend_nights > 0;
    
    

#7. What is the highest and lowest lead time for reservations?
SELECT 
    MAX(lead_time) AS 'Highest lead time',
    MIN(lead_time) AS 'Lowest lead time'
FROM
    hotel_reservations;
    
    

#8. What is the most common market segment type for reservations?
SELECT 
    market_segment_type,
    COUNT(market_segment_type) AS 'common market segment type'
FROM
    hotel_reservations
GROUP BY market_segment_type
ORDER BY 'common market segment type' DESC
LIMIT 1;

 
#9. How many reservations have a booking status of "Confirmed"?
SELECT 
    COUNT(booking_status) AS booking_confirmed
FROM
    hotel_reservations
WHERE
    booking_status = 'Not_Canceled';
    
    

#10. What is the total number of adults and children across all reservations?
SELECT 
    SUM(no_of_adults) + SUM(no_of_children) AS Total_count
FROM
    hotel_reservations;

SELECT SUM(no_of_adults) 
AS total_adults,
SUM(no_of_children) 
AS Total_children
FROM hotel_reservation_dataset;


#11. What is the average number of weekend nights for reservations involving children?
SELECT 
    AVG(no_of_weekend_nights) AS 'average weekend night involving children'
FROM
    hotel_reservations
WHERE
    no_of_children > 0;
    


#12. How many reservations were made in each month of the year 2018?
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


#13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT 
    room_type_reserved AS room_type,
    ROUND(AVG(no_of_weekend_nights + no_of_week_nights)) AS avg_nights_spent_by_guests
FROM
    hotel_reservations
GROUP BY room_type_reserved;



#14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT 
    room_type_reserved AS 'common room type',
    ROUND(AVG(avg_price_per_room)) AS avg_price_per_room
FROM
    hotel_reservations
WHERE
    no_of_children > 0
GROUP BY room_type_reserved;



#15. Find the market segment type that generates the highest average price per room.
SELECT 
    market_segment_type,
    ROUND(SUM(avg_price_per_room)) AS 'highest avg price per room'
FROM
    hotel_reservations
GROUP BY market_segment_type;
-- THANK YOU -- 