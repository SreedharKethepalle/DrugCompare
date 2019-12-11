USE [DrugCompare]
GO

IF NOT EXISTS(SELECT * FROM [dbo].[DrugMaster])
BEGIN
/*
	--> Lipitor --> alternative plan for lipitor it work in reverse like pravastatin sodium 
	will not have the Lipitor as alternative so only liptior is 1 main and primaryID is 1 for lipitor alternatives
*/
	--> Lipitor
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Lipitor',1)
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Atorvastatin',1)
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Simvastatin',1)
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('lovastatin',1)
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Pravastatin sodium',1)

	--> Humira
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Humira', SCOPE_IDENTITY() + 1)

	--> Sancuso
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Sancuso',SCOPE_IDENTITY() + 1)

	--> Dolophine
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Dolophine',SCOPE_IDENTITY() + 1)
	INSERT INTO [dbo].[DrugMaster] ([DrugName],[PrimaryDrugId]) VALUES ('Methadone',SCOPE_IDENTITY())

END
ELSE
	PRINT 'Data Already exists in [dbo].[DrugMaster] Table'

