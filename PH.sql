drop table if exists employees;
drop table if exists departments;
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries;
drop table if exists titles;

CREATE TABLE titles (
    title_id varchar   NOT NULL,
    title varchar   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no integer   NOT NULL,
    emp_title_id varchar   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no),
	foreign key(emp_title_id) references titles (title_id)
);

create table departments (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

create table dept_emp (
    emp_no integer   NOT NULL,
    dept_no varchar   NOT NULL,
	foreign key(emp_no) references employees (emp_no),
    foreign key(dept_no) references departments (dept_no)

);

CREATE TABLE dept_manager (
    dept_no varchar   NOT NULL,
    emp_no integer   NOT NULL,
	primary key (dept_no,emp_no),
	foreign key(emp_no) references employees (emp_no),
    foreign key(dept_no) references departments (dept_no)
);


CREATE TABLE salaries (
    emp_no integer   NOT NULL,
    salary integer   NOT NULL,
    PRIMARY KEY (emp_no, salary),
	foreign key(emp_no) references employees (emp_no)
);

select * from titles;
select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;

--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from salaries
inner join employees on
employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees 
--who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.

select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on
dept_manager.dept_no = departments.dept_no
inner join employees on
dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and 
--department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;
