CREATE TABLE [dbo].[PricePercentageMaster]
(
	[PricePercentageId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Year] INT NULL, 
    [Percentage] FLOAT NULL, 
    [StatusFlag] BIT NULL DEFAULT 1
)
