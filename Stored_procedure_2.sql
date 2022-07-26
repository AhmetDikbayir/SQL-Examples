USE des
SELECT 
	* 
FROM 
	census_data

ALTER PROCEDURE com_are_num(@c tinyint)
AS
BEGIN

SELECT 
	*
FROM 
	census_data
WHERE Community_Area_Number = @c

END

EXEC com_are_num 12