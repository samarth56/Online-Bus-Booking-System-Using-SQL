# Online Bus Booking System Using SQL


## Project Overview
The Online Bus Booking System is a comprehensive database-driven application designed to manage and streamline operations for bus routes, schedules, bookings, payments, and customer information. This project showcases expertise in database design, advanced SQL queries, and handling real-world scenarios like seat availability, ticket booking, and payment processing.

---

## Features

### 1. **Database Design**
- Normalized relational database with the following tables:
  - `buses`
  - `routes`
  - `schedules`
  - `customers`
  - `bookings`
  - `payments`
- Relationships established using primary and foreign keys.

### 2. **Data Management**
- CRUD (Create, Read, Update, Delete) operations supported for all tables.
- Handles complex data relationships, such as:
  - Linking buses to routes and schedules.
  - Managing customer bookings and seat assignments.

### 3. **Advanced SQL Queries**
- Retrieve specific data, such as:
  - Available buses for a route.
  - Booked seats for a specific schedule.
  - Customer booking history.
- Use of advanced SQL features:
  - Joins.
  - Subqueries.
  - Aggregations.
  - Window functions.

### 4. **Business Logic**
- Business rules implemented to:
  - Check seat availability.
  - Calculate total fare based on distance and seat type.
  - Process and validate payments.
- Use of:
  - Stored procedures.
  - Triggers.
  - Views for automation and data integrity.

### 5. **Reporting**
- Generate dynamic reports such as:
  - Total bookings by date or schedule.
  - Revenue reports.
  - Most popular routes.

---

## Database Schema

### Tables and Fields

#### **Buses**
| Field        | Type         | Description              |
|--------------|--------------|--------------------------|
| `bus_id`     | INT (PK)     | Unique ID for each bus.  |
| `bus_name`   | VARCHAR(100) | Name of the bus.         |
| `total_seats`| INT          | Total number of seats.   |
| `bus_type`   | VARCHAR(50)  | Type (AC, Non-AC, etc.). |

#### **Routes**
| Field          | Type         | Description                      |
|----------------|--------------|----------------------------------|
| `route_id`     | INT (PK)     | Unique ID for each route.        |
| `source_city`  | VARCHAR(100) | Starting city of the route.      |
| `destination_city` | VARCHAR(100) | Ending city of the route.     |
| `distance`     | FLOAT        | Distance in kilometers.          |
| `base_fare`    | FLOAT        | Base fare for the route.         |

#### **Schedules**
| Field           | Type         | Description                      |
|-----------------|--------------|----------------------------------|
| `schedule_id`   | INT (PK)     | Unique ID for each schedule.     |
| `bus_id`        | INT (FK)     | Linked to `buses` table.         |
| `route_id`      | INT (FK)     | Linked to `routes` table.        |
| `departure_time`| DATETIME     | Scheduled departure time.        |
| `arrival_time`  | DATETIME     | Scheduled arrival time.          |
| `available_seats`| INT         | Number of seats available.       |

#### **Customers**
| Field          | Type         | Description                      |
|----------------|--------------|----------------------------------|
| `customer_id`  | INT (PK)     | Unique ID for each customer.     |
| `first_name`   | VARCHAR(100) | Customer's first name.           |
| `last_name`    | VARCHAR(100) | Customer's last name.            |
| `email`        | VARCHAR(100) | Customer's email address.        |
| `phone_number` | VARCHAR(15)  | Customer's contact number.       |

#### **Bookings**
| Field          | Type         | Description                      |
|----------------|--------------|----------------------------------|
| `booking_id`   | INT (PK)     | Unique ID for each booking.      |
| `customer_id`  | INT (FK)     | Linked to `customers` table.     |
| `schedule_id`  | INT (FK)     | Linked to `schedules` table.     |
| `seat_numbers` | TEXT         | Seats booked (e.g., "A1, A2").  |
| `total_fare`   | FLOAT        | Total fare for the booking.      |
| `booking_date` | DATETIME     | Date of booking.                 |

#### **Payments**
| Field          | Type         | Description                      |
|----------------|--------------|----------------------------------|
| `payment_id`   | INT (PK)     | Unique ID for each payment.      |
| `booking_id`   | INT (FK)     | Linked to `bookings` table.      |
| `payment_amount`| FLOAT       | Amount paid.                     |
| `payment_date` | DATETIME     | Date of payment.                 |
| `payment_status`| VARCHAR(50) | Status (Paid, Pending, etc.).    |

---

## How to Use

1. **Setup Database:**
   - Create the database and tables using the schema provided.
   - Populate tables with sample data for testing.

2. **Run SQL Queries:**
   - Perform CRUD operations for various tables.
   - Test advanced queries to retrieve and analyze data.

3. **Test Business Logic:**
   - Validate seat availability and booking rules.
   - Verify fare calculations and payment processing.

4. **Generate Reports:**
   - Run SQL queries to generate reports for bookings, revenue, and routes.

---

## Tools and Technologies
- **Database:** MySQL / PostgreSQL.
- **SQL Features:** Joins, subqueries, aggregations, window functions.
- **Optional:** Frontend for booking (HTML, CSS, JS).

---

## Future Enhancements
- Integration with a frontend for customer interactions.
- Real-time seat availability updates.
- SMS/Email notifications for booking confirmation.
- Dynamic fare pricing based on demand.

---

## License
This project is open-source and available under the [MIT License](LICENSE).
