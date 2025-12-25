Create Database Ola;
Use Ola;
# Retrieve all successful bookings:
DROP VIEW IF EXISTS Successful_Booking;

CREATE VIEW Successful_Bookings AS
Select * FROM Bookings
WHERE Booking_Status = 'Success';

# Find the average ride distance for each vehicle type:
Select Vehicle_Type, avg(Ride_Distance)
as Avg_Distance from Bookings
group by Vehicle_Type;

# Get the total number of cancelled rides by customers:
select count(Canceled_Rides_by_customer) from Bookings;

select count(*) from Bookings
where Booking_Status = 'Canceled by Customer'; 

select distinct Booking_Status from Bookings;

# List the top 5 customers who booked the highest number of rides:
select customer_ID, count(Booking_ID) as Total_Rides
from Bookings
group by customer_ID
order by Total_Rides desc
Limit 5;

# Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

# Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) as Maximum_Rating,
min(Driver_Ratings) as Minimun_Rating
from Bookings
where Vehicle_Type = 'Prime_sedan';

# Retrieve all rides where payment was made using UPI:
select * 
from Bookings as UPI_Payment_Method
where payment_method = 'UPI';

# Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating)
as Avg_Customer_Rating
from Bookings
group by(vehicle_type);

# Calculate the total booking value of rides completed successfully:
select sum(booking_value) as Total_successful_value
from Bookings
where Booking_status= 'Success';

# List all incomplete rides along with the reason:
select Customer_ID, Booking_ID, Incomplete_Rides_Reason
from Bookings
where Incomplete_Rides = 'Yes';

select distinct Incomplete_Rides from Bookings;


