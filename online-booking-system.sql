CREATE TABLE Buses (
    bus_id INT PRIMARY KEY,
    bus_name VARCHAR(50),
    total_seats INT,
    bus_type VARCHAR(20)
);

CREATE TABLE Routes (
    route_id INT PRIMARY KEY,
    source_city VARCHAR(50),
    destination_city VARCHAR(50),
    distance DECIMAL(10, 2),
    base_fare DECIMAL(10, 2)
);

CREATE TABLE Schedules (
    schedule_id INT PRIMARY KEY,
    bus_id INT,
    route_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    available_seats INT,
    FOREIGN KEY (bus_id) REFERENCES Buses(bus_id),
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    schedule_id INT,
    seat_numbers VARCHAR(100),
    total_fare DECIMAL(10, 2),
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (schedule_id) REFERENCES Schedules(schedule_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


/*Inserting Sample Data:*/

INSERT INTO Buses (bus_id, bus_name, total_seats, bus_type)
VALUES (1, 'Volvo AC', 50, 'AC'),
       (2, 'Sleeper Bus', 40, 'Sleeper');

INSERT INTO Routes (route_id, source_city, destination_city, distance, base_fare)
VALUES (1, 'New York', 'Boston', 300, 50.00),
       (2, 'Los Angeles', 'San Francisco', 600, 80.00);

INSERT INTO Schedules (schedule_id, bus_id, route_id, departure_time, arrival_time, available_seats)
VALUES (1, 1, 1, '2023-11-15 08:00:00', '2023-11-15 12:00:00', 50),
       (2, 2, 2, '2023-11-16 10:00:00', '2023-11-16 18:00:00', 40);

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
       (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210');

INSERT INTO Bookings (booking_id, customer_id, schedule_id, seat_numbers, total_fare, booking_date)
VALUES (1, 1, 1, 'A1, A2', 100.00, '2023-11-10'),
       (2, 2, 2, 'B1, B2', 160.00, '2023-11-11');

INSERT INTO Payments (payment_id, booking_id, payment_amount, payment_date, payment_status)
VALUES (1, 1, 100.00, '2023-11-10', 'Paid'),
       (2, 2, 160.00, '2023-11-11', 'Paid');
    
    
    
    
/*Find available buses for a specific route and date:*/
SELECT b.bus_name, s.departure_time, s.arrival_time, s.available_seats
FROM Schedules s
JOIN Buses b ON s.bus_id = b.bus_id
WHERE s.route_id = 1 AND s.departure_time >= '2023-11-15';


/*Calculate total revenue from bookings:*/
SELECT SUM(p.payment_amount) AS total_revenue
FROM Payments p
WHERE p.payment_status = 'Paid';


/*Check seat availability for a specific schedule:*/
SELECT s.schedule_id, b.bus_name, s.available_seats
FROM Schedules s
JOIN Buses b ON s.bus_id = b.bus_id
WHERE s.schedule_id = 1;

