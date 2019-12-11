ALTER TABLE [dbo].[PatientDrugMapping]
ADD CONSTRAINT [Fk_PatientDrugMapping_PharmacyMaster]
FOREIGN KEY (PharmacyID)
REFERENCES PharmacyMaster (PharmacyID)
GO