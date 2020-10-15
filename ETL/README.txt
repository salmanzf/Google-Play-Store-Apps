# ETL
The ETL proces composed of 2 section which are:
- SSIS
- SQL (using PROC)

The ETL already have folder template including the following description:
- Original Data : RAW source file, untouched
- Prepared Data : Original data after getting prepared, by defining each type of column for easier manipulation on SQL and SSIS
- Uploaded Data : Final version of data for upload at SSIS
- Analysis 		: Consist of removed data after some modification because invalid/duplicate
- Insight		: Data after some modification on SQL to view some insight
- Final			: Final Data for visualization