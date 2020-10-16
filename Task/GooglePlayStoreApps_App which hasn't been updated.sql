SELECT *
FROM [dbo].[WRK_GooglePlayStore]
WHERE [Last Updated] <= '2016-12-31'
ORDER BY [Last Updated] DESC

--I pick the year 2016 because the latest was at 2018 month 9th