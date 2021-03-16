-- DELIVERABLE 1

-- MAKE THE RETIREMENT TITLES TABLE
SELECT
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date, 
t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON t.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;	

-- MAKE THE UNIQUE TITLE TABLE
SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
t.title
INTO unique_titles
FROM employees AS e
JOIN titles AS t
ON t.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, to_date DESC;	


-- NUMBER OF TITLES FROM UNIQUE TITLES & MAKE A RETIRING TITLES TABLE
SELECT COUNT(title) count, title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- DELIVERABLE 2

-- MENTORSHIP ELIGIBILITY
SELECT DISTINCT ON (e.emp_no) 
e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dep_emp AS de ON e.emp_no = de.emp_no
JOIN titles AS t ON t.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND t.to_date = '9999-01-01'
ORDER BY e.emp_no ASC, t.to_date ASC;

