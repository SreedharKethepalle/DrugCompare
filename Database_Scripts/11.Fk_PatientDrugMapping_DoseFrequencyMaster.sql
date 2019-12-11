ALTER TABLE [dbo].[PatientDrugMapping]
ADD CONSTRAINT [Fk_PatientDrugMapping_DoseFrequencyMaster]
FOREIGN KEY (FrequencyId)
REFERENCES DoseFrequencyMaster (FrequencyId)
GO