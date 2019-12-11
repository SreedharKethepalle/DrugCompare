CREATE TABLE [dbo].[PlanMaster]
(
	[PlanId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PlanName] NVARCHAR(MAX) NULL, 
    [PlanYear] INT NULL, 
    [PlanTypeId] INT NULL, 
    [StatusFlag] INT NULL DEFAULT 1
)
