ALTER TABLE PlanMaster
ADD CONSTRAINT [Fk_PlanMaster_PlanType]
FOREIGN KEY (PlanTypeId)
REFERENCES PlanType (PlanTypeId)
GO
