USE SAMPLEDB

---Challenge 1
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	e.manager_id,
	m.first_name AS manager_first_name,
	m.last_name AS manager_last_name
FROM hcm.employees e LEFT JOIN hcm.employees m
ON e.manager_id = m.employee_id

---Challenge 2
SELECT 
	p.product_id,
	p.product_name,
	w.warehouse_id,
	w.warehouse_name
FROM oes.products p INNER JOIN oes.inventories i
ON p.product_id = i.product_id
INNER JOIN oes.warehouses w
ON i.warehouse_id = w.warehouse_id

---Challenge 3
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name,
	j.job_title,
	e.state_province	
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d 
ON d.department_id = e.department_id
INNER JOIN hcm.jobs j
ON e.job_id = j.job_id
INNER JOIN hcm.countries c
ON c.country_id = e.country_id
WHERE c.country_name='Australia';

---Challenge 4
SELECT 
	SUM(i.quantity) AS total_quantity,
	p.product_name,
	c.category_name	
FROM oes.order_items i JOIN oes.products p
ON i.product_id = p.product_id
JOIN oes.product_categories c
ON c.category_id= p.category_id
GROUP BY p.product_name, c.category_name
ORDER BY c.category_name DESC, p.product_name ASC

--Challenge 5
SELECT 
	pc.category_name, 
	p.product_name, 
	COALESCE(SUM(i.quantity), 0) AS total_number_hand_on 
FROM oes.order_items i RIGHT JOIN oes.products p
ON p.product_id = i.product_id
RIGHT JOIN oes.product_categories pc
ON pc.category_id = p.category_id
GROUP BY pc.category_name, p.product_name
ORDER BY pc.category_name, p.product_name