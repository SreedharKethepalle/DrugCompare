USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdatePharmacyForUser]    Script Date: 12/13/2019 12:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Sp_AddingNewDrug]
	@UserId INT, 
	@DosageID INT,
	@Quantity INT,
	@FrequencyID INT
AS
BEGIN TRY

	DECLARE 
		@DrugID INT = (SELECT [DrugId ] FROM DrugDoseMaster WHERE DrugDoseId = @DosageID),
		@PharmacyID INT,
		@ProviderID INT,
		@PlanID INT

	SELECT 
		@PharmacyID = PharmacyID,
		@ProviderID = ProviderID, 
		@PlanID = PlanID
	FROM PatientDrugMapping WHERE UserId = @UserId

	INSERT INTO PatientDrugMapping 
		(UserId,DrugDosageId,FrequencyId,PharmacyID,ProviderID,Quantity,CreatedDate,UpdatedDate,IsRefilling,DrugID,PlanID)
	VALUES 
		(@UserId,@DosageID,@FrequencyID,@PharmacyID,@ProviderID,@Quantity,GETDATE(),GETDATE(),0,@DrugID,@PlanID) 

END TRY
BEGIN CATCH
SELECT ERROR_LINE(),
		ERROR_MESSAGE(),
		ERROR_PROCEDURE()

END CATCH
