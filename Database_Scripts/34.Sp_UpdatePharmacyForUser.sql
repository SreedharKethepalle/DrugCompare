USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdatePharmacyForUser]    Script Date: 12/13/2019 12:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_UpdatePharmacyForUser]
	@UserId INT,
	@PharmacyId INT
AS
BEGIN TRY

	UPDATE [dbo].[PatientDrugMapping] SET PharmacyID = @PharmacyId WHERE UserId = @UserId

END TRY
BEGIN CATCH
SELECT ERROR_LINE(),
		ERROR_MESSAGE(),
		ERROR_PROCEDURE()

END CATCH
