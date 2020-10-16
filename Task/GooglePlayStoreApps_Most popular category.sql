SELECT Category, SUM(Installs) AS Install
FROM [dbo].[WRK_GooglePlayStore]
GROUP BY Category
HAVING SUM(Installs) >= ALL(SELECT SUM(Installs)
							FROM [dbo].[WRK_GooglePlayStore]
							GROUP BY Category)