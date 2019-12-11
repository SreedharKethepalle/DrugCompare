
ALTER TABLE DrugDoseMaster
ADD CONSTRAINT [Fk_DrugDoseMaster_DrugMaster]
FOREIGN KEY (DrugId)
REFERENCES DrugMaster (DrugId)
GO