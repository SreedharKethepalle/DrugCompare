CREATE PROCEDURE [dbo].[Sp_ValidateLoginUser]
	@UserName VARCHAR(Max) = NULL,
	@Password VARCHAR(MAX) = NULL
	--@UserID INT = 0 OUTPUT 
AS
BEGIN TRY
DECLARE 
	@UserID INT	= 0

IF EXISTS (SELECT 1 FROM UserLogin WHERE UserName = @UserName AND Password = @Password)
BEGIN
	SET @UserID = (SELECT UserID from UserLogin WHERE UserName = @UserName AND Password = @Password)	
END

return @UserID 

END TRY
BEGIN CATCH
SELECT ERROR_LINE(),
		ERROR_MESSAGE(),
		ERROR_PROCEDURE()

END CATCH
