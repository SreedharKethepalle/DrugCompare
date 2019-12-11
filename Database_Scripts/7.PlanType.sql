CREATE TABLE [dbo].[PlanType]
(
	[PlanTypeId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PlanTypeName] VARCHAR(MAX) NULL, 
    [StatusFlag] INT NULL DEFAULT 1
)
