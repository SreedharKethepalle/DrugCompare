USE [DrugCompare]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetDrugs]    Script Date: 12/13/2019 2:28:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Sp_GetUserDetailsForDashboard 101
ALTER PROCEDURE [dbo].[Sp_GetDrugs] 
(
	@UserId INT
)
AS 
BEGIN

    -- Plan Level Info
   SELECT  d.* FROM DrugMaster d
   JOIN PatientDrugMapping p ON p.drugID <> d.DrugId
   WHERE 
   p.UserId = @UserId

	-- DosageInfo
	SELECT * FROM DrugDoseMaster  
	
	SELECT * FROM DoseFrequencyMaster
END