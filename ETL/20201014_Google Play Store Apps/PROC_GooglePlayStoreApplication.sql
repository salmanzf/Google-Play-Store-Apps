USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[__tmpl__BLD_WRK_WRK_GooglePlayStore]    Script Date: 10/15/2020 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[BLD_WRK_GooglePlayStore]
-- =============================================
-- Author		:
-- Create date	:
-- Description	: RAW -> WRK
-- Mod Date		:
-- =============================================	
	
AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================
	IF OBJECT_ID('WRK_GooglePlayStore') IS NOT NULL
	DROP TABLE [WRK_GooglePlayStore]

-- =============================================
-- CREATE TABLE
-- =============================================
	CREATE TABLE [WRK_GooglePlayStore]
	(
		[RowNumber]		INT IDENTITY(1,1)
      ,[App]			VARCHAR(1000)
      ,[Category]		VARCHAR(1000)
      ,[Rating]			FLOAT
      ,[Reviews]		FLOAT
      ,[Size]			FLOAT
      ,[Installs]		FLOAT
      ,[Type]			VARCHAR(10)
      ,[Price]			FLOAT
      ,[Content Rating]	VARCHAR(20)
      ,[Genres]			VARCHAR(100)
      ,[Last Updated]	DATE
      ,[Current Ver]	VARCHAR(1000)
      ,[Android Ver]	VARCHAR(1000)
	)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
	TRUNCATE TABLE [WRK_GooglePlayStore]

-- =============================================
-- INSERT INTO
-- =============================================
	INSERT INTO [WRK_GooglePlayStore]
	(
		[App]
      ,[Category]
      ,[Rating]
      ,[Reviews]
      ,[Size]
      ,[Installs]
      ,[Type]
      ,[Price]
      ,[Content Rating]
      ,[Genres]
      ,[Last Updated]
      ,[Current Ver]
      ,[Android Ver]
	) 
	SELECT
		[App]
      ,[Category]
      ,[Rating]
      ,[Reviews]
      ,[Size]
      ,[Installs]
      ,[Type]
      ,[Price]
      ,[Content Rating]
      ,[Genres]
      ,[Last Updated]
      ,[Current Ver]
      ,[Android Ver]
	FROM [dbo].[RAW_GooglePlayStore_20201015]
	WHERE ISNUMERIC(Reviews)=1
	OR Reviews=''
	--(10840) rows affected)
END

/*Excluded Row:
-------------------------------------------------------
NON NUMERIC VALUE AND NOT BLANK EXCLUDED
------------------------------------------------------
SELECT *
FROM [DSTRAINING].[dbo].[RAW_GooglePlayStore_20201015]
WHERE ISNUMERIC(Reviews)=0
AND Reviews<>''
-- 1 ROW

-------------------------------------------------------
DUPLICATE VALUE EXCLUDED
------------------------------------------------------
WITH dupe AS (
SELECT *,
		ROW_NUMBER() OVER (
		PARTITION BY
			App,
			Size,
			[Type]
		ORDER BY
			App,
			Category,
			Size,
			[Last Updated] DESC
		) row_num
FROM [dbo].[WRK_GooglePlayStore]
)
DELETE
FROM dupe
WHERE row_num>1
-- 1163 ROW
*/