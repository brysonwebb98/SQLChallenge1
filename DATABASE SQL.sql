Create Table title (
title_id VARCHAR(30),
title VARCHAR(30)
);


create table salaries (
emp_no INT,
salary int
);

create table employees (
emp_no int,
emp_title_id VARCHAR,
birth_date VARCHAR,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date VARCHAR
);

create table dept_manager (
dept_no VARCHAR,
emp_no INT
);

create table dept_emp (
emp_no INT,
dept_no VARCHAR
);

create table departments(
dept_no VARCHAR,
dept_name VARCHAR
);