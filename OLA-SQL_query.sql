SELECT * FROM `ola`.`bookings-100000-rows` WHERE Booking_Status = 'Success';

SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM `ola`.`bookings-100000-rows` GROUP BY
Vehicle_Type;

SELECT COUNT(*) FROM `ola`.`bookings-100000-rows`  WHERE Booking_Status = 'cancelled by Customer';

create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_distance) as avg_distance from `ola`.`bookings-100000-rows` Group By Vehicle_Type;
select * from ride_distance_for_each_vehicle;

create view cancelled_by_customer as
SELECT COUNT(*) 
FROM `ola`.`bookings-100000-rows` 
WHERE booking_status = 'Canceled by customer';
    
Create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from `ola`.`bookings-100000-rows`
group by Customer_ID
order by total_rides DESC limit 5;


Create view rides_cancelled_by_drivers as 
select count(*) from `ola`.`bookings-100000-rows`
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

Create view Max_Min_driver_ratings as 
select max(Driver_ratings)as max_ratings,
min(Driver_ratings) as min_ratings
from `ola`.`bookings-100000-rows` where Vehicle_Type = 'Prime-Sedan';

Create View UPI_Payment As
SELECT * FROM `ola`.`bookings-100000-rows` WHERE Payment_Method = 'UPI';

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM `ola`.`bookings-100000-rows`
GROUP BY Vehicle_Type;

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_value FROM `ola`.`bookings-100000-rows` WHERE
Booking_Status = 'Success';

Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason FROM `ola`.`bookings-100000-rows` WHERE Incomplete_Rides =
'Yes';