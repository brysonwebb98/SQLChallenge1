CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(30)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(30),
    emp_no INT PRIMARY KEY
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(30),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary DECIMAL(10, 2)
);

CREATE TABLE title (
    title_id VARCHAR(30) PRIMARY KEY,
    title VARCHAR(255)
);

ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_departments FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_departments FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_employees FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_title FOREIGN KEY (emp_title_id)
REFERENCES title (title_id);

ALTER TABLE salaries
ADD CONSTRAINT fk_salaries_employees FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);


-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees AS e
join salaries s on  e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_manager.dept_no AS Department_Number, departments.dept_name AS Department_Name, dept_manager.emp_no AS Employee_ID, employees.last_name AS Last_Name, employees.first_name AS First_Name
from dept_manager
join employees on employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name
from employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, Count(*) AS frequency
from employees
group by last_name
order by frequency desc;


