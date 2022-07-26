USE SAMPLEDB

--UNIQUEIDENTIFIER ý veri eklerken de kullanýlabilir.
CREATE TABLE dbo.subjects
(
	subject_id INT IDENTITY,
	subject_name VARCHAR(20),
	global_id UNIQUEIDENTIFIER,
	CONSTRAINT PK_subejects_subject_id PRIMARY KEY (subject_id)
);

INSERT INTO dbo.subjects(subject_name, global_id)
VALUES ('Math', NEWID()), 
		('Chemistry', NEWID()), 
		('P.E.', NEWID());

SELECT *
FROM dbo.subjects

--DOÐRUDAN TABLO OLUÞTURURKEN DE KULLANILABÝLÝR.
CREATE TABLE dbo.subject2
(
	subject_id INT IDENTITY,
	subject_name VARCHAR(20),
	global_id UNIQUEIDENTIFIER DEFAULT NEWID(),
	CONSTRAINT pk_subject2_subject_id PRIMARY KEY (subject_id)
);

INSERT INTO dbo.subject2(subject_name)
VALUES ('English'),
		('Math'),
		('Physics')
SELECT * 
FROM dbo.subject2

--NEWSEQUENTIALID kodu

CREATE TABLE subject3
(
	subject_id INT IDENTITY,
	subject_name VARCHAR(20),
	global_id UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID(),
	CONSTRAINT pk_subject3_subject_id PRIMARY KEY (subject_id)
);

INSERT INTO dbo.subject3 (subject_name)
	VALUES ('Math'),
			('Science'),
			('Social Science'),
			('Language')

SELECT *
FROM dbo.subjects

--UPDATE kodu
UPDATE dbo.subjects
SET global_id = NEWID()
WHERE subject_name IN ('Biology', 'Physics') 

SELECT *
FROM dbo.subjects

UPDATE dbo.emp
SET last_name = 'Greenbank'
WHERE emp_id = 2;

--DELETE FROM kodu

DELETE FROM dbo.subjects
WHERE subject_name IN ('Math', 'Chemistry', 'P.E.')

DELETE FROM dbo.emp
WHERE first_name = 'Scott'

SELECT *
FROM dbo.emp