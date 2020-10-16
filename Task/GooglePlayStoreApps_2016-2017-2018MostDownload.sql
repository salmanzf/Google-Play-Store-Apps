WITH YearCateg AS (
	SELECT YEAR([Last Updated]) AS Years, Category, SUM(Installs) AS Install
	FROM [dbo].[WRK_GooglePlayStore]
	WHERE YEAR([Last Updated]) IN ('2016','2017','2018')
	GROUP BY YEAR([Last Updated]), Category
	)
SELECT Years, Category, MAX(Install) AS Download
FROM YearCateg x
GROUP BY Years, Category, Install
HAVING Install >= ALL(SELECT Install
					  FROM YearCateg y
					  WHERE x.Years=y.Years)