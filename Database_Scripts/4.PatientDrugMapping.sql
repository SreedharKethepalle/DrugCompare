USE [DrugCompare]
GO

/****** Object:  Table [dbo].[PatientDrugMapping]    Script Date: 12/12/2019 3:18:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PatientDrugMapping](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DrugDosageId] [int] NULL,
	[FrequencyId] [int] NULL,
	[PharmacyID] [int] NULL,
	[ProviderID] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsRefilling] [bit] NULL,
	[DrugID] [int] NULL,
	[PlanId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_DoseFrequencyMaster] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[DoseFrequencyMaster] ([FrequencyId])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_DoseFrequencyMaster]
GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_DrugDoseMaster] FOREIGN KEY([DrugDosageId])
REFERENCES [dbo].[DrugDoseMaster] ([DrugDoseId])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_DrugDoseMaster]
GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_DrugMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogin] ([UserID])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_DrugMaster]
GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_DrugMaster1] FOREIGN KEY([DrugID])
REFERENCES [dbo].[DrugMaster] ([DrugId])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_DrugMaster1]
GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_PharmacyMaster] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[PharmacyMaster] ([PharmacyID])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_PharmacyMaster]
GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_PlanId] FOREIGN KEY([PlanId])
REFERENCES [dbo].[PlanMaster] ([PlanId])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_PlanId]
GO

ALTER TABLE [dbo].[PatientDrugMapping]  WITH CHECK ADD  CONSTRAINT [Fk_PatientDrugMapping_ProviderMaster] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[ProviderMaster] ([ProviderId])
GO

ALTER TABLE [dbo].[PatientDrugMapping] CHECK CONSTRAINT [Fk_PatientDrugMapping_ProviderMaster]
GO


