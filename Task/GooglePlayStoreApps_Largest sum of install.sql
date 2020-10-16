SELECT App, Installs
FROM [dbo].[WRK_GooglePlayStore]
WHERE Installs >= ALL(SELECT Installs
					  FROM [dbo].[WRK_GooglePlayStore])