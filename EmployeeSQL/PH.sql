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