CREATE TABLE [dbo].[PatientDrugMapping]
(
	[TransactionId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserId] INT NULL, 
    [DrugDosageId] INT NULL, 
    [FrequencyId] INT NULL, 
	[PharmacyID] INT NULL,
	[ProviderID] INT NULL,
    [Quantity] INT NULL, 
    [CreatedDate] DATETIME NULL, 
    [UpdatedDate] DATETIME NULL, 
    [IsRefilling] BIT NULL, 
)
