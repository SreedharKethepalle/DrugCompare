ALTER TABLE [dbo].[PatientDrugMapping]
ADD CONSTRAINT [Fk_PatientDrugMapping_DrugDoseMaster]
FOREIGN KEY (DrugDosageId)
REFERENCES DrugDoseMaster (DrugDoseId)	
GO
