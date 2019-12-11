USE [DrugCompare]
GO


IF NOT EXISTS(SELECT * FROM [dbo].[PlanMaster])
BEGIN
	INSERT INTO [dbo].[PlanMaster] ([PlanName],[PlanYear],[PlanTypeId]) VALUES ('2019 FlexCare Connections Advantage (HMO)',2019,(SELECT PlanTypeId FROM PlanType WHERE PlanTypeName = 'MAPD'))
	INSERT INTO [dbo].[PlanMaster] ([PlanName],[PlanYear],[PlanTypeId]) VALUES ('2019 FlexCare Heart Health (HMO SNP)',2019,(SELECT PlanTypeId FROM PlanType WHERE PlanTypeName = 'MAPD'))
	INSERT INTO [dbo].[PlanMaster] ([PlanName],[PlanYear],[PlanTypeId]) VALUES ('Aetna Medicare Rx Select (PDP) S5810-295',2019,(SELECT PlanTypeId FROM PlanType WHERE PlanTypeName = 'PDP'))
	INSERT INTO [dbo].[PlanMaster] ([PlanName],[PlanYear],[PlanTypeId]) VALUES ('Cigna-HealthSpring Rx Secure (PDP)',2019,(SELECT PlanTypeId FROM PlanType WHERE PlanTypeName = 'PDP'))
	INSERT INTO [dbo].[PlanMaster] ([PlanName],[PlanYear],[PlanTypeId]) VALUES ('flexcare MA plan 1',2019,(SELECT PlanTypeId FROM PlanType WHERE PlanTypeName = 'MA'))
	INSERT INTO [dbo].[PlanMaster] ([PlanName],[PlanYear],[PlanTypeId]) VALUES ('flexcare MA plan 2',2019,(SELECT PlanTypeId FROM PlanType WHERE PlanTypeName = 'MA'))
END
ELSE
	PRINT 'Data already exists in [dbo].[PlanMaster] table'

GO


