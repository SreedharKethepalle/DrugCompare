USE [DrugCompare]
GO

/*
SELECT * FROM DrugMaster
P- Primary plan
A- Alternative Plan

TRUNCATE TABLE [dbo].[DrugDoseMaster] 

ALTER TABLE [dbo].[DrugDoseMaster] DROP CONSTRAINT Fk_DrugDoseMaster_DrugMaster
ALTER TABLE dbo.PatientDrugMapping DROP CONSTRAINT Fk_PatientDrugMapping_DrugDoseMaster
*/

IF NOT EXISTS (SELECT * FROM [dbo].[DrugDoseMaster])
BEGIN
---------------------------------
--> Lipitor (P)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Lipitor'),'Lipitor TAB 10MG',300)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Lipitor'),'Lipitor TAB 20MG',500)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Lipitor'),'Lipitor TAB 40MG',750)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Lipitor'),'Lipitor TAB 80MG',1000)
	
--> Atorvastatin(A)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Atorvastatin'),'Atorvastatin calcium TAB 10MG',367)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Atorvastatin'),'Atorvastatin calcium TAB 20MG',481)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Atorvastatin'),'Atorvastatin calcium TAB 40MG',854)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Atorvastatin'),'Atorvastatin calcium TAB 80MG',999)

--> Simvastatin(A)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Simvastatin'),'Simvastatin TAB 5MG',245)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Simvastatin'),'Simvastatin TAB 10MG',369)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Simvastatin'),'Simvastatin TAB 20MG',582)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Simvastatin'),'Simvastatin TAB 40MG',741)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Simvastatin'),'Simvastatin TAB 80MG',998)

--> lovastatin(A)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'lovastatin'),'Lovastatin TAB 10MG',179)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'lovastatin'),'Lovastatin TAB 20MG',366)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'lovastatin'),'Lovastatin TAB 40MG',522)

--> Pravastatin sodium(A)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Pravastatin sodium'),'pravastatin sodium TAB 10MG',200)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Pravastatin sodium'),'pravastatin sodium TAB 20MG',258)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Pravastatin sodium'),'pravastatin sodium TAB 40MG',665)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Pravastatin sodium'),'pravastatin sodium TAB 80MG',856)
-------------------------------------------	
																  
-------------------------------------------																	  
--> Dolophine(P)																	  
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Dolophine'),'Dolophine TAB 5MG',380)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Dolophine'),'Dolophine TAB 10MG',560)
																					  
--> Methadone(A)																		  
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Methadone'),'Methadone SOL 5MG/5ML',123)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Methadone'),'Methadone SOL 10MG/5ML',456)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Methadone'),'Methadone TAB 5MG',789)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Methadone'),'Methadone TAB 10MG',1024)
-------------------------------------------	
										  
-------------------------------------------																		  
--> Humira(P)																		  
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Humira'),'Humira INJ 10/0.1ML',250)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Humira'),'Humira INJ 10MG/0.2',390)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Humira'),'Humira INJ 20/0.2ML',450)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Humira'),'Humira KIT 20MG/0.4',560)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Humira'),'Humira INJ 40/0.4ML',800)
-------------------------------------------																		  

-------------------------------------------																		  																					  
--> Sancuso(P)
INSERT INTO [dbo].[DrugDoseMaster] ([DrugId],[DosageName],[UnitCost]) VALUES ((SELECT DrugId FROM DrugMaster WHERE DrugName = 'Sancuso'),'Sancuso DIS 3.1MG',560)
-------------------------------------------																		  

END
ELSE
	PRINT 'Data Already exists in [dbo].[DrugDoseMaster] table'

