
--creat table of titles by retirement
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(u.emp_no),
u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

--Deliverable 2

SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    d.from_date,
    d.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
Left JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
Left JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01')
AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;