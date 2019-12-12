USE [DrugCompare]
GO


IF NOT EXISTS(SELECT * FROM sys.columns WHERE NAME LIKE '%ProviderAddress%')
	Alter Table providerMaster ADD ProviderAddress VARCHAR(max), ProviderPhone BIGINT , ProviderExperience BIGINT 

go


IF NOT EXISTS (SELECT * FROM ProviderMaster)
BEGIN 

	INSERT INTO ProviderMaster (ProviderName, StatusFlag,ProviderAddress,ProviderPhone,ProviderExperience) VALUES ('Mani',1,'andhra Pradesh Vijayawada, 560068',7732001432,4)
	INSERT INTO ProviderMaster (ProviderName, StatusFlag,ProviderAddress,ProviderPhone,ProviderExperience) VALUES ('Muhil',1,'TamilNadu Saleem, Bangalore - 560068',1234567891,5)
	INSERT INTO ProviderMaster (ProviderName, StatusFlag,ProviderAddress,ProviderPhone,ProviderExperience) VALUES ('Sreedhar',1,'Nandyala, andhra Pradesh - 560068',5828497151,9)
END
ELSE
	PRINT 'Data already Exists in ProviderMaster Table'

	