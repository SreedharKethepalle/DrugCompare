CREATE TABLE [dbo].[DoseFrequencyMaster]
(
	[FrequencyId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FrequencyName] NVARCHAR(MAX) NULL, 
    [FrequencyDays] INT NULL, 
    [StatusFlag] BIT NULL DEFAULT 1
)
