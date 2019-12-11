CREATE TABLE [dbo].[PharmacyMaster]
(
	[PharmacyID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PharmacyName] NVARCHAR(MAX) NULL, 
    [PharmacyZip] INT NULL, 
    [Address] NVARCHAR(MAX) NULL, 
	[Timings] NVARCHAR(MAX),
    [StatusFlag] BIT NULL
)
