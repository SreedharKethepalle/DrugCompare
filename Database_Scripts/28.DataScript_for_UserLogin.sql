USE [DrugCompare]
GO

IF NOT EXISTS(SELECT * FROM [dbo].[UserLogin])
BEGIN 
	INSERT INTO [dbo].[UserLogin] ([UserName],[Password],[Email],[DOB],[PhoneNo],[CreatedDate]) VALUES ('Mkatari','Mkatari@3700','manikantaka@emids.com','1996-05-03 00:00:00.000',7732001432,GETDATE())
	INSERT INTO [dbo].[UserLogin] ([UserName],[Password],[Email],[DOB],[PhoneNo],[CreatedDate]) VALUES ('Muhil','Muhil@2250','muhilarasanK@emids.com','1966-04-08 00:00:00.000',1234567891,GETDATE())
END
ELSE
	PRINT 'Data already exists in [dbo].[UserLogin] Table'

GO


