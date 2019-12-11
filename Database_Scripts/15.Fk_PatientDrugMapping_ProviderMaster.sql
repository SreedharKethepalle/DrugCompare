ALTER TABLE [dbo].[PatientDrugMapping]
ADD CONSTRAINT [Fk_PatientDrugMapping_ProviderMaster]
FOREIGN KEY (ProviderID)
REFERENCES ProviderMaster (ProviderID)
GO