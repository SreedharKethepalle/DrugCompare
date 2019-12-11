USE [DrugCompare]
GO

IF NOT EXISTS (SELECT * FROM [dbo].[PricePercentageMaster])
BEGIN
	INSERT INTO [dbo].[PricePercentageMaster] ([Year],[Percentage]) VALUES (2018,8)
	INSERT INTO [dbo].[PricePercentageMaster] ([Year],[Percentage]) VALUES (2019,12)
	INSERT INTO [dbo].[PricePercentageMaster] ([Year],[Percentage]) VALUES (2020,10)
END
ELSE
	PRINT 'Data already Exists in [dbo].[PricePercentageMaster] Table'
GO


