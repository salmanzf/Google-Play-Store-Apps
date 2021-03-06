USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[__tmpl__BLD_WRK_WRK_GooglePlayStoreUserReview]    Script Date: 10/15/2020 5:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[BLD_WRK_GooglePlayStoreUserReview]
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
	IF OBJECT_ID('WRK_GooglePlayStoreUserReview') IS NOT NULL
	DROP TABLE [WRK_GooglePlayStoreUserReview]

-- =============================================
-- CREATE TABLE
-- =============================================
	CREATE TABLE [WRK_GooglePlayStoreUserReview]
	(
		[RowNumber]				INT IDENTITY(1,1),
		[App]					VARCHAR(1000),
		[Translated_Review]		VARCHAR(8000),
		[Sentiment]				VARCHAR(100),
		[Sentiment_Polarity]		FLOAT,
		[Sentiment_Subjectivity]	FLOAT
	)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
	TRUNCATE TABLE [WRK_GooglePlayStoreUserReview]

-- =============================================
-- INSERT INTO
-- =============================================
	INSERT INTO [WRK_GooglePlayStoreUserReview]
	(
		[App]	
      ,[Translated_Review]
      ,[Sentiment]
      ,[Sentiment_Polarity]
      ,[Sentiment_Subjectivity]
	) 
	SELECT
		[App]					
      ,[Translated_Review]		
      ,[Sentiment]				
      ,[Sentiment_Polarity]		
      ,[Sentiment_Subjectivity]
	FROM [dbo].[RAW_GooglePlayStoreUserReview_20201015]
	--(64295 rows affected)
END
/*
SELECT COUNT(*)
FROM [WRK_WRK_GooglePlayStoreUserReview]

SELECT *
FROM [WRK_WRK_GooglePlayStoreUserReview]

SELECT *
FROM [dbo].[RAW_WRK_GooglePlayStoreUserReview_YYYYMMDD]
*/