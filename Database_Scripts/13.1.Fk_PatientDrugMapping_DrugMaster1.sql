
ALTER TABLE PatientDrugMapping
ADD CONSTRAINT [Fk_PatientDrugMapping_DrugMaster1]
FOREIGN KEY (DrugId)
REFERENCES DrugMaster (DrugId)
GO