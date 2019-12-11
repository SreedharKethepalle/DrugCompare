CREATE TABLE [dbo].[DrugDoseMaster]
(
	[DrugDoseId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DrugId] INT NULL, 
    [DosageName] NVARCHAR(MAX) NULL, 
    [UnitCost] DECIMAL NULL, 
    [StatusFlag] BIT NULL DEFAULT 1
)
