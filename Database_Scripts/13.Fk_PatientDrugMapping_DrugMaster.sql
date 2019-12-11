ALTER TABLE [dbo].[PatientDrugMapping]
ADD CONSTRAINT [Fk_PatientDrugMapping_DrugMaster]
FOREIGN KEY (UserId)
REFERENCES UserLogin (UserId)	
