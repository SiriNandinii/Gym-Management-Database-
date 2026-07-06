# 🏋️‍♀️💖 Gym Management Database ✨

A cute little SQL project that builds a mini **Gym Management System** — trainers, members, membership plans, and equipment, all living together happily in one database! 🐣🎀

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL-ffb6c1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL badge"/>
  <img src="https://img.shields.io/badge/Language-SQL-c1a3ff?style=for-the-badge&logo=databricks&logoColor=white" alt="SQL badge"/>
  <img src="https://img.shields.io/badge/Status-Complete-b5f2b5?style=for-the-badge" alt="Status badge"/>
  <img src="https://img.shields.io/badge/Difficulty-Beginner%20Friendly-fff3b0?style=for-the-badge" alt="Difficulty badge"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Tables-4-ffd6e8?style=flat-square" alt="tables"/>
  <img src="https://img.shields.io/badge/Made%20with-💕-ff9dbf?style=flat-square" alt="made with love"/>
  <img src="https://img.shields.io/badge/Queries-20+-c2f0c2?style=flat-square" alt="queries"/>
</p>

---

## 🌸 About This Project

This assignment walks through the full lifecycle of a tiny gym database:

- 🏗️ Creating the database & tables
- 🛠️ Altering tables (adding/dropping columns)
- 📥 Inserting sample data
- 🔍 Selecting, updating & deleting records
- 📊 Aggregate functions & `GROUP BY` / `HAVING`
- 🔗 `INNER JOIN` and `LEFT JOIN` magic
- 🪄 A nested (subquery) example

It's a sweet little sandbox for practicing real-world relational database concepts! 🍬

---

## 🗂️ Database Schema

```
gym
 ├── 🧑‍🏫 Trainers
 ├── 💳 Membership_Plan
 ├── 🙋 Members
 └── 🏋️ Equipment
```

### 🧑‍🏫 `Trainers`
| Column | Type | Notes |
|---|---|---|
| trainer_id | INT (PK, AUTO_INCREMENT) | Unique trainer ID |
| trainer_name | VARCHAR(50) | Required |
| specialization | VARCHAR(40) | e.g. Yoga, CrossFit 🧘 |
| experience | INT | Must be ≥ 0 |
| salary | DECIMAL(10,2) | 💰 |
| phone | VARCHAR(15) | Unique |
| certification | VARCHAR(40) | Added later via `ALTER` |

### 💳 `Membership_Plan`
| Column | Type | Notes |
|---|---|---|
| plan_id | INT (PK, AUTO_INCREMENT) | Unique plan ID |
| plan_name | VARCHAR(30) | Basic, Standard, Premium, Elite, Student 🌟 |
| duration_months | INT | Plan length |
| price | DECIMAL(10,2) | 💵 |
| benefits | VARCHAR(100) | What you get! |

### 🙋 `Members`
| Column | Type | Notes |
|---|---|---|
| member_id | INT (PK, AUTO_INCREMENT) | Unique member ID |
| first_name / last_name | VARCHAR(30) | 🙂 |
| gender | VARCHAR(10) | |
| age | INT | Must be ≥ 16 |
| phone | VARCHAR(15) | Unique |
| join_date | DATE | Defaults to today 📅 |
| trainer_id | INT (FK) | → Trainers |
| plan_id | INT (FK) | → Membership_Plan |
| email | VARCHAR(50) | Added later via `ALTER`, unique 📧 |
| ~~favorite_color~~ | — | Dropped later 🎨❌ |
| ~~blood_group~~ | — | Dropped later 🩸❌ |

### 🏋️ `Equipment`
| Column | Type | Notes |
|---|---|---|
| equipment_id | INT (PK, AUTO_INCREMENT) | Unique equipment ID |
| equipment_name | VARCHAR(40) | Treadmill, Dumbbells, etc. 🏋️‍♂️ |
| category | VARCHAR(30) | Cardio, Strength, Bodyweight |
| purchase_date | DATE | 🗓️ |
| condition_status | VARCHAR(20) | Defaults to 'Good', can be 'Excellent' or 'Maintenance' |
| quantity | INT | Must be ≥ 0 |

---

## 🔗 Relationships

```
Trainers (1) ──────< (many) Members
Membership_Plan (1) ──────< (many) Members
```

Every member is happily linked to **one trainer** 🧑‍🏫 and **one membership plan** 💳 via foreign keys!

---

## 🧁 What's Inside `Assignment.sql`

| Section | Description |
|---|---|
| 🏗️ **Setup** | Creates the `gym` database and all 4 tables |
| 🛠️ **ALTER TABLE** | Adds `email`, `certification`; drops `favorite_color`, `blood_group` |
| 📥 **INSERT** | Populates all tables with cute sample data (5 trainers, 5 plans, 10 members, 8 equipment) |
| ✏️ **UPDATE** | Updates a trainer's salary, a member's plan, and equipment condition |
| 🗑️ **DELETE** | Removes one equipment record |
| 📊 **Aggregate Queries** | `COUNT`, `MAX`, `MIN`, `AVG`, `SUM`, `GROUP BY`, `HAVING` |
| 🔢 **Sorting & Pagination** | `ORDER BY`, `LIMIT`, `OFFSET` |
| 🪆 **Nested Query** | Trainers earning above average salary |
| 🔗 **Joins** | `INNER JOIN` and `LEFT JOIN` across all relationships |

---

## ✨ Sample Query Highlights

**👵 Three oldest members:**
```sql
SELECT * FROM Members ORDER BY age DESC LIMIT 3;
```

**💰 Trainers earning above average salary:**
```sql
SELECT * FROM trainers
WHERE salary > (SELECT AVG(salary) FROM Trainers);
```

**🤝 Members with their trainers (INNER JOIN):**
```sql
SELECT m.member_id, CONCAT(m.first_name, ' ', m.last_name) AS Member_Name,
       t.trainer_name, t.specialization
FROM Members m
INNER JOIN Trainers t ON m.trainer_id = t.trainer_id;
```

**🧑‍🏫 All trainers, even ones with no members (LEFT JOIN):**
```sql
SELECT t.trainer_name, CONCAT(m.first_name, ' ', m.last_name) AS Member_Name
FROM Trainers t
LEFT JOIN Members m ON t.trainer_id = m.trainer_id
ORDER BY t.trainer_name;
```

---

## 🚀 How to Run

1. Open MySQL Workbench, phpMyAdmin, or your favorite SQL client 🐬
2. Run the whole `Assignment.sql` script top to bottom
3. Watch the `gym` database spring to life! 🌱
4. Explore the `SELECT` queries at the bottom to see it in action 🔍

---

## 🏷️ Tech Stack

<p align="center">
  <img src="https://img.shields.io/badge/RDBMS-MySQL%208.0-4479A1?style=flat-square&logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Concepts-DDL%20%7C%20DML%20%7C%20Joins%20%7C%20Aggregates-ffb6c1?style=flat-square"/>
</p>

---

<p align="center">
  Made with 🧘‍♀️ dumbbells, 🩰 discipline, and a lot of 💗 <br/>
  <em>Stay strong, query smart!</em> 🏆
</p>
