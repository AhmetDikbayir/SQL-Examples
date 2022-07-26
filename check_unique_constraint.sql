USE SAMPLEDB

ALTER TABLE hcm.departments
ADD CONSTRAINT uk_departments_department_name UNIQUE (department_name);

ALTER TABLE hcm.employeeS
ADD CONSTRAINT chk_employee_salary
CHECK (salary >=0);

ALTER TABLE hcm.employees
ADD CONSTRAINT chk_employees_salary
CHECK (salary >10000);

SELECT *
FROM hcm.employees
