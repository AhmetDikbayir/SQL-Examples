USE SAMPLEDB

CREATE TABLE parks1
(park_id INT,
park_name VARCHAR(50),
entry_fee DECIMAL(6,2)
);

SELECT *
FROM dbo.parks1;

INSERT INTO dbo.parks1 (park_id, park_name,entry_fee)
	VALUES(1, 'Bellomont Park', 5)