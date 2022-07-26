USE SAMPLEDB
--1. dept isimli bir table oluþtur. dept_id primary key olsun ve kendiliðinden artan bir yapýsý olsun. dept_name boþ olamasýn.
CREATE TABLE dept
(
	dept_id INT IDENTITY (1,1),
	dept_name VARCHAR(50) NOT NULL,
	CONSTRAINT PK_dept_dept_id PRIMARY KEY (dept_id);
);

--2. Business Intelligence bölümünü tabloya ekleyin.

INSERT INTO dbo.dept(dept_name)
VALUES ('Business Intelligence');


--3. hcm.department daki bütün departman isimlerini dbo.dept tablosuna ekleyin.

INSERT INTO dbo.dept (dept_name)
SELECT department_name 
FROM hcm.departments;

--4. emp isimli bir talo oluþturun. Aþaðýdaki kolonlarý olsun.

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

--5. Ýki kiþiyi emp tablosuna ekleyin.

INSERT INTO dbo.emp (first_name, last_name, hire_date, dept_id)
VALUES 
( 'Scott', 'Davis', '20201211', 1),
('Miriam', 'Yardley', '20201205', 1);


SELECT *
FROM dbo.emp





