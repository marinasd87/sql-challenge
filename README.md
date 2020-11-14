# sql-challenge
For this challenge I've created an ERD (Entity Relationship Diagram) for Pewlett Hackard.
Then I created a table schema for each of the six CSV files (with information about the Employees, Salaries, Titles, etc) specifying data types, primary keys and foreign keys. Then I've imported each CSV file into the corresponding SQL table.
Now with a complete database I've run queries to obtain the following results:
1) List the following details of each employee: employee number, last name, first name, sex, and salary.
2) List first name, last name, and hire date for employees who were hired in 1986.
3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
4) List the department of each employee with the following information: employee number, last name, first name, and department name.
5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Last, I loaded the tables into Pandas to create a histogram to visualize the most common salary ranges for employees and create a bar chart of average salary by title.
