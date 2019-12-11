CREATE TABLE [dbo].[DrugMaster]
(
	[DrugId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DrugName] NVARCHAR(MAX) NULL, 
    [PrimaryDrugId] INT NULL, 
    [StatusFlag] INT NULL DEFAULT 1
)
