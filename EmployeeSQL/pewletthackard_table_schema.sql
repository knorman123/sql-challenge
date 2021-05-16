-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30)
);

-- Check table
SELECT *
FROM titles;

-- Create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Check table
SELECT *
FROM employees;

-- Create salaries table
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Check table
SELECT *
FROM salaries;

-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30)
);

-- Check table
SELECT *
FROM departments;

-- Create department employees table
CREATE TABLE department_employees (
	emp_no INT,
	dept_no VARCHAR(30),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Check table
SELECT *
FROM department_employees;

-- Create department managers table
CREATE TABLE department_managers (
	dept_no VARCHAR(30),
	emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Check table
SELECT *
FROM department_managers;