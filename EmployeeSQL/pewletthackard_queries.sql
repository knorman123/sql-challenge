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



-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM salaries AS sal
INNER JOIN employees AS emp
	ON emp.emp_no = sal.emp_no;
	
-- List first name, last name, and hire date for employees who were hired in 1986
SELECT emp.first_name,
	emp.last_name,
	emp.hire_date
FROM employees AS emp
WHERE emp.hire_date >= '1986-01-01' and emp.hire_date <= '1986-12-31'

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.