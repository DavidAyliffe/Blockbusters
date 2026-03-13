# Blockbusters

A progressive SQL training curriculum built around a fictional video rental company database. Learn MySQL through hands-on challenges across 10 difficulty levels, structured with a ninja-themed ranking system.

## Overview

Blockbusters teaches MySQL database skills through problem-based learning. Each level introduces new SQL concepts with ~10-15 progressively harder challenges, complete with answer keys for self-assessment. The curriculum is built on top of the Sakila-style database schema representing a video rental business with customers, films, actors, stores, and rental transactions.

## Curriculum

| Level | Rank | SQL Focus | Key Concepts |
|-------|------|-----------|--------------|
| 01 | Academy Ninja | Basic SELECT & Aggregation | `WHERE`, `ORDER BY`, `COUNT`, `AVG`, `MIN`, `MAX`, `NULL` checks |
| 02 | Genin | Multi-table JOINs | `INNER JOIN` across up to 6 tables, `GROUP BY` |
| 03 | Chunin | Complex Filtering | `HAVING`, date functions, `NOW()`, compound `WHERE` clauses |
| 04 | ANBU | Advanced Joins | Self-joins, joining the same table multiple times |
| 05 | Jonin | Subqueries | `IN` / `NOT IN`, nested `SELECT` statements |
| 06 | Hokage | DDL & Schema Changes | `ALTER TABLE`, `CREATE TABLE`, column operations, CSV imports |
| 07 | Minato | Data Population | `INSERT` statements, spatial/geographic queries |
| 08 | Missing Ninja | Data Modification | `UPDATE` statements, `SHA2` hashing, salt generation |
| 09 | Kage | Views | `CREATE VIEW`, data abstraction layers |
| 10 | Master Ninja | Stored Procedures | Parameters, control flow, server-side logic |

Each level is estimated at ~2 class sessions, totalling approximately 20 hours of coursework.

## Database Schema

The `blockbusters` database models a video rental company with the following core tables:

- **customer** - Rental customers with address and contact info
- **film** - Movie catalogue with ratings, lengths, and rental rates
- **actor** / **film_actor** - Cast members and film-to-actor relationships
- **rental** - Rental transactions with due and return dates
- **inventory** - Physical inventory tracked by store and film
- **store** / **staff** - Store locations and employees
- **payment** - Payment records
- **category** - Film genre classification
- **address** / **city** / **country** / **region** - Geographic hierarchy
- **locations** - GPS coordinates for spatial queries
- **award** / **ceremony** - Movie awards and ceremony events

## Project Structure

```
├── Level XX - <Rank>.sql              # Challenge questions
├── Level XX - <Rank> (answers).sql    # Answer keys
├── Level 06 - *.csv                   # CSV data for imports (awards, ceremonies)
├── Level 06 - locations_insert_statements.sql
├── Level 07 - Example Spatial Query.sql
├── Level 08 - maiden names.csv
└── Databases Homework Booklet v4.docx # Comprehensive guide document
```

## Prerequisites

- MySQL Server installed and running
- A MySQL client (MySQL Workbench, CLI, or similar)

## Getting Started

1. **Create the database:**
   ```sql
   CREATE DATABASE blockbusters;
   USE blockbusters;
   ```

2. **Populate the schema and data** by following the setup instructions in the homework booklet or running the provided SQL and CSV import files.

3. **Work through the levels in order** (Level 01 → Level 10). Each `.sql` file contains commented challenge questions. Write your queries underneath each prompt.

4. **Check your work** against the corresponding answer file when finished.

## Topics Covered

- Fundamental CRUD operations
- Single and multi-table joins (including self-joins)
- Aggregation and grouping with filtering
- Subqueries and set operations
- DDL and schema modification
- Bulk data imports from CSV
- Spatial/geodesic distance calculations (`ST_Distance_Sphere`)
- Cryptographic functions (`SHA2`, salt generation)
- Database views and stored procedures

## License

Educational use.
