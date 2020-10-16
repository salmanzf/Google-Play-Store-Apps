WITH app_nonan AS (SELECT App, Size
				   FROM [dbo].[WRK_GooglePlayStore]
				   WHERE Size <110
				   )
SELECT App, Size
FROM app_nonan
WHERE Size >= ALL(SELECT Size
				  FROM app_nonan)

/*README:
Size 110 is excluded because the original value was "Varies with device"
*/