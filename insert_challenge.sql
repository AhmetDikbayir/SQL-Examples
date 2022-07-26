USE SAMPLEDB
--1. dept isimli bir table olu�tur. dept_id primary key olsun ve kendili�inden artan bir yap�s� olsun. dept_name bo� olamas�n.
CREATE TABLE dept
(
	dept_id INT IDENTITY (1,1),
	dept_name VARCHAR(50) NOT NULL,
	CONSTRAINT PK_dept_dept_id PRIMARY KEY (dept_id);
);

--2. Business Intelligence b�l�m�n� tabloya ekleyin.

INSERT INTO dbo.dept(dept_name)
VALUES ('Business Intelligence');


--3. hcm.department daki b�t�n departman isimlerini dbo.dept tablosuna ekleyin.

INSERT INTO dbo.dept (dept_name)
SELECT department_name 
FROM hcm.departments;

--4. emp isimli bir talo olu�turun. A�a��daki kolonlar� olsun.

CREATE TABLE emp 
(
	emp_id INT IDENTITY (1,1) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	hire_date DATE NOT NULL,
	dept_id INT,
	CONSTRAINT PK_emp_emp_id PRIMARY KEY (emp_id),
	CONSTRAINT FK_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept (dept_id)
);

--5. �ki ki�iyi emp tablosuna ekleyin.

INSERT INTO dbo.emp (first_name, last_name, hire_date, dept_id)
VALUES 
( 'Scott', 'Davis', '20201211', 1),
('Miriam', 'Yardley', '20201205', 1);


SELECT *
FROM dbo.emp





