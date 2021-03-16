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