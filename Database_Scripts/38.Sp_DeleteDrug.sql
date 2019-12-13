USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteDrug]    Script Date: 12/13/2019 1:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Sp_GetUserDetailsForDashboard 1
CREATE PROCEDURE [dbo].[Sp_DeleteDrug]
(
	@UserId INT,
	@DrugID INT
)
AS 
BEGIN
IF(1 < (SELECT COUNT(*) FROM PatientDrugMapping WHERE UserId = @UserId))
BEGIN
	DELETE PatientDrugMapping WHERE DrugID = @DrugID AND UserId = @UserId
END

END

	