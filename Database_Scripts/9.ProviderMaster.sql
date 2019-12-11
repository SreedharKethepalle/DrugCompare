CREATE TABLE [dbo].[ProviderMaster]
(
	[ProviderId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProviderName] NVARCHAR(MAX) NULL, 
    [StatusFlag] BIT NULL
)
