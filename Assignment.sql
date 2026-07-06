-- Create Database
CREATE DATABASE gym;


-- Use Databse
USE gym;


-- Verify Database
SELECT DATABASE();


-- Drop Tables if they exist

DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Membership_Plan;
DROP TABLE IF EXISTS Trainers;



-- Create Trainers Table

CREATE TABLE Trainers
(
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(40) NOT NULL,
    experience INT CHECK (experience >= 0),
    salary DECIMAL(10,2),
    phone VARCHAR(15) UNIQUE
);




-- Create Membership_Plan Table

CREATE TABLE Membership_Plan
(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(30) NOT NULL,
    duration_months INT,
    price DECIMAL(10,2),
    benefits VARCHAR(100)
);




-- Create Members Table

CREATE TABLE Members
(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30),
    gender VARCHAR(10),
    age INT CHECK (age >= 16),
    phone VARCHAR(15) UNIQUE,
    join_date DATE DEFAULT (CURRENT_DATE),
    trainer_id INT,
    plan_id INT,
    favorite_color VARCHAR(20),
    blood_group VARCHAR(5),
    CONSTRAINT fk_trainer
        FOREIGN KEY (trainer_id)
        REFERENCES Trainers(trainer_id),
    CONSTRAINT fk_plan
        FOREIGN KEY (plan_id)
        REFERENCES Membership_Plan(plan_id)
);




-- Create Equipment Table

CREATE TABLE Equipment
(
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(40) NOT NULL,
    category VARCHAR(30),
    purchase_date DATE,
    condition_status VARCHAR(20) DEFAULT 'Good',
    quantity INT CHECK (quantity >= 0)
);



DESC Trainers;

DESC Membership_Plan;

DESC Members;

DESC equipment;






-- ALTER the tables

ALTER TABLE Members ADD email VARCHAR(50) UNIQUE;


ALTER TABLE Trainers ADD certification VARCHAR(40);


ALTER TABLE Members DROP COLUMN favorite_color;


ALTER TABLE Members DROP COLUMN blood_group;


-- Viewing Altered Tables

DESC members;

DESC trainers;












-- Insertion of Data

INSERT INTO trainers (trainer_name, specialization, experience, salary, phone, certification) VALUES
	('Rahul Sharma', 'Strength Training', 8, 55000, '9876543210', 'ACE Certified'),
	('Priya Reddy', 'Yoga', 6, 48000, '9876543211', 'RYT-200'),
	('Arjun Mehta', 'Cardio', 5, 45000, '9876543212', 'NASM'),
	('Sneha Kapoor', 'CrossFit', 7, 60000, '9876543213', 'CrossFit Level 2'),
	('Vikram Singh', 'Bodybuilding', 10, 70000, '9876543214', 'ISSA');

SELECT * FROM Trainers;





INSERT INTO membership_plan (plan_name, duration_months, price, benefits) VALUES
	('Basic',1,1200,'Gym Access'),
	('Standard',3,3200,'Gym + Cardio'),
	('Premium',6,6000,'Gym + Trainer'),
	('Elite',12,11000,'All Facilities'),
	('Student',6,4500,'Discounted Membership');

SELECT * FROM Membership_Plan;





INSERT INTO members (first_name,last_name,gender,age,phone,email,join_date,trainer_id,plan_id) VALUES
	('Amit','Patel','Male',24,'9000000001','amit@gmail.com','2026-01-15',1,3),
	('Neha','Rao','Female',22,'9000000002','neha@gmail.com','2026-02-10',2,5),
	('Kiran','Kumar','Male',28,'9000000003','kiran@gmail.com','2026-01-28',5,4),
	('Pooja','Sharma','Female',25,'9000000004','pooja@gmail.com','2026-03-02',1,2),
	('Rohan','Gupta','Male',31,'9000000005','rohan@gmail.com','2026-02-20',4,4),
	('Divya','Reddy','Female',26,'9000000006','divya@gmail.com','2026-04-01',3,3),
	('Akash','Verma','Male',23,'9000000007','akash@gmail.com','2026-04-05',2,1),
	('Meera','Joshi','Female',29,'9000000008','meera@gmail.com','2026-03-15',5,4),
	('Sanjay','Nair','Male',34,'9000000009','sanjay@gmail.com','2026-05-01',4,3),
	('Ananya','Das','Female',21,'9000000010','ananya@gmail.com','2026-05-20',2,5);

SELECT * FROM Members;





INSERT INTO equipment (equipment_name,category,purchase_date,condition_status,quantity) VALUES
	('Treadmill','Cardio','2023-02-12','Good',8),
	('Bench Press','Strength','2022-05-18','Excellent',5),
	('Dumbbells','Strength','2021-10-05','Good',50),
	('Exercise Bike','Cardio','2023-08-14','Excellent',6),
	('Rowing Machine','Cardio','2024-01-25','Good',3),
	('Kettlebell','Strength','2022-09-20','Good',25),
	('Leg Press','Strength','2023-06-10','Maintenance',2),
	('Pull-up Bar','Bodyweight','2024-02-01','Excellent',4);

SELECT * FROM equipment;








-- Displaying Tables with values inserted

SELECT * FROM trainers;

SELECT * FROM Membership_Plan;

SELECT * FROM Members;

SELECT * FROM equipment;







-- UPDATE Command

UPDATE Trainers SET salary = 58000 WHERE trainer_id = 1;

UPDATE Members SET plan_id = 4 WHERE member_id = 1;

UPDATE Equipment SET condition_status = 'Excellent' WHERE equipment_name = 'Leg Press';



/* Display updated tables */

SELECT * FROM trainers;

SELECT * FROM Membership_Plan;

SELECT * FROM Members;

SELECT * FROM equipment;









-- DELETE Command


DELETE FROM Equipment WHERE equipment_id = 8;

SELECT * FROM equipment;









-- SELECT Queries



-- 1. Count the total number of members enrolled in the gym.

SELECT COUNT(*) AS Total_Members FROM Members;



-- 2. Display the highest, lowest, average and total trainer salary.

SELECT MAX(salary) AS Highest_Salary, MIN(salary) AS Lowest_Salary, AVG(salary) AS Average_Salary, SUM(salary) AS Total_Salary FROM Trainers;


-- 3. Display the number of members enrolled under each membership plan.

SELECT plan_id, COUNT(member_id) AS Total_Members FROM Members GROUP BY plan_id ORDER BY Total_Members DESC;



-- 4. Display membership plans having more than one member.

SELECT plan_id, COUNT(member_id) AS Member_Count FROM Members GROUP BY plan_id HAVING COUNT(member_id) > 1;



-- 5. Display the three oldest members in the gym.

SELECT * FROM Members ORDER BY age DESC LIMIT 3;



-- 6. Display the next three oldest members after skipping the first two (OFFSET demonstration).

SELECT * FROM Members ORDER BY age DESC LIMIT 3 OFFSET 2;



-- 7. Display equipment arranged first by category and then by quantity in descending order.

SELECT * FROM Equipment ORDER BY category ASC, quantity DESC;



-- 8. Find the average membership plan price.

SELECT AVG(price) AS Average_Plan_Price FROM Membership_Plan;



-- 9. Display the most expensive membership plan.

SELECT * FROM Membership_Plan ORDER BY price DESC LIMIT 1;



-- 10. Count the number of equipment available in each category.

SELECT category, COUNT(*) AS Equipment_Count FROM Equipment GROUP BY category ORDER BY Equipment_Count DESC;



-- Nested Query

SELECT * FROM trainers
WHERE salary > (
    SELECT AVG(salary) FROM Trainers
);





















-- INNER JOIN. Display all members along with their assigned trainer.

SELECT
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS Member_Name,
    t.trainer_name,
    t.specialization
FROM Members m
INNER JOIN Trainers t
ON m.trainer_id = t.trainer_id;






-- INNER JOIN - 2. Display all members along with their membership plan and plan price.

SELECT
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS Member_Name,
    p.plan_name,
    p.price
FROM Members m
INNER JOIN Membership_Plan p
ON m.plan_id = p.plan_id;






-- LEFT JOIN. Display all trainers and the members assigned to them. If a trainer has no members, the trainer details should still be displayed.

SELECT
    t.trainer_name,
    CONCAT(m.first_name, ' ', m.last_name) AS Member_Name
FROM Trainers t
LEFT JOIN Members m
ON t.trainer_id = m.trainer_id
ORDER BY t.trainer_name;







-- INNER JOIN WITH WHERE. Display members who have enrolled in plans costing more than ₹5000.

SELECT
    CONCAT(m.first_name, ' ', m.last_name) AS Member_Name,
    p.plan_name,
    p.price
FROM Members m
INNER JOIN Membership_Plan p
ON m.plan_id = p.plan_id
WHERE p.price > 5000;