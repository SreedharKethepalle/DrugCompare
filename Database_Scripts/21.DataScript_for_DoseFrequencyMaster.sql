USE [DrugCompare]
GO

IF NOT EXISTS (SELECT * FROM [dbo].[DoseFrequencyMaster])
BEGIN 
	INSERT INTO [dbo].[DoseFrequencyMaster]   ([FrequencyName],[FrequencyDays]) VALUES ('per month',30)
	INSERT INTO [dbo].[DoseFrequencyMaster]   ([FrequencyName],[FrequencyDays]) VALUES ('per 60 days',60)
	INSERT INTO [dbo].[DoseFrequencyMaster]   ([FrequencyName],[FrequencyDays]) VALUES ('per 90 days',90)
	INSERT INTO [dbo].[DoseFrequencyMaster]   ([FrequencyName],[FrequencyDays]) VALUES ('per year',365)
END
ELSE
	PRINT 'Data already exists in [dbo].[DoseFrequencyMaster] table'
GO


