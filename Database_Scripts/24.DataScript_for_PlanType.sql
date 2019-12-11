USE [DrugCompare]
GO

IF NOT EXISTS (SELECT * FROM [dbo].[PlanType])
BEGIN 
	INSERT INTO [dbo].[PlanType] ([PlanTypeName]) VALUES ('MA')
	INSERT INTO [dbo].[PlanType] ([PlanTypeName]) VALUES ('PDP')
	INSERT INTO [dbo].[PlanType] ([PlanTypeName]) VALUES ('MAPD')
END
ELSE
	PRINT 'Data already exists in [dbo].[PlanType] Table'


