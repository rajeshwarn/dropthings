/**********************************************************************/
/* Install.SQL                                                        */
/* Creates a login and makes the user a member of db_owner            */
/*                                                                    */
/**********************************************************************/

-- Declare variables for database name, username and password
DECLARE @dbName sysname,
      @dbUser sysname,
      @dbPwd nvarchar(max);

-- Set variables for database name, username and password
SET @dbName = 'PlaceHolderForDb';
SET @dbUser = 'PlaceHolderForUser';
SET @dbPwd = 'PlaceHolderForPassword';

DECLARE @cmd nvarchar(max)

-- Create login
IF( SUSER_SID(@dbUser) is null )
BEGIN
    print '-- Creating login '
    SET @cmd = N'CREATE LOGIN ' + quotename(@dbUser) + N' WITH PASSWORD ='''+ replace(@dbPwd, '''', '''''') + N''''
    EXEC(@cmd)
END

-- Create database user and map to login
-- and add user to the datareader, datawriter, ddladmin and securityadmin roles
--
SET @cmd = N'USE ' + quotename(@DBName) + N'; 
IF( NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = ''' + replace(@dbUser, '''', '''''') + N'''))
BEGIN
    print ''-- Creating user'';
    CREATE USER ' + quotename(@dbUser) + N' FOR LOGIN ' + quotename(@dbUser) + N';
    print ''-- Adding user'';
    EXEC sp_addrolemember ''db_owner'', ''' + replace(@dbUser, '''', '''''') + N''';
END'
EXEC(@cmd)
GO
-------------------------------------------------------------------


/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 12/16/2010 22:13:26 ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dropthings]    Script Date: 12/16/2010 22:13:26 ******/
CREATE USER [dropthings] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 12/16/2010 22:13:26 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  UserDefinedFunction [dbo].[udfGetAppId]    Script Date: 12/16/2010 22:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfGetAppId]()
RETURNS uniqueidentifier
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN CONVERT(uniqueidentifier, 'fd639154-299a-4a9d-b273-69dc28eb6388')
END;
GO
/****** Object:  Table [dbo].[WidgetZone]    Script Date: 12/16/2010 22:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WidgetZone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[UniqueID] [varchar](50) NOT NULL,
	[OrderNo] [int] NOT NULL,
 CONSTRAINT [PK_WidgetZone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[WidgetZone] ON
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15107, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15108, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15109, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15110, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15111, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15112, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15113, N'Column 1', N'bc57ab94-5689-40b5-836f-f0b286c95ea4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15114, N'Column 2', N'28df39db-ac60-4d5e-ad55-e673ad3acabc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15115, N'Column 3', N'c83edc6a-4385-40b9-80ee-b4970cc72fa4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15116, N'Column 1', N'd20130ec-866b-457f-a677-053c70ea55b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15117, N'Column 2', N'06e7fe13-aa5d-408c-96d0-b75c334e3303', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15118, N'Column 3', N'366aad6d-6f5f-4b3a-ab92-ac112e27fefc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15119, N'Column 1', N'73642306-8cf0-463d-9403-5a975cfd5ce4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15120, N'Column 2', N'b6ad378f-c7dd-4dad-aa5e-3fc3e1491c2d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15121, N'Column 3', N'f74398ac-5332-46bd-83f0-c7d1a626ec12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15122, N'Column 1', N'e70762e6-3d60-420d-9c6e-be4082da292e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15123, N'Column 2', N'b37fd1ed-78a8-430b-9826-84c3969f4c41', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15124, N'Column 3', N'5372a7ea-f449-4420-88d3-1a1ba5347b98', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15125, N'Column 1', N'1a843bc1-3d40-4c88-819b-ab1135626cc9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15126, N'Column 2', N'adb23af6-1517-4372-b012-c5397bbbbf59', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15127, N'Column 3', N'd1dd8b34-3e80-4316-8e52-0392175c8c1e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15128, N'Column 1', N'35735e70-7b16-419f-9660-cba679284911', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15129, N'Column 2', N'df2fa787-c3c0-4160-96d5-4d4271d82652', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15130, N'Column 3', N'2722b7cc-aee0-44a6-929a-5a2f6060fcb5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15131, N'Column 1', N'3fdb0891-0efd-4b3c-8309-f2c456a1f0a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15132, N'Column 2', N'827eca91-6e6e-4754-9dad-022d0e0ca76d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15133, N'Column 3', N'99fdbcb3-9377-4ce1-a610-34e3ac6918a4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15134, N'Column 1', N'602708e4-60a8-437a-a23d-bce80dd82b80', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15135, N'Column 2', N'a9fc3a86-7e7a-4b53-95da-7103e9b52577', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15136, N'Column 3', N'64f6ff9e-79eb-4aaf-84ab-58fddfe88df7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15137, N'Column 1', N'd3cfc899-1446-4077-b626-845e7ae2fd32', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15138, N'Column 2', N'c4fa8abf-ac4b-49cf-a33e-8ca87cab2a74', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15139, N'Column 3', N'9cd84a32-58d8-4ae2-884a-09d4bb507bcd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15140, N'Column 1', N'c3c2f11a-df70-492e-a751-f4aac44c9eb7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15141, N'Column 2', N'eb093b1c-c6cb-424d-b0a4-72c8e8a02957', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15142, N'Column 3', N'7806832c-4ebf-4981-928e-29cbaa87c975', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15143, N'Column 1', N'd11c2d42-3f6e-4672-b7b0-a0958b8ace25', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15144, N'Column 2', N'4ac6f6f8-2805-426c-be43-f3746724eb24', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15145, N'Column 3', N'0c698c45-9c2c-47ee-9895-140de40c70d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15146, N'Column 1', N'd34cdda2-5d57-4050-ac5c-f5c82142f41f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15147, N'Column 1', N'44554206-2109-4716-936a-d1792eea4474', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15148, N'Column 2', N'e8d56ef6-ee41-4000-a6da-6461e46e34fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15149, N'Column 2', N'8734d4e1-c9e2-43ed-86c6-6dcdce65321f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15150, N'Column 3', N'77b977ad-a074-4f7a-a21b-02d652ddf563', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15151, N'Column 1', N'4661aca1-ccc5-4c3a-9bae-e67893bb428c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15152, N'Column 3', N'1c5624b5-cc9c-43aa-bd7a-8f08e1f6e7f3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15153, N'Column 2', N'ed790a15-aa84-44fc-a188-79005b6c6916', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15154, N'Column 1', N'ac453fe4-74d8-42ec-92f7-95de4cca4df3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15155, N'Column 3', N'5df95589-5447-4924-a5b3-4398624a6b06', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15156, N'Column 1', N'2a7a225e-7d4a-4d2b-9583-db0be7da163b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15157, N'Column 2', N'59e483db-8e88-4597-8237-aaa62f468a78', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15158, N'Column 1', N'cca5aa55-7077-4965-8ef3-00a931f3b678', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15159, N'Column 3', N'7e7c21ea-7edd-4539-b597-34ebd5afd7d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15160, N'Column 2', N'e286dbf2-cb9a-4b80-90e0-7fba9a5323b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15161, N'Column 1', N'a777d97a-8bc9-4a70-8e41-0ffb151c5d59', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15162, N'Column 3', N'f7b9d0f8-518a-4270-934c-1af84d6051c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15163, N'Column 2', N'7f6aa0cc-0b31-49eb-ae60-89df6af7ac8b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15164, N'Column 3', N'6576a42f-047f-4e73-939a-8f08116bf352', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15165, N'Column 2', N'f90ebc02-1414-450a-a831-0ffc88cf3276', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15166, N'Column 3', N'4b6569b6-b499-45c3-bfe6-c095cd31e279', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15167, N'Column 1', N'45a430e3-cdb0-4a52-a47d-ec432f409095', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15168, N'Column 2', N'd2e9c170-ef61-46ca-843d-e5d7987c6b1e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15169, N'Column 3', N'74caedce-6edf-4765-ad3c-f37d85d0b2c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15170, N'Column 1', N'dda509bd-ff4a-4b38-a42c-33258e83ae22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15171, N'Column 2', N'b725cffb-aa88-451d-ba4b-4dcd1a99786c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15172, N'Column 3', N'2003d3fc-d004-42ea-a66a-d65f1b420241', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15173, N'Column 1', N'c5652bb1-cf55-4308-b33e-1eb12abde35c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15174, N'Column 2', N'5498f0ef-5cc3-4ce0-a2af-b69e156381d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15175, N'Column 3', N'6318d3cd-cad4-4dcf-8c27-aa64c4f139eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15176, N'Column 1', N'07c05b90-6ef5-49db-a4bc-9dfd80b5f8b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15177, N'Column 2', N'141f4c4e-49d9-4aaf-b6da-a2d1a1f78499', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15178, N'Column 3', N'569ee865-f64d-402a-8e07-fe3fc906d6bd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15179, N'Column 1', N'f7d4ce1e-9369-4663-9656-2a278b99f443', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15180, N'Column 2', N'2e06e7b7-887e-411c-954c-bbc06f87baac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15181, N'Column 3', N'e2ff4778-67e8-456f-9ad6-c29caa25c14c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15182, N'Column 1', N'3fb5db0d-a1de-4718-bddf-68087e5134f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15183, N'Column 2', N'a9eaa387-d594-48c6-8703-e2efae2a0e83', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15184, N'Column 1', N'0599ffc3-c085-4143-85f7-b1acad738869', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15185, N'Column 2', N'a00e5e4c-7ea3-4208-9646-0c0b35b0e55b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15186, N'Column 3', N'8ed30b05-59de-4610-837e-564e1946f82a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15187, N'Column 3', N'a352678a-0fc1-46e7-8532-2f219e3296f5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15188, N'Column 1', N'9eee0bd4-b15a-4846-b323-b5ae3c95c215', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15189, N'Column 2', N'e41d92f7-af0a-48a9-b586-61c4a555d32a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15190, N'Column 3', N'1f0655fd-1cee-44ca-9bea-309f26b43fe9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15191, N'Column 1', N'e2cfa7f5-8851-43da-b869-d8c284004b78', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15192, N'Column 2', N'7224577a-27e8-4323-a788-d61b6b289ab7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15193, N'Column 3', N'fad5cf4f-6e9a-4d5e-a183-09ced2e650ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15194, N'Column 1', N'2e5370fe-d36f-410f-9bca-86d0ec159b11', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15195, N'Column 1', N'e486314f-6b86-43cc-8c60-dc07da4b9cb5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15196, N'Column 2', N'9ae61695-f4ae-4b42-a25a-48c4ce4d75b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15197, N'Column 3', N'cd80b936-c94f-4587-acf7-57e646a7232d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15198, N'Column 2', N'30908eb7-ba33-4029-a3f3-b928b1909237', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15199, N'Column 1', N'6b505503-9d06-4050-a5ce-ec9fef37052a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15200, N'Column 2', N'1481f8be-8622-487a-8fdb-c8113bdd12f6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15201, N'Column 3', N'993c9646-1c65-439e-a595-d690a5ea28e8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15202, N'Column 3', N'9c208660-242b-41dc-bfc4-1ce9a4112a5c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15203, N'Column 1', N'c892940a-02c7-4a77-b7df-6e30d85fdf16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15204, N'Column 2', N'ecba1ed1-bb22-4e8d-a7b1-8e72d5560ffb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15205, N'Column 3', N'98df8203-cf66-4d9b-af35-e08f8be3ea92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15206, N'Column 1', N'735d5db9-96e1-405d-87e5-1eeaea19cffc', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15207, N'Column 2', N'd3fbb5c4-4bbf-44c1-a8c2-9976b7aba96c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15208, N'Column 1', N'e29bb6f2-a5a2-405a-8181-acd03e387f6b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15209, N'Column 2', N'bb9070e7-1e90-415f-9a29-781de8e269d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15210, N'Column 3', N'7c9fab8e-6107-4ce3-8149-34d657d69a56', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15211, N'Column 3', N'f42dc161-efba-4c18-94d6-dd6c0e525c98', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15212, N'Column 1', N'b96f8f9a-f410-4ca7-9e69-dd36b36caa1f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15213, N'Column 2', N'3936b39f-289e-4676-8127-47c401a6db39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15214, N'Column 3', N'ad68a76a-ce17-43af-840c-80c334a5b0d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15215, N'Column 1', N'c5bdabcc-31d8-4822-b15d-064261835a59', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15216, N'Column 2', N'1640ed73-d43a-4f90-806b-df702cd37512', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15217, N'Column 3', N'4297a386-7ffc-4db4-a59a-3a67f625ee1d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15218, N'Column 1', N'301458d6-332a-45d9-a51e-3bf050627655', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15219, N'Column 2', N'c0b43785-f447-4d58-8538-09f744ec2e86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15220, N'Column 3', N'f8bd333b-04f2-4051-b0ea-c9e556108375', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15230, N'Column 1', N'5f8a8b14-566b-4ad3-9198-7dd6bb5cf75c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15231, N'Column 2', N'b9212c31-cd43-444c-a2e1-d5aa5963476c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15232, N'Column 3', N'a0206be1-48ee-4eeb-9c47-5ecf7358e60b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15233, N'Column 1', N'1124ddca-c4ac-401f-b975-5b8dbc6219c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15234, N'Column 2', N'd0a9b536-9b5e-4291-8971-67ae7217ca64', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15235, N'Column 3', N'6142548d-056d-41c5-b3a5-9f2dde86c2c6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15236, N'Column 1', N'6daab0fb-abd5-4dbf-9c97-e1d3f79e7404', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15237, N'Column 2', N'c98540f2-223a-4ad6-acf7-eaa8780f5c1b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15238, N'Column 3', N'e0b42a88-7f73-45df-8dcc-2d215ade2ce8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15239, N'Column 1', N'ba08bd10-414c-4def-8ece-c30743e43c8b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15240, N'Column 2', N'1dc1b3e9-0f6e-479e-bfc4-938757f3cc86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15241, N'Column 3', N'6ed69414-bd1f-4ff1-80de-b93ebd4e74d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15242, N'Column 1', N'fe636ebb-1569-4179-84e4-c859a2ffdb85', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15243, N'Column 2', N'e8640af9-5f79-4459-bfb6-5843cb676575', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15244, N'Column 3', N'4357e5ee-f469-4a5a-8a7e-768920c15de5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15245, N'Column 1', N'5763cc6a-28a5-4f9e-a35f-26477832f8c2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15246, N'Column 2', N'44b613ff-7354-4813-a187-5195b2e69a0f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15247, N'Column 3', N'e110876b-2ff6-4317-9d14-1837288fa805', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15248, N'Column 1', N'526aecc2-465f-40b9-8597-cb32ba1f25ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15249, N'Column 2', N'e2ae1ea5-1efe-49d4-85ee-37f491e7abb3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15250, N'Column 3', N'cf54028a-0a06-4ef1-84d3-4e933fc94c7e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15251, N'Column 1', N'9495d97a-976b-47d6-87a5-e021de85f25e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15252, N'Column 2', N'd91e4845-8b37-4f5d-a99c-df9ed71651ea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15253, N'Column 3', N'30e40e18-4ec0-4a8d-88d0-c88926b7cd37', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15254, N'Column 1', N'de1bf0a8-24a1-45df-848f-3c955e4df11c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15255, N'Column 2', N'cc458fe6-104a-4703-9a0f-448864a10d75', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15256, N'Column 3', N'b7fd3f6b-985b-4036-97cf-a3857c84c3d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15257, N'Column 1', N'4e32faf4-4b0a-4c3e-b205-9ebc0a1e68a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15258, N'Column 2', N'87540e5b-4ab3-4acd-838d-ae5ec4fc0b9b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15259, N'Column 3', N'7d811d53-c226-4ecd-990e-7bd108670462', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15260, N'Column 1', N'a2ebabbd-a7a7-4825-aafc-d6413c6084ec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15261, N'Column 2', N'b1e6be66-859e-4fbf-a92a-929a2c7d79c0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15262, N'Column 3', N'62958f71-0109-4fd1-b56b-1b41969e3dfd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15263, N'Column 1', N'dc92f7d5-14a3-4d49-a4a1-a9e357837ff3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15264, N'Column 2', N'f0c9a02f-0c5b-42fb-8891-f3bc6542a329', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15265, N'Column 3', N'2f1cf05f-3583-4fcb-ab65-ca805f393d86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15266, N'Column 1', N'5f852dc4-313b-485c-a1ed-0176382d6032', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15267, N'Column 2', N'45f939ff-3b1e-4756-a9fd-e1631c37899e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15268, N'Column 3', N'907e4aef-34fa-483e-a9d7-0cae996c1ead', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15269, N'Column 1', N'fabb38ca-39f6-496d-89f3-45f6c454ed31', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15270, N'Column 2', N'a62c3867-5ef9-4d2c-ac81-0ecd27f7d276', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15271, N'Column 3', N'4018a10e-eaed-47c5-ac39-35b7650b42af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15272, N'Column 1', N'ed9a6078-4124-4b9d-bc2a-8024957b4cff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15273, N'Column 2', N'9b1225f0-ed91-4f19-875d-afd735bff581', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15274, N'Column 3', N'2fc257ce-61f2-4625-9abc-6ef9d7f2b3de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15275, N'Column 1', N'6f00f93b-340a-4b08-944c-f4feca97a313', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15276, N'Column 2', N'58e622bd-e33b-446e-9d7a-90c4da291250', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15277, N'Column 3', N'715fad89-c910-45d1-aaf6-697cb8b9fc83', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15278, N'Column 1', N'0a91a5de-4c0b-4088-8df2-11b81cff8f15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15279, N'Column 2', N'89267cc6-8677-44c1-83e9-c9412a1141f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15280, N'Column 3', N'a61f9d69-246c-4430-a6bc-2c5fb9c90670', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15281, N'Column 1', N'687d35e9-de37-4cd6-a8b7-a0246f55ec7f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15282, N'Column 2', N'6aef3aa8-1ff6-4c84-9c7d-f898b60f94cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15283, N'Column 3', N'ce0b99c3-cf42-4303-9bde-c0f08f196acb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15284, N'Column 1', N'6d9423f4-519c-4635-a5f2-4b8885a4ebeb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15285, N'Column 2', N'96df1b81-9a43-411e-86ed-e89824477977', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15286, N'Column 3', N'9fb9b493-3d32-498a-b152-3ac5c50df4c1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15287, N'Column 1', N'b724b6b4-313e-4141-b85b-aab9003a3ac1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15288, N'Column 2', N'b5933364-1c40-44ef-bccb-6fe5970b21ef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15289, N'Column 3', N'20e57fe7-13bc-4749-a41e-8ba92749b695', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15290, N'Column 1', N'90e1d9d9-7df3-4ea9-8e2e-8ab639cb7c6c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15291, N'Column 2', N'8e8d9167-1960-43e0-9df2-d0c836724b48', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15292, N'Column 3', N'c50a3311-4b86-4dee-aa68-365fc5824279', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15293, N'Column 1', N'c5a60551-d618-433c-9aff-9e3bb7e1ca90', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15294, N'Column 2', N'b676ef07-c973-46d6-9389-a27e4e1f5f4b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15295, N'Column 3', N'8e0c83a0-a279-470d-b342-252778ff992d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15296, N'Column 1', N'a1f317c2-4cdd-41d4-aab0-04fa8b267e1c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15297, N'Column 2', N'7775f56b-8d5f-4650-8e0f-fe4cfda4c93b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15298, N'Column 3', N'e35ea454-8908-4e45-bd2d-d030b405b4b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15299, N'Column 1', N'0404d500-1123-41f1-87a8-7fe9a9e5261b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15300, N'Column 2', N'3c5c5720-c5fc-4c22-a91f-443cbedf5405', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15301, N'Column 3', N'd965f0e3-155a-4029-b22a-ff97bc3ebfc2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15302, N'Column 1', N'e146ab67-7853-45bd-8416-da49b361858d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15303, N'Column 2', N'fa913c14-1840-47b5-b4a0-def8a55d53df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15304, N'Column 3', N'f2846150-b5d6-42b4-81e4-5aba970f5893', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15305, N'Column 1', N'6c655441-f900-4f96-b35a-b3930e62d564', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15306, N'Column 2', N'4151a776-a5c4-4240-b722-c02d20f499c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15307, N'Column 3', N'51ed7eb5-3397-4807-b908-e974fc3c1f17', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15308, N'Column 1', N'a3adfc1e-8d8f-42ef-959d-93bfe43fa9a8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15309, N'Column 2', N'b707cf77-e664-41dd-9037-d16c743add2e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15310, N'Column 3', N'6aa0cf7c-4848-4e31-a820-64ea44a33322', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15311, N'Column 1', N'5ffa9557-6802-4a02-beab-0fb1bbbd655f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15312, N'Column 2', N'2bfb82ca-1991-44be-8483-433ef6953dce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15313, N'Column 3', N'df7f01f2-65bb-47f9-941f-2f6099721b5e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15314, N'Column 1', N'66a194e2-a300-4d4f-92c8-38138f79a2e8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15315, N'Column 2', N'd40034d2-8afe-48c1-806c-601caaa96d29', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15316, N'Column 3', N'a7fbcbad-c98d-4a1b-898a-70d9f8e7e395', 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15317, N'Column 1', N'afb48afa-950a-4d00-8e03-82b7a35e016b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15318, N'Column 2', N'fba51105-271e-43ca-9f6d-e410ac1b96ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15319, N'Column 3', N'a09cf46b-0206-4bbb-b7f0-ed5bfa64d6de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15320, N'Column 1', N'0501c63a-6646-414a-af92-37e440593893', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15321, N'Column 2', N'be298496-96ac-47a3-a978-4c4d85c84490', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15322, N'Column 3', N'8710793e-dddd-4b29-a744-edf4d1008db9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15323, N'Column 1', N'b855324d-f671-402c-835a-eb20bb14a7df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15324, N'Column 2', N'c2aeb5b5-9953-47ac-824d-635ec86b95b3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15325, N'Column 3', N'f13aa9d6-974b-4d0f-a774-c91180e2d123', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15326, N'Column 1', N'35c1813b-078c-49f8-bcdd-ceed7f8a0381', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15327, N'Column 2', N'18164e09-d08b-468c-85fe-dbf037f09e5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15328, N'Column 3', N'2081e3e7-f1ee-43b3-bb22-9636387753bf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15329, N'Column 1', N'fd28269c-a800-4c79-98fc-ed83dc5e8f4d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15330, N'Column 2', N'fe6700ac-4219-4c34-964e-37d892681a8c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15331, N'Column 3', N'bc6ff5fe-a79a-47ed-8b68-897b74b83f08', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15332, N'Column 1', N'56224d74-e526-4ff9-938d-26ad78baca21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15333, N'Column 2', N'0352ad29-9c4e-418b-97d8-b2b20099ad86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15334, N'Column 3', N'b3377607-c536-4fee-95d0-754032dc4587', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15335, N'Column 1', N'b5b4598f-d53b-4556-96f4-2106e373dba5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15336, N'Column 2', N'85f87c9c-f2aa-4bf3-a62d-bb44c0d90914', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15337, N'Column 3', N'6d7624e4-8d0a-4b1a-a46b-5dd6a7021561', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15338, N'Column 1', N'6b3b3b82-840d-4a3d-87c0-27fdbe23c4d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15339, N'Column 2', N'40d4b12b-24ea-4831-a776-d11824eeda82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15340, N'Column 3', N'02babeaf-aa3b-416f-be04-037a428b8132', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15341, N'Column 1', N'6913a9d8-3ef5-49a9-a7fe-061c7b397f99', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15342, N'Column 2', N'61195c55-8478-4332-bec7-a1302f654e4b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15343, N'Column 3', N'2b676616-eb3f-4baa-87a2-d16b57bc0302', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15344, N'Column 1', N'5428481c-c9aa-4ebe-87ee-22ad35d68eb6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15345, N'Column 2', N'477aa28a-d751-4fb4-bea9-678f794fdb57', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15346, N'Column 3', N'0a70d5f2-3214-45c6-b713-f60305ffa3fe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15347, N'Column 1', N'58df8759-3d92-4c16-a718-87309a5cc32a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15348, N'Column 2', N'51588649-290c-4c1e-99e0-1dfc021e5379', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15349, N'Column 3', N'e72faebf-dc68-47ae-ba79-f163dcc7f850', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15350, N'Column 1', N'a3381876-260b-45fb-814f-dbfe1965e2db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15351, N'Column 2', N'8c4531ed-9cc2-40f5-bac6-cd2e0019e8d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15352, N'Column 3', N'f1ff9b04-4798-4c0a-9a5f-350a6b698a8e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15353, N'Column 1', N'db812b4b-5890-444c-8e40-2ef5d078d782', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15354, N'Column 2', N'8e5851f7-2f96-4a1e-af90-57956ee29778', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15355, N'Column 3', N'f2da5bb4-9ac0-40ce-9c32-4ab96d8db1e5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15356, N'Column 1', N'a88d20be-335a-4d10-a5fe-b6ca70f292fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15357, N'Column 2', N'7b7b87bb-29d4-48ea-9511-ea5cbbeeafd7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15358, N'Column 3', N'2ec0a125-b1ff-4a69-86ae-77b5b40ecd4d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15359, N'Column 1', N'f300cc7f-06df-4778-9618-9fedb8720121', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15360, N'Column 2', N'68ea216c-06c2-411e-b7aa-439476b9926c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15361, N'Column 3', N'7dcefe26-09aa-4faf-9fd7-9b729fdb365d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15362, N'Column 1', N'3a8b3096-5f3a-4496-9f0d-0085b0330981', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15363, N'Column 2', N'62e68596-152b-41fa-998a-fd2af9c67b48', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15364, N'Column 3', N'aa561271-5977-467b-9bed-9e586814ec32', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15365, N'Column 1', N'2a909a91-ccb1-44b9-a9b2-dd4e52dd1d87', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15366, N'Column 2', N'2cac68c2-4af3-415e-94ce-fa49cdb08e49', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15367, N'Column 3', N'c9162a61-b034-485f-af69-c8148d56eb5f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15368, N'Column 1', N'a921016f-0a2e-4d61-8f4e-064834a901b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15369, N'Column 2', N'c1efd77d-dfa4-4355-a5fb-6cee00cfdcd6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15370, N'Column 3', N'15aeb15f-9b03-4f18-9876-330ff80d0135', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15371, N'Column 1', N'eba69c17-2cdf-4530-95c9-fa2d7b3c6d31', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15372, N'Column 2', N'90771d4a-d7d5-4499-988c-093313e4a8f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15373, N'Column 3', N'd5a48445-4f03-450a-8621-bb72bda28f17', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15374, N'Column 1', N'4b75f288-3fd0-4962-a23d-8a8df0fb4ded', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15375, N'Column 2', N'a3a2005e-83ca-4be8-b106-929f78f4032b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15376, N'Column 3', N'f7575dcd-d410-4b70-a0df-195a3550ff92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15377, N'Column 1', N'78315713-d8d9-4481-b58c-f75aca58ec94', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15378, N'Column 2', N'93ff41e8-f0f3-47fd-a3fb-59e9768d5301', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15379, N'Column 3', N'78364b84-21f3-439e-b7b8-9ac6933f2675', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15380, N'Column 1', N'10215539-f0db-4521-ac83-640425ba7c65', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15381, N'Column 2', N'e8f7dba6-3f2f-479d-993c-9d4a7b5a841e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15382, N'Column 3', N'eaec9c37-b506-41ff-b3e7-a21f5a319be5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15383, N'Column 1', N'3ee6ae9a-9d37-4de1-882d-bf858a9f0861', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15384, N'Column 2', N'f834cdcf-9d68-4690-91c1-54c7f81f6f84', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15385, N'Column 3', N'53812def-5516-4875-b5a3-dfbe079c89b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15386, N'Column 1', N'317cf2a9-0f48-48f5-a5bc-5135f83eefa5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15387, N'Column 2', N'f5e8b36d-95cf-43d0-8bd4-35870b31e6ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15388, N'Column 3', N'1ad0b361-8c50-4fc8-823c-a30f27ef523d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15389, N'Column 1', N'52f5abb1-5d95-4573-9f86-e57c1744ba29', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15390, N'Column 2', N'a9650690-b8f3-41a1-8a68-6f6a5c140af3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15391, N'Column 3', N'4a90a5fe-3ae9-44bb-b3a1-ae918b28f46c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15392, N'Column 1', N'5aa28927-d37e-4f4d-923c-6a5c667aad91', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15393, N'Column 2', N'c3fe256f-8f67-4e69-bec6-54b7849d013d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15394, N'Column 3', N'81f4c19c-878a-4c28-9e43-90c4e7e5e1e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15395, N'Column 1', N'10f5f1df-f9c8-46d4-8688-3adfe4cd9c15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15396, N'Column 2', N'8de9efd9-6760-4970-938c-72f5c716dc6f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15397, N'Column 3', N'da0a70e7-b847-4657-9ad1-0a2a84f8afa3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15398, N'Column 1', N'0e52a8ed-ccb2-4b90-9cb8-1cfbe5b7daf4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15399, N'Column 2', N'f4ca6d09-c86e-4f76-b743-51c6ce1b8187', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15400, N'Column 3', N'a6dbbc4c-1aee-463e-8073-685abe8408fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15401, N'Column 1', N'2861cecd-3cc0-4670-8e78-b910949245f5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15402, N'Column 2', N'46cdc588-1974-45d8-8c78-7c40a71c4bb1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15403, N'Column 3', N'd4d746c3-0695-44c3-984e-4918d25ce80a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15404, N'Column 1', N'89b0cd74-1177-4033-b1c9-93c07bfe28ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15405, N'Column 2', N'f8462720-5f6c-4bb8-9928-d6375c81f968', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15406, N'Column 3', N'39bb9533-9c93-4530-853c-184b437d9230', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15407, N'Column 1', N'e87961f5-1e87-4ebf-9643-a333a6ccf855', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15408, N'Column 2', N'47d246b9-33d8-4361-b96f-d6e30bc0d2f9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15409, N'Column 3', N'812ab9e1-df9d-422b-afbc-a0ff8dd9e4a7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15410, N'Column 1', N'9e97eb6b-9dae-4a2e-a911-228bee59a83b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15411, N'Column 2', N'352e37c4-3329-4dd6-bd18-ee17d67794ea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15412, N'Column 3', N'c603ef68-8ab8-41f6-b39c-f07f51ff05ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15413, N'Column 1', N'963e6dba-d580-47ad-807c-73be0ecf875a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15414, N'Column 2', N'9548d8d0-f56b-4d43-9d6e-7873131282b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15415, N'Column 3', N'94c74d32-bf37-4a35-b340-c44734d8caf3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15416, N'Column 1', N'332fa21b-3d99-49fe-8000-391a879b71fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15417, N'Column 2', N'52fc5988-3e62-4856-bb04-f4c02f63de0d', 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15418, N'Column 3', N'9861bc7e-38a8-465d-861e-0bff244e2de6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15419, N'Column 1', N'b3a0af8a-eae3-4ef7-8cd7-65b3cd6dd9c1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15420, N'Column 2', N'f8939b9f-1fbf-41ce-85fe-f9ae180ddb59', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15421, N'Column 3', N'9a40739d-5472-40a6-b376-010deeb32d5c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15422, N'Column 1', N'89fa79b4-10d3-49f5-a456-777fda9d3093', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15423, N'Column 2', N'54c3e83c-e9c9-47dc-9938-0bd9ea7ed8f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15424, N'Column 3', N'd688fd71-6018-445c-86ab-05fdc288c3a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15425, N'Column 1', N'0a31cfb5-d8cc-4748-a753-ec2ca5ae2144', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15426, N'Column 2', N'998dbadb-6bd1-4ac1-af28-e9d4dacc6c0b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15427, N'Column 3', N'17b3c38d-1860-4948-89b4-1be651df2ed1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15428, N'Column 1', N'7b826396-82e4-4fdc-9f02-2038ae8ac274', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15429, N'Column 2', N'47b439a3-cd49-4a0e-af89-8c7584d921c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15430, N'Column 3', N'73b21c75-34b8-46cc-b6f2-c44146c1970a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15431, N'Column 1', N'96e29cc7-bef0-4234-bac9-6006a6ecc6d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15432, N'Column 2', N'eabcf12d-175f-4548-aa8a-a8f97180d5c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15433, N'Column 3', N'bf2fa25a-3db3-44d6-8145-a6db3c5745b3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15434, N'Column 1', N'eb6c3c50-e249-4e0e-b655-01fef61dea73', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15435, N'Column 2', N'a7e29ad8-43b4-4b41-b375-602117484d46', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15436, N'Column 3', N'8f28c330-018a-4565-9802-63aee186ec5e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15437, N'Column 1', N'39699027-0cb4-4bc2-bbc5-243b5afb8aee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15438, N'Column 2', N'40a20b1f-90e6-40e0-a7cb-eb21c3641b6f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15439, N'Column 3', N'6599863a-fc58-44f4-a015-d66d0f373429', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15440, N'Column 1', N'50b1dd07-6674-4fc1-8826-14521ab2db42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15441, N'Column 2', N'800d4924-bba7-4cb4-9978-556c515bb1fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15442, N'Column 3', N'9b6ac32e-850c-4339-9f80-5f291f49c96e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15443, N'Column 1', N'7e5eac2e-f507-400a-8295-29b09fe4c9e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15444, N'Column 2', N'98427b3c-38a6-420a-84c2-499b7f7da935', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15445, N'Column 3', N'e533c3b0-b3fe-44ac-b943-150865e408b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15446, N'Column 1', N'292c6676-d02f-4340-bc6f-4a0f237f9ae7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15447, N'Column 2', N'c6a09e00-81bc-47ce-85a1-c5ed7c70cece', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15448, N'Column 3', N'588c8c55-36b9-4db7-ab09-aac2cc7837a2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15449, N'Column 1', N'7a852af9-cfa0-4a41-9f7a-0fe234f492ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15450, N'Column 2', N'b18d49bf-29c4-4f0b-a210-3c451ba1d714', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15451, N'Column 3', N'5f963057-cd39-4717-81a6-b18d18b9a637', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15452, N'Column 1', N'b21922d2-a9be-4334-9295-6c3a1a339277', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15453, N'Column 2', N'ef259dd0-e8b9-4cea-b59c-364144d3abe2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15454, N'Column 3', N'cea2a321-42cd-4e4a-b22e-b524b41ac485', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15455, N'Column 1', N'b693d811-a4b3-45f6-915c-56683b9830ec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15456, N'Column 2', N'290aa1e7-3304-4657-adf7-d632f50cf1de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15457, N'Column 3', N'e897a7c5-c9f1-4cb0-94fb-54ac587d60b7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15458, N'Column 1', N'8e232f46-cd57-4e47-a950-81d45e2806c1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15459, N'Column 2', N'd26c6974-cada-4dc8-afa2-fa398beca139', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15460, N'Column 3', N'a7a47c86-14ca-4c6a-888f-38316b734474', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15461, N'Column 1', N'b3abd0f6-2b0f-49a1-97b1-ff6589e513ec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15462, N'Column 2', N'43564c52-2b15-485a-995b-fa7775a98a4c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15463, N'Column 3', N'c4126e3f-a1c7-45da-95da-50e0e18abc8d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15464, N'Column 1', N'd3294cff-d4ec-4423-acbf-7e3d9f395aa7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15465, N'Column 2', N'3cd84925-686c-4a83-9a69-b1feb295344f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15466, N'Column 3', N'eae10698-ac35-4e15-8d70-1a5814d24bf8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15467, N'Column 1', N'd5a656ea-47ef-45b0-84a5-142007a4e197', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15468, N'Column 2', N'3942b5fc-a579-4b76-82ff-4975584ad893', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15469, N'Column 3', N'e34a4c28-5a16-49f8-a60f-8634422e60de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15470, N'Column 1', N'afc8a993-e5ab-4118-b5e5-6d7a9275011e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15471, N'Column 2', N'da1a06dd-847d-4f51-b059-59d8ae073254', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15472, N'Column 3', N'79052e0d-57ec-49b9-8d53-da0687d4881d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15473, N'Column 1', N'9f0c0de4-4b6b-431c-aae3-d7dcf23e2ddb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15474, N'Column 2', N'981349b0-cf34-44ca-be9f-6d07a2d00a15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15475, N'Column 3', N'9db9524c-2822-458c-82cc-d210b6bd0c58', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15476, N'Column 1', N'40c3594a-f8b7-47cb-9883-137c28cbd748', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15477, N'Column 2', N'f24e9bb9-5856-406d-aa70-b6062210f21d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15478, N'Column 3', N'6148fb4f-2fa2-4845-bf42-d8332c6bdd53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15479, N'Column 1', N'a3a8510c-f4e1-45f9-a0a2-1b8bdc63a82e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15480, N'Column 2', N'2f0f0a29-3eba-4ff8-9d3f-2cc5de70c534', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15481, N'Column 3', N'c52b3fad-dc3f-4466-9098-a485858855b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15482, N'Column 1', N'2e0ffa7f-841a-4ba8-8390-5ac791fb62ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15483, N'Column 2', N'de7c9b00-5484-40a9-872c-94f91776de41', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15484, N'Column 3', N'2b6f75e9-9836-404f-9ee4-55cdc7db953f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15485, N'Column 1', N'4697d341-dfbe-497d-9a04-243a606d52ce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15486, N'Column 2', N'4653b277-89c7-4ca2-b09f-461c7de7e9c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15487, N'Column 3', N'f45769c6-e482-464c-8d96-496861cbec3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15488, N'Column 1', N'8654a3a2-30eb-4c65-886f-3ce871bdcfd3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15489, N'Column 2', N'559cd6d8-3df1-4b96-a951-a383177b42a6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15490, N'Column 3', N'da982907-601c-4d77-b120-9cf41ee5b349', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15491, N'Column 1', N'a963b796-58ea-4273-a889-70f456408f96', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15492, N'Column 2', N'2b0105c8-c196-46d5-a3a0-ac0669e39783', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15493, N'Column 3', N'e31085d6-e65c-458c-baf4-7a32e898517d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15494, N'Column 1', N'd8820bab-5ef8-4275-82b9-4c91c5802b05', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15495, N'Column 2', N'cb14bcf2-1dcf-4a5d-8674-10f1fd8dccc8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15496, N'Column 3', N'6b8e902a-4e53-4f35-aa86-789a2b1f6011', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15497, N'Column 1', N'2cc6c3ff-2713-49bd-a2a8-46c7a34919e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15498, N'Column 2', N'80443b7e-6ed3-4ed8-b26c-04b5f96be737', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15499, N'Column 3', N'8402238e-e8d0-4f59-94b6-343054506314', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15500, N'Column 1', N'c8353cba-2c41-4a2b-a5d3-13603a5b89c2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15501, N'Column 2', N'adc1c3d9-5aac-4d14-82f2-3e37365a812a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15502, N'Column 3', N'9f8b72d0-c000-4614-b28a-00167f4b04f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15503, N'Column 1', N'4fa9092c-f448-4f01-a2e0-7ccc80cecfdf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15504, N'Column 2', N'5fa102ce-cdab-4100-b174-8a6d663a1255', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15505, N'Column 3', N'4fddc444-14bd-40e6-8415-f6a60a1ea84f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15506, N'Column 1', N'45560dff-3d03-462f-8014-219896937211', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15507, N'Column 2', N'8198de6d-5c28-4a4c-b781-e285225adf11', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15508, N'Column 3', N'80e53de7-1bec-4416-8bd1-eb51d4fde3f5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15509, N'Column 1', N'e64dd2ac-3da9-463b-b58a-6aab477cfe7e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15510, N'Column 2', N'f6cbd60c-e5e5-4ba9-9066-f4c310a1621f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15511, N'Column 3', N'fb0dffb4-2a3d-4b3b-9f22-41c4b0ccced6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15512, N'Column 1', N'510a1e6a-19cb-404c-8acc-e67f22d77cee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15513, N'Column 2', N'7333e791-5361-44f4-b1b2-2faa6128c15d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15514, N'Column 3', N'7270fece-6d28-4058-8bdc-2231118739e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15515, N'Column 1', N'd51f02c0-0e93-4657-8332-a8d42a459db7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15516, N'Column 2', N'20b1656f-f49e-4328-96a8-1f39204e99c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15517, N'Column 3', N'152b7e6a-3d19-469a-9129-de3586bf1adf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15518, N'Column 1', N'50fcf10a-9b31-4128-bd91-1ed0043fb952', 0)
GO
print 'Processed 400 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15519, N'Column 2', N'91152323-c041-4c79-a6cc-5cbcabb63e2f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15520, N'Column 3', N'67c6a909-a898-428e-b675-6ae247efd79b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15521, N'Column 1', N'4275e8dd-07d7-472e-9c67-176d92667e1a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15522, N'Column 2', N'c3c6154e-2c89-4a82-9b69-9a4df75488d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15523, N'Column 3', N'6310c10d-ea68-462a-9afb-b00d8c72999d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15524, N'Column 1', N'b298682c-f3f6-4858-b1b0-09f94f881ea2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15525, N'Column 2', N'b9398383-2ddf-4457-b4a7-88c2ec9f6389', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15526, N'Column 3', N'8fce255c-602c-4969-9c0b-7a5b3c574924', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15527, N'Column 1', N'0b657824-63d9-4cdd-aef4-76e7396f7d36', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15528, N'Column 2', N'16803bd4-7759-4826-8955-0cbd0d0eb576', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15529, N'Column 3', N'adc5f12f-7efe-4202-91b2-500fb7317ddd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15530, N'Column 1', N'3679c3eb-7246-4211-be62-569b17648085', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15531, N'Column 2', N'b591cb16-75c9-45d1-92bb-a579037dbeef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15532, N'Column 3', N'0686f1a3-23ab-4e5e-aeb5-372cd2ab4e73', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15533, N'Column 1', N'cfc357f3-73f6-4a12-86b2-e8c7a3248720', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15534, N'Column 2', N'cb489ee6-d6c4-46b9-a9c7-a699f3eaf7de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15535, N'Column 3', N'04c6cb41-8c70-420a-b24e-277e02c0a10b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15536, N'Column 1', N'e3c99e78-644f-42d1-9744-b921126c6b8a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15537, N'Column 2', N'250d3b9e-e3c7-4988-86a2-7e40c0291c34', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15538, N'Column 3', N'7dcc2fa5-593e-411d-bb37-bada0cdbb76c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15539, N'Column 1', N'74895a79-5333-4d6f-b577-d9746522bfb7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15540, N'Column 2', N'dcdc74aa-81b7-477a-9c14-e5e30e9cd1b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15541, N'Column 3', N'4eb6227f-6590-449b-8647-bb72f0549cda', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15542, N'Column 1', N'727ba467-a638-40d1-9d83-418aa913511d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15543, N'Column 2', N'13e01910-602d-4aea-8cf2-f317726b7ca0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15544, N'Column 3', N'274cafc7-8133-4914-9a1f-05fc529a25bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15545, N'Column 1', N'0f291f2a-8847-42a8-85bb-f2286c5aeee3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15546, N'Column 2', N'2b685edc-6bed-43f9-b275-385ba2ddfb6e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15547, N'Column 3', N'4119799c-edd3-472f-ab51-86d861fb5483', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15548, N'Column 1', N'8a7d8a04-c4e1-46e7-aa34-d2bd58bfbde6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15549, N'Column 2', N'6fffeeed-c73b-4bf5-9286-8fa173b162ef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15550, N'Column 3', N'45323620-aeb8-422d-9e52-f694db66ab40', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15551, N'Column 1', N'aa5edc35-5339-46f2-8f34-a13e7abe363d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15552, N'Column 2', N'c5f0218b-c3b5-44c7-ab5c-41760975f3b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15553, N'Column 3', N'00f0f26d-a4a4-40d9-b786-1fe966150a5d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15554, N'Column 1', N'68cd0a03-6906-458e-88c9-197e8b4b8ea5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15555, N'Column 2', N'd158baa0-f5c7-41e9-8875-531814699acc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15556, N'Column 3', N'6cdf7435-502a-48b1-99d5-a85ee21871a8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15557, N'Column 1', N'955511e2-7ae8-4d8e-9387-b9e496c69f0a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15558, N'Column 2', N'865fd284-c400-44c4-b09d-1ef240ea05b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15559, N'Column 3', N'78b826eb-ef25-428f-abac-f51879130d85', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15560, N'Column 1', N'a2515167-8acb-439d-9f3b-3dce6e1b2cd2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15561, N'Column 2', N'f8759c0c-d9ae-4abb-9253-fa0b1f5872a3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15562, N'Column 3', N'2c67efbf-1fc6-4a82-96f4-64eb8e798183', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15563, N'Column 1', N'73537a74-5be8-48a9-a49f-eb95875156c2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15564, N'Column 2', N'6c5d1bbf-dd6f-41ec-8e48-f15d6ae97c53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15565, N'Column 3', N'3f608926-dc60-40bb-8ec8-a3f47ea95d3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15566, N'Column 1', N'5aebb15c-94af-4dbd-b62b-2fb1f96d38ed', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15567, N'Column 2', N'886489e7-e888-4c67-9904-da28278875cc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15568, N'Column 3', N'aa76da7c-1a54-4599-b4cd-00721320c5df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15569, N'Column 1', N'31cbeefd-dab2-41d6-ae9f-43ce8933b6b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15570, N'Column 2', N'93b4ba42-0492-44b8-9434-496eab4a7696', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15571, N'Column 3', N'fec42bcd-cc0d-4b3f-9fdd-8991911134d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15572, N'Column 1', N'31fc032d-d7bf-43a1-b657-4fc241d4efd3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15573, N'Column 2', N'58a56627-81b7-4481-b5d2-3ab6ce94bb4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15574, N'Column 3', N'11c97a95-85c0-463a-abbd-34d5e589fa32', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15575, N'Column 1', N'9eb665c5-3139-4efd-b0be-b42375ffc69d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15576, N'Column 2', N'b8a2873c-8d70-4353-b6f1-a5efafe467b7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15577, N'Column 3', N'ec4f76b3-340f-428b-a377-165744a9abe2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15578, N'Column 1', N'ca12826d-023b-41fe-b8ce-1df95da12246', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15579, N'Column 2', N'22eb8688-f0d7-425d-a28f-24d4da4cab0b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15580, N'Column 3', N'8896d791-9bd2-4011-9851-b9e92b604c84', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15581, N'Column 1', N'f913fa0e-eb0f-4d83-bcba-03ee7dd0fa13', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15582, N'Column 2', N'2db9c6a8-afe2-4a0d-af5b-9661d5494324', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15583, N'Column 3', N'cde93a88-b72e-4ed6-86aa-de9cf820c696', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15584, N'Column 1', N'a4d024b5-fd01-4e04-a4d1-e3f82a846aa9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15585, N'Column 2', N'7bb7a525-ec8a-484c-8c21-373719ce8421', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15586, N'Column 3', N'48617cf9-0737-4bc2-ae0d-573a52ea0c0a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15587, N'Column 1', N'4a3dbb04-ac47-4157-b250-d3e33a6919d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15588, N'Column 2', N'f539a68f-ee1f-4a88-992d-cc2934a33ff3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15589, N'Column 3', N'1da7f59b-f1fb-45d4-8833-6932d25bda17', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15590, N'Column 1', N'4dd8b385-488f-4096-9a4b-9137bb5d9253', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15591, N'Column 2', N'c8508e28-1f7f-4438-b6f2-087198cfd65a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15592, N'Column 3', N'1d865ab4-0d2c-4434-a497-0c44420abe02', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15593, N'Column 1', N'35379a64-f070-4840-8598-4e9643943b4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15594, N'Column 2', N'8974ab64-4229-418f-be4e-7d956a059413', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15595, N'Column 3', N'1503d470-f083-4516-845e-dc885dc41fec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15596, N'Column 1', N'0482c544-7de5-4869-ab9f-095052f7df8d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15597, N'Column 2', N'fa7f998e-5120-438c-9bfa-287753597d63', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15598, N'Column 3', N'dce0d0e3-3b8c-49a8-9afe-9dcca9f9c2ab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15599, N'Column 1', N'44fe5fc3-403a-4451-9abe-c506463b31b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15600, N'Column 2', N'e921e2f9-92dd-4769-be1c-4adc3739bd69', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15601, N'Column 3', N'5ba558ca-c99f-4187-a9fa-9cf56cdd4615', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15602, N'Column 1', N'c2fe5ab5-a364-4f48-ad8d-08dd65622235', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15603, N'Column 2', N'5871b9ad-5fe1-43f2-a1b4-36f9763b3ca2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15604, N'Column 3', N'7c14f396-2fda-45c0-8457-851a42e024be', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15605, N'Column 1', N'21d85616-c4ef-42ca-a92f-22eef3782679', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15606, N'Column 2', N'dc4f3cf7-8160-4b83-8e33-5c15ea9b8318', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15607, N'Column 3', N'be307845-b0f8-40ec-b326-acd7a9fc525a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15608, N'Column 1', N'fa4814e8-d6fc-4850-9310-d178765b5f81', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15609, N'Column 2', N'8d35a6ed-aed8-4ce4-8c0f-2c1bad341a12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15610, N'Column 3', N'b70bef02-df06-4f64-bcb4-d867b3f0b405', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15611, N'Column 1', N'38842146-6a55-4a74-a396-92905aa7915e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15612, N'Column 2', N'88c3ef4e-677f-4946-bfd1-95f6e298839a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15613, N'Column 3', N'acecbdcf-b4e7-430b-abb1-648f8e16b7f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15614, N'Column 1', N'c3b19c72-fb32-44ea-a7c4-877d28308467', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15615, N'Column 2', N'4830141b-490b-4eef-bdf5-4e8d300c267f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15616, N'Column 3', N'ac8acd9e-61de-446f-b18c-2bd1cedb62ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15617, N'Column 1', N'fc5b19c8-aa88-470d-90fc-e538355dbe39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15618, N'Column 2', N'8efa590f-cd6c-4fcc-8b4e-c458e87a9666', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15619, N'Column 3', N'238abd8d-9519-4338-9604-7a605eb9c3b1', 0)
GO
print 'Processed 500 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15620, N'Column 1', N'2ff7dee8-585f-466d-9dfa-cf5e3f5bd218', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15621, N'Column 2', N'b9be8893-1499-45de-83ef-0cb862c55b3e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15622, N'Column 3', N'941106d3-8009-47b7-9162-fb283d808089', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15623, N'Column 1', N'669a1c5f-9dab-47fa-b7de-31870079374d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15624, N'Column 2', N'37f67548-e1f4-428b-b6ac-67336af1e6e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15625, N'Column 3', N'cdbcd73f-02b5-4dfa-b712-38936eac5afe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15626, N'Column 1', N'ddf6f97e-5eb0-46ca-abf6-474b7368c3ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15627, N'Column 2', N'9639d869-a7f3-4dfc-9df6-321fdb42de43', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15628, N'Column 3', N'1eadd14a-3fcb-4aff-98cb-6c89f9a01209', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15629, N'Column 1', N'ec184a3a-8331-423c-890b-91b58498d018', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15630, N'Column 2', N'027175b9-392f-4b9f-80d9-178243b6d262', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15631, N'Column 3', N'f1334ab3-a110-4ceb-ad44-2b6b9152e7b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15632, N'Column 1', N'b18516f2-f979-4c31-89c7-1635af043ef8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15633, N'Column 2', N'19fd92b0-ff2b-4dff-b5f5-513df8ac8e22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15634, N'Column 3', N'0c29bf34-248b-4624-b490-8748bc9abb1a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15635, N'Column 1', N'f074f0ec-a7ce-4ac2-bb52-715ff5727cfc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15636, N'Column 2', N'd6650eb2-20c0-4713-8c85-e8ce19125baf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15637, N'Column 3', N'abf7fa5f-1ef8-4818-9905-574cfdd338a8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15638, N'Column 1', N'4da6763e-74c1-42cd-af00-7eb2f0670c97', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15639, N'Column 2', N'a9378dc9-e859-431e-a9e6-60a9619b8874', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15640, N'Column 3', N'ec54d2fb-c80e-450a-a4b3-eb575db08e21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15641, N'Column 1', N'49601c23-9ea0-4b51-a977-cc5271d35326', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15642, N'Column 2', N'59f67cd5-b511-4f25-a814-dfedb267a963', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15643, N'Column 3', N'2e88384a-8eed-4187-89d1-619ef45bc447', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15644, N'Column 1', N'b17c3848-7603-46c2-80d1-6c77861e1588', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15645, N'Column 2', N'1d906d86-3fe1-41e6-90df-603a04d8ed88', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15646, N'Column 3', N'31fe9ae8-8d43-47df-9476-51cd4d97ad56', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15647, N'Column 1', N'0c094af9-8356-49f1-a0ef-04d6d45a0b5f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15648, N'Column 2', N'ce1eb65b-d791-46db-a38a-9955f7d988d0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15649, N'Column 3', N'07873e8e-3944-47e8-b345-84a507b5fb29', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15650, N'Column 1', N'b1a556ae-c513-4268-b789-83831ff5c8c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15651, N'Column 2', N'73977542-febf-40ac-bc9b-28c27763d993', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15652, N'Column 3', N'3e54e370-7acc-459f-94b7-a3dec0ba6c3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15653, N'Column 1', N'cf6289fb-d924-4102-8b5b-19d5d47f3d1b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15654, N'Column 2', N'aff4fffe-1de8-45ef-b361-52cc8664a207', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15655, N'Column 3', N'3dc8438d-ae62-45a5-a542-3652feff9c84', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15656, N'Column 1', N'3266c618-a5bb-4961-96df-2803a134d737', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15657, N'Column 2', N'3a8bb19b-e3bf-4b56-9c1c-12fe00351501', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15658, N'Column 3', N'f72161f3-eb92-49ca-a71d-5038423ddf22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15659, N'Column 1', N'd60f4c33-4c1a-44e3-8667-505a094dd5e9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15660, N'Column 2', N'2d825587-37df-4930-b56c-bc0a31e5126f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15661, N'Column 3', N'032dbde5-8559-48eb-9af8-443a0e1b9e5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15662, N'Column 1', N'52827645-e398-4762-8d32-b66cb4901e8d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15663, N'Column 2', N'91dbc536-e0a2-4aeb-a3b5-f00c92a7ecaa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15664, N'Column 3', N'182f4534-f8a0-4132-8e13-bfa256dfe620', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15665, N'Column 1', N'51519ef7-fa94-42ff-9ce9-053b300d2d11', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15666, N'Column 2', N'd1d8c5fa-5c7e-4853-b7f6-f8df1e38117c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15667, N'Column 3', N'379a34d5-273f-484f-8dbd-dee38e3a3177', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15668, N'Column 1', N'ba5f0e8c-b66d-4c41-8b85-006c59518aa5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15669, N'Column 2', N'0ab7865e-d0eb-4f4b-bd0b-da0c43b4b9c8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15670, N'Column 3', N'eb328234-c1f9-4b26-967d-e8bf19ce2bdb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15671, N'Column 1', N'65258e5c-1305-4889-bbe6-cf875798fd8b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15672, N'Column 2', N'ed6faaad-5e44-4e68-a3c2-26df1fccd20d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15673, N'Column 3', N'112c1121-87f2-4d2a-b8c7-148b02b18f27', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15674, N'Column 1', N'ff258000-0862-4f99-be83-1c2227b8f1e9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15675, N'Column 2', N'd0992484-7e91-46df-9f73-ad529ebcde40', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15676, N'Column 3', N'a7edbc8b-6c1d-4b02-bda3-d90b197627ce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15677, N'Column 1', N'b62cff47-94f8-4032-b1ce-c64d6c68079f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15678, N'Column 2', N'361db7ba-941f-4247-83bd-80f84fd06975', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15679, N'Column 3', N'a9d52107-b65a-42c9-a50b-2709e7011a37', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15680, N'Column 1', N'70d6b4a0-f98b-4c59-a801-6235e5889d71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15681, N'Column 2', N'441bd9f9-cc02-4fd6-99d9-40aff8fb9e43', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15682, N'Column 3', N'328ab8a8-c777-441f-b6ca-0bb6a89ccb83', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15683, N'Column 1', N'7fd0865b-42ec-4191-aa6a-c95be264287d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15684, N'Column 2', N'4533335d-1649-4325-9704-8129367cb9c8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15685, N'Column 3', N'875ecb3e-89fa-4590-94cc-04dffaebb3c6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15686, N'Column 1', N'a54e0554-485b-45e9-8772-e810acd16f49', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15687, N'Column 2', N'48ff28b1-d17b-441b-9483-199234b858f0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15688, N'Column 3', N'cc96fcd5-f9b1-41d4-9a38-4b203a19227b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15689, N'Column 1', N'91737ca0-f13f-4d74-8471-1baa00b400b6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15690, N'Column 2', N'd88d6e51-82b3-4471-86fe-dc61a6541d1f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15691, N'Column 3', N'd3689d25-ee61-4dfa-b673-7737e009b1a3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15692, N'Column 1', N'a0abbefd-4f0f-4545-a90f-7cab8d256daa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15693, N'Column 2', N'270e69e2-ab4f-4a53-b847-fff1021df41d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15694, N'Column 3', N'6c8951c4-1e65-4446-a19a-4049f15290e9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15695, N'Column 1', N'4049bc9a-a231-4644-afc8-6f07b21c0eef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15696, N'Column 2', N'c2f252ad-9a86-40f0-8075-eb8e5f89b2a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15697, N'Column 3', N'a82103ee-4b07-4fdc-b063-c2e478d2ab00', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15698, N'Column 1', N'84ab7be3-35b2-4c28-95b4-29a72eb336d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15699, N'Column 2', N'ae384d53-93f5-4a7b-899d-951497413eac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15700, N'Column 3', N'33c23835-a241-4647-8c3c-128bfeb9192e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15701, N'Column 1', N'422a7e62-e239-43cb-b3d1-d34b5168b716', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15702, N'Column 2', N'a0a2b48a-11b3-4132-a8b1-02fa7c4e1f9f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15703, N'Column 3', N'e5baf020-43e3-4fb2-a4be-88c6957b7854', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15704, N'Column 1', N'4b49e45f-d32b-465f-85be-0dcf86574422', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15705, N'Column 2', N'3355dab5-dbfc-4ded-aa63-2f456b50bd5b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15706, N'Column 3', N'2c158fc9-1481-42c2-92ba-e4dec9e8375d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15707, N'Column 1', N'700865e8-fdcd-4502-94ac-cf2446ed5bbb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15708, N'Column 2', N'0536cdaa-4f6e-4ede-b593-95e3d42bd811', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15709, N'Column 3', N'04d344e6-5991-4bdc-abee-a77824533f21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15710, N'Column 1', N'3305e8c8-4776-40f7-9212-04abf521d756', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15711, N'Column 2', N'4bf9b587-63dc-4a56-a5cf-1477811ed6c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15712, N'Column 3', N'92a24d97-ff8b-49a0-9434-0ed33cd89293', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15713, N'Column 1', N'c7804db3-69ec-45bf-bcbc-099bb240d79f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15714, N'Column 2', N'b5ecf31d-59e7-4b08-8ee3-b66daffe5a2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15715, N'Column 3', N'bc1f4f8e-041b-4870-8396-4f633dc3d110', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15716, N'Column 1', N'34b17e0f-e3cf-499a-9415-446eb4319d4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15717, N'Column 2', N'637172c0-393d-45ec-9b8e-07bae9be415b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15718, N'Column 3', N'2bbd4f39-57d7-48d7-9935-a8289191ccfd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15719, N'Column 1', N'147d38a5-b38e-4e8f-8d6e-b0dc2f575cba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15720, N'Column 2', N'265e0fd0-6e28-4ea8-9bc4-5741a02f1ab6', 0)
GO
print 'Processed 600 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15721, N'Column 3', N'475bad22-ba71-4236-bed5-f660ac8be9ef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15722, N'Column 1', N'36b42291-2d3d-42bf-8bde-24a0c6ef2f91', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15723, N'Column 2', N'67f27fac-a466-4645-adc2-d3f9da1eeed8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15724, N'Column 3', N'7a3f3713-3150-4624-9875-4a8ff2b0a0cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15725, N'Column 1', N'abccade0-3374-4df2-b7c8-5a1dcae3f699', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15726, N'Column 2', N'11089dd9-c462-46cf-a5ea-ae4aead8301b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15727, N'Column 3', N'4ce8123b-f7c6-45ad-8254-37e0cc5eef92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15728, N'Column 1', N'7f1bf4c4-527a-4d37-bef5-32ff6eafedef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15729, N'Column 2', N'a9c0121a-ace5-4d7d-a36c-2f29cb527ac2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15730, N'Column 3', N'3270b0c4-c986-4f30-acce-62b171096876', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15731, N'Column 1', N'443199fd-c622-449c-bc46-31042bae6cec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15732, N'Column 2', N'd17b239c-edf7-4781-8b38-f12516d16b2f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15733, N'Column 3', N'5a81cb1a-5b3e-4a3f-aec4-d8207c2eeab7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15734, N'Column 1', N'8b0239fc-ba7a-4563-be58-5c6c8174b514', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15735, N'Column 2', N'899a1826-e04e-4b5c-8c6c-e0cc0a74c995', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15736, N'Column 3', N'a61d2b59-0638-4c90-99b8-ea40c32baa2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15737, N'Column 1', N'e2c20262-0e45-4766-820f-4100f70d4c5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15738, N'Column 2', N'ec774292-24c1-4e5a-87cf-306f294ff830', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15739, N'Column 3', N'42b40dba-bb57-4fe9-8561-03f7792751af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15740, N'Column 1', N'e1228723-99be-4c6b-bf2f-f9b2c1903326', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15741, N'Column 2', N'9321dbc5-df7b-4a8c-b5a5-0c9e2c937fe0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15742, N'Column 3', N'b295f712-92e9-470f-867b-a5c0b28775a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15743, N'Column 1', N'7a21060c-656e-425d-b2dc-555c951237ab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15744, N'Column 2', N'c8ca581f-e8d6-4e73-96cf-23e5bcb490dd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15745, N'Column 3', N'a0b8de4d-f8ec-447d-b710-1588bd6b0d67', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15746, N'Column 1', N'8ef88308-1dd2-4da0-bd9d-54ad0fe4dd29', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15747, N'Column 2', N'bf4235b6-fdf6-470a-b0ec-5b177ae8e667', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15748, N'Column 3', N'cadafe8b-eec8-4493-ad71-3e0d08da1d14', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15749, N'Column 1', N'e1c84d8c-9605-4f1f-8746-2473d2cc35bd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15750, N'Column 2', N'8fddc060-1419-418f-b618-2b3f0549d485', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15751, N'Column 3', N'6d575607-462c-49d5-a8d7-54495a2793fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15752, N'Column 1', N'7654bc02-8bb5-4f58-b831-23a134cf1758', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15753, N'Column 2', N'bf96f3fd-3a06-40a0-a2b0-c070d2765360', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15754, N'Column 3', N'23f80deb-85fc-48e2-91cc-795a1b582439', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15755, N'Column 1', N'3f3fe137-608c-4256-b146-74f7e802e53a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15756, N'Column 2', N'3884daec-eb53-46c0-aa5e-4974f55ec1e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15757, N'Column 3', N'b821fd27-68b2-41cd-92bd-ae0f21c6607c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15758, N'Column 1', N'c2aa8db9-7b85-43b1-aa84-611e471bc3ec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15759, N'Column 2', N'dd26983a-2432-48e4-bfc4-01ffd597fe22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15760, N'Column 3', N'633eda20-cb57-4ceb-8628-3d7716af116e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15761, N'Column 1', N'04fe58a4-717f-4876-9086-e2bddba265ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15762, N'Column 2', N'9098b1a2-fc60-4166-813f-23c2e50cadf4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15763, N'Column 3', N'3c8784cb-66ac-444e-b9a5-998e3d11c205', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15764, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15765, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15766, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15767, N'Column 1', N'5eed55b5-3e94-4b9c-8662-0c5af9a545db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15768, N'Column 2', N'c68674f7-99c0-4d8e-b838-c649092f8d6f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15769, N'Column 3', N'7e7ae8d3-8e0b-4b82-b14d-5a79a64c5466', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15770, N'Column 1', N'3277aa98-639e-43e7-ad4b-3f525b14430d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15771, N'Column 2', N'3ad69096-87c1-42d5-ba18-81482dc874ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15772, N'Column 3', N'8f88e815-b964-47da-a210-066ffa184a65', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15773, N'Column 1', N'c8f12211-41dc-4ebc-80cf-db276ab74c39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15774, N'Column 2', N'c377e217-9b27-4763-b143-81b90c0c3925', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15775, N'Column 3', N'062cdf7e-7f89-4a31-919c-97cfa43a6a23', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15776, N'Column 1', N'a333f1ee-2378-46b4-a2e1-09defd71fc25', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15777, N'Column 2', N'96b95eaa-4d16-455f-93d2-1b12b81debc4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15778, N'Column 3', N'2e13c405-b43d-44d5-a220-81c40e7b8153', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15779, N'Column 1', N'5b40f684-5e8e-460b-9e1b-7c05996f79d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15780, N'Column 2', N'c9db14b4-d0ac-44d2-bdef-ff4eaca6d1ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15781, N'Column 3', N'4c8eff20-94cb-41d9-82bf-d3e0acbaef9e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15782, N'Column 1', N'0d3e6ea0-3e1b-46bb-a9ad-7fc84c880743', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15783, N'Column 2', N'ad4bb2d6-4d66-4c3b-90c1-4a45c59ef07e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15784, N'Column 3', N'23a9f6aa-8e25-4e4c-bb33-e3991ac5d350', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15785, N'Column 1', N'16e3cc79-598a-4ba1-bfa0-8c25fe6752db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15786, N'Column 2', N'41f63025-c426-4384-b06a-63d0d4979fa1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15787, N'Column 3', N'2a0dd935-f45c-4509-be40-973303c41bbb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15788, N'Column 1', N'2edadd69-f089-48ca-a4c7-08d74849d37f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15789, N'Column 2', N'3d71858c-d29a-4650-97ae-28ee43d95c55', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15790, N'Column 3', N'431458d8-facf-4719-8316-32ccafeed7b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15791, N'Column 1', N'01ae5c61-13d1-4c3c-a2fa-10a61ac810a7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15792, N'Column 2', N'1dc59235-4707-4b7a-b3b7-3a7ee481e5fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15793, N'Column 3', N'9da75667-11b5-4cc9-9208-3d9385732b82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15794, N'Column 1', N'b1506c39-715e-4cd8-8da0-2e5d86ec156f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15795, N'Column 2', N'82dd8e15-806f-4ed1-b8fe-bbed33e9e86d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15796, N'Column 3', N'b0e905ff-8461-4e80-b9cb-b82814d43d10', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15797, N'Column 1', N'37ebd9d3-e705-48e3-8609-c2565e175964', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15798, N'Column 2', N'7235eed5-cd82-48fc-9165-3bf1fcbedac9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15799, N'Column 3', N'f0bedfd3-f9f1-4486-9ee9-8aecec22aef3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15800, N'Column 1', N'a9c774f5-f204-4b80-9015-b56a259c0ace', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15801, N'Column 2', N'a4597627-c468-44fb-8e73-788ee75cff41', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15802, N'Column 3', N'c791384e-c2e3-435b-bc1b-007b0d8b544a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15803, N'Column 1', N'01dceaf7-7bd1-4591-af94-23f5d2e0b259', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15804, N'Column 2', N'9d5c1802-e284-4408-bab7-6ff40730ee3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15805, N'Column 3', N'6b6c4f24-b8ab-478f-bcda-c689cbc9f4ef', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15806, N'Column 1', N'3d220fa7-96c9-4f53-81b9-57c633f31712', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15807, N'Column 2', N'27be6847-0b8f-4ea9-9f5e-5d3717c3627e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15808, N'Column 3', N'ec77c316-16c4-4ea1-a7f8-443001fb0f44', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15809, N'Column 1', N'74eb8482-efc1-4e54-97d7-3db61eae0936', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15810, N'Column 2', N'7dff85f6-d0bd-4509-a864-787e1bff5557', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15811, N'Column 3', N'4116fa22-e99f-437b-8fd9-bd4ef8e4c5ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15812, N'Column 1', N'54f162d1-d312-4d54-b24f-5d3f06ddc7f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15813, N'Column 2', N'258d2b2f-e629-42f7-89d5-f1477bbe00a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15814, N'Column 3', N'9235031a-c701-4420-91c6-8e860d6eef27', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15815, N'Column 1', N'd2b0e9cc-df34-4ea0-8ee4-40a898fcd046', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15816, N'Column 2', N'b76da3f5-3be1-4e82-a917-232dee6a2781', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15817, N'Column 3', N'a4388de6-60d0-489a-8ca8-0382cf8639da', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15818, N'Column 1', N'97395060-ee8f-462a-a6d3-5ae9906fff2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15819, N'Column 2', N'd835a156-4103-469c-97a7-a82a9d7fcdc9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15820, N'Column 3', N'a3599570-cc14-441f-a214-29d1a671726c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15821, N'Column 1', N'0199032b-1ebf-4f38-9e72-b0fae4a1526e', 0)
GO
print 'Processed 700 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15822, N'Column 2', N'fa388fd0-15c5-45ed-b37f-96998635c15c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15823, N'Column 3', N'1451a059-1dbb-4e93-a59c-45049089ba0f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15824, N'Column 1', N'e94e0d3b-82ea-44c7-8bc8-c03298f16685', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15825, N'Column 2', N'e710c6ac-70ea-4009-82c3-6303fe3edf3d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15826, N'Column 3', N'127a7318-e0f8-4d88-9946-761e059b8774', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15827, N'Column 1', N'29986723-c2c0-4559-b9c5-d4a900e5b79e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15828, N'Column 2', N'2d6d3eb2-e1a9-410d-8600-928303d8b52d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15829, N'Column 3', N'ef051a3b-5fc4-4b47-9130-bc8b5870f9e0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15830, N'Column 1', N'132a19bd-6645-4c10-b57b-e8eeda48a8f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15831, N'Column 2', N'6b7b7984-9ae5-41cf-8596-fe15daec73c8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15832, N'Column 3', N'843ae1bd-ea8f-4a7b-9c93-602104225422', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15833, N'Column 1', N'3c672322-3bd2-47f9-9698-86969ea60f2e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15834, N'Column 2', N'3b35a639-d7ce-4d9c-9af3-b32fce820d59', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15835, N'Column 3', N'68c92458-4af9-4800-baec-2bf4a7d9e5ab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15836, N'Column 1', N'd2c19c16-c670-43ca-a296-2d6957a13f0c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15837, N'Column 2', N'a68c749a-1fc9-46cd-94f3-70156a56cd28', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15838, N'Column 3', N'316bf3d2-505d-4ad4-bafd-ff539136f6c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15839, N'Column 1', N'1e9622ee-2506-47ad-8fd2-f2c4a75f07f5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15840, N'Column 2', N'75631432-af7c-48dd-9d2a-2523292b15bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15841, N'Column 3', N'ad63162b-8bb5-4d21-9017-d9e1a0d58892', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15842, N'Column 1', N'2c90fe79-d6f2-4086-8e94-9c831cacca41', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15843, N'Column 2', N'5bacdd52-d83d-4ceb-bc84-a654adf1bde5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15844, N'Column 3', N'b75b80f1-2001-4741-8083-19c13e3a07e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15845, N'Column 1', N'8cafb327-d855-4e86-9e0c-7781cae5e2d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15846, N'Column 2', N'1b595f19-7c3f-41f5-b984-7f32d19693ea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15847, N'Column 3', N'1960962d-c318-4f20-9012-e7372c316dff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15848, N'Column 1', N'19e32693-cc9e-491a-8c2c-a4cc8011a28a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15849, N'Column 2', N'bd11d1e8-57a3-4bd2-bed3-f40332479bd9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15850, N'Column 3', N'34c38d87-a3b1-4023-a8f3-9f6bb3ded77c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15851, N'Column 1', N'8b1ab749-ad46-480c-ae05-cd8281a5cb90', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15852, N'Column 2', N'79d4831d-4ae4-4cbb-8354-a92974864e2f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15853, N'Column 3', N'd194786e-f6a2-4de9-8077-879d57770aa1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15854, N'Column 1', N'043afb88-622b-446a-955c-1dadb232e2a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15855, N'Column 2', N'9fd405c7-9100-4b0f-8aaf-f8e10e51b29f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15856, N'Column 3', N'66f30f9e-904d-413d-950c-80af6d3858aa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15857, N'Column 1', N'c86a0793-ddf6-4409-8f33-9dac745db9da', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15858, N'Column 2', N'd23f2ad7-bbe9-4d28-866e-8bd7aa45ba39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15859, N'Column 3', N'27a93a05-0fc2-4463-890b-b71800b2e2cb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15860, N'Column 1', N'0bfd20ac-a4e5-4ed3-a84e-2ee2a38f3364', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15861, N'Column 2', N'8c2fdf52-ed26-41a0-b90d-e74050c8fd21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15862, N'Column 3', N'03354481-55ea-4a01-a69d-9032dd991ba6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15863, N'Column 1', N'e8947b9c-fd35-4d46-b3c1-865966774321', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15864, N'Column 2', N'6fade1ca-0ff4-481e-be02-cc8130024e16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15865, N'Column 3', N'7ba5a45d-8b01-44c3-b6c3-a26e9b652ff7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15866, N'Column 1', N'49f59456-e77f-4844-8ea4-665fc3bb049f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15867, N'Column 2', N'7c9e654d-acf9-4b73-b9de-7d9acdade56f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15868, N'Column 3', N'81aa5a10-f70d-40cb-99f8-dbc4417bc808', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15869, N'Column 1', N'40b0890e-0ab0-40c0-9659-739064d2f025', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15870, N'Column 2', N'394ada52-acc1-4891-84ff-9cff2c87aa31', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15871, N'Column 3', N'558ba2fe-a872-4277-9981-880ff0829fcf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15872, N'Column 1', N'1121a230-1ccd-47ec-b1b6-cacbb08efd15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15873, N'Column 2', N'a4091b24-403b-451a-845c-e71fd265b21a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15874, N'Column 3', N'97a52a9d-77c2-4976-8984-7292157182d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15875, N'Column 1', N'7aa63b94-b16e-43c5-9702-cfe398c9adaa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15876, N'Column 2', N'94349749-4212-405f-a127-51b0ddc32f4c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15877, N'Column 3', N'3f9a7fdd-7b27-4cd8-8297-6af3ffe6cc81', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15878, N'Column 1', N'03570c6a-26c8-496d-ba42-c438a968308e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15879, N'Column 2', N'00fe1fe5-2674-4552-b1b3-3a9b2fe68e9f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15880, N'Column 3', N'c8d87f69-d715-45d5-af84-7f95fa222f7f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15881, N'Column 1', N'ed056ef0-bf4c-4696-9d80-02e340537d16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15882, N'Column 2', N'bcf05222-032f-4145-a356-002eacd57a69', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15883, N'Column 3', N'a2d39a46-153a-47ef-a4c2-19122517d513', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15884, N'Column 1', N'8609edba-bdf0-4971-b567-7d72b9962604', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15885, N'Column 2', N'341395dc-16ce-43e2-adfb-23d5b1fe220f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15886, N'Column 3', N'24b8d214-9602-4bb7-8f3a-be728090e1a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15887, N'Column 1', N'd5cbb8fc-4fb0-4490-a448-4758dfbde744', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15888, N'Column 2', N'290c41ad-ef7f-40f1-88af-5e8845cbe883', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15889, N'Column 3', N'087247ca-a10b-49cb-9e17-9af6c33c9b8c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15890, N'Column 1', N'7599cf16-d1ac-46f1-ba7d-46d4beddb511', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15891, N'Column 2', N'396d1fb4-5341-4760-b008-a1c7d71b22b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15892, N'Column 3', N'96e64751-5c60-42d7-a166-e381d05cfddc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15893, N'Column 1', N'6780fbca-0029-4410-af4f-dd2373f3fd47', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15894, N'Column 2', N'2e9133b2-1ad5-4f75-b7a6-7a2e70beaf34', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15895, N'Column 3', N'18ccfa2a-f98e-470b-a3b3-ec31a2adb855', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15896, N'Column 1', N'8fb85dd0-6a02-4024-b04e-7c545df14626', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15897, N'Column 2', N'15180f23-1916-421d-82af-9e0cf20a1ff9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15898, N'Column 3', N'4f6284cb-44c7-47fa-925b-6599f6f0de74', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15899, N'Column 1', N'2d96f437-c30a-4933-a4ab-cdc7ce4e8507', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15900, N'Column 2', N'a9f07649-f3d5-4b16-89f6-c6add0be2e9f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15901, N'Column 3', N'be1d6804-e114-43f3-bef3-5736f07cbc24', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15902, N'Column 1', N'c94eabb2-8b17-475a-9353-3608ebeeed6c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15903, N'Column 2', N'e1017c81-ee20-45fb-bfbe-e53e90436030', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15904, N'Column 3', N'79fa3657-7b9f-4976-abc4-f51cf0326c76', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15905, N'Column 1', N'd806bb0a-bc69-431c-9b4f-07787b007740', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15906, N'Column 2', N'8c331621-eced-44c5-b20f-267979229a71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15907, N'Column 3', N'ec1db658-9b79-4cba-bb01-17341295a078', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15908, N'Column 1', N'1704e913-73bd-4779-9aab-f14deeb1a648', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15909, N'Column 2', N'f6fce966-ee89-4cf4-a5f9-fb4c89a1f7e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15910, N'Column 3', N'60e78a25-30c9-453c-a207-bba63bec9ab4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15911, N'Column 1', N'd335fdbf-4f50-4974-a40b-86410efecfba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15912, N'Column 2', N'92f9e51a-2725-4bbc-a792-378cfd54f4cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15913, N'Column 3', N'a48643d3-d2b3-42ec-9815-7a1ca4b6a5df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15914, N'Column 1', N'0e89a822-23c7-462f-abd8-c80187b86cb4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15915, N'Column 2', N'864dc76b-d0c6-4ce3-9de0-639e90621955', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15916, N'Column 3', N'6cbc9e4a-1ad2-4b9c-9272-ed28675fbc64', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15917, N'Column 1', N'd82afa16-7e6b-4a8a-b8ac-d4cb4bf80d66', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15918, N'Column 2', N'28703b6f-f660-46b4-b7d7-0b18f97ce03b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15919, N'Column 3', N'fb30a140-1cf2-43d6-83fe-384869f50ba4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15920, N'Column 1', N'58f6963d-fdcf-41f2-8624-e75a066e073e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15921, N'Column 2', N'8783862e-fe6d-4cd3-a773-5f98c6a7c014', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15922, N'Column 3', N'1832a714-f6b0-4da5-b5b2-a0147d47f784', 0)
GO
print 'Processed 800 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15923, N'Column 1', N'fd3dcc2b-ee18-4d86-a07f-2bd0742edd26', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15924, N'Column 2', N'1a9254eb-5b3e-4b00-a99e-e5b7e4bf9968', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15925, N'Column 3', N'3661d61c-9d41-4e72-9ef6-6ec92be21e6b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15926, N'Column 1', N'55eac374-f9b1-4405-8a57-f54f02f9b251', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15927, N'Column 2', N'298834e7-eeb3-4e93-ac90-69502cfed554', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15928, N'Column 3', N'7572c2cd-22ab-4f09-9693-9f8eedb19435', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15929, N'Column 1', N'613d36bf-8464-4560-9c47-131a6d7d9562', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15930, N'Column 2', N'a947420c-2030-4aff-86bb-cf0cd88e5339', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15931, N'Column 3', N'6a8c44af-d7c5-491c-9c2c-e5a51210b150', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15932, N'Column 1', N'2b07d9a2-01ee-4822-993a-f1bd6e5a6373', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15933, N'Column 2', N'c286eaa9-bb12-4415-b69d-559e75a3ad03', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15934, N'Column 3', N'5d70b26b-c1de-4d5f-b142-2a2324b4b6b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15935, N'Column 1', N'9de43c52-9baf-42ca-bddd-78225863274b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15936, N'Column 2', N'bbfd5968-b8c6-4144-bbe0-e59ac027fff4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15937, N'Column 3', N'23ddc68c-16ee-4484-a601-1046895f07f5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15938, N'Column 1', N'ac155f64-400c-4a05-95c9-4c37c0a6d3cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15939, N'Column 2', N'7b456ab4-6486-4a58-b232-523dc1c14cf7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15940, N'Column 3', N'099dbbbf-b6be-4272-a855-edb368ecb607', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15941, N'Column 1', N'7e818be5-d826-41c2-8dd6-b6c3738960eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15942, N'Column 2', N'cc8e35b7-be11-437c-a8df-8ed5e68ee1e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15943, N'Column 3', N'28f1a92a-bb5e-45ff-84d3-bead2f2c1850', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15944, N'Column 1', N'f97903ad-0bb9-4264-83b8-c0ae08f56829', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15945, N'Column 2', N'108e3fae-7188-4a5b-8247-31c3126c1139', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15946, N'Column 3', N'1efb16c5-6907-410a-9e47-00beae828c38', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15947, N'Column 1', N'1b74b40f-13eb-40b9-83f6-524213833e5d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15948, N'Column 2', N'26c5c1b8-6b1f-4545-9a76-2c67d7377eb9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15949, N'Column 3', N'ccae4833-3452-499a-b5fa-7838c2dc76df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15950, N'Column 1', N'78a3b399-f3e2-42a8-9c59-c21eaa5df763', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15951, N'Column 2', N'dd90e32d-d996-4aab-b5be-babc51c52117', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15952, N'Column 3', N'05cfb9f6-2114-491a-a0e2-88184cbc81d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15953, N'Column 1', N'b9943033-53d7-4081-9caa-a3855f044270', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15954, N'Column 2', N'2ce15147-e065-44db-b344-a8965ff0890a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15955, N'Column 3', N'7660c10b-9ee5-4216-9744-b6ca09689e9b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15956, N'Column 1', N'0134bf16-6c73-4afc-b7dc-a06d1b6c168d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15957, N'Column 2', N'6d2ca328-0bf6-46e0-9da9-d28eda69d9d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15958, N'Column 3', N'3a4dc586-a770-4c3a-a0f5-916cc4aac3eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15959, N'Column 1', N'9d29f747-349c-4079-9254-e1281a69c96d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15960, N'Column 2', N'56edfb7a-e57a-4f42-b2fe-8872b2d5cc5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15961, N'Column 3', N'077b84f0-f0f3-490f-a02c-2d8b99a922b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15962, N'Column 1', N'83a8f377-341d-4dcf-a786-92e650b3ff92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15963, N'Column 2', N'10857bbf-bd43-4367-b4fc-341fbdadce21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15964, N'Column 3', N'6f22ddcf-feb8-41f9-8c99-650f46703938', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15965, N'Column 1', N'638a125b-01ef-4d6b-abd3-902a2b02d6be', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15966, N'Column 2', N'80762d98-bb2a-4c3f-bfdc-d0b7ec9786c6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15967, N'Column 3', N'86f541d6-6df0-4bb2-a250-f9f1ab602415', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15968, N'Column 1', N'89dabc48-9b14-4b47-a95b-6de9f6b21d6e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15969, N'Column 2', N'58a0e6bd-c05a-434a-ba41-461ca84ab8db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15970, N'Column 3', N'f0bd02e9-da3c-4087-9811-f70bca65ef23', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15971, N'Column 1', N'68382e9f-0ec9-4810-b2bc-cc0113c15d6f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15972, N'Column 2', N'2d513127-7be0-45f8-ae1a-417319c7d51b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15973, N'Column 3', N'37e707e4-eb22-4356-8f5d-1a50534696a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15974, N'Column 1', N'cd1bd1d3-addd-4c0e-8331-eb2ca5393fc8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15975, N'Column 2', N'600bae9f-b0b7-42a5-a6d8-67ba9a016193', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15976, N'Column 3', N'82a2eb65-9141-4bce-b490-235c244ce169', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15977, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15978, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15979, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15980, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15981, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15982, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15983, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15984, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15985, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15989, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15990, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15991, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15992, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15993, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15994, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15995, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15996, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15997, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15998, N'Column 1', N'9fa826ea-2082-41f8-bada-c379b866bb5f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (15999, N'Column 2', N'e3292690-b294-4761-8560-15ca065183c2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16000, N'Column 3', N'68b1a590-4877-4d55-bf4a-9232626a89ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16001, N'Column 1', N'f3ec7eef-2e4f-4ef1-a840-d248980e6e85', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16002, N'Column 2', N'e0b76d32-8855-4460-9308-e7445005e453', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16003, N'Column 3', N'becc96c6-e83c-4137-addd-c5e10a89d1b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16004, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16005, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16006, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16007, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16008, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16009, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16010, N'Column 1', N'14bc34af-b22e-49de-ad05-07310a46cef8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16011, N'Column 2', N'5b8891a3-c118-4997-a73b-8f5ba2b0fd55', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16012, N'Column 3', N'e5c2b06a-b9b9-46fe-806b-eaf3ec0e1099', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16013, N'Column 1', N'1719ae5e-4e16-4ef7-a10c-1ce08e9ced3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16014, N'Column 2', N'afc46a5d-d410-4187-a184-734bc54f8562', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16015, N'Column 3', N'fda46b0e-2b62-4ba1-bd15-902277f7fdf1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16016, N'Column 1', N'35f23abf-bce4-407d-9b47-251cd5b52731', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16017, N'Column 2', N'05b97c73-e336-409c-b29b-2dada6db137d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16018, N'Column 3', N'9e10604b-df09-4969-90d6-641fb296c9ee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16019, N'Column 1', N'965cdb72-faa8-435a-a9c9-631cbf0ebd89', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16020, N'Column 2', N'b51ebd29-a558-4aea-98da-6493b7a3a269', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16021, N'Column 3', N'3389f2f8-f709-415a-b139-020c37a05c39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16022, N'Column 1', N'810ffae7-55c2-4974-a302-73dda32b815c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16023, N'Column 1', N'61a1d9d4-eaaa-48d9-8878-efd9b504e21c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16024, N'Column 2', N'9a7b12e2-b77d-49a8-bb90-0d6d81e19f10', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16025, N'Column 2', N'69a15c11-2ab8-4cec-94b6-c139e85005bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16026, N'Column 3', N'70a87881-e276-4aae-91a2-86fc3ef3f2e7', 0)
GO
print 'Processed 900 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16027, N'Column 3', N'030dd635-fe9f-42c8-b765-70fb53c9a71d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16028, N'Column 1', N'7c1702a5-40d3-41d5-931c-eed1f57a6c15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16029, N'Column 1', N'44c437bd-1fa1-401a-8373-eb326033f3f4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16030, N'Column 2', N'f6541b43-39ac-4af2-a3ae-20f7c7eb49ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16031, N'Column 2', N'0cdb8682-e97c-435b-a61b-d158670d2eab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16032, N'Column 3', N'ec770272-4058-493d-85cf-bcab8f13e400', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16033, N'Column 3', N'dcdddf62-675d-48b2-a3ff-3a15ee2bbcab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16034, N'Column 1', N'172962cd-b09f-4192-9239-e0f86a4f85fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16035, N'Column 2', N'8c5a2289-9fcc-4788-a571-7d32f86fe765', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16036, N'Column 3', N'36336f89-1418-46de-814c-c60761c20c8f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16037, N'Column 1', N'f2bbaf3d-9696-4b2f-8250-8b029f42b308', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16038, N'Column 2', N'596cf6d4-1f71-4c8b-9af4-6a1a8350eb8b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16039, N'Column 3', N'2bf804c1-e3b5-4ce3-8973-b84b4b96824e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16040, N'Column 1', N'8b10b0a9-11da-464e-a897-4f2812cc67a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16041, N'Column 2', N'fd0609dd-114b-4864-bef4-5fa77fcb2c7b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16042, N'Column 3', N'a6699ba7-ab16-48c3-a142-a6eb48e9da25', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16043, N'Column 1', N'a2893202-6948-40ab-b96e-710943cda8f6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16044, N'Column 2', N'65c9f3ad-9410-4c2b-9184-494ab54c7518', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16045, N'Column 3', N'2e007b80-a029-4a66-8556-2e82343b85ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16046, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16047, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16048, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16049, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16050, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16051, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16052, N'Column 1', N'ac39fdc5-3440-47ef-8bed-404cd8a44242', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16053, N'Column 2', N'ca0bf1fd-8438-4f7c-b370-a252ba236307', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16054, N'Column 3', N'1b65035c-503a-40e5-9ed3-a76371288f64', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16055, N'Column 1', N'4e6c723d-02b5-4460-b2af-75b97fa8217d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16056, N'Column 2', N'398a9755-8597-4d5d-8cf9-925d093db55f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16057, N'Column 3', N'4f55c8bb-de2a-40fb-abf5-b1f8e8df2a7a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16058, N'Column 1', N'a85cb135-f966-4981-b441-22fca4844f12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16059, N'Column 2', N'0976fc20-dee0-445c-aaf9-46c1c19740a8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16060, N'Column 3', N'9d1954e2-3783-4936-bc6f-a3367cfbed02', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16061, N'Column 1', N'92971e04-9918-415a-8f04-def5b79ae085', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16062, N'Column 2', N'f69188a8-f960-44d4-b6f4-157cd45c9a75', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16063, N'Column 3', N'55c7f513-ff6b-4f49-a049-fbe01f7e416c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16064, N'Column 1', N'998c9eb2-5ca7-439a-9107-29b15ff2fbf0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16065, N'Column 2', N'3dad28cf-dfdb-44da-88b8-7299faf377cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16066, N'Column 3', N'bc91c808-aa86-4dbc-8e0a-518392646e89', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16067, N'Column 1', N'dc13e8b7-50bf-4772-9a22-0d227859241f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16068, N'Column 2', N'29c5afe0-f8b9-47eb-a2ae-70c14dc630e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16069, N'Column 3', N'1a13808b-3fed-4ae8-b4b6-63e51b82fb94', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16070, N'Column 1', N'ebffe0ab-1049-4ae9-a52d-5e0e73fb99c8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16071, N'Column 2', N'6b999d12-6f62-449d-8688-ee2cd3b010ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16072, N'Column 3', N'5e8d1e35-98d9-4d17-90ec-10dd6cd5bb15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16073, N'Column 1', N'5f9ab5c5-772a-4c6f-8122-19ea53e6fe58', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16074, N'Column 2', N'e3680961-a553-4ddd-83d7-5178d1cdda09', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16075, N'Column 3', N'cd0e9734-760a-4419-bc22-84f09d83d53b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16076, N'Hello', N'76d86f61-d287-48fa-9686-3472d90c2ec0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16077, N'Hello', N'65fe149d-2e98-463c-8651-1583213601cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16078, N'Hello', N'b758202b-d985-46ab-a1f5-3d29871fca77', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16079, N'Hello', N'daf8817f-0105-49cc-b478-0723903df284', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16080, N'Column 1', N'7a6538e4-59ca-45fe-b4a5-65f193b94194', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16081, N'Column 2', N'8432cb7a-69fe-42ce-a0e1-01e435b3dc8d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16082, N'Column 3', N'0856a2d8-3d60-4ccd-aeec-191ea05fea8a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16083, N'Column 1', N'e9346411-181a-4b1c-a83d-f8fc642c0e2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16084, N'Column 2', N'd55b9202-5bdf-463f-80b2-5244b873eeb4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16085, N'Column 3', N'f0e5ac84-7843-4cd5-b4a8-9fbd192a359d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16086, N'Column 1', N'cdedd309-3a64-43b0-8ee2-8002a3db6bea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16087, N'Column 2', N'a6ba2c80-031e-4d3b-bc45-53fa338bb528', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16088, N'Column 3', N'8f10796b-9bc1-43e2-8209-a1c3189f1297', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16089, N'Column 1', N'b5aedb21-b669-4459-8c4f-9ecb5d4992ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16090, N'Column 2', N'e30debab-3695-4565-848c-0774295c032e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16091, N'Column 3', N'16964dd7-ef93-46fb-98b6-fcf927343cbb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16092, N'Column 1', N'6d5bf8fd-ae51-4ced-b159-e5d6ad4f4830', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16093, N'Column 2', N'256a7e34-9d28-486e-abbb-326e3a491a4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16094, N'Column 3', N'b0c2d282-348e-4fba-8076-33fc359b37a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16095, N'Column 1', N'0cf3c561-9681-4660-b138-6c36f79eda9d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16096, N'Column 2', N'901e74b0-312e-40aa-8203-d93f7212bfbe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16097, N'Column 3', N'a0933794-4e5f-40c0-981a-65b5295d1a9a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16098, N'Column 1', N'5021dc92-f796-45e1-a6c8-20dbe02d39a3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16099, N'Column 2', N'0bb76af9-af8e-44dd-aafe-23a8c3704199', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16100, N'Column 3', N'7b5126dd-36f4-45da-b6f7-b9d6c34a56fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16101, N'Column 1', N'c8022f68-ce1c-4a99-a091-d286e6f70705', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16102, N'Column 2', N'e9e2ac75-497a-44f4-8ce4-0708d3955334', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16103, N'Column 3', N'0465ff76-2455-468c-9f84-76b2770abd84', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16104, N'Column 1', N'5d06f27d-0cec-44a6-b349-bef74cbd212e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16105, N'Column 1', N'eb9778c4-4723-4ae6-8384-6e3b1946527d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16106, N'Column 1', N'4f4faaa2-a2d2-435a-ae05-fb6eed35d322', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16107, N'Column 1', N'15775b76-aec3-4b6c-88fd-e151cf67de7e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16108, N'Column 2', N'6539a812-4eb5-48df-8605-47198e685880', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16109, N'Column 2', N'f0e77b25-03ad-4f34-bf36-61365eb97565', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16110, N'Column 2', N'83441d43-f0b3-45a8-85b0-17797d25d307', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16111, N'Column 2', N'74261aed-f4a8-4977-9d8f-8639cba33f19', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16112, N'Column 3', N'5d3f3728-6692-4091-bf73-18652952efa5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16113, N'Column 3', N'89ba11d3-75a8-4aa3-8d11-df36a577ff82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16114, N'Column 3', N'fd6290ce-d326-4214-9472-12c14b52691a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16115, N'Column 3', N'7f5bed9e-dffe-4085-8c84-b1e4a93f321f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16116, N'Column 1', N'51a7fde3-a7e2-4ab3-83ab-ce7e203f2c6b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16117, N'Column 1', N'6f1a1c98-c852-4ca3-a926-31924e8981c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16118, N'Column 1', N'9d2d7130-001e-4648-85a8-0da71f6be5f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16119, N'Column 1', N'a5c03b3c-64cd-4736-959d-a8f8b2909745', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16120, N'Column 2', N'44ee8f71-268a-48e7-a933-aec677a51257', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16121, N'Column 2', N'3a4614ee-74ba-48f8-b06c-63d56f4c66c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16122, N'Column 2', N'13144264-4174-4795-acb1-e25a7e95ca12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16123, N'Column 2', N'726325e1-85bd-49fc-8bc6-f61f57114243', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16124, N'Column 3', N'5678e3d9-b02b-46c2-890c-e64c2fb777e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16125, N'Column 3', N'0c7085a1-bb1a-4a8c-abd2-70ba6bd29ac4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16126, N'Column 3', N'36ac0418-1675-491b-a05e-5476e3b9128e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16127, N'Column 3', N'4c9c759f-c529-4078-a8cd-2eda78a80792', 0)
GO
print 'Processed 1000 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16128, N'Column 1', N'a579d20f-133a-4874-83f1-d41dfc4b4c6d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16129, N'Column 1', N'bad2c413-1471-415f-9ae4-7ae54a93c8c3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16130, N'Column 2', N'5b3edaa0-530c-40c3-9182-27ebb7b52e42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16131, N'Column 2', N'cbb89c6d-3a81-4029-b296-86947a2875f9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16132, N'Column 3', N'b365f84d-f973-44f3-a7d7-3ccf0157b296', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16133, N'Column 3', N'3a00526b-97b4-4010-a1f6-efb2cdce49d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16134, N'Column 1', N'09a64d9d-99d3-4303-90d7-a87b1155307f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16135, N'Column 2', N'd13540af-f0f1-4978-83fa-b5d35e69f1b3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16136, N'Column 1', N'd3452988-9958-4bb3-a5da-a1a5a1d2a7a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16137, N'Column 3', N'5c75f278-c0ec-4376-8bff-3761da61c769', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16138, N'Column 2', N'91d046dc-e4f5-47bd-b0c3-79de088735ab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16139, N'Column 3', N'0673b45e-0ccb-48b3-bbb3-97d449db24c5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16140, N'Column 1', N'9b4ef84b-76bc-41bf-896b-930a310dd47c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16141, N'Column 1', N'11814319-31ea-4fc5-ad2e-5fd1e4b03b32', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16142, N'Column 2', N'dd8a2206-3d08-4009-a6bf-6236e1fdd487', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16143, N'Column 2', N'c277c7af-c95f-4052-8d59-4c7085d52e41', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16144, N'Column 3', N'74157002-f0af-444b-a8a6-71c9596cc712', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16145, N'Column 3', N'e7a640cc-0230-4ce9-bc55-7b56abbfa957', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16146, N'Column 1', N'16da7a96-d162-4ccd-a032-3c6730f66f99', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16147, N'Column 1', N'e12009f3-0451-4035-9267-647476b6958c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16148, N'Column 2', N'477a71ea-8fed-46c9-8394-048aecd7a314', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16149, N'Column 2', N'1ffb1101-ea54-491a-83a2-f7f4e8a67e29', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16150, N'Column 3', N'a62341f6-85ce-472f-b1cf-255cc69b044e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16151, N'Column 3', N'8c4d8b07-40c5-42e7-af7e-195220bab7f4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16152, N'Column 1', N'3a4a3c70-6d03-4315-8bbb-a48588edfb35', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16153, N'Column 1', N'11619e42-20e7-4d92-b089-30281b762553', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16154, N'Column 1', N'83c1b080-7da5-4e3f-ab64-2aed3c7d4e0b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16155, N'Column 2', N'356b7b1e-f302-4597-b5cd-02854c490c73', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16156, N'Column 2', N'24acfef7-a0a5-4b35-9ae0-9efbf562fde4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16157, N'Column 2', N'fefae9c8-1e2b-421d-be0e-97039c36e48a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16158, N'Column 3', N'da38a3bf-e51b-4102-8346-011e85aeb557', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16159, N'Column 3', N'27126734-4137-4f9e-80f6-2498566d172e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16160, N'Column 3', N'cd2b2c9a-5953-4735-bc0b-038976a54996', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16161, N'Column 1', N'e7290e25-def8-405e-8cc7-979da03e4349', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16162, N'Column 2', N'cd3bdc86-f7c0-479d-9af9-7ed53077d725', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16163, N'Column 1', N'a972a5df-1e77-49b8-ba0c-a94366bbfda5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16164, N'Column 3', N'b0d702ab-f26e-4197-877e-4f8d733e5aa1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16165, N'Column 1', N'd1f1e02f-7a02-446a-9f29-c3eb0f19e304', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16166, N'Column 2', N'cef2bf49-e9f4-4782-8497-b77bdacc75af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16167, N'Column 1', N'4f63c680-331d-4948-b615-e94c916168b7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16168, N'Column 3', N'7a003d1e-c285-4393-8e2d-aa50d680a666', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16169, N'Column 2', N'bf20630a-731e-4d66-b905-1ed31b0a5609', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16170, N'Column 2', N'de84cebc-016c-47d8-9a0d-94264a3f1a50', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16171, N'Column 3', N'ef843400-43a6-4cc8-8577-6cf50636d996', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16172, N'Column 3', N'1d74df03-dd94-4535-91d6-a39bb419c890', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16173, N'Column 1', N'5b890e62-3967-4ad9-ae79-f35334a812bd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16174, N'Column 2', N'a0bf1c21-7497-41eb-a2cc-87ae8b424b8d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16175, N'Column 3', N'58f83cc6-f09f-49f3-aa4f-5a9f71547da2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16176, N'Column 1', N'f9074fa1-0775-4700-9d7e-e64ab2103e8c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16177, N'Column 1', N'7ee91900-7369-4866-9778-831c7ca4d51d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16178, N'Column 2', N'bc0ffcf8-ddab-4611-b9f0-eaa94024712f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16179, N'Column 2', N'e4074b60-2da0-4e8f-9371-98ae2853099c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16180, N'Column 3', N'199a21f5-c9db-43c3-8b43-5aad7db4ecc1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16181, N'Column 3', N'8a0781b1-6870-4e1a-b903-170e7caae4e4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16182, N'Column 1', N'fc18ad7a-f449-4a4b-be20-42395575b5e4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16183, N'Column 2', N'ec295c54-e7d2-4a1f-b4b0-f363e48ed76c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16184, N'Column 1', N'83dc7063-a1e0-4038-9666-59752843b763', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16185, N'Column 3', N'288889f3-bbfe-410c-ae12-575ad5a7a775', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16186, N'Column 2', N'597e71a3-b406-4dc8-a934-2ef5f4e3fc64', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16187, N'Column 3', N'243d1e79-e5b3-4121-9257-bbd107c4667b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16188, N'Column 1', N'8a197c1d-d0b1-4988-b1a7-bf75155d93ce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16189, N'Column 2', N'5922dc8a-d1fe-4fc3-9791-c8e337802a99', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16190, N'Column 3', N'a215ad62-f1f5-4adc-9877-6b05c8ea71ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16191, N'Column 1', N'e40b704c-cfee-451e-a0dd-e3827ec27e56', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16192, N'Column 2', N'c39e5efe-a7ec-45c2-95d7-a8e120be992d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16193, N'Column 3', N'b95d80eb-74cb-42c1-b454-f8943ffb7924', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16194, N'Column 1', N'9e174ea9-4a48-42fd-94ba-d57dd3c0adcf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16195, N'Column 2', N'6ec5c22c-bde1-4561-9d98-50d99f52c8ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16196, N'Column 3', N'32b21fae-0d21-4a38-bbc5-f21eea00991a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16197, N'Column 1', N'2a46ac25-171c-4b19-b7e9-c2922bf4a95d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16198, N'Column 2', N'05415fe4-5738-4e3d-a909-ac590d6385a2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16199, N'Column 3', N'bc660924-1e67-4452-b285-2b5fa3161676', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16200, N'Column 1', N'df790faa-eaeb-4864-9e6f-9be8bfef2ab9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16201, N'Column 2', N'04d328e1-8adf-4730-a9d9-f603f37e4e9f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16202, N'Column 1', N'7a1290c1-e76c-4dc8-8a1d-5d77b2c74aac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16203, N'Column 3', N'1bd785e2-b12e-4caa-9160-d891dc1d95f3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16204, N'Column 2', N'488bdf2c-bde5-42b4-a50c-5dbfefaa4406', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16205, N'Column 1', N'f2dca459-ca71-4eb9-9b44-4965ead1de33', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16206, N'Column 1', N'6c52f6a0-4356-4d33-a3d6-41e72dbfc829', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16207, N'Column 2', N'ac3bd014-18ba-47f9-ac07-ba4b4060768e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16208, N'Column 3', N'86344078-377c-4612-bcd9-667e5967abe5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16209, N'Column 3', N'1d814464-5559-457f-92c0-e471514cc03f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16210, N'Column 2', N'58728971-5d43-4d48-a96d-247df107c348', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16211, N'Column 1', N'777a4b54-947d-4f09-a150-ffe5f0d6aea9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16212, N'Column 3', N'1ce1fdb9-3983-4d60-b845-c678f6f5597b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16213, N'Column 2', N'0548a4a4-4090-4c3c-9fc5-5bda91bc886b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16214, N'Column 3', N'c39fc45a-7828-4d62-a22e-f65b3b8ad4cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16215, N'Column 1', N'3c32d308-b99b-46d4-a9a3-85723f411843', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16216, N'Column 2', N'd08d810a-cb93-4753-9596-a2963157682c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16217, N'Column 3', N'e968a8ee-0905-4e50-bb29-80b02dfa8035', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16218, N'Column 1', N'372882c7-a73c-4bd9-9947-f113e4911467', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16219, N'Column 2', N'd8a1cd06-1987-4fac-a2ae-abdac91c7d71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16220, N'Column 3', N'6347c09a-af57-4d74-a3a9-7471c73fe154', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16221, N'Column 1', N'9ca8deda-5636-4d3e-b443-57bc3707d63f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16222, N'Column 2', N'bd34be08-9252-417e-b17d-20bab548c648', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16223, N'Column 3', N'de7a7be6-5e39-49ca-9d91-787697fbef86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16224, N'Column 1', N'e55c1f80-2174-43e8-bdd0-8d67ece4674e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16225, N'Column 2', N'5b0965cd-f056-4a40-a8c1-2165f0049ce6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16226, N'Column 3', N'c7cd191d-2c89-4255-9f46-afb82bde00c8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16227, N'Column 1', N'0d3844ed-81b3-429f-81cf-c645bde91cb5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16228, N'Column 2', N'8b0ccd76-16e9-4631-9f25-0e09f6573a21', 0)
GO
print 'Processed 1100 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16229, N'Column 3', N'4eb13fda-1dcb-4111-bd89-e469be6c1419', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16230, N'Column 1', N'ad8d4ec2-07b2-4820-a413-ada9661def71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16231, N'Column 2', N'97f36a3a-26fd-462d-99e3-f9c1805477d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16232, N'Column 3', N'b9411d07-f8ac-4fac-97da-d2d1c24e9be9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16233, N'Column 1', N'35d4e0ce-2345-41d5-adce-ac8c54e2022a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16234, N'Column 2', N'40788a64-eed3-4a75-b730-dba04172685d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16235, N'Column 3', N'2d07e367-6b39-49d8-992f-7913bca5ae2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16236, N'Column 1', N'8dd04977-25f8-4377-85df-9419323a6fc3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16237, N'Column 2', N'2fd332f6-1aed-4259-8615-8c1670573f4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16238, N'Column 3', N'460082d0-0b54-4797-b24d-c1751294f567', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16239, N'Column 1', N'2051c197-a93d-4fe2-b098-04e73e012a02', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16240, N'Column 2', N'b0edc124-0355-43a3-9f63-7addf9ec3986', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16241, N'Column 3', N'0d8da67d-b173-453e-9652-4b9094f5cf26', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16242, N'Column 1', N'f3b1b5d6-13f7-48e2-9347-2aa055207ed2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16243, N'Column 2', N'3dfd894a-6f48-42d9-b49e-00daea608a22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16244, N'Column 3', N'cc969ea5-b719-429d-bf66-f99cd7dc98b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16245, N'Column 1', N'2facc1cf-d754-4f08-81e5-4ccfd77d6eba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16246, N'Column 2', N'208d2dc8-8db0-4309-bf82-d1da8172d6a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16247, N'Column 3', N'69b7cfb9-64eb-4714-a3b4-50eb9f77d212', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16248, N'Column 1', N'1ed3e502-6db5-4828-8199-5965944be46c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16249, N'Column 2', N'e600f995-471c-43fb-a8c3-9892a5b43573', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16250, N'Column 3', N'5967e958-621c-4b26-8fa1-0114809d7775', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16251, N'Column 1', N'274d765b-01f9-4360-af15-0583cb6e7f1f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16252, N'Column 2', N'0af1c659-107e-4d53-b368-9b4541996e42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16253, N'Column 3', N'ad80ec9d-c4ba-4aa2-84f0-e83360ad3a01', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16254, N'Column 1', N'3866d881-b311-47e2-8abe-02259a5aee28', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16255, N'Column 2', N'c8dd2792-7aa4-43f9-a724-86a08fa743dc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16256, N'Column 3', N'b85dc5f4-d1bc-4797-8f86-eef72000682b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16257, N'Column 1', N'6d36eb66-44e1-4b79-bca6-9112da188e0e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16258, N'Column 2', N'245b1de0-dcaf-47f3-b4bd-23ca7144b7d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16259, N'Column 3', N'e73b236f-02e9-482d-9e4e-1c9781c07e46', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16260, N'Column 1', N'3cb1b95d-2015-4cf5-85a8-019d5dd54476', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16261, N'Column 2', N'92ebae70-795c-404c-a5d6-ebedbe8ed530', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16262, N'Column 3', N'a9816f4d-438a-4a4a-8276-be92946e4b75', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16263, N'Column 1', N'75a3afa4-b38b-47d5-89d7-e3d403c14be8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16264, N'Column 2', N'e6388d40-903e-4c1c-98da-12fb8a41a121', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16265, N'Column 3', N'05fa7460-31d0-49c5-a008-7a9873f62625', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16266, N'Column 1', N'e517a1b3-f58c-44b9-8463-3445bbf25b72', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16267, N'Column 2', N'acb5df1a-4145-4da8-b2ee-a467350b1d0e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16268, N'Column 3', N'818e3672-217f-4151-9369-3de5363e4b95', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16269, N'Column 1', N'dc14adcd-8c5c-4fde-8fe6-e1f60134c555', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16270, N'Column 2', N'aef3af47-f911-41cf-8964-634526190221', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16271, N'Column 3', N'a357c87b-a231-4b40-909b-3991f446d154', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16272, N'Column 1', N'67ec1899-a645-4058-905b-3cac09b49591', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16273, N'Column 2', N'7fda2318-5fd6-4e66-acba-3d8a85bf1f02', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16274, N'Column 3', N'71466eb9-b469-48a4-ba19-04125ee937ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16275, N'Column 1', N'9d42fbc0-f930-4b10-a6a4-6700c3093045', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16276, N'Column 2', N'23e59a78-25c8-4bc8-945d-66fc94ebeed2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16277, N'Column 3', N'730577d3-2cee-4b46-b3d0-2060efc082bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16278, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16281, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16282, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16283, N'Column 1', N'8352dafd-0f4f-42b9-9b10-b8e7b7e8edff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16284, N'Column 2', N'37f2382b-1549-411f-9576-aec910658a7d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16286, N'Column 1', N'742491b6-9f82-4d83-a455-1b2067b226c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16287, N'Column 2', N'428f48f1-0546-4fd1-882c-7cf79cc38484', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16289, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16293, N'Column 1', N'91fc46b8-a079-419e-b858-d7491325ad3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16294, N'Column 2', N'e6dcafad-2b0e-4b60-b8d8-bec105257756', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16299, N'Column 1', N'247751dc-cb72-40c9-960e-63b6ad019c9e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16300, N'Column 2', N'f239aa6f-e353-484b-b1d4-6a114dd4d891', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16301, N'Column 3', N'6365ba8d-2d4e-4658-aa94-fc9f02a03443', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16302, N'Column 1', N'aca688ef-e778-4d64-b9a7-5e0558878481', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16303, N'Column 2', N'cff3fd64-cb43-4d24-8f6b-3275deb78d39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16304, N'Column 3', N'fe8c54c9-56ea-4c98-89c3-6d61b51b962f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16305, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16306, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16307, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16308, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16309, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16310, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16311, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16312, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16313, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16314, N'Column 1', N'44a12cda-c2de-4a8b-bb9e-40dc40968b5b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16315, N'Column 2', N'30551c8e-c40b-4cc9-b89b-071a0c92ab88', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16320, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16321, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16322, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16323, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16324, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16325, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16326, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16327, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16328, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16329, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16330, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16331, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16332, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16333, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16334, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16335, N'Column 1', N'7454fe5c-3419-4576-8339-16f083a4c270', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16336, N'Column 2', N'f4eccc87-bdd4-4f7c-aa4e-4fbce992b869', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16337, N'Column 3', N'cfbbf82d-e52a-426f-abd4-50df27384cc9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16338, N'Column 1', N'd2dece84-5056-424d-84e9-713ff3394b5d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16339, N'Column 2', N'52b28a17-a0e5-4a9a-963f-fb1de1d2eaab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16340, N'Column 3', N'8a5e6f85-38ee-4dd7-8a41-8f5f21d9f82f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16341, N'Column 1', N'6454170c-dc30-41a6-8423-c573e24c1f16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16342, N'Column 2', N'65c4cd05-47d1-4b94-9249-5317fec5cb4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16343, N'Column 3', N'ea39a8d8-b050-4c34-bacc-b690a55e0dbf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16344, N'Column 1', N'04082eb1-6066-460a-a9c0-7acc6a07b12a', 0)
GO
print 'Processed 1200 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16345, N'Column 2', N'df6e72ea-9110-4132-93cb-7d4d82118da5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16346, N'Column 3', N'a6298683-d269-4226-b7b6-f4d169a9316a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16347, N'Column 1', N'e8021486-6bf3-43d5-8665-06dd2323aa4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16348, N'Column 2', N'84bfd183-d83e-4b84-9c4b-6cffdb3dae19', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16349, N'Column 3', N'2351996a-2bf3-4fa6-9f59-75f1529e44a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16350, N'Column 1', N'e6e4e7a7-e1ea-479f-a554-e1b3ef615bf5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16351, N'Column 2', N'bd762c07-a24b-4b4e-892e-dd35ba04fe35', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16352, N'Column 3', N'de0decbb-173c-46cb-b738-11fbc27f5448', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16353, N'Column 1', N'2538eb23-8a22-4682-a672-7377bd50e471', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16354, N'Column 2', N'55d7be95-7b55-4114-9117-ac9642170d26', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16355, N'Column 3', N'a3eb1d82-c83d-48ac-acae-412ae47fc09a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16356, N'Column 1', N'41d5fd85-4e5f-4391-bde3-cbf6aad8e5f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16357, N'Column 2', N'8347d423-637d-4ae2-be78-3993481fffb0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16358, N'Column 3', N'3a59f7b5-c216-499b-8ddb-c56bf7cbaf31', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16359, N'Column 1', N'c7168efc-0ce6-45d3-afe4-1f24264d78a6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16360, N'Column 2', N'2091f61c-9532-49ec-8645-0ddf3bd67e63', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16361, N'Column 3', N'bd4f2c77-9d62-4da0-933f-921e72dd013f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16362, N'Column 1', N'be293b9a-a3ef-4f2f-84d8-1820aabee324', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16363, N'Column 2', N'c3753e19-9df1-4ee3-a87c-db5dcad20519', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16364, N'Column 3', N'22e973d4-9713-48a8-aa14-4c0e3a2ebcca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16365, N'Column 1', N'e8ea03d7-63a3-4034-b3bb-bd162157ae8a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16366, N'Column 2', N'4257c0b7-b7a7-44c3-bf76-4db3611dab46', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16367, N'Column 3', N'a7568071-6dcf-4a64-a279-e2ff84ec79de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16368, N'Column 1', N'c3a4c053-dd22-45ca-b54e-0513a3a7b267', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16369, N'Column 2', N'48d06b34-7ca8-4705-b198-a1181725b2a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16370, N'Column 3', N'8542ddf4-2615-4f46-951a-17dd90a688ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16371, N'Column 1', N'c843e607-6757-4f56-88dd-c98c8ac64cc9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16372, N'Column 2', N'878eff8e-e110-4042-baa1-ccdeb8934697', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16373, N'Column 3', N'2b371f0b-3686-4842-b9a2-abfe9f18cb71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16374, N'Column 1', N'b60022ed-4483-49ba-bce3-918a3cc3e8f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16375, N'Column 2', N'fc1f7aeb-6857-4316-ac01-9dbae0192c79', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16376, N'Column 3', N'727cad64-d5b8-4280-9254-579f669d759b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16377, N'Column 1', N'944cedc0-6395-482c-b5ec-646b231dcb0e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16378, N'Column 2', N'2d7a1159-ebbe-4443-9dd2-04aaf50d1227', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16379, N'Column 3', N'0a162d24-e900-4cb5-a0f1-5011a00dfeae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16380, N'Column 1', N'955e8879-c1b9-4b50-a7cb-90fa1d6a6884', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16381, N'Column 2', N'97c6f5c6-cdeb-43b8-af27-6e7f1c415cca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16382, N'Column 3', N'e5f2c590-8868-462d-913f-2241c9a632a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16383, N'Column 1', N'd2c39514-089d-48e2-8380-a8def3c628a9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16384, N'Column 2', N'c3f1a017-30a1-4f50-9c8e-60767008f12f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16385, N'Column 3', N'8488663c-e955-41fc-817e-789f31cbe1b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16386, N'Column 1', N'e85a352e-5c72-451b-8781-ca82992f2f9a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16387, N'Column 2', N'644565d7-6024-4cfe-981e-060259deaf4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16388, N'Column 3', N'd70da8f3-6f13-4522-9054-116e1c397e6d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16389, N'Column 1', N'f921b950-b889-48e0-acc4-80ac3dce2c61', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16390, N'Column 2', N'0a256c72-55e7-4cae-8627-1ff9a97b88e3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16391, N'Column 3', N'bd15e5ce-8ccb-48ea-a7d4-1e23fe8b0866', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16392, N'Column 1', N'f6bd791e-8f53-42de-8b0d-14717e3571de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16393, N'Column 2', N'7b1cafb1-314b-4cfd-8bc0-bec0c6f55baf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16394, N'Column 3', N'2db16550-0da5-43ea-a8f5-990861a033b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16395, N'Column 1', N'7cf49478-29e3-4476-a34e-4823a5f70eae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16396, N'Column 2', N'ccca199e-79b4-4d51-98b9-6034960f17e9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16397, N'Column 3', N'62599283-2e74-4391-9f43-e5eca01daf34', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16398, N'Column 1', N'6d4dd953-8f7b-4617-9a6b-cf78cdd71e18', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16399, N'Column 2', N'6cbee849-ee0d-413f-9f62-d4d3ff987393', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16400, N'Column 3', N'848c57d0-7bfc-472f-94c2-773c29f84bc5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16401, N'Column 1', N'f9c8ed2a-8259-4093-a2ad-96f34ec5fb1c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16402, N'Column 2', N'0d03f8f6-fe89-41e8-828c-aa1b9ccca5f5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16403, N'Column 3', N'eb441248-c118-448e-abdd-d9f36818655c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16404, N'Column 1', N'c54135d2-db88-4272-b1e2-55ee1a1e7930', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16405, N'Column 2', N'8130d041-fbd5-427c-9e2d-698742438a4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16406, N'Column 3', N'9a782e1f-557e-4277-8a75-86851417bc47', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16407, N'Column 1', N'48f73cf2-4907-4cff-9311-5d41c506486d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16408, N'Column 2', N'c008ae11-7660-41b6-a4ac-af6d8d99b30c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16409, N'Column 3', N'8d158007-6ba9-48a7-8340-cdda3b79994b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16410, N'Column 1', N'221548b4-881e-49c4-b80b-7a7b41d4c4a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16411, N'Column 2', N'3b36258e-216d-4471-85ca-875313488e86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16412, N'Column 3', N'77c7660f-9ed2-4ede-867a-b1063d9f36db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16413, N'Column 1', N'8de64ec4-dcd1-4155-b7ac-152f3abda580', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16414, N'Column 2', N'b6649c4c-d11c-4bab-b38c-7e2906e0c232', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16415, N'Column 3', N'e8fd87d2-dd48-4b73-af20-0eb3cbc32a31', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16416, N'Column 1', N'7784e611-1dd0-45c8-91a6-e17210270467', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16417, N'Column 2', N'5a2ae624-9c49-410a-b387-3b10cd72179f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16418, N'Column 3', N'd4b16b25-4ba8-48f2-bb35-038a4c29d590', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16419, N'Column 1', N'420cacd0-d188-46f0-8541-731a967f66e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16420, N'Column 2', N'11e73c6c-12f6-4e6c-8a8e-9d5d606b446a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16421, N'Column 3', N'e3b7a920-13fa-4eec-b61c-fbac741aafb3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16422, N'Column 1', N'a24620dc-202f-4eda-b226-eedb89dee970', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16423, N'Column 2', N'1b2e75fc-039c-4c24-bcc7-dfe7af943d16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16424, N'Column 3', N'ca256081-2826-4f15-bd76-a501048dbe47', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16425, N'Column 1', N'b84816cf-c269-4c4c-925a-e3c020218125', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16426, N'Column 2', N'ef1b8d7d-4b26-4119-b71e-4e3495b16fb6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16427, N'Column 3', N'a3ca0048-4bb1-4369-94c5-241955bae36f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16428, N'Column 1', N'a114e5a9-2c1d-439c-b1e1-4fa7854ebf2b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16429, N'Column 2', N'1ef5ade8-800b-47db-be56-dcf1de2ca928', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16430, N'Column 3', N'cf643ac3-4ae7-4894-b990-d4c5e8a74a43', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16431, N'Column 1', N'ae69825c-d689-46b2-9a8b-af88f6c1f9e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16432, N'Column 2', N'2515f54f-e557-4ff1-83dd-86bc2260b384', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16433, N'Column 3', N'3144aa67-96c4-4620-bb1b-fe514f571cec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16434, N'Column 1', N'98d0222c-5564-4fcd-9b02-82840c6886c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16435, N'Column 2', N'aec4f583-d747-4bee-ba6b-e89cdb822bcc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16436, N'Column 3', N'744f28e3-c4d0-490e-bf59-300bab4dcef9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16437, N'Column 1', N'b4b63bac-da29-4b51-97dc-2e7819f7baea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16438, N'Column 2', N'c115dffa-6d51-4ee3-8e4a-d6c1851d24bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16439, N'Column 3', N'1433de21-50f8-4a7b-a52e-0ed87717d13a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16440, N'Column 1', N'905729f8-da43-4bab-ab38-e818824fca52', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16441, N'Column 2', N'6861e966-08c4-4985-9510-813251f0c01a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16442, N'Column 3', N'f2a3bbcf-49ab-4162-8fba-7a50a1a9409d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16443, N'Column 1', N'bb559d5d-074e-444c-8fed-8981ac6f303c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16444, N'Column 2', N'fdd45871-903d-4345-99cf-e20f2ffd6a72', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16445, N'Column 3', N'8e601641-0812-45f2-b19a-25d2b8d958a8', 0)
GO
print 'Processed 1300 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16446, N'Column 1', N'e5cb3b81-bb1a-4cc0-8130-0f7129252134', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16447, N'Column 2', N'74560af2-51ef-44e5-adde-97919c4d3f2b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16448, N'Column 3', N'fb2ff577-e118-4dad-b521-9be877a00f2a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16449, N'Column 1', N'7934c000-7ccf-4888-bb8f-4f3beffcb8fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16450, N'Column 2', N'9826203b-f21e-4ff8-b6a6-d69b52179247', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16451, N'Column 3', N'3ba9efce-fc15-45ed-b9fb-aaf4c82014dd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16452, N'Column 1', N'd8707aa4-7a42-4e2e-82a6-1268919ca25a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16453, N'Column 2', N'cb9104f7-ffe0-4cee-88ac-ede7988b80b3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16454, N'Column 3', N'3441be4f-a02c-4459-9aea-fd24c9efff66', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16455, N'Column 1', N'0850beae-51b6-4c3b-a200-4d24b85ed465', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16456, N'Column 2', N'708b4d7a-4695-4906-aec0-d707dbebaacf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16457, N'Column 3', N'23c087e1-da33-4807-b095-6657297d75c5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16458, N'Column 1', N'551a82f2-30a1-4963-b50b-b9ad635a747a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16459, N'Column 2', N'589b7ac5-60dd-4fee-a36d-a9e2b8df8e80', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16460, N'Column 3', N'ff59fd18-e80f-4e06-948c-1560d355c870', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16461, N'Column 1', N'7d828f9b-8c31-4923-b974-2c8ab84af6b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16462, N'Column 2', N'7ffecc03-de79-434c-8361-f81813ce67d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16463, N'Column 3', N'1a4285de-e9b9-4c19-9af0-62b7a3d62d70', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16464, N'Column 1', N'e8c8ed33-d80c-436f-8a0b-f3c6551fd038', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16465, N'Column 2', N'8a701d61-0c88-4002-9488-0bb3ec172b82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16466, N'Column 3', N'09125c9b-ce60-45e0-a467-73da679b59e9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16467, N'Column 1', N'45e28c83-9d2b-4bce-8ee7-35dd0020e45c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16468, N'Column 2', N'ac7fc574-4333-4593-b9ca-c0cb16d53d6d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16469, N'Column 3', N'4064e89c-35a7-4b08-804e-1060aa1637fe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16470, N'Column 1', N'69cbd5f1-b3b5-42ae-99a6-1d24d7e1d825', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16471, N'Column 2', N'c976152f-19cd-434f-97fd-05ce7ed9185b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16472, N'Column 3', N'10342c66-5333-45b3-98e2-b19cf73da273', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16473, N'Column 1', N'69c34c5b-3423-4fa7-a105-99e5766fc58b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16474, N'Column 2', N'bcf03128-19b0-40ea-8660-cab96dd3f0b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16475, N'Column 3', N'c9e338b5-2657-4e80-9c68-aeb6cbeb6cc2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16476, N'Column 1', N'50e9c162-34b4-4de7-850c-d61ffa447b21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16477, N'Column 2', N'bc4d3ff3-cd81-4c9b-8611-5d07cee41663', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16478, N'Column 3', N'30927623-7cb7-4099-a1fc-e5a76aa6d5d7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16479, N'Column 1', N'f9db29f2-608f-450c-8fc0-4452846cbffc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16480, N'Column 2', N'5747e05f-f3af-4e67-b4af-b83866d30ec5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16481, N'Column 3', N'b6182d1a-b8ae-4b58-97d4-26bbbe1b3c55', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16482, N'Column 1', N'0951d49f-26e1-4606-8f4c-d5f91f897e9b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16483, N'Column 2', N'25a777f7-6a86-4ac4-bfff-fc46f1ba0fbd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16484, N'Column 3', N'76f9b92e-053d-40ed-82f7-3f01abb420a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16485, N'Column 1', N'757a859f-ea39-42e3-bca8-18171d105ed5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16486, N'Column 2', N'da4df49c-4e03-4744-b26e-e074de25dd17', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16487, N'Column 3', N'979fe805-5935-4d7f-9344-95c22d82859e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16488, N'Column 1', N'b9c19dea-cec6-422f-a131-fd1bc3ae5ed9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16489, N'Column 2', N'6304a902-29cd-4b7c-bb73-1138b82a1678', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16490, N'Column 3', N'e0c61fcd-dc74-47cd-aba0-2d00297c65f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16491, N'Column 1', N'84b68878-94f1-47d8-ade6-2d37f236b9aa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16492, N'Column 2', N'891535d7-95d0-4fd5-b080-fc2c4f6fb7d9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16493, N'Column 3', N'774c2759-e274-4df7-ab13-f1facb467fae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16494, N'Column 1', N'299038d2-4f12-4471-8bc5-1c3cd15d5617', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16495, N'Column 2', N'30be86ba-a426-460f-8394-586ffdd437d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16496, N'Column 3', N'6efbd4d8-765e-4ddb-a444-06e9cd1aa7fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16497, N'Column 1', N'aff5ac4f-827a-48d1-a7ab-d37a235386b3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16498, N'Column 2', N'707c5309-e2bf-4997-a695-f2bd80eda67f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16499, N'Column 3', N'85c2641a-875e-4fc4-809b-34862eeed7f6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16500, N'Column 1', N'4a4ce55e-a542-4469-9f5d-879121825f64', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16501, N'Column 2', N'a9f151ed-de42-45d8-89d4-f616d7fcd2e9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16502, N'Column 3', N'baeecd63-d282-4cb7-96f2-4cc5bf642841', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16503, N'Column 1', N'e78a91ff-b289-4fcf-b57e-748b03e5f926', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16504, N'Column 2', N'5105955d-6883-41a4-b388-49a996e2342b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16505, N'Column 3', N'cd8b3223-216a-4f48-aac0-790cbb7ea051', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16506, N'Column 1', N'56e6cbc4-3603-426b-811f-36ab06b36550', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16507, N'Column 2', N'1c77b6d6-3c5d-441e-9840-b60be18e8161', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16508, N'Column 3', N'3e4fd4a3-5c00-4dcf-826b-e412512d0901', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16509, N'Column 1', N'140b1d81-fdcd-44c4-83d2-d4294a8c7c60', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16510, N'Column 2', N'2f350494-eac6-4e7a-a1c7-f50284485a00', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16511, N'Column 3', N'27b8e7c9-ccc7-462e-9e15-a5c07be7921d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16512, N'Column 1', N'40238f80-f384-4cab-9fde-cb9b5edf8a2f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16513, N'Column 2', N'd1c266be-8221-4fa0-99df-d25241180693', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16514, N'Column 3', N'e04b732e-d188-4b20-bc51-9a9e4eea4b7b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16515, N'Column 1', N'86e40002-c753-4f39-8229-1bbd14b73daf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16516, N'Column 2', N'6723217f-d586-4e79-ba99-3c23d0d7456a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16517, N'Column 3', N'01d98658-5e2b-4a6d-90ca-25e8dcb689d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16518, N'Column 1', N'aab17df5-3b35-4ff9-b98f-c396aed2c5c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16519, N'Column 2', N'b768b25f-3a92-4716-b9fd-51fc54dad6a6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16520, N'Column 3', N'f0c4d5c5-4bba-4c2b-8f74-94013b115b8d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16521, N'Column 1', N'7ccc345e-5d43-48c5-bc4f-d34bee3a1cc6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16522, N'Column 2', N'220466ec-a27d-4316-82e6-482611ad06f4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16523, N'Column 3', N'b430aa7d-cda3-4f49-bb1e-daea45bab1ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16524, N'Column 1', N'e5f627a2-6562-4925-9e1a-80093e31d818', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16525, N'Column 2', N'0eed9ec2-4e59-4486-a86e-d31e22ec450d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16526, N'Column 3', N'2a3f2a1d-43b8-430a-ad20-5f5a3c57043f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16527, N'Column 1', N'0a0d36bc-66ac-4cfc-9ec6-67c52515e158', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16528, N'Column 2', N'2cee1fb5-f7bd-4a95-a73e-bd6917928a53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16529, N'Column 3', N'3ea4bb89-1d85-428f-b75c-afae0f9e43f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16530, N'Column 1', N'6d133786-c8dd-45f7-af9c-2dc37f044958', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16531, N'Column 2', N'2a099bd4-9be6-4a66-9e0d-7713bb750c71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16532, N'Column 3', N'b1a015de-7476-4b3f-8104-15e113823aff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16533, N'Column 1', N'bcea00f4-19b5-460f-bf7f-2f25659e65d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16534, N'Column 2', N'42354f17-f728-48a7-b5c5-8ec97560b522', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16535, N'Column 3', N'5256df91-7936-46d0-b1fa-20b8b0949b1e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16536, N'Column 1', N'79fca96d-905b-4dd0-b933-66f66a7e1db2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16537, N'Column 2', N'a027781b-b0bb-43c7-a18f-d44f46824001', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16538, N'Column 3', N'26b91078-139d-4099-9358-04e9da171b46', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16539, N'Column 1', N'02beb4bf-d3e2-4ec8-8b08-aaa15ee7acb8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16540, N'Column 2', N'be903265-9ac6-44e3-9281-6fd7c72f7008', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16541, N'Column 3', N'0ac817ff-7329-44f7-a181-336ec24cef59', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16542, N'Column 1', N'15669c8a-f05b-45d4-a957-4f153c92c114', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16543, N'Column 2', N'a98e2ed4-3cc0-4d47-ba7a-67c3d1d463e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16544, N'Column 3', N'62dd659d-ad85-4c5d-a576-2831c47accad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16545, N'Column 1', N'6a720e2e-f2c0-442a-bb67-0d2951baa288', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16546, N'Column 2', N'737678f5-cebc-46d8-8313-d2551b9a82a7', 0)
GO
print 'Processed 1400 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16547, N'Column 3', N'cbf3bfca-393b-43d6-9a9b-7dc928a18059', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16548, N'Column 1', N'3e231163-d43b-4ca7-be9a-5a558d6424a2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16549, N'Column 2', N'018faf2c-aa25-4a83-b987-c816958dcd98', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16550, N'Column 3', N'05f973ac-3198-4e86-ade8-97d72f8b68dd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16551, N'Column 1', N'f347cd05-a3fd-43b8-9f80-420f0fc68819', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16552, N'Column 2', N'6fb221af-3879-4522-b61d-1908495ce216', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16553, N'Column 3', N'70811e56-1c42-4529-9aea-a2c16dda2dfb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16554, N'Column 1', N'c1000c7c-22fb-422a-a0de-50b9a0840646', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16555, N'Column 2', N'17433ffd-93bd-4c06-9b7e-2d005a0ca3e4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16556, N'Column 3', N'c28cd002-1071-4057-9c1f-3d371056db4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16557, N'Column 1', N'966cbbb6-c707-48eb-a860-5a1ace9f61b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16558, N'Column 2', N'4aeee442-6ddb-4775-9e78-f38a1f2e4bdf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16559, N'Column 3', N'b53efaf1-7ac1-4b8a-b647-036eddca6208', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16560, N'Column 1', N'9454b0ae-800c-4313-8fa0-7fd6696eae0c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16561, N'Column 2', N'd89baf6d-35e4-4fdd-96b2-5484296e2ef8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16562, N'Column 3', N'0b32bda8-ee33-4097-be8f-07af023532e3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16563, N'Column 1', N'48665e0f-ba78-4af2-a66f-bf5117e1c6b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16564, N'Column 2', N'1201f431-0a86-488a-915d-15e970a2fc0a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16565, N'Column 3', N'b820e24d-161a-4c13-8ac2-8f9e80b8ad4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16566, N'Column 1', N'dd9077d1-e9ea-4c0f-9ff5-be5333c9105e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16567, N'Column 2', N'91a90e9a-7d69-4a61-b7ac-d54a3a04113a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16568, N'Column 3', N'0f484203-8b82-4712-bff6-6f8cb5e6c67f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16569, N'Column 1', N'dcad52b7-daba-471f-b980-dd7cfc2b341d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16570, N'Column 2', N'42e41c55-f9dd-47ff-b3a9-7b540c7a90e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16571, N'Column 3', N'182e2385-a768-45e2-b5a3-2111536d9c06', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16572, N'Column 1', N'12a5ee4a-85eb-496b-b05d-39d19ed20161', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16573, N'Column 2', N'2385f1ee-9944-4fa8-820c-0ab3f3bcd663', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16574, N'Column 3', N'f0a3d9ae-ec14-49d2-befa-0fd76b96def5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16575, N'Column 1', N'f1c7bc02-7422-480a-b2bf-43a7e871e90b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16576, N'Column 2', N'743d63e4-82a9-41ed-9163-bf7474354d2e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16577, N'Column 3', N'26c790ea-9a3c-43f2-9e62-35c18387feca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16578, N'Column 1', N'a288d2e0-f476-494c-be37-61965d248d35', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16579, N'Column 2', N'ec645ec1-fc21-45d7-be72-9aeea62a6ece', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16580, N'Column 3', N'b4f733b0-f16f-4204-ae83-2d6887c0ff99', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16581, N'Column 1', N'0e00cd2f-866c-4863-9b7a-01b8eefe9ffe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16582, N'Column 2', N'c14548f3-73f4-4b75-9c1a-fb80bf811557', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16583, N'Column 3', N'6706524c-b8d1-47bc-81fc-8d8364be9ef4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16584, N'Column 1', N'fdfdf454-eb12-4946-b09e-0cc4c5950c47', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16585, N'Column 2', N'4bee9aa6-e1c1-4417-9d4f-f9c1abbde7a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16586, N'Column 3', N'aafd3fdd-483f-4af1-9a9f-e3baaeb63d24', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16587, N'Column 1', N'ed1444ae-9473-403e-9a2d-58a9578ad27c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16588, N'Column 2', N'f212a0bf-b717-4414-b7fa-4eb9f3661170', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16589, N'Column 3', N'cd9118b3-94af-4185-9c25-dd53ee7f0acb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16590, N'Column 1', N'8d2f03ec-10e0-40ac-8cc1-69ba4a6d8695', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16591, N'Column 2', N'fa3f1453-fa5d-4ec4-8c4e-60c6c723b809', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16592, N'Column 3', N'2c9d2ab0-7e8d-4bb3-89a4-2e5a332cfddb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16593, N'Column 1', N'43adaef9-2838-48ed-8190-82fa9e55bc71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16594, N'Column 2', N'dabff673-5144-4b5c-8ff9-399e0a56a22a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16595, N'Column 3', N'48c9297c-4f41-40dd-80ff-fe0a44c432d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16596, N'Column 1', N'392ebf76-204c-4506-b4d6-ab6bd93f5648', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16597, N'Column 2', N'46223b80-a48d-4fa7-962a-3f644062688d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16598, N'Column 3', N'77535d5f-2a3d-4f91-97ed-815b446f04a9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16599, N'Column 1', N'1162b804-85bf-43b2-a810-895101568cfb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16600, N'Column 2', N'e740a7d3-6cfd-4f97-a58c-9576991f1f6e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16601, N'Column 3', N'be0bfa80-d36d-468e-9023-0db2bbb8b4fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16602, N'Column 1', N'961462cc-e9ea-4472-8f0f-b9015613fbf1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16603, N'Column 2', N'47981581-ae8f-44c8-b578-d6c7430de9ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16604, N'Column 3', N'41cecd8b-b7c3-45fd-b8d5-8ad80fbbcfc6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16605, N'Column 1', N'1e546ff4-5cb3-4e43-89bf-8fdb5c25a577', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16606, N'Column 2', N'f3ec7e1e-08c6-4f25-b365-c4d71a7c8a0b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16607, N'Column 3', N'3434b0b0-251d-4fe9-bf3d-af9ca706ec3c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16608, N'Column 1', N'e001a5d3-2ea0-49ca-8aa9-017948eb3a97', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16609, N'Column 2', N'3a81c199-ba5e-4460-a84b-1589d19d5c4f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16610, N'Column 3', N'c5997f36-3c2e-44ef-b40f-f636011792f6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16611, N'Column 1', N'80856e0e-0d49-463c-ae55-57de709ad941', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16612, N'Column 2', N'3d263cee-0c65-4673-9fce-154d22a4bfaa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16613, N'Column 3', N'1a294bba-7dd6-4b8e-80c2-2d0b2f62be5d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16614, N'Column 1', N'b9ed18cb-2b74-4e2b-8618-d0dbc109df9c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16615, N'Column 2', N'5f3ebbfe-52b7-4329-be84-798db0192ad7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16616, N'Column 3', N'bff5633d-08c9-4230-9510-1899454406b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16617, N'Column 1', N'398a1b81-367b-47cd-aed2-9edbcf8a51db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16618, N'Column 2', N'9c66d146-5d85-49dc-9164-fabae2a6f936', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16619, N'Column 3', N'ae100962-5573-4339-a999-346e99d104de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16620, N'Column 1', N'bc289492-48e8-452d-8db5-e998f201f50d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16621, N'Column 2', N'fca89102-e20f-46dc-9429-94698bf4a349', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16622, N'Column 3', N'b1f62589-c0d3-4064-8cf7-819b4893169d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16623, N'Column 1', N'fdb06441-dc6f-495d-b8dc-f6593a601590', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16624, N'Column 2', N'0ab07e37-3d11-48c6-9291-7d1c67b7e76d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16625, N'Column 3', N'ffd90dbc-2a54-404c-a861-ccd5102cec39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16626, N'Column 1', N'45d5e872-43a2-4ab9-85de-f68652dfa567', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16627, N'Column 2', N'032ebd5b-717c-4482-811c-42820f8cd9f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16628, N'Column 3', N'6e90d93a-5cf5-419b-88e1-d9591dd527fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16629, N'Column 1', N'1362ca1a-6071-4838-bec5-a5ba2bbc5304', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16630, N'Column 2', N'b170ee10-428c-4e38-ad3d-1735cc549abb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16631, N'Column 3', N'795e0d7c-5851-4e30-8ea6-d333e7fe4ba3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16632, N'Column 1', N'e889c82e-fdd4-4968-9ec3-243dd5486093', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16633, N'Column 2', N'5592d2d2-468e-4f62-8611-c57c136f09cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16634, N'Column 3', N'95bb704a-4319-49ac-ad93-d50fd5643a6d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16635, N'Column 1', N'7b8770b1-03b9-4802-a6b8-7670b601f05f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16636, N'Column 2', N'1670095a-4cf5-42af-bffb-350611495308', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16637, N'Column 3', N'332408e9-b84e-4c6b-a7eb-d399392100fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16638, N'Column 1', N'a4cf4cd1-4aff-453f-b79f-2c37a3273f20', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16639, N'Column 2', N'11ddbe8e-3cf6-4811-8b46-1fa2996f66e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16640, N'Column 3', N'9581cf1e-40d3-4db7-b1ed-20c4c6e86de9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16641, N'Column 1', N'b960298b-96f1-4f0d-8e89-f544d045dc92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16642, N'Column 2', N'b959f183-47b4-41ad-8479-948d1d29b084', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16643, N'Column 3', N'cb8c1605-22ff-4b31-8ccd-d0d7a8166577', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16644, N'Column 1', N'17373207-619c-4a6a-85ee-76ec8fa1405e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16645, N'Column 2', N'0f80a268-a360-4981-8346-7327e8ebfd30', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16646, N'Column 3', N'a91a37bf-0a76-4324-b2db-be87b01f24be', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16647, N'Column 1', N'bff2b1c2-f261-482f-9006-cbc79173e52b', 0)
GO
print 'Processed 1500 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16648, N'Column 2', N'66744155-b107-4947-9ace-5de0f658bb80', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16649, N'Column 3', N'5d858c27-10f1-45e7-910a-57dc115ac1c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16650, N'Column 1', N'0fca8496-d437-4f17-9f0b-d7b49f3ad2bd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16651, N'Column 2', N'b1094ec9-1051-4715-98e7-a319eb7be892', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16652, N'Column 3', N'01cc5137-4713-4834-9a74-df5ff3a6efcc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16653, N'Column 1', N'9efea86f-2c8a-4c2f-8b22-2ce187693801', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16654, N'Column 2', N'7948417f-6709-4b55-8900-1c554c80ab6b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16655, N'Column 3', N'2964a12b-5cf2-44dc-9e53-acd4846e8aca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16656, N'Column 1', N'7967eb5a-e6c8-4634-9f74-75ed9461a01c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16657, N'Column 2', N'c2b381bb-becf-4eaa-a9f6-ee3a74a0392d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16658, N'Column 3', N'e2089c44-48e8-4c4e-8dbd-b3010073a284', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16659, N'Column 1', N'47e1f5d7-1b84-49c6-a429-885bd9f23946', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16660, N'Column 2', N'a6b298c3-c02d-4d88-b663-d06916366914', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16661, N'Column 3', N'ff898cdd-1fce-4ba2-b653-e3f5f7ea790d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16662, N'Column 1', N'0eeb7c4e-8fad-4229-8e87-75e653fcfd16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16663, N'Column 2', N'9489469b-e52b-4033-b4c8-b29e35c99069', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16664, N'Column 3', N'a548af47-a231-4adc-9c96-bb2fc920eb79', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16665, N'Column 1', N'5f3880d6-6603-4669-9bfa-e81bf2ed632c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16666, N'Column 2', N'f9245a04-9176-44be-9adf-ee2ba41df245', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16667, N'Column 3', N'de54ab28-1441-4e0e-8619-9dedc466e482', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16668, N'Column 1', N'ff3aee4e-cfba-4491-915c-b019ee43cd9e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16669, N'Column 2', N'd6c83fb8-c36d-4b27-9d66-ae22c4d8597e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16670, N'Column 3', N'ea65f82e-aa06-4215-8717-14c6f48f5888', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16671, N'Column 1', N'a59da035-296f-4c08-a638-2857e218f42f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16672, N'Column 2', N'f6fef12e-913b-4c95-ae13-b11d077727b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16673, N'Column 3', N'9f34f1cf-4a38-4abe-97fb-9e2ac20e8600', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16674, N'Column 1', N'161bde5e-a06a-4bca-9f71-a19061b389d4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16675, N'Column 2', N'0444a8ae-b938-42e2-a855-a15513129220', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16676, N'Column 3', N'294e910f-137b-425d-b4e7-d47e3f285d42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16677, N'Column 1', N'031165da-07ae-4493-8f80-e6ba4441c18a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16678, N'Column 2', N'0b2cdda5-e9f4-4dcd-8a78-0d64f0f1a57a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16679, N'Column 3', N'6e97fa16-9981-4873-a57a-53006de60c99', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16680, N'Column 1', N'8d5a267d-85c1-426c-9faa-98349889dedf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16681, N'Column 2', N'44b4acf0-14e0-4693-a004-e5b2bfc5421f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16682, N'Column 3', N'785ab117-94ea-45fa-89d6-078eab0010e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16683, N'Column 1', N'4ac280d7-4420-47ef-81a6-9f849b91d48f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16684, N'Column 2', N'68e89f2a-f77c-48ce-ae7a-36a8280a37f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16685, N'Column 3', N'0560351a-6762-44c3-bd05-b556eeb65862', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16686, N'Column 1', N'2a5f7061-e042-4c68-8c31-c33fe54e162d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16687, N'Column 2', N'18b3b591-d8a9-4bd1-836b-216ee290b4d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16688, N'Column 3', N'a229c18e-1f2b-4a52-8f29-fbbb399902b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16689, N'Column 1', N'4e13d5b5-26e4-41c4-879b-fc98351458e4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16690, N'Column 2', N'132c3e92-0e70-487d-8ea6-f441865faf06', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16691, N'Column 3', N'5abf9400-5ea4-4971-887f-a09269e8c456', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16692, N'Column 1', N'054e104d-a1b1-45f8-aeda-57c36a9d293b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16693, N'Column 2', N'f62768ba-618d-4ac1-807b-bb31ab612452', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16694, N'Column 3', N'276e7eee-aa4a-4645-8c34-5a4fa7642233', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16695, N'Column 1', N'060c4b89-616a-4e96-a4dc-5a68e6100f98', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16696, N'Column 2', N'7744e2e4-ee1e-4cdc-a56f-85682f4f6fd6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16697, N'Column 3', N'1e2ce909-e0d1-48c3-8bc2-9a80308c1c95', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16698, N'Column 1', N'cb4f2a27-1ef5-4888-bbc6-e52d9317a2e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16699, N'Column 2', N'f1c3ce98-b5e6-4266-8e7c-0243415ca7cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16700, N'Column 3', N'b38e9ae4-0f36-491b-8aa5-9d77f8c5d558', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16701, N'Column 1', N'6df7d943-12a3-4c3b-a30f-f9fbd07765b6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16702, N'Column 2', N'd7b96fa3-c0c4-44f6-a579-db6fdc22fade', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16703, N'Column 3', N'f2acb5af-cdc1-42e7-ae63-ccd76dac8476', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16704, N'Column 1', N'f0df6d6a-d3e2-4e50-b4f5-0570046313d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16705, N'Column 2', N'717efb3e-23de-4fd5-a531-319248fe6a50', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16706, N'Column 3', N'4c73c130-6d9f-4f79-ac41-8ec5d136cfc9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16707, N'Column 1', N'9399a138-0a18-412b-aa36-16c70c3d3842', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16708, N'Column 2', N'77684235-4e64-4537-975b-f94ef146d294', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16709, N'Column 3', N'8053f572-c294-494c-8865-40691d895589', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16710, N'Column 1', N'ba049929-e2e0-4f77-92d7-ce94a18791bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16711, N'Column 2', N'26c9770c-8b16-4d4e-98a3-c4ec27e235d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16712, N'Column 3', N'8a467a50-44c5-4a2c-927a-19bdd22fc3ae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16713, N'Column 1', N'37695503-1674-497d-afdd-8142fd5b769e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16714, N'Column 2', N'c0ab73a3-038d-453c-8479-ac32678caf21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16715, N'Column 3', N'a88ba21c-8e6d-463b-af59-8e72d3d9a433', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16716, N'Column 1', N'20ee876a-5bad-4e4d-a25e-c4aa4ac4f7ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16717, N'Column 2', N'a0e2495f-fc21-4554-9b23-c57080400a11', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16718, N'Column 3', N'0780b7e0-b8ec-4412-ab6f-0d1c0cafd0df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16719, N'Column 1', N'd42ab7c6-17d4-4b58-88d9-4528f76d38a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16720, N'Column 2', N'7f2387c2-76fe-42ab-861a-1b0a65bbfdcd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16721, N'Column 3', N'85e36c4b-b42e-44ef-a44f-fb51a625d352', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16722, N'Column 1', N'ac9975e7-8da0-413d-ad13-07aaa6a5179b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16723, N'Column 2', N'afc09776-4128-4217-8cde-7ff4058d3661', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16724, N'Column 3', N'4a90f060-5ecc-4a49-b256-a747b3b38028', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16725, N'Column 1', N'eed9ef47-abe1-470b-845d-3ef4a6828c40', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16726, N'Column 2', N'ea37c01b-f62f-41d9-85e1-332bb335db79', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16727, N'Column 3', N'756d393b-0cda-4001-a6ae-5d478a1e1573', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16728, N'Column 1', N'85a4254a-bf7e-4f79-aec0-11d6b9ee9db6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16729, N'Column 2', N'25bd0030-a3fc-4d2a-85d7-4d93994ee4ed', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16730, N'Column 3', N'024643f0-6f26-4177-b00c-81eb6410cac8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16731, N'Column 1', N'e8a53065-e167-464a-a195-9e4d20c7aece', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16732, N'Column 2', N'c7333f12-acaa-4a50-8d7d-10bee76979a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16733, N'Column 3', N'f7ac94dd-bf57-4d9e-bb57-342ff024628d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16734, N'Column 1', N'388bf8c8-5f2d-4ba1-a24f-59ad00d7d32b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16735, N'Column 2', N'54ab466c-7e20-417b-ad45-5fa3e6a9a69f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16736, N'Column 3', N'f651e6e7-2b34-43d8-afed-27aa62a6d946', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16737, N'Column 1', N'cf0f34e9-d0f7-4d5a-abe9-f1daa6e59e5f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16738, N'Column 2', N'196dfdb5-769a-444e-8ba9-93e634fd4537', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16739, N'Column 3', N'88c34c9e-1396-4815-8704-a34bab025ed9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16740, N'Column 1', N'23425954-24eb-4836-910f-87f6d4f036e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16741, N'Column 2', N'c1ce460a-05a4-43dd-b582-5ed8597eef2f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16742, N'Column 3', N'f8aa23cc-bf38-4d75-a19c-a1d1faa8bf8a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16743, N'Column 1', N'7c7f23c9-02db-4a3d-8cbf-d9726d70ab56', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16744, N'Column 2', N'96970793-b294-42bb-ad84-114334cbcb70', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16745, N'Column 3', N'71ef12b8-da3a-4563-be10-b220b7a444b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16746, N'Column 1', N'809bc98a-c817-4b92-ac63-6f8516c9f352', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16747, N'Column 2', N'a02882c4-e4dc-4bf8-9def-31cdb684c587', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16748, N'Column 3', N'45eaee0d-29b0-445a-b4fb-dceb7096976e', 0)
GO
print 'Processed 1600 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16749, N'Column 1', N'5ba583ee-8d4d-42b5-a939-5429638f6808', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16750, N'Column 2', N'7bc01b9d-f22e-4c96-a646-c8a3d132d60d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16751, N'Column 3', N'85dd5c18-a7c8-4ff4-8545-0cad33991f18', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16752, N'Column 1', N'bd92a499-8a4f-4c81-a31d-20d0fe8c740a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16753, N'Column 2', N'99676864-37a8-485b-87b5-97a7d293d898', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16754, N'Column 3', N'18c6d0cc-e448-4687-800c-c095ab5723b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16755, N'Column 1', N'04672799-d04c-4246-9635-eb8263cd2cc3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16756, N'Column 2', N'5d5ff37c-75bb-4c75-a9a4-06169ea12ea5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16757, N'Column 3', N'87221d5f-21a0-4fac-afef-abf69ea3a1b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16758, N'Column 1', N'1a825de6-251b-4e82-84f6-4017779cf810', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16759, N'Column 2', N'0d11cfb6-1439-4a60-a19a-f93afe6d7080', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16760, N'Column 3', N'd9641469-45b2-40a9-a3ce-8bf1a8fff71d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16761, N'Column 1', N'3928fcf4-9787-4285-86c4-0f5a3a5ffa6c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16762, N'Column 2', N'212e5eef-2667-4f7c-b454-44a457f6dc9a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16763, N'Column 3', N'dc565761-6b6d-4700-a2f6-e85fafb3ac2b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16764, N'Column 1', N'3af14bdb-2927-461f-b550-7fe21cf7d266', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16765, N'Column 2', N'5b464fbd-9faa-4d58-9298-82e414ea3e53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16766, N'Column 3', N'4774914a-19b2-4176-b86d-e2a66569a145', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16767, N'Column 1', N'd4bc5592-96be-4949-9dc1-47120bb48084', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16768, N'Column 2', N'01529b3c-f438-4b71-90dd-3e77f429b76d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16769, N'Column 3', N'2d0d34f6-82c2-464c-8355-601b5c6fdc55', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16770, N'Column 1', N'9506ab3b-394d-48e0-9e05-4dcac7745b9d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16771, N'Column 2', N'28b71ba1-6918-43ca-b290-41dca8b518bf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16772, N'Column 3', N'a49d7987-57f7-4cef-b39e-e3f3f9150072', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16773, N'Column 1', N'eccbcfd9-0a62-44d3-bf18-5fcc9dd92638', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16774, N'Column 2', N'a7ea2131-6487-4f38-ba67-741ec6bc0c0a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16775, N'Column 3', N'5de30ea0-c13f-428e-ac4b-f1edb1a059e8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16776, N'Column 1', N'75c78225-d295-4a92-9cc3-107f8efdb3de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16777, N'Column 2', N'57990bb1-a878-4fba-8bee-f4da1e19ec07', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16778, N'Column 3', N'4a13dfaf-bead-48d9-be43-625933520223', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16779, N'Column 1', N'189cda5d-3835-4748-a79f-993626e38f90', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16780, N'Column 2', N'8faeb724-157e-4f8b-9764-bdb3e6cb5f8e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16781, N'Column 3', N'ff6a3fbe-bd84-4bb1-ba09-d9e072f89dd0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16782, N'Column 1', N'61e2a6fa-933b-40af-bc51-75a6c946027f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16783, N'Column 2', N'11cb4656-4e56-41c3-b9ac-aad4fdb72674', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16784, N'Column 3', N'0c728262-b88c-400c-8b76-a1ff4505bcc1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16785, N'Column 1', N'e4e68954-f487-4efc-84f2-0e749c118201', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16786, N'Column 2', N'b385a9c7-0f5a-45cc-b707-87976e078293', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16787, N'Column 3', N'f282fed3-b0d8-47fc-baff-748308bfba4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16788, N'Column 1', N'7522d28e-397f-4c3a-b910-9d4d26061176', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16789, N'Column 2', N'4a7e78b6-1ddf-478e-87e6-89e2e3e14d22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16790, N'Column 3', N'1ce2fa14-3e2c-4f6e-b5bf-2ac3639172c0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16791, N'Column 1', N'2f6245e8-9299-4cdb-9323-a540df08b8af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16792, N'Column 2', N'4ccc9ea2-8f90-49dc-b421-ae227b3a4d4d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16793, N'Column 3', N'ad4f3308-d82f-423f-91e8-f76f54cd170f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16794, N'Column 1', N'df480de1-cbdd-4996-a0b4-c177249c1445', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16795, N'Column 2', N'293d0f1f-c52a-4929-9885-416ecdd792d4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16796, N'Column 3', N'05725862-c631-4f77-a73d-fd5093321534', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16797, N'Column 1', N'71e2de3c-aa15-49ed-9c67-e3128c4ca91f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16798, N'Column 2', N'adda8ecd-182e-4775-b333-5a1e866a8072', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16799, N'Column 3', N'b40ea421-a2c0-4601-b01f-5a7acb9aa33f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16800, N'Column 1', N'7d838c5a-351b-4de8-b343-3ebe8cd6c23c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16801, N'Column 2', N'0f242dc6-e1cf-4ec5-bfbe-3df69317edc3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16802, N'Column 3', N'fa12e23d-6b12-4d2e-90e2-0f5a016950f8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16803, N'Column 1', N'24573d8d-cc7d-4691-9894-b4246fbfea93', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16804, N'Column 2', N'e79a54e9-9db9-4a1d-a17f-039bbdc41223', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16805, N'Column 3', N'ecb2761e-13b3-426b-b8b8-e914134b75b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16806, N'Column 1', N'fd5ee778-7354-4e94-95b8-59ca7aa9fc65', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16807, N'Column 2', N'4d40cebf-3f46-48ea-8398-79468694a078', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16808, N'Column 3', N'b1dfdd2a-8be8-4767-a6e7-c43ada9d066a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16809, N'Column 1', N'9e26d861-67bb-4df8-81ff-d41b468e410c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16810, N'Column 2', N'88da4701-e088-4186-a1e1-359de40fcd0f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16811, N'Column 3', N'b158b887-db83-419d-baed-08d12002fb19', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16812, N'Column 1', N'79330acb-d965-4fc4-815d-7700251da22c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16813, N'Column 2', N'd0dbaf3d-0239-4f25-922e-a79f067c1196', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16814, N'Column 3', N'90d6b335-247a-4940-b498-6beeddfe447f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16815, N'Column 1', N'0c5eda31-d646-43d3-8f37-5a45bed0c83a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16816, N'Column 2', N'37c93b1a-0bae-4644-a938-752fbc0462b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16817, N'Column 3', N'9d9da0c4-53ab-46cb-8923-c2063bde8bf9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16818, N'Column 1', N'5306b3ea-7f52-4ad9-813e-350ecc152b0c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16819, N'Column 2', N'798ee9aa-adfc-43a4-8774-8cfb4efc441f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16820, N'Column 3', N'a1da359f-3d35-4f9a-a172-e9955c94a89a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16821, N'Column 1', N'515dbb10-01c9-41d0-ab5c-32c18703869b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16822, N'Column 2', N'683f1f4d-61ab-4b55-83cf-1d6bf7c5135b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16823, N'Column 3', N'eda2d16e-373b-4ff7-ae1d-9784277edf4b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16824, N'Column 1', N'da1df71d-67a2-46b5-bf45-8985e2b609df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16825, N'Column 2', N'582d3154-0516-425b-9894-9971ff0057af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16826, N'Column 3', N'f7a133d3-b034-48fa-881b-c4fd7f955136', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16827, N'Column 1', N'a5681e3e-d483-4c78-aa7f-efdd34981587', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16828, N'Column 2', N'0ee8a688-954e-4cbf-b768-7ae778c22142', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16829, N'Column 3', N'1896430e-67d5-40a5-91e1-df7d38acd9b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16830, N'Column 1', N'96300468-7647-48b9-9245-878a9dd19926', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16831, N'Column 2', N'f5b8b5dc-7520-4390-b094-6541090d3510', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16832, N'Column 3', N'a06f9c96-219d-469c-9873-1ce4ca7c2d2e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16833, N'Column 1', N'183d4108-cb53-445d-8bc8-f4a3af3d1ee5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16834, N'Column 2', N'02578b31-0f06-4858-a4a5-1fbf4b490c34', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16835, N'Column 3', N'13f2faae-1325-4c91-8495-735b6b14627b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16836, N'Column 1', N'19c2bd6b-f1de-44b8-b9cb-19167d06fbc8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16837, N'Column 2', N'f040f811-5287-4e31-9202-be09e1a98275', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16838, N'Column 3', N'6f35d8f9-13bd-4d04-87c6-07a94023dbb2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16839, N'Column 1', N'4850aa20-153f-4763-98a5-3d97cfcd625e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16840, N'Column 2', N'3f5f893a-e2a5-4c91-99a8-5d8c97fbb960', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16841, N'Column 3', N'e4d71ba0-8f1e-450f-98cd-3a44bdb42884', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16842, N'Column 1', N'859712b3-0b52-45bc-8664-5ee62a4c695c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16843, N'Column 2', N'f508003b-d212-4b7c-bfc9-9dba84b8b216', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16844, N'Column 3', N'a0db625f-65e4-4530-8388-f8be963e2250', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16845, N'Column 1', N'2b412b7b-c9ea-401e-81a5-fabc69a81420', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16846, N'Column 2', N'401c5521-03f7-4ce5-a7d1-9ffc586722b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16847, N'Column 3', N'84eb416d-0e54-4357-8ddf-e140ddfb1397', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16848, N'Column 1', N'e0265145-ff20-4e4c-ae41-f7c05aad58e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16849, N'Column 2', N'7a3bdde9-dfdb-4458-90aa-6e75068118ec', 0)
GO
print 'Processed 1700 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16850, N'Column 3', N'0c1c9b2f-d931-49f9-a765-dfc06923ee7e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16851, N'Column 1', N'7c1316bd-a699-4be1-a447-7e8852b0b2fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16852, N'Column 2', N'194b5ff6-414f-47c7-91c5-dbedc7ae8662', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16853, N'Column 3', N'6b2b37e5-9bc7-4379-b049-62be5a018ae0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16854, N'Column 1', N'1114d6c7-377d-4e58-a216-c9648344e1fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16855, N'Column 2', N'38ceecf2-f9f4-4307-8fe3-4230f6bc4a37', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16856, N'Column 3', N'efeb4101-d059-46cc-b1f1-331eb4de1bed', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16857, N'Column 1', N'2e891bc7-a0b1-47c1-aa17-e1c5cd4734ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16858, N'Column 2', N'42e88f3e-f1bf-44a0-926c-6b5f80272d7f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16859, N'Column 3', N'8dfbb4f7-14f7-48fe-a437-d31bf380609a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16860, N'Column 1', N'7f833342-1e39-42f1-8343-1b63578bc779', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16861, N'Column 2', N'e87c1f0d-fb94-4af5-96d2-a0374cf4941f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16862, N'Column 3', N'cf180b24-c274-4181-ac8c-243d8c10a216', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16863, N'Column 1', N'470e0406-cf89-4328-8242-74f4e9d98cdf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16864, N'Column 2', N'ac3ab4ec-3fbf-4d5a-8f36-0eee788474af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16865, N'Column 3', N'c3af43f4-d241-4b14-ab71-409d23211edf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16866, N'Column 1', N'f3dcffdd-f237-4755-ab93-5d7fe35f9082', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16867, N'Column 2', N'5bafad74-ca4c-4323-bf60-3343856e7972', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16868, N'Column 3', N'a4e4bf12-6f26-462e-902b-a5af107850d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16869, N'Column 1', N'80d57228-3fbf-4f07-b587-0599dd0d68df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16870, N'Column 2', N'c134efae-c456-473f-a0be-ad34e0869816', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16871, N'Column 3', N'2af85165-841a-478a-a083-b58168c167ea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16872, N'Column 1', N'5c614b68-61f9-494d-b58e-7a07cc481bff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16873, N'Column 2', N'0b936103-5b00-4398-b27b-3d4b201eada9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16874, N'Column 3', N'f03dd14b-de3f-400d-8f56-a1ca22ae96b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16875, N'Column 1', N'020cca9d-2c83-4ec2-be28-28523b78e18a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16876, N'Column 2', N'c7aaf959-af63-4b16-826f-5f10d94e1f32', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16877, N'Column 3', N'6a361369-d46b-4f5e-be27-137c1966ef04', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16878, N'Column 1', N'42b4e117-3397-484e-84c8-bb7254db9b9f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16879, N'Column 2', N'fad23dfe-b59d-400f-bdeb-58f282740472', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16880, N'Column 3', N'242d5acf-3d80-4ad7-9a9f-79d98435e0eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16881, N'Column 1', N'c070d2fd-d43a-4a23-95e5-455e51b04d20', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16882, N'Column 2', N'be4cfa41-0aea-4c99-baa7-20e3075b5ed5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16883, N'Column 3', N'5ba5ec98-bdf2-4e07-a1b6-cd057a8ee553', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16884, N'Column 1', N'eb4671cb-77a2-487d-9c52-f0cd72ff31b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16885, N'Column 2', N'30b8242d-0b99-4af7-853b-495a7af43059', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16886, N'Column 3', N'3e19940c-1be4-4124-8630-fb75466f9524', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16887, N'Column 1', N'389a0cef-967f-4c3d-90fe-be5c1dcfd3a8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16888, N'Column 2', N'bd3ae9a0-e79c-4fb3-98c8-224ca7b5b451', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16889, N'Column 3', N'b0fc98dd-4c11-47df-b90c-93e362482e19', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16890, N'Column 1', N'c1c5818f-44da-4b79-9c92-35ead51d5c68', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16891, N'Column 2', N'5a768b3d-5182-4e55-852d-8e8360037d0e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16892, N'Column 3', N'afd23480-dc7e-4efe-a260-980879da11b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16893, N'Column 1', N'34640e69-0b30-44dc-a6d7-6cec2adaec55', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16894, N'Column 2', N'574b8f96-5292-48a1-a05e-ff7003635253', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16895, N'Column 3', N'6ed744d4-de79-4d77-92e3-02bbbd411664', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16896, N'Column 1', N'2197dc10-471b-4e79-a032-d1c5ce9a7a54', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16897, N'Column 2', N'b008f322-a0c2-41f1-b991-e0d81957acd4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16898, N'Column 3', N'528f8d2a-265d-45b6-b8ea-4459fcaa51a9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16899, N'Column 1', N'f17a3f9c-24b0-40ec-ad98-1a37d40fc891', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16900, N'Column 2', N'7812f51b-e68b-491d-997f-98dacbf98f1d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16901, N'Column 3', N'03e6ecc7-9534-4bd3-89fa-cfeb218f7c03', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16902, N'Column 1', N'6dd1000e-4b90-4959-b8cc-c5d39c767462', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16903, N'Column 2', N'73fe795b-f38d-44ee-9a59-624197b5b5c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16904, N'Column 3', N'b24df290-5746-4bf9-8340-170f9eda4a5b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16905, N'Column 1', N'34148299-884e-4733-b590-0f87d1dcbcf1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16906, N'Column 2', N'7824f397-8b46-47d7-ba8f-ecc6e16b0919', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16907, N'Column 3', N'8f4fdcd6-4322-4022-ad5e-deafb04aad5d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16908, N'Column 1', N'e3af224c-6224-4f86-8ec1-acd2fee3d333', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16909, N'Column 2', N'ed09da47-f093-4684-8137-2a414cb19a09', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16910, N'Column 3', N'c033a0bb-ef64-430c-8bef-c5125fcd0fc2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16911, N'Column 1', N'38be671f-8e5b-4c02-b3d6-eff91c3a82a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16912, N'Column 2', N'8d675bf2-47a7-4b36-b806-c808374a90f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16913, N'Column 3', N'bf8ddc67-2a45-4810-9b9c-ec79d7336583', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16914, N'Column 1', N'8c177e7a-c48a-4dc0-8359-34a16fbc5f0c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16915, N'Column 2', N'67f42164-f306-4836-8cf7-5f5339540793', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16916, N'Column 3', N'c1cb034e-ef9c-459f-8b12-144ec1c401c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16917, N'Column 1', N'd77d3b65-564f-4d8f-b3fa-6924cc28c3b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16918, N'Column 2', N'812f4668-913e-4c0f-b6ed-539b524778de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16919, N'Column 3', N'cb784eb8-ab40-42ef-9572-42df81ef2665', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16920, N'Column 1', N'555973a5-88ee-4f00-8d0a-7146f10e00dd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16921, N'Column 2', N'907d8947-4847-4587-b03a-0427fabfe0ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16922, N'Column 3', N'926417d4-3d5f-4361-b299-d7b2d333f389', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16923, N'Column 1', N'4b7004be-4528-41a0-83f5-e2ad91637695', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16924, N'Column 2', N'b4b4ecd3-bf30-420d-aab1-536a8879864b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16925, N'Column 3', N'f0cda7ce-8b72-4ed3-b83c-93e0ecf7afe0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16926, N'Column 1', N'1a8a6935-569b-4e96-9dff-ab71f5736507', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16927, N'Column 2', N'4da6a0da-c78b-4e34-8990-767058fd24cc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16928, N'Column 3', N'625cf50f-73d3-45f7-ba81-cda0ce6cd5e8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16929, N'Column 1', N'5bb23c1c-e041-4e8c-80ee-24e8276564e8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16930, N'Column 2', N'cafb0fc9-a4c5-4732-9fa9-6a5678446c5e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16931, N'Column 3', N'03c1cb72-084b-4ba1-bd00-11fbb11da4e3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16932, N'Column 1', N'8702e610-ef40-436d-952c-7001ef313fd4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16933, N'Column 2', N'385bf4ff-69ba-427c-a976-b11c57227884', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16934, N'Column 3', N'5c92941d-26bb-48ce-8a07-6cf0c6fa4541', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16935, N'Column 1', N'0e9939fe-9e92-42a9-83d3-0542d0e5c8ed', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16936, N'Column 2', N'08b8238b-e8c3-4c9c-b89c-f452b345bbbd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16937, N'Column 3', N'535912e8-be70-4fb0-bb8c-3cf3d7099e8b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16938, N'Column 1', N'9a9973ba-76e8-41fc-9ac3-b6db903a8d1f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16939, N'Column 2', N'b22264c9-2c03-4c1c-a8a9-4b6d3f908bc2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16940, N'Column 3', N'af0c59c4-dc31-4d05-9213-fc41ffe6b694', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16941, N'Column 1', N'755ef51d-9bff-4de3-87ff-d9b6f902ce1f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16942, N'Column 2', N'439f988b-0f7b-4bad-89d4-e38a4d402895', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16943, N'Column 3', N'c162a4e7-9b7f-4a2b-ab50-79e34bfbc09e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16944, N'Column 1', N'2f87d665-8367-4f01-9776-3fec25daa3ab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16945, N'Column 2', N'68d41201-6dd1-4552-8aba-8de14f41f4ae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16946, N'Column 3', N'4042ee91-b07c-4e69-bbf8-eba10f06bd3d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16947, N'Column 1', N'2bf2ac02-93ab-4e10-9184-eb16fd0c45b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16948, N'Column 2', N'08d7d908-4669-4c07-83a9-b38f57ec3744', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16949, N'Column 3', N'2b5e8094-d80d-464d-ac90-fa06b08cec7f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16950, N'Column 1', N'00cf2572-bf04-47ab-9dd9-c6bcaf2b72d8', 0)
GO
print 'Processed 1800 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16951, N'Column 2', N'3e005b62-1356-49bc-9e71-f6820b69272c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16952, N'Column 3', N'754a6d8d-30b7-4233-a912-24049dd1e597', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16953, N'Column 1', N'6c9cfb63-c71d-4123-bf14-799680d65152', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16954, N'Column 2', N'4171d496-349a-4277-ad45-d97863afda98', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16955, N'Column 3', N'eab1f9bd-30b6-460c-81d6-47c646f86188', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16956, N'Column 1', N'6457d79d-b4ca-4821-a257-f76cdd9218ec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16957, N'Column 2', N'c6010fd4-f45b-42ff-b742-419915788007', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16958, N'Column 3', N'2cc8fe51-a7ad-4a27-9d38-3f4cf9e84509', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16959, N'Column 1', N'87a89bd0-3cd7-47d4-a42d-45900e345ab4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16960, N'Column 2', N'0fc7fff3-0be3-4ed7-9777-c00ddea0e471', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16961, N'Column 3', N'964494fd-7864-43f5-b24c-06742f31c440', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16962, N'Column 1', N'bc570bf3-d135-49c3-92e2-25d95d7fbb5f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16963, N'Column 2', N'd79ee8ce-d781-4209-968c-30f2fb7d9020', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16964, N'Column 3', N'a35d7e50-3352-4966-a9b3-b887021b2852', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16965, N'Column 1', N'64d7e420-7ca0-401d-b951-c057d0fb7c82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16966, N'Column 2', N'5db4c8f9-8dd3-4a5b-bcf3-af6e12bf20c8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16967, N'Column 3', N'ee0425f3-a31d-4bd9-9361-36336364a05a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16968, N'Column 1', N'1752b75e-cfa1-4775-b690-65b751fa50f9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16969, N'Column 2', N'31f6324e-2242-451f-841e-44666207faba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16970, N'Column 3', N'cb95b2ad-d7d9-4719-bb8c-e8ebe6813058', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16971, N'Column 1', N'032d50e8-6ad2-4ec3-92e9-383f98042aa9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16972, N'Column 2', N'5008adb5-5d91-4408-8e0f-dd2a2d903736', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16973, N'Column 3', N'4c3b6bca-719a-4fe7-bf64-3445baf18f03', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16974, N'Column 1', N'b50d16c9-3521-495e-b286-320be0e5cd46', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16975, N'Column 2', N'ea86fa7a-4e21-41b9-a847-f60deeb73eb7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16976, N'Column 3', N'ad3a041c-7651-4d47-b5a9-931e44e4f148', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16977, N'Column 1', N'37ee940d-8934-4da3-9441-940c2c44298c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16978, N'Column 2', N'3a6a5d84-c0a2-47d9-93bc-e43299833102', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16979, N'Column 3', N'30a39044-8e0d-476a-9445-c0860ea650d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16980, N'Column 1', N'9cd2d740-cb68-4433-9c2c-6cace5d0e067', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16981, N'Column 2', N'cbda9a89-b56d-4ba2-8e46-548abd5d7448', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16982, N'Column 3', N'19ad73df-f994-493d-8051-07a05c4d24fe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16983, N'Column 1', N'100da5ff-45e8-4027-8dd4-457511c01a9a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16984, N'Column 2', N'5f8ba3de-740f-408a-b643-af605fa718fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16985, N'Column 3', N'4cfcc3c3-8369-421d-b357-df50be5df1af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16986, N'Column 1', N'a9cd8d31-0ecc-48a6-919a-d2cd92461bf4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16987, N'Column 2', N'896c6894-a6a3-434d-b5d6-55f10efdc0db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16988, N'Column 3', N'0bdda0a8-8f15-4e4c-a7e6-04774a4cb756', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16989, N'Column 1', N'4d2a7786-bb35-4ccb-ab15-85afb306066c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16990, N'Column 2', N'2a100a87-5fa1-4b6e-b0c0-5d48f664d83b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16991, N'Column 3', N'fe3ca3ce-f761-4aae-bedb-a2c3d30a878e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16992, N'Column 1', N'3c92dff6-6955-444c-b503-9a4339cfe052', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16993, N'Column 2', N'fbd03d02-1a01-4aa2-88e7-06fe5ee14076', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16994, N'Column 3', N'9fe7e785-8a4e-4bae-a839-b9df11c42bad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16995, N'Column 1', N'74df0423-d8c0-4c63-93b5-a94f356ec380', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16996, N'Column 2', N'aed07035-a2f3-46a7-9c8f-bce2e17313a4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16997, N'Column 3', N'256f1242-bc4d-450c-9591-f914ef95f81c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16998, N'Column 1', N'280a5834-4b83-4362-8a73-bee81fef1cec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (16999, N'Column 2', N'b1bffbf1-ddee-4218-adfd-0b6f3691bfab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17000, N'Column 3', N'39ac9f1f-09f9-4a6a-8e19-e3aaebbe0599', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17001, N'Column 1', N'ff13a5c1-694d-4f38-81e6-00897e5c8051', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17002, N'Column 2', N'623e0d0b-438d-4d2f-8e7b-4e4f0e87b210', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17003, N'Column 3', N'32b67bd1-3009-49d3-8cc8-a2bb8efc923e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17004, N'Column 1', N'507dc6b7-60c9-4c4a-87ed-7d29659bc6fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17005, N'Column 2', N'80d11a18-6931-49e2-888f-fc6faadaed77', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17006, N'Column 3', N'8642d6da-1b9a-40d1-9d5f-3531cb6d1c36', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17007, N'Column 1', N'b25106f1-65ee-44b8-801d-e289b9c44b81', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17008, N'Column 2', N'24bae47b-7b91-47e2-973d-05766ca80ff8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17009, N'Column 3', N'f5f72284-850e-41b9-b1ea-a146460f30ab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17010, N'Column 1', N'0643d437-f3dd-412c-b7f6-168fee5cc6f9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17011, N'Column 2', N'7c474dea-6223-490a-a992-6306ff0bff45', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17012, N'Column 3', N'87ee9d6d-e294-4739-b350-a6a600630229', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17013, N'Column 1', N'44ee1f58-2fab-416e-8600-bcc31756ab90', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17014, N'Column 2', N'63393647-f5d5-4e75-a5ce-80cd203ae7e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17015, N'Column 3', N'421ace85-88cb-402a-b7fd-04737a04e88b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17016, N'Column 1', N'c5c3e1c4-9205-420f-a30c-1eddabcf1d7b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17017, N'Column 2', N'3a1ddcd4-0c4c-4b17-bd93-8f9555401aaa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17018, N'Column 3', N'2487ba91-b65d-4889-9065-1f74532cdd34', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17019, N'Column 1', N'a09c4b35-4f82-4fac-8dc7-8a7cb0970fcb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17020, N'Column 2', N'116b0ee8-6c19-4a3c-920c-44ad2e3dc363', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17021, N'Column 3', N'13a1555f-5f89-42d7-9b71-7202ec80cb44', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17022, N'Column 1', N'716cd3b4-ca63-498d-8b6b-c811b87c520b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17023, N'Column 2', N'2a724d26-1b00-4211-bf59-09de7ce381bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17024, N'Column 3', N'34fe3484-676a-41ef-84c8-f60a93e76b2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17025, N'Column 1', N'cd20987f-9d58-4632-8c4e-bebd7f277f82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17026, N'Column 2', N'bd070fc0-7e2f-47c8-a946-5666c3527631', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17027, N'Column 3', N'd81631b5-f240-4859-abe1-fb27ede42fea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17028, N'Column 1', N'1b3c2200-b323-4ca6-b71e-2fb716addd76', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17029, N'Column 2', N'dde4ca32-273f-46b4-9b78-3689079cc1b6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17030, N'Column 3', N'7ffc43c5-aac9-409e-9a4c-9ded8644ac39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17031, N'Column 1', N'4431ac5a-5924-4fc6-9c28-c465b935f9b6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17032, N'Column 2', N'9dd94121-e2f3-4aae-95ba-27a2c27d101d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17033, N'Column 3', N'5f469e6a-1407-454f-909e-347f0b5dcc42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17034, N'Column 1', N'8e3fba59-64a9-4d92-a0a2-e7f53e93f703', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17035, N'Column 2', N'604071d2-b17e-40f6-ab99-4c5ab119248d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17036, N'Column 3', N'ebc49815-3508-4170-a044-e640cbe500bf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17037, N'Column 1', N'b57e0637-2ca5-4e1b-8422-7a16094214d4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17038, N'Column 2', N'4d820508-2432-45a4-9439-1da342705962', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17039, N'Column 3', N'264bf0f2-2572-40e6-8fb2-9f2c87286637', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17040, N'Column 1', N'3b15680b-056d-4c64-92d7-0b21cd0c0feb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17041, N'Column 2', N'e0bdd663-7bc2-4fd7-af9e-6d71d8b13afa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17042, N'Column 3', N'b494f295-ab23-4768-8fbf-bd570b8fb3d0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17043, N'Column 1', N'd0d76cd8-7648-4cf9-9d69-4bc6d3590b42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17044, N'Column 2', N'36c5b9e7-6c56-4499-ab2e-dedc4a0ee78b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17045, N'Column 3', N'a1c13d4f-6da9-458b-a61e-ff18481768e3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17046, N'Column 1', N'86b9e9d5-b6e0-445a-b22f-b770f89f74d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17047, N'Column 2', N'e460807c-c5e6-45e0-af57-02befd70d970', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17048, N'Column 3', N'4de81f58-45c0-4ee8-ac29-a60331a03e85', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17049, N'Column 1', N'3da687b7-907a-4ee5-998a-8f14b8c1e3b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17050, N'Column 2', N'b45250f0-3217-485e-b4ed-95bcfac5d882', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17051, N'Column 3', N'e023ad94-3fc3-4022-98c9-274ccc900a8a', 0)
GO
print 'Processed 1900 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17052, N'Column 1', N'9205e939-22bb-4b7b-bff1-237052a2aa72', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17053, N'Column 2', N'7bca8dc5-9ea2-4aee-a9d3-63c96f835731', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17054, N'Column 3', N'9a80c763-ce28-4dee-a73e-614968773d34', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17055, N'Column 1', N'613d54b7-44d1-468e-88ab-aa4b502e4e14', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17056, N'Column 2', N'0202139a-e762-448f-933c-b89d02b1d6c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17057, N'Column 3', N'477b6819-44bc-41c6-8699-39e68a3c6466', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17058, N'Column 1', N'e8cc1705-8fc0-45a5-9374-5042c63f0143', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17059, N'Column 2', N'3f9c01a1-1507-41f0-b1f7-40f8d3a7cf25', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17060, N'Column 3', N'8c0b9319-967e-440a-ba8f-37ed8507aeb5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17061, N'Column 1', N'57d788ff-d407-480c-98d0-c528b442c05f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17062, N'Column 2', N'33c4e060-9e70-4df2-90da-d89a6ebe8174', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17063, N'Column 3', N'89d42c18-ca53-48f0-a921-584750978be3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17064, N'Column 1', N'92635607-5e2a-4a31-bbef-857a6eea4cfe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17065, N'Column 2', N'4cbaacd9-25ce-445f-8855-9785ac6a1dcb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17066, N'Column 3', N'1a304e2d-64b4-40f3-9b44-fa230964e169', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17067, N'Column 1', N'9baf2af0-657f-49e1-b404-4a0ecc06df49', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17068, N'Column 2', N'a6dfbf9a-52f0-4e42-9db8-f6dd629b69c5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17069, N'Column 3', N'9d169154-ff2a-48e8-afba-21af19536bdc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17070, N'Column 1', N'6c6cc1a6-9026-4add-a8b0-51e6e15aa8a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17071, N'Column 2', N'e9c60e02-dc85-44c0-87a5-9d079dfdbb96', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17072, N'Column 3', N'cadf3f0e-7c87-48dc-8943-21ec10119264', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17073, N'Column 1', N'60a8fc60-713c-466b-9761-403d9b801bee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17074, N'Column 2', N'0a5b191e-fd57-4091-8546-1a92b2c1cd66', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17075, N'Column 3', N'4c8844e6-1911-4be9-9772-006476bf9061', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17076, N'Column 1', N'77a067f8-a402-45dc-9211-f5eba54f7b9c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17077, N'Column 2', N'da853446-a690-4cf9-ba6c-c3867bcf9d50', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17078, N'Column 3', N'27e8c53a-16e0-46be-b286-5ab881188da1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17079, N'Column 1', N'34cf8d36-7539-4c28-a61f-edf5de96f8b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17080, N'Column 2', N'b8608972-032f-4d87-8944-c8870ec6647c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17081, N'Column 3', N'07b10e61-eace-4a61-ab7e-b4114997d71f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17082, N'Column 1', N'31d2be23-a457-4c8d-ab29-22f081c7b718', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17083, N'Column 2', N'439636bb-342a-4544-97a9-5f8cadaf904a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17084, N'Column 3', N'a2ec00bc-b06d-41ba-81a3-624e05a415fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17085, N'Column 1', N'1d7c60ac-07b9-4db9-853e-a1c598ba36e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17086, N'Column 2', N'd70c36f0-c4ac-426d-9e7b-957e24bc7f18', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17087, N'Column 3', N'c1c2e2a6-8e06-454a-9aa8-39ae627fb192', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17088, N'Column 1', N'6047d93c-6cc9-4d36-8f54-1692d4ae2b94', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17089, N'Column 2', N'22853833-472b-47a3-ada7-8ec9c85aa2ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17090, N'Column 3', N'd3be05c5-a161-44d7-9c84-b9b16ea63e2e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17091, N'Column 1', N'ad2659fe-9a21-4131-a76e-9da46c11b98c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17092, N'Column 2', N'be1479a6-8e16-4c79-bf3b-895e659783c7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17093, N'Column 3', N'05d2f71d-4f70-4582-8bae-28787258f977', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17094, N'Column 1', N'356c5b32-8b2f-4f63-ab04-4c629f93bd78', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17095, N'Column 2', N'8ed44285-a4f4-4abd-8dea-08849d63b5aa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17096, N'Column 3', N'e0616393-b878-41d5-9835-dfef544b3400', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17097, N'Column 1', N'0d98b424-b1fb-499b-b887-82eb8d0758b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17098, N'Column 2', N'86b07342-7a51-4d21-a75a-4c097e6d4298', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17099, N'Column 3', N'0b5a4a4d-5af9-4eae-a252-0e06bbb46ac8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17100, N'Column 1', N'4fc6358f-9dc5-4dda-8982-14ffac3b80fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17101, N'Column 2', N'f790602f-50b8-4380-86d7-fd226d763119', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17102, N'Column 3', N'5922661b-a59a-4962-8ff5-b6886641d818', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17103, N'Column 1', N'9a8436da-f6dc-4b2f-9c38-134cd6df4a89', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17104, N'Column 2', N'73fa48e6-2f93-4c85-b595-bacb2025bfb8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17105, N'Column 3', N'83ab81f5-d79e-4003-b6ed-0732d6b737d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17106, N'Column 1', N'6000a4e5-2b0e-4465-ba01-c06e9b825e5c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17107, N'Column 2', N'c13bda99-ccf3-4991-8721-10b8f7c501f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17108, N'Column 3', N'bc2a0748-66cb-4627-9042-eb3ba3a7906a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17112, N'Column 1', N'b87c768b-2abd-47af-a7d2-0c5e31139bdc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17113, N'Column 2', N'278e8328-e185-49dd-a203-930a0d91e8d7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17114, N'Column 3', N'cba04e90-76cd-4fec-a655-392e60d51007', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17115, N'Column 1', N'9c17efaa-652c-4127-b7eb-f9b9e8e03a6e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17116, N'Column 2', N'dfcf007a-258b-4f85-ba5d-fb61798e9885', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17117, N'Column 3', N'29d72726-0a9f-4ff0-b2ae-cf4b9fc0e4ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17118, N'Column 1', N'b94ecf1e-7818-4abb-b11f-d19dd1fd5b58', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17119, N'Column 2', N'bc628401-d0e2-4819-ade0-a2d3fd54f7a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17120, N'Column 3', N'0ed35578-fa33-44c8-9af6-19460652f7e5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17121, N'Column 1', N'945d6eb1-2c66-41c6-a226-e6e88e3f44f3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17122, N'Column 2', N'f1803060-e0f6-41f3-a203-ca1c93c2169d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17123, N'Column 3', N'1450c65f-1a45-487c-b054-e13baf3ea368', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17124, N'Column 1', N'5e3ab192-10dc-4c8b-9e1c-dc8c8817996e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17125, N'Column 2', N'b94ceb91-ab1a-405d-bd69-9cd5067c7eb0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17126, N'Column 3', N'b141763f-5d55-4c32-93d6-7946423c99ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17127, N'Column 1', N'9621d6a5-2f50-4024-95f3-4400c70666cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17128, N'Column 2', N'046e41f5-6aae-415b-a5d5-c5edad48a9dc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17129, N'Column 3', N'bf9aacf8-4e4f-4d33-92d1-5bca2c83d1a4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17130, N'Column 1', N'a38ca999-84eb-48cc-a8f3-26d20e53d7b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17131, N'Column 2', N'aa89f2dd-e8cc-4655-9c31-c891d64acc5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17132, N'Column 3', N'14277c67-c681-4f0d-a6b8-a75a60f1f0e3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17133, N'Column 1', N'0e10579e-bb9f-474a-9945-b4e4e9af5892', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17134, N'Column 2', N'461a8181-34f1-4937-9540-933195a3cf30', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17135, N'Column 3', N'513cf550-d551-4701-8d58-539f1a51dddc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17136, N'Column 1', N'21e8fc47-c40d-4f8c-835f-b20386cc135a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17137, N'Column 2', N'46c6b1ff-ea82-4a7f-b95d-504f862697d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17138, N'Column 3', N'32aa8a48-301f-4e66-beba-6bda3b8eadd6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17139, N'Column 1', N'f1d94b4e-e387-4e3d-a863-7de40e501479', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17140, N'Column 2', N'8ad56930-c068-4363-9996-d1e5152e26c3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17141, N'Column 3', N'79554a9a-3e08-4aa2-9833-36ae232a35f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17142, N'Column 1', N'581fb628-6f18-4d79-add4-3d9d57188091', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17143, N'Column 2', N'403a06fe-9b2e-4790-9970-a7dbf951c352', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17144, N'Column 3', N'257cc4bc-2c8c-4e82-baa5-400ae35f1d3c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17145, N'Column 1', N'7996daec-4989-458b-b9e2-f8adefc1b7ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17146, N'Column 2', N'6623f653-6468-4f76-8a62-2f652f8d3e21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17147, N'Column 3', N'6b2df5b6-5e1a-4ca0-b9ed-bd899745300a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17148, N'Column 1', N'd4c668b3-eeaa-401c-9f5b-3465dbf72311', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17149, N'Column 2', N'a8322677-5509-4a02-8c01-e46046b90a8c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17151, N'Column 1', N'19cb7424-d6fc-4f30-876c-712f7744a995', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17152, N'Column 2', N'ab019fd9-8300-4861-a850-f78a8e59f68c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17153, N'Column 3', N'809940a3-0535-4c52-9994-1aa410a5efd2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17154, N'Column 1', N'86327d36-f5d8-4b9e-b4b2-7224401969fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17155, N'Column 2', N'784e796d-381f-4e48-9bbf-afded77fd05d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17156, N'Column 3', N'5e81de52-8a8e-47e8-9e94-edaa9e145ad2', 0)
GO
print 'Processed 2000 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17157, N'Column 1', N'2c47eabb-a237-432c-be52-a70000ab6243', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17158, N'Column 2', N'ec97c795-881b-4217-8f68-7884a9cfc743', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17159, N'Column 3', N'1bd3033d-41ca-4e06-b4ca-2cfdc02797ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17160, N'Column 1', N'acbc42a5-9ec1-4a91-8d9c-1561f1e8680a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17161, N'Column 2', N'fcce7efa-aeab-4d7d-b843-e755e4b36cb1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17162, N'Column 3', N'512143dc-a69f-4317-87cb-e601647f1b28', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17163, N'Column 1', N'3ddaea48-b6d9-42ad-9ca2-803d185a67ea', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17164, N'Column 2', N'00835cf9-5095-447d-b2e4-fb077cba6d05', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17165, N'Column 3', N'c5fab53d-a982-4844-81f7-0e7dbca6c9ce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17166, N'Column 1', N'dfac4983-bfac-4dad-9856-9ad514870326', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17167, N'Column 2', N'e00ef5ab-cdcf-448f-a9e6-3184def00418', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17168, N'Column 3', N'2c053f0b-9bb8-4f58-9074-1eb57f958020', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17169, N'Column 1', N'a5ec355a-e08c-4529-8172-ea3a85c51c23', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17170, N'Column 2', N'8edbedca-6cb2-468b-bd65-59a8f86f49d4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17171, N'Column 3', N'38dce1aa-e5e5-45c5-ae01-9745990f2d2e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17172, N'Column 1', N'1249f8f1-3c92-49ee-8933-c478880666fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17173, N'Column 2', N'b0100167-9c4d-4fe5-a937-aa0b953f6ef6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17174, N'Column 3', N'351c5fcc-be7c-4072-9808-95ac51fd5829', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17175, N'Column 1', N'e9758c6c-37f4-43ab-ba99-39d89bd3570f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17176, N'Column 2', N'b7305e57-becc-4549-aeaa-1fbd2a0962f6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17177, N'Column 3', N'eea619fb-f3ab-49c7-a27c-d31966f03cee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17178, N'Column 1', N'13a680c3-3cb5-472b-b54d-f8dac2746143', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17179, N'Column 2', N'dddbe769-a4d5-4ee3-9704-19bcdd606e44', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17180, N'Column 3', N'b99fd6ed-d043-4da1-b095-04274b6cb792', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17181, N'Column 1', N'147aa501-8442-43c2-aca2-587b442ad7c5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17182, N'Column 2', N'40adfc9f-185a-487a-bb2b-88f3a75c7674', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17183, N'Column 3', N'76cf2ae9-e053-4438-85ad-274985681ffe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17184, N'Column 1', N'6036447e-622c-415f-aa9d-3a22590b9eeb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17185, N'Column 2', N'1cdf6535-c7cb-40a0-b07c-ef2d7f7593e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17186, N'Column 3', N'f944cd3d-893f-4bc6-91c1-85e899c72b10', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17187, N'Column 1', N'6d6090a3-d410-4187-a6fc-fdafe8b4ceb7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17188, N'Column 2', N'db9c814f-8df3-4ee7-81a3-bd67bee81690', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17189, N'Column 3', N'3706aca0-955e-406f-9284-d1202a43a181', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17190, N'Column 1', N'f95066a1-0d13-4828-b1ed-c98cedc58e27', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17191, N'Column 2', N'6b5b7320-260a-48b2-b22b-0fbf4bd9365f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17192, N'Column 3', N'a644d5d1-f20e-4ecf-b46e-b8313b36947f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17193, N'Column 1', N'd68be6dd-526f-4023-8acf-a6e777fd4e3b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17194, N'Column 2', N'63005f6e-6dae-46bf-be0b-80f981f6586d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17195, N'Column 3', N'0c42625d-f134-44a3-b9ec-e7363edad90b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17196, N'Column 1', N'097b9a32-0f28-4ef8-acb7-6301bfe6979d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17197, N'Column 2', N'771014e5-28c5-4844-9ea1-b31ccc3d57c0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17198, N'Column 3', N'6bc00399-4a8f-4356-b08f-f4f3eaf7ef5c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17199, N'Column 1', N'3682ba06-d68e-4553-b0e1-81efb7fca95a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17200, N'Column 2', N'6f5817e9-56ba-4747-8029-4317018b4b53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17201, N'Column 3', N'6c9c3038-178f-45fa-bff8-d631e3ada937', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17202, N'Column 1', N'f35feddf-e8af-42c0-8335-70ec3667736c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17203, N'Column 2', N'485ebd03-4df7-45cd-ae9a-e91abcc2c614', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17204, N'Column 3', N'facd7658-9886-4529-af70-f29fa20eec30', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17205, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17206, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17207, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17209, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17210, N'Column 1', N'499f901b-a80f-4007-beec-0234f8ecf4d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17211, N'Column 2', N'6564f0a6-6828-4277-9f47-9dde2d10e05e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17212, N'Column 3', N'79135e22-a1ee-4d6a-be9c-42e13c9942f8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17213, N'Column 1', N'564148e7-2d57-4b9d-a759-a10654f9dae6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17214, N'Column 2', N'00e852a4-bf49-45c1-995e-2830116993a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17215, N'Column 3', N'9b1d8bd3-79cf-469f-93b0-6aba6dd913d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17216, N'Column 1', N'5cbba797-2702-4720-8e74-15094dd693f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17217, N'Column 2', N'369350ea-b219-44b8-8910-d70df860f720', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17218, N'Column 3', N'e1516413-1138-4ae7-9cae-c3a8cc3c5263', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17219, N'Column 1', N'afc7ddc8-ab98-48ca-87f5-85c97a1edf6f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17220, N'Column 2', N'0edde90d-6848-443e-ab84-007f716284fe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17221, N'Column 3', N'2f91fe63-0b13-4285-9f9e-a6cd7aeb1123', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17222, N'Column 1', N'19077893-54c2-4c8e-98ea-46f0fd55f58d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17223, N'Column 2', N'389024ee-0a05-45a6-b2ec-b35fd00b1389', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17224, N'Column 3', N'ab09d85a-3a6a-4275-ab09-3b493e37968e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17225, N'Column 1', N'e8481863-bd3d-49d5-80a9-4d9f54ec9d5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17226, N'Column 2', N'50405e21-bb6c-4624-828f-b2895fb98419', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17227, N'Column 3', N'37d717a1-eb08-473d-88c8-f9e4f847df4b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17228, N'Column 1', N'721f2926-5911-44bc-a072-f9a2fd61aa65', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17229, N'Column 2', N'1ceaaf0a-5e65-40e0-a6cb-4c40f25b9c93', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17230, N'Column 3', N'08d8c41c-2341-48fe-85cd-403573b595ce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17231, N'Column 1', N'9acc2c5f-0920-4d85-873a-073d2927948f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17232, N'Column 2', N'71b9f7ba-0c2f-4576-a537-c249dc0e781d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17233, N'Column 3', N'ee0df5ec-da6e-492c-aaa3-6e0f2716a812', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17234, N'Column 1', N'39ba9ea3-e97e-4279-a6de-d010082d54d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17235, N'Column 2', N'8321907a-5ce6-420a-8d7a-5ed5249b591c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17236, N'Column 3', N'8bf215c3-86ba-416a-a449-a950f769086f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17237, N'Column 1', N'26211c67-0c81-4824-9852-16900fa86b80', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17238, N'Column 2', N'd64fa007-6d6a-400a-b134-e1f99d205ec5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17239, N'Column 3', N'2ff7c421-20dd-4e49-afb2-5996b85e61c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17240, N'Column 1', N'8e9c4cf0-d27a-4edc-8f68-0e0d3e475af7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17241, N'Column 2', N'844634f8-b7df-4e6f-865c-b4498400a416', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17242, N'Column 3', N'ebffe746-dbbd-4e80-8fbf-478b9e3b2fce', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17243, N'Column 1', N'b3989d77-9c2a-42d4-8e04-389db84d3714', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17244, N'Column 2', N'324938e8-2f12-4fb9-8bb3-d7c40e9f9285', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17245, N'Column 3', N'd9375cda-26ab-4de7-ac1a-a386f6642e6a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17246, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17247, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17248, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17249, N'Column 1', N'28ccb11f-a60f-4611-b336-8c109aaec704', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17250, N'Column 2', N'54aeb49a-3c68-44c3-9c98-3c6ced6187e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17251, N'Column 3', N'588f57c4-b359-4e60-ae75-997712d60902', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17252, N'Column 1', N'6d575d70-c885-4c44-b7c1-e73d8e463335', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17253, N'Column 2', N'ada7556a-4528-4878-868a-096fee5cc797', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17254, N'Column 3', N'cd8bcafa-2965-4def-b630-54cd5856eb8f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17255, N'Column 1', N'82333a4d-17c9-41e4-b35a-1c253418f394', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17256, N'Column 2', N'1bae556c-8fd1-4621-83d8-e70587cc3c12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17257, N'Column 3', N'0ae5b6a6-2e2d-42c7-9137-e657a0a9a0db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17258, N'Column 1', N'd37a06ea-76a3-4e56-a5a6-464d84515ca5', 0)
GO
print 'Processed 2100 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17259, N'Column 2', N'6443c36d-b680-4094-82c4-cecdaa03b92d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17260, N'Column 3', N'3d3cbc0f-5630-491e-a772-035cb1f6432a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17261, N'Column 1', N'5be92a0f-ea06-4ac5-91be-2527e2d2ab03', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17262, N'Column 2', N'7583ea1f-8197-4dcd-9b21-4a748127e864', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17263, N'Column 3', N'a34cc242-e784-42a9-82a3-358e209b2a9b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17264, N'Column 1', N'558fd5bf-c4ac-4e2f-8e81-695b5d35f5f4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17265, N'Column 2', N'23f04081-a588-4f8e-a937-c2273f12bd17', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17266, N'Column 3', N'92125aa7-0bcc-4015-ad74-9ac444304b39', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17267, N'Column 1', N'ab07d18b-cbb8-4d84-8ffb-17ab703738f8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17268, N'Column 2', N'f840dec0-eff8-4983-9992-0dd6b8bafb4c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17269, N'Column 3', N'af7cd103-84a7-4186-aa0d-c047f4df7efd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17270, N'Column 1', N'28e98a1c-fb30-4eba-b077-d68273dd13e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17271, N'Column 2', N'462f328e-960b-4954-b7d4-315f221efea3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17272, N'Column 3', N'7b22a8a8-8775-4930-b55e-e3d4028da37f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17273, N'Column 1', N'a422963a-4f0d-4680-9b2d-1ca667e545c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17274, N'Column 2', N'40dd2a8b-07c1-4760-808a-f8fb20798567', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17275, N'Column 3', N'081285ab-7485-43ad-bafb-cbd5d927246f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17276, N'Column 1', N'dadfdbfb-80a6-4875-bfc9-da75e77594a4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17277, N'Column 2', N'64932160-e67c-4e7a-9f00-a14c89518051', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17278, N'Column 3', N'404368ee-a1a6-49ed-9710-154de73bb519', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17279, N'Column 1', N'53bada7f-b659-4c62-8397-62a711f0f7af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17280, N'Column 2', N'f32b811a-06db-49b7-974f-6acaa07247eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17281, N'Column 3', N'bf4e8c52-3f2a-4de6-ad59-9a0144445b38', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17282, N'Column 1', N'3e4569f7-9f4c-4512-8eed-530cfb8decbf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17283, N'Column 2', N'c328f4ae-fd5d-4744-89be-bf9896fd735f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17284, N'Column 3', N'eb6cfbdf-e485-419b-821e-2c0088b159e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17285, N'Column 1', N'1f30bd44-4583-4947-acc0-8d3b66b61bc9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17286, N'Column 2', N'473639fc-068c-4531-8319-bc5ca243c5da', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17287, N'Column 3', N'30cbefc1-58de-4c28-99b6-a9f2c459e8e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17288, N'Column 1', N'bdc505f8-6358-4e02-a317-603de4e43d22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17289, N'Column 2', N'5ba5ff3f-d267-4eca-97fc-b72951458156', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17290, N'Column 3', N'ab6b3755-b52f-40a7-b3da-208d6b043683', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17291, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17292, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17293, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17294, N'Column 1', N'baa97067-87f7-4bd7-8183-defaff67ebb2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17295, N'Column 2', N'eaced7a1-f2e2-4f22-9b36-313d97a27840', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17296, N'Column 3', N'ccb39d56-eb44-4a12-a828-dfd095da77d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17297, N'Column 1', N'dac58001-bc73-4a4f-b840-2fea7b66f2f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17298, N'Column 2', N'fb95394e-ac98-4f06-a514-345ede711849', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17299, N'Column 3', N'e5ff9a2f-c15a-4aeb-b9f9-c7e922ecd920', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17300, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17301, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17302, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17303, N'Column 1', N'1d63c322-a08a-460f-8f38-e8bd9e550dad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17304, N'Column 2', N'3b133834-023b-49ba-934f-45d13d8e1903', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17305, N'Column 3', N'14dff1c0-03b2-456c-b6cf-f20402e7f87f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17306, N'Column 1', N'fe3e9e17-6af0-4847-9c6f-5b78d15e7b1b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17307, N'Column 2', N'08e0a0cb-3f0d-483e-b525-ffabee596bf6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17308, N'Column 3', N'0211e005-430a-4339-8aae-50fd95b0c6f9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17309, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17310, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17311, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17312, N'Column 1', N'dc34a621-4f23-4b04-962e-376520bbe21f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17313, N'Column 2', N'27ea29b6-35f2-4384-bd0e-5645013f5d6e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17314, N'Column 3', N'5ffe8b40-8954-4c8d-a180-2373daded386', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17315, N'Column 1', N'0344f468-07e7-46de-9c1a-e0a6ca07a6fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17316, N'Column 2', N'41cb79c0-c0f2-4e75-9fb9-81023f182498', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17317, N'Column 3', N'ca385e1a-2c8a-4126-8468-1cf7782ef405', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17318, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17319, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17320, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17321, N'Column 1', N'41c9825d-1e95-40e2-a9f7-7ecde305fa5e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17322, N'Column 2', N'ad90aa7b-4d14-4180-9709-def7cbf8c01c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17323, N'Column 3', N'0fa38947-2752-4629-b1f5-e83f1e770116', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17324, N'Column 1', N'e749ab8e-0aa7-4d18-9faa-05220a3c1eca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17325, N'Column 2', N'79dbcd5a-0ba3-4a95-a9ed-44a914d86b4c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17326, N'Column 3', N'b5821f86-cbd0-4537-aa15-c4141ecdb81c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17327, N'Column 1', N'f68d2180-2119-4a14-9976-969148c386c5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17328, N'Column 2', N'd0af9da6-9d33-473b-9270-da9907884fe9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17329, N'Column 3', N'57210d4b-1ed7-4470-a678-7cd70ee6e38d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17330, N'Column 1', N'49ff9ce5-6c02-4193-a063-60517216afe7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17331, N'Column 2', N'3b3a1ef6-0316-4242-a69e-3fbd5f0001fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17332, N'Column 3', N'd88d4ce5-0bfd-49b1-87f5-f9a6ce911e3c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17333, N'Column 1', N'ae7ef52c-2644-4be2-9f7f-08de1049b80a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17334, N'Column 2', N'8c3e8861-ffd3-4c83-89e6-3e1be60898cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17335, N'Column 3', N'21266555-8882-47c1-bb96-ec265ab38c0a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17336, N'Column 1', N'f974e09e-7932-4a16-8d24-a1ab2b361abe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17337, N'Column 2', N'de195b3c-573d-4240-aedd-e79a83e35874', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17338, N'Column 3', N'30903c4b-1a1e-4cff-af61-b2f0091a1fab', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17339, N'Column 1', N'd109fbf1-e8ed-4edc-8fe9-4ead07734e86', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17340, N'Column 2', N'8f80bed0-e743-4f96-a5a4-0d014a050e4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17341, N'Column 3', N'1d4fe1b8-9c6f-4003-afd8-83f021b31e57', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17342, N'Column 1', N'68cd774c-0515-45b5-a7cf-1e7bad09f051', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17343, N'Column 2', N'9d1d1452-41f6-46b4-b72a-c6c18619b1ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17344, N'Column 3', N'41d5fc6e-970c-4796-96a6-6a432d7297af', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17345, N'Column 1', N'3206b2e1-3be0-4419-ab01-eec26850be12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17346, N'Column 2', N'e1ea33ed-a63a-47a4-8ff3-63deec97014d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17347, N'Column 3', N'7e3b6e09-6a54-4be4-99bd-083cc5cfa754', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17348, N'Column 1', N'94481aa7-7b7d-462b-a6fe-a85300af4e67', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17349, N'Column 2', N'94f8252d-0d95-4691-92d9-c5b87d2c6558', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17350, N'Column 3', N'cf3f7904-7904-4c41-bfc2-4d6350e5bbae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17351, N'Column 1', N'22847318-88e0-40af-ba69-80301554bb3b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17352, N'Column 2', N'6453fc4a-ef3b-421f-baf8-0e5698470f02', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17353, N'Column 3', N'3cee8575-7505-4f60-99d7-062f08414f82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17354, N'Column 1', N'001eaf9f-bf4b-4377-b29c-5002b18595a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17355, N'Column 2', N'47a07a48-3345-4258-8183-e0e08cfd19f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17356, N'Column 3', N'af5f1b71-93f9-437e-88a9-65fba474b445', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17357, N'Column 1', N'd7f38074-2e11-42c8-9881-74d07c4556e0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17358, N'Column 2', N'300b0562-11a8-46cc-99c7-5a64660b1cb4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17359, N'Column 3', N'09f68507-64ac-49d7-a23a-a39a1fc30ec4', 0)
GO
print 'Processed 2200 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17360, N'Column 1', N'7ca7c3af-ed3b-45cd-9178-b585a0c34866', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17361, N'Column 2', N'48fd5707-f4d1-45b3-913d-77b3e2d1050f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17362, N'Column 3', N'91eaec5d-f509-4364-a3be-32642934e25d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17363, N'Column 1', N'aa56ba51-6c23-49a2-bc84-d91508369fbd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17364, N'Column 2', N'6266bad1-75d1-4ce9-8908-e37c32d8b880', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17365, N'Column 3', N'aefd5a17-3bf5-4337-8817-668b16b03ce8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17366, N'Column 1', N'9ce23de7-b55d-4fb3-8451-e0563a1eb393', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17367, N'Column 2', N'6f8cfd11-351a-48d3-853e-ab4e9c8b81ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17368, N'Column 3', N'ceb1ecb3-5a5c-4bca-9fd4-2d6d71563a7e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17369, N'Column 1', N'e8cf77a0-9627-49bb-a2fe-773dea73e0ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17370, N'Column 2', N'cd00ab65-3c33-4319-8278-196adf792fc1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17371, N'Column 3', N'0205214e-1930-4575-9aeb-7e2c934b31bf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17372, N'Column 1', N'a313fc10-0723-466a-83f5-4b24cf335a18', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17373, N'Column 2', N'a1dfd2fb-f49a-405d-b89a-868846e1f2ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17374, N'Column 3', N'278b1ada-550e-48d6-a65d-54aa61a58a5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17375, N'Column 1', N'f49e118c-c514-4837-965d-2a5466c469a0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17376, N'Column 2', N'f244eeea-51b5-4e5a-9426-46bcd9290872', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17377, N'Column 3', N'1f9e3130-f390-4c79-a90e-b7b79c3953da', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17378, N'Column 1', N'ae374f00-71b6-4f73-a5cd-6c728043ce87', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17379, N'Column 2', N'25ea611d-01aa-4efe-abd8-99277a0b087b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17380, N'Column 3', N'8e5ed1c2-6672-4995-bfbb-4c60faa744d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17381, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17382, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17383, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17384, N'Column 1', N'eca585ec-7a0e-45ca-bf9a-1f3eab6ca8fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17385, N'Column 2', N'6e4c75bd-4765-424c-9785-e6552c550e57', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17386, N'Column 3', N'a191ae42-070b-496a-abb3-8524b3a11d63', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17387, N'Column 1', N'c834a795-2a3f-410f-b945-d4b876cc0f2a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17388, N'Column 2', N'f0a3afe7-108b-49eb-ab1a-7c58d133b145', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17389, N'Column 3', N'c9b98665-0b59-4d14-b779-e2ce62c8d152', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17390, N'Column 1', N'e5fad779-5e8d-4593-8c5c-4f6d141ddf3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17391, N'Column 2', N'428b6191-3630-4247-b67a-fcb1fb00288e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17392, N'Column 3', N'ab804b6a-a177-4bd2-a78f-ae7e7582fa6b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17393, N'Column 1', N'1e33cd18-f3b6-4bc0-af7e-b577526e9594', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17394, N'Column 2', N'05cd2101-e35c-4b46-ba58-18f1a53f4c71', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17395, N'Column 3', N'757249a2-7ac4-4ec7-91d7-7974f89c0105', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17396, N'Column 1', N'4482876e-971b-44e4-b475-7f18b980f487', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17397, N'Column 2', N'579f0cdc-2679-4a7d-bc8a-c53a7be41a51', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17398, N'Column 3', N'e0c3fe03-0c68-4882-a6db-119a73a01928', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17399, N'Column 1', N'5bff438b-7e71-4705-95c6-f50bfde6efbb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17400, N'Column 2', N'e5505524-6dda-443a-954a-6094ba18b946', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17401, N'Column 3', N'71991686-bf5a-48b5-8539-740442a08f88', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17402, N'Column 1', N'db5574ad-56ab-41e7-a69c-a2e98d8d6911', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17403, N'Column 2', N'd787c946-6062-44ea-93c2-6eb7fa72eb1e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17404, N'Column 3', N'47a61e3a-8a80-48c6-9212-cd5dcf57e842', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17405, N'Column 1', N'dd8bced3-7a4d-4f26-8a68-2b2f02c4ffb3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17406, N'Column 2', N'44575646-7b78-467b-ba53-0a84502454c6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17407, N'Column 3', N'b80b8b7c-92e1-45c1-a6a0-2e2928d8cb7b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17408, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17409, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17410, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17411, N'Column 1', N'2efaac31-db1a-46d5-9314-ddeeecc4f577', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17412, N'Column 2', N'0d4126cf-03e3-4c2d-b17a-5867b9e8af53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17413, N'Column 3', N'd8cc8bf9-8faa-4915-af9b-45e82d15de16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17414, N'Column 1', N'ff4a0867-0b97-4759-a3cc-05e6edb34e77', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17415, N'Column 2', N'ab007961-61b3-48fe-851f-6999081710b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17416, N'Column 3', N'446ed4f9-6da3-4e0a-a10d-45a9f66a2642', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17417, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17418, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17419, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17420, N'Column 1', N'e2b465d4-cde6-4efc-acd6-287701fdab22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17421, N'Column 2', N'5d913e81-6f39-4cff-a3c1-40a622974928', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17422, N'Column 3', N'b3a20a5b-4915-41e1-ba5e-6dfd4c72e9cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17423, N'Column 1', N'915d5fdd-2d03-4649-91c1-fb21e621d1e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17424, N'Column 2', N'e2245fb6-15d4-43cb-8342-2ca2821a8899', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17425, N'Column 3', N'c72d5a85-b58a-408c-bf3e-ca2f6f56bc80', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17426, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17427, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17428, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17429, N'Column 1', N'93797074-38f7-40b8-9392-9a66f9189a90', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17430, N'Column 2', N'94920305-a541-4a2e-a9a5-0f2cf630a4b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17431, N'Column 3', N'28e1cab0-75e4-4bcd-bd91-fcd37da801d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17432, N'Column 1', N'1ba43d7b-72af-4f79-b448-b48a58f28c0e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17433, N'Column 2', N'b38b9a9c-6c6c-42fc-8718-2da811091468', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17434, N'Column 3', N'e64253ee-9df3-47d5-89bf-94c5f2232904', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17435, N'Column 1', N'68f8ce61-b77c-4127-a35c-17bfc702999e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17436, N'Column 2', N'878c39f5-5068-41fc-9917-95da55d9748e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17437, N'Column 3', N'b7967328-f7d7-48fa-a67e-173c2aa4e163', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17438, N'Column 1', N'c1cc7119-99f9-422f-88dc-8701a4bb2dd9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17439, N'Column 2', N'97a69ded-0ae4-4e01-921e-341484cd027f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17440, N'Column 3', N'4b1c8d39-1162-4148-904f-f8496c34a660', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17441, N'Column 1', N'e66e9b83-4f45-4849-8387-c1025dd4c2b0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17442, N'Column 2', N'97bb20af-bd02-4888-82c8-8fa9252f875c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17443, N'Column 3', N'cfd9eb03-e26a-482a-b384-aac379ffea89', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17444, N'Column 1', N'00d2db0f-e8d1-4906-9d2c-2ec3c0074e2d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17445, N'Column 2', N'5dc3c00e-3fae-4168-9d0a-3895dc4e5b57', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17446, N'Column 3', N'cc0e8516-d095-4936-b81a-f5b947a5f555', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17447, N'Column 1', N'90dd2ece-a825-4b2e-afe3-f9d63e035d26', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17448, N'Column 2', N'74441148-5d9d-4b66-a369-5165adea0058', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17449, N'Column 3', N'399d6571-8d5b-4567-afa1-ea5c57268787', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17450, N'Column 1', N'6b5f5dd1-d4e2-45e9-81f0-4e758541bd7a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17451, N'Column 2', N'e61f394a-c53f-4188-9764-98ad1c0c21e0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17452, N'Column 3', N'9a9fff43-2709-4fb2-967b-997b15a8836d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17453, N'Column 1', N'55b8ac8d-95f5-474a-9094-bbdf3d0aa10b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17454, N'Column 2', N'e9aa2bd3-d391-4a8a-bdcd-2c2da243832f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17455, N'Column 3', N'6f5bc2a7-6638-41c0-b0aa-9f4f45aa3bb3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17456, N'Column 1', N'569d3ece-3769-4d95-9acf-0c3c137813b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17457, N'Column 2', N'ddb7b2c0-9c49-49f0-8729-4cf712c58085', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17458, N'Column 3', N'2bcde563-0e87-431a-9455-53f870cc9452', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17459, N'Column 1', N'7e00a60e-7f26-424d-82ed-830ad919c35c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17460, N'Column 2', N'742b9e38-0735-41ac-9fb1-8de8fe0f2f80', 0)
GO
print 'Processed 2300 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17461, N'Column 3', N'dc6b56c1-babe-43ce-8d3a-ee87aac2f6fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17462, N'Column 1', N'451e762a-ed35-4270-95e7-1f021ef0b5fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17463, N'Column 2', N'2111fe17-4630-448a-8286-fb8946c15fcd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17464, N'Column 3', N'e404eeb9-0ec0-44d7-896e-2e78219f6822', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17465, N'Column 1', N'96cbfe34-a2b7-4df5-9058-40ca6420159c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17466, N'Column 2', N'50762ab8-730d-46cb-a4d9-cd61d68ca38c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17467, N'Column 3', N'd65808fa-04ad-4099-9406-847a38c1d541', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17468, N'Column 1', N'46bf0759-790b-45d1-8f6d-246b0d6357bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17469, N'Column 2', N'9c28e747-118a-4c82-983a-6ce43ce23037', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17470, N'Column 3', N'3f3c5254-34ab-4705-8deb-fc6ada6550aa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17471, N'Column 1', N'021f20ac-731f-42c0-ba93-837157753646', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17472, N'Column 2', N'f5c412d8-7417-4e67-8f3b-6a19e9c76794', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17473, N'Column 3', N'030f4ad6-fc44-4544-a013-b943a5c51b08', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17474, N'Column 1', N'360dfa86-b724-40b0-94f0-633b80339039', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17475, N'Column 2', N'7e5d048d-c1bd-452b-9f32-a6379693fe16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17476, N'Column 3', N'8c43813e-a02f-442d-a83f-22743db4c816', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17477, N'Column 1', N'ccced21d-280d-4813-88cc-17d69bf95337', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17478, N'Column 2', N'3951455c-854f-4962-8872-096d64f5c070', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17479, N'Column 3', N'38f5024a-f815-4951-a146-0ea8fa29e589', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17480, N'Column 1', N'e0499fcf-4636-4291-8e55-f1373a6ce923', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17481, N'Column 2', N'fb1da1c1-cd1a-416b-a487-9f01dea3f159', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17482, N'Column 3', N'2574b5da-ded8-430d-8ed3-54507f4e77bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17483, N'Column 1', N'3a1d4443-6f4a-47da-a526-52bf070f602e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17484, N'Column 2', N'451c8d9e-a394-400e-88a6-4dd67b6ffdec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17485, N'Column 3', N'ef5faa6e-ccf2-4c1b-871e-bfc33d928517', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17486, N'Column 1', N'5ce2c88d-0994-4a79-9bc0-0b7ca5444575', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17487, N'Column 2', N'495d316f-a74d-4e65-9f83-49395fe720a6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17488, N'Column 3', N'31309204-00ac-49b4-b0b9-568da7233bac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17489, N'Column 1', N'b870ebe2-a47c-46fc-a72f-3aa958203a27', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17490, N'Column 2', N'2a2f431b-d710-4dca-86d3-1ad31a40fdfb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17491, N'Column 3', N'42f19a56-9647-4b60-9f5d-f5c98e68bdb4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17492, N'Column 1', N'101bf95e-c7a5-43e8-aef2-f4a32693b851', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17493, N'Column 2', N'7d6cf645-2477-4572-ab56-10f3555ef2df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17494, N'Column 3', N'fb050bc3-81a2-4079-b09e-75c8991a299d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17495, N'Column 1', N'dabba91c-9ca2-48b9-b6b5-1ab65c3d2d7d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17496, N'Column 2', N'de85998e-4ebd-4293-8e18-57630a4fdb28', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17497, N'Column 3', N'7e1d40f9-1cad-4e22-9187-2afbffb0cd64', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17498, N'Column 1', N'c002848c-2e14-4c52-8c58-6ff0e03a3ad1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17499, N'Column 2', N'e738569c-b994-4052-8223-f832890e981f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17500, N'Column 3', N'5d181f0d-87d8-43c1-9000-63ef1fcc7fe0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17501, N'Column 1', N'6fb781cb-ee77-4586-bb02-585ae8f7b469', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17502, N'Column 2', N'a3299005-6fa1-4ab0-8842-8e5e8032ba35', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17503, N'Column 3', N'1b637093-d216-400a-b499-e5d34c2ed45e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17504, N'Column 1', N'7abcf806-0378-4e4e-98d9-260fc182c07b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17505, N'Column 2', N'e261e517-55b1-48eb-a088-0f5076717de4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17506, N'Column 3', N'339db207-9d0c-4d6f-987e-76aacf9c5e94', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17507, N'Column 1', N'6ff2cab7-7511-4c64-b284-0a0f729658c0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17508, N'Column 2', N'9cea3e9c-e58d-4130-bb11-5f852022f427', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17509, N'Column 3', N'f5ff0766-6871-491f-9b26-dc7e0d51161b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17510, N'Column 1', N'e54eebe0-e3cd-4b09-b84c-19c373687d78', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17511, N'Column 2', N'4c9663e7-aea5-445e-af49-dbd27d8415cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17512, N'Column 3', N'ec1208b0-a48f-45de-a570-3de5152c69fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17513, N'Column 1', N'583a9fc8-c23a-4f30-997c-9270bcb8eca0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17514, N'Column 2', N'98b982c8-9597-4a55-b5f9-a0220567e292', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17515, N'Column 3', N'c610d694-8a4d-475d-8656-031db15f76da', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17516, N'Column 1', N'14f9deea-547c-4376-9c8b-5b20f286c035', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17517, N'Column 2', N'16605ebf-2b8a-4d36-8201-104e4a66ea58', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17518, N'Column 3', N'0bd6a9b2-a3c5-4f0e-a279-0e61fb567a00', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17519, N'Column 1', N'405ab4d7-f350-4725-81ae-b1209cfc5b60', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17520, N'Column 2', N'f33fcc27-d28d-4d44-bb3f-c2fe7868ac92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17521, N'Column 3', N'89c36272-9bcd-4360-92ba-ac0717673089', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17522, N'Column 1', N'2b367ee7-c1ef-4add-94a0-e1826c266ff6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17523, N'Column 2', N'b7f5fa88-f180-485e-b508-0dfe8dee309d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17524, N'Column 3', N'efd91765-2b7a-4101-9368-83aa5382d17b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17525, N'Column 1', N'e4318450-cb61-482b-8962-1d028e5ee3e5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17526, N'Column 2', N'd261670f-316d-4df1-9780-fdde12a82b05', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17527, N'Column 3', N'12a9685f-bcf2-4448-a164-bbc0a514d9ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17528, N'Column 1', N'6d45ad49-5720-4395-8d32-e73dab35bc30', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17529, N'Column 2', N'27f8aa31-cec1-4897-bc72-e36a61b5bf30', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17530, N'Column 3', N'5c6541bc-7596-446f-bcf7-eba05b9be209', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17531, N'Column 1', N'13d5c348-000e-425f-bdac-b80b38018ad1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17532, N'Column 2', N'0b93c641-6646-453b-8ef8-e8360b299322', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17533, N'Column 3', N'a3573185-967a-4047-909d-a638d07591c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17534, N'Column 1', N'34edf43e-8965-4691-8cac-81b4f93d1e3c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17535, N'Column 2', N'80b15135-3c61-4553-831d-0f15da687bca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17536, N'Column 3', N'2771fc12-ed58-4a55-909b-84c95aaca5e5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17537, N'Column 1', N'50de736e-cfee-47db-b512-056a3c8e8c18', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17538, N'Column 2', N'a3942668-e234-4399-a7e1-4a432779f1e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17539, N'Column 3', N'2edb3bb8-db45-4e7e-b169-12a3b831a73d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17540, N'Column 1', N'f9e03040-23e1-4233-8e90-3f1d26b1b46b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17541, N'Column 2', N'9cccae9c-accf-480d-b284-09816035b2f3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17542, N'Column 3', N'9ef7ba7e-4bff-44da-8095-c1815f763cb3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17543, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17544, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17545, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17546, N'Column 1', N'ede1a95f-cc80-4248-9166-59a9e5ede94a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17547, N'Column 2', N'1b0851f8-e552-4b8b-b22e-ae63c7609ecc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17548, N'Column 3', N'4079938c-fda3-4ce5-84bd-f313a65c57a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17549, N'Column 1', N'705716e4-0f44-47ee-ae27-7fa86610a1fb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17550, N'Column 2', N'b66dbb50-fcc2-48c9-a327-7ff41efd2b54', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17551, N'Column 3', N'bdb7b2f8-776a-4043-a99e-493981b9af19', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17552, N'Column 1', N'65d99433-a98b-42ce-a6b5-30a4c24bc7c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17553, N'Column 2', N'e8fb261f-45cd-4555-8959-db6dee4ea004', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17554, N'Column 3', N'76826802-d829-49e5-8fcb-d41237abbb49', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17555, N'Column 1', N'5a17230b-1d70-4fc5-b5ca-649f468fa78e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17556, N'Column 2', N'05fdac24-a6db-49b0-9faa-874dc63dc4d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17557, N'Column 3', N'36afbb60-d3ef-4b47-943b-23c2fbb2a8fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17558, N'Column 1', N'0b2b2c2b-be2e-4cc6-b04a-458bfdadec3b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17559, N'Column 2', N'40ae5fd0-4ec6-4a0e-9568-d5db5f71b641', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17560, N'Column 3', N'665bdd4c-fdb2-4042-9ace-be57e61c06bd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17561, N'Column 1', N'd9db772b-0fc8-4970-b6c2-a0339a34b134', 0)
GO
print 'Processed 2400 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17562, N'Column 2', N'5eb26cc4-c00c-4c60-9eaf-7b3a2acf3127', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17563, N'Column 3', N'b9676a21-1c84-444c-9e82-0c194004ac12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17564, N'Column 1', N'6c5ef1d2-67b9-4552-b29c-3c9a38338ba9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17565, N'Column 2', N'9eeac826-a037-452d-912a-d0c7dbe1d60c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17566, N'Column 3', N'f80d1af4-8cad-4bd5-8a6c-c6bddc986ed3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17567, N'Column 1', N'8b035648-97dc-4bbd-9d06-666db9495bb7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17568, N'Column 2', N'908cc5f2-59c7-46cf-bf34-5a673b0d2356', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17569, N'Column 3', N'94d2b8a7-72aa-475c-9278-9aff997a9798', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17570, N'Column 1', N'9acd7996-be69-4e54-9b03-0d9fab03a730', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17571, N'Column 2', N'aeb4f0c3-3bef-446c-bc44-31dffc7cb9b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17572, N'Column 3', N'd4484243-ee7e-4bdd-b08c-623b7c288cff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17573, N'Column 1', N'6d0e4109-9d92-4d8b-9f97-d193aca948bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17574, N'Column 2', N'0f4daa10-8f81-40fb-8876-19496da0d05c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17575, N'Column 3', N'79a64d54-73f9-4703-b9d5-d0f69751873f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17576, N'Column 1', N'84b3da14-83cc-4bb7-8a0a-6d3e186d318b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17577, N'Column 2', N'636eed74-c918-4a22-874a-e511f7952b53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17578, N'Column 3', N'6f38e201-2f72-40a0-9792-1c2aa04ccb47', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17579, N'Column 1', N'9de64121-c640-4331-8229-d0a3fca8510c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17580, N'Column 2', N'147fc888-587c-4aca-8af3-cfb2ad72f85d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17581, N'Column 3', N'6e72efe4-e104-4c98-9628-ac06c2e4f042', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17582, N'Column 1', N'135d4e80-d589-4f62-a5fb-c9e61533d416', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17583, N'Column 2', N'7ca2eebc-39b1-46a4-9c31-0d9721c34888', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17584, N'Column 3', N'c41c6a7a-ce0f-4d2e-b01c-a7e1d84353a3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17585, N'Column 1', N'a0cdb57b-196f-4212-94ff-2cb79e7cc732', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17586, N'Column 2', N'46c7b3cc-685d-434c-a9d4-593502b875f6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17587, N'Column 3', N'c9e1772e-4a15-48d6-a42c-a98b8f302ba7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17588, N'Column 1', N'16ba8184-c641-46b6-b86c-84b11ae06525', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17589, N'Column 2', N'f7997283-a85a-457a-b51c-fdac539bb330', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17590, N'Column 3', N'00ea4742-ff17-4d0e-8904-cee0191d37cf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17591, N'Column 1', N'5e26a0ca-9593-42e4-b398-383d0d05b2f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17592, N'Column 2', N'eb9721f2-3e85-4c67-bb58-a0bfa2496c5e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17593, N'Column 3', N'5937b118-641f-4a54-b8ea-9ccbf26f0478', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17594, N'Column 1', N'143a7bb9-5942-47dc-a69d-44a7df91488b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17595, N'Column 2', N'7e9ebe39-51cd-4c11-b857-0fbedfa2bc51', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17596, N'Column 3', N'e28f3f71-bf1e-4f1f-bfff-8096452aef91', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17597, N'Column 1', N'74031e87-abfa-4c4a-a514-ee55150ed104', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17598, N'Column 2', N'd7bc7e99-07bb-416d-9f9e-c573efc51be7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17599, N'Column 3', N'09576c89-7df7-47e2-955e-a68e14f50f4c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17600, N'Column 1', N'81491171-b3fd-4fea-b5c6-c6471b48064e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17601, N'Column 2', N'7710b6db-b5aa-4a7f-9758-ec5725824bf1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17602, N'Column 3', N'eab6939b-85a1-49e2-9b11-64d78fe51b8c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17603, N'Column 1', N'13060c4e-04d2-4066-9809-c5cbb873728c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17604, N'Column 2', N'22abb402-3b0f-425a-89f0-9f169328e233', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17605, N'Column 3', N'6161e331-2b3e-4665-b872-756c6bf00818', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17606, N'Column 1', N'013b3f72-0610-4365-9253-2763cb8d4d15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17607, N'Column 2', N'1b0d1922-0cae-4695-b06a-c3647a2d7a8c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17608, N'Column 3', N'110cddd4-62e1-43fc-8f8a-c9a3da3bdab3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17609, N'Column 1', N'1c2c1f16-1f17-4c2e-a87b-8a9a594a7038', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17610, N'Column 2', N'19313bcf-9c82-40a9-b29d-80d1e680fb2a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17611, N'Column 3', N'd179866d-6f73-4e76-8049-22520cef2dbb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17612, N'Column 1', N'ceef5a81-6369-45c3-b2f0-522159af6912', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17613, N'Column 2', N'e8ecb1eb-4d80-4e4d-a5b2-7f4737f99176', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17614, N'Column 3', N'6675f47f-ae5a-4882-b50a-82548a98c1aa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17615, N'Column 1', N'd5110510-dd2d-4970-bc7c-85905ad4824e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17616, N'Column 2', N'97481e5a-91e5-49c5-9d9a-4171abb9ded0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17617, N'Column 3', N'7cb68e57-c905-4f85-aeb4-de9013d95d0c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17618, N'Column 1', N'12549652-88fa-4665-a725-861fd80b70c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17619, N'Column 2', N'65bcc06e-dbdf-489d-bd84-c4e9430eb8cc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17620, N'Column 3', N'5089d80f-55c3-4330-8160-043155560759', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17621, N'Column 1', N'8eba5af7-b8e5-4bd8-8337-dce9f1a1c325', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17622, N'Column 2', N'573a0c10-f7ed-47bb-b409-f6a07a02a19a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17623, N'Column 3', N'e6b0b975-cf48-4ab2-9c76-933488c85625', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17624, N'Column 1', N'02ff3ca2-2328-49fb-b2c6-cc0384790835', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17625, N'Column 2', N'0c64d374-6dd4-49ff-93f7-267340abd685', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17626, N'Column 3', N'0f068a8d-66c6-4691-bd80-2c1ce3327364', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17627, N'Column 1', N'37fbc3ba-6a48-4086-ab0c-4d0538a8fa2b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17628, N'Column 2', N'f0f412cb-cad7-4c15-a4db-a7e10d6cf106', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17629, N'Column 3', N'daa009ea-b52a-4f29-8cee-f482cb88d13d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17630, N'Column 1', N'c7d4695c-d2c0-4a5e-90e5-2659da0554a5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17631, N'Column 2', N'32d073eb-56db-48d8-b16e-94f2c39ad2de', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17632, N'Column 3', N'3699b5e2-c51b-47b2-8c07-3d9842dc1025', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17633, N'Column 1', N'fc0c6ff8-eca5-4614-88ed-0a60d0d678a9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17634, N'Column 2', N'5f036b73-ed88-4ce7-b239-ad51d84463dd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17635, N'Column 3', N'0e4e998d-16db-46f2-afb2-63029f74fafe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17636, N'Column 1', N'2dd21f18-1bf0-418b-b643-a7fe6b362504', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17637, N'Column 2', N'94fece06-d92a-4975-83d2-b42ca36c160a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17638, N'Column 3', N'5379098f-f032-4352-b8f3-b00bf774c8cb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17639, N'Column 1', N'65fc2f18-ff96-4588-a55d-060cccd3c081', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17640, N'Column 2', N'5df6199d-fd2b-42a6-9307-4620ae8a65b7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17641, N'Column 3', N'cdd435e3-a2c9-4a10-81cf-53742cde6a08', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17642, N'Column 1', N'd099bb5a-79d2-43f0-b576-f504f9a3a9dc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17643, N'Column 2', N'f9008583-5a34-450c-9595-0bde69fe85f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17644, N'Column 3', N'23d4c4f4-ef85-4023-9648-9a0097eafea8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17645, N'Column 1', N'331656f4-a3d7-4979-8304-3108294c371f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17646, N'Column 2', N'08fc0777-9fdf-419c-8da8-7952b806a869', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17647, N'Column 3', N'f6ef2d4c-217a-4d78-b0bf-3049f9102a58', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17648, N'Column 1', N'b5348a05-92f8-4142-a155-648fe8f0b7db', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17649, N'Column 2', N'1c378905-87c6-4482-925b-58b27d53ed5a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17650, N'Column 3', N'd1bb79bb-f893-40ae-9f20-f159972b517c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17651, N'Column 1', N'12b5472e-3aa8-40af-90f4-52b130619206', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17652, N'Column 2', N'e451227c-acd5-4858-8916-4c915276ee38', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17653, N'Column 3', N'73db4448-fba9-45c4-a3fb-40677796e9d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17654, N'Column 1', N'06e50419-b163-4e8f-8a8d-81d383f279c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17655, N'Column 2', N'12aad7be-3e60-491e-b352-9b32673bbd7f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17656, N'Column 3', N'b807af16-9a6a-4aff-8f59-b849ac26b791', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17657, N'Column 1', N'f1055768-999c-43e4-aceb-22224c2658b6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17658, N'Column 2', N'2122b2d1-6885-4d91-a5f5-0ea336feefd6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17659, N'Column 3', N'c6644201-475f-4017-a9f2-ce674742e794', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17660, N'Column 1', N'2fa6a257-aa7a-451f-9d81-b53eb2ff0685', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17661, N'Column 2', N'02b321be-978a-4463-887e-404b684c6c7e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17662, N'Column 3', N'6349f14e-7dbb-4662-bb8d-32ffd0d33b7d', 0)
GO
print 'Processed 2500 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17663, N'Column 1', N'8e7f7b4d-166e-4f5f-ba11-4fa989f96240', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17664, N'Column 2', N'6147af1d-5337-40f9-8788-c0148f8796eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17665, N'Column 3', N'f2e8caea-edd6-4d0f-aa20-89f9bd2ca085', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17666, N'Column 1', N'fe4c87a7-6f9d-45cd-aa41-8665257e02fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17667, N'Column 2', N'6202443b-1bcc-49c1-af5a-89421e7ffcdc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17668, N'Column 3', N'b0824156-127c-4237-9d4d-13bfa6118abc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17669, N'Column 1', N'14442f41-de3f-43c4-99b3-d566350d52df', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17670, N'Column 2', N'11760843-f9f6-4ba0-9d1f-cd567d9b3574', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17671, N'Column 3', N'ad7ad7ef-2de9-415a-bf63-c4412ba3d712', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17672, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17673, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17674, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17675, N'Column 1', N'2fa7a7a8-92ea-49b8-ae8c-1563dcd74ad4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17676, N'Column 2', N'f6acad19-53fd-40b1-8106-2ecf0d22dcd5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17677, N'Column 3', N'32f03f64-f75b-4dff-9175-757a287c5055', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17678, N'Column 1', N'6c35cc21-a0df-4b04-8fda-00a42198c1bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17679, N'Column 2', N'fa9f67c2-e04b-425e-b745-db73f37a88c3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17680, N'Column 3', N'6d1ad900-84c1-4aff-9438-d658e25a07b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17681, N'Column 1', N'40fa3c98-21ce-4e03-b728-811b81bda5a4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17682, N'Column 2', N'3dc7465b-99a3-4595-964d-b811db1d543f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17683, N'Column 3', N'bb65da8b-73fa-4d8e-bba8-4d171ed5700d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17684, N'Column 1', N'3e3a5f31-1f38-4228-872d-2c1914371505', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17685, N'Column 2', N'bf3c648c-dda7-4e0f-bcfc-48ea46bf464b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17686, N'Column 3', N'48af70f2-021e-49d0-84b7-40dc44130358', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17687, N'Column 1', N'daba7971-edc7-4b08-8ea7-f6a59722df9d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17688, N'Column 2', N'783481e4-3fc3-4ad1-aab8-3d2c6d89193b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17689, N'Column 3', N'b7b9f89e-5808-42ac-acc6-e4904ccf2ec1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17690, N'Column 1', N'32599d71-8f97-4013-a0a8-11ac681c3afe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17691, N'Column 2', N'cd5870c8-2237-44c8-a2cf-fb7c2ffca1d9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17692, N'Column 3', N'68c6b4bb-df66-4d78-ae8e-2c51e7137fae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17693, N'Column 1', N'34494437-4378-45f6-914e-18b27356482c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17694, N'Column 2', N'91f20413-7f78-4f26-be40-f0303ebccc1f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17695, N'Column 3', N'74c4fbf2-cb4a-4cd1-b44e-1312a5d156aa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17696, N'Column 1', N'142bb7cd-4857-4111-94d2-b3be4e5348d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17697, N'Column 2', N'3ea1500e-c6ee-4d77-8ca2-a3e80914aed5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17698, N'Column 3', N'918d7982-0019-4da3-8175-09575f56399e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17699, N'Column 1', N'a4fe8835-57d6-4644-ac51-45e5970394c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17700, N'Column 2', N'3cabd1d1-08c8-4258-b8d3-7fd26a2b133e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17701, N'Column 3', N'7fe2aa9e-d799-41ce-a24a-cffe5deaa8ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17702, N'Column 1', N'a015366a-c605-4c63-a407-e5bb99eaad2d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17703, N'Column 2', N'19d0eb57-6475-41dd-9cd0-e7a3ec4a2d07', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17704, N'Column 3', N'598cefa9-22b6-41b3-a664-2a092e9cfbaf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17705, N'Column 1', N'c37918f5-59d8-4d8a-a6b6-c19172463a45', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17706, N'Column 2', N'28000c1c-1145-4be9-ae13-7115cf7df4d5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17707, N'Column 3', N'785c9d2b-98f1-4bf8-bbcf-7ead69e9a8b5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17708, N'Column 1', N'ab6bfba2-2344-455a-b958-58a7fc3a38ca', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17709, N'Column 2', N'1909afab-032e-4279-8400-2746c5367ecf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17710, N'Column 3', N'371603e1-1ced-4957-aca0-3fba58cd8721', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17711, N'Column 1', N'd9fc001c-0001-402a-ba75-0d34fc88d73c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17712, N'Column 2', N'4915a22d-4035-4734-8a8a-9d7264ed09e1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17713, N'Column 3', N'365dde1f-e3ba-4542-9dd9-06aeca5d230e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17714, N'Column 1', N'77b5c89b-aae9-4d59-98cc-4c8265b3cd8a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17715, N'Column 2', N'334580c2-5d8a-4452-b600-2e89d9557ed8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17716, N'Column 3', N'b617f9f1-df29-43c6-820c-9d638459f964', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17717, N'Column 1', N'3eaa7241-09e1-405f-aa3c-fed03b70cac7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17718, N'Column 2', N'5ec7aca7-f6b7-4030-9eff-dcdc6ea82212', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17719, N'Column 3', N'607a2fd8-e656-4753-936d-4b9da0519432', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17720, N'Column 1', N'bef16db8-613c-4b78-a77f-f75f195c7bf4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17721, N'Column 2', N'f0e071a2-4864-4ab2-a07e-34aca886acec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17722, N'Column 3', N'45adafb1-7d07-4694-977d-c853a2ed1a43', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17723, N'Column 1', N'21e313c0-d8c7-4ee1-b836-877167d5bdc7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17724, N'Column 2', N'3342a3ac-42b5-4e88-ad4a-b2d85da13bc1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17725, N'Column 3', N'7dacd1cd-d0b8-42ab-be1d-e85245ab201f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17726, N'Column 1', N'57ca21dd-79dd-403f-8269-3a59ec305f7c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17727, N'Column 2', N'60478ec6-a276-4af6-bc40-8de5341307c1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17728, N'Column 3', N'6b9ac09b-616f-4259-a1e4-302d277dde96', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17729, N'Column 1', N'188b745f-fc03-4504-81cb-4c83cc1bac89', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17730, N'Column 2', N'9b512927-4cc0-4797-a996-de033bd159b7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17731, N'Column 3', N'9774377b-5c00-4c90-a67c-44f40c3a8786', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17732, N'Column 1', N'f0d26f4a-bc3d-4ffe-b8ba-fdc25ccaa98c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17733, N'Column 2', N'6f15a00f-bcff-473d-bd5f-5975f9e378b4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17734, N'Column 3', N'b7ea2002-021b-454b-842e-d233243971bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17735, N'Column 1', N'8e297f30-e11f-4406-9d64-40f2319d82e7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17736, N'Column 2', N'ef818a2e-d7a8-450f-b0d4-ce1b887b12e4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17738, N'Column 1', N'ea0d8b6b-c7bf-4773-ad7a-e816468b6b91', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17739, N'Column 2', N'2bf8ddf5-5561-4b9c-9d21-32d3d272096e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17740, N'Column 3', N'9ef6920c-a66f-4880-9ac4-42ac84fa03e4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17741, N'Column 1', N'6ca773a0-9acc-4496-beed-de4be6ce6739', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17742, N'Column 2', N'd6bec69e-6baa-419e-8c2c-a1c659ede813', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17743, N'Column 3', N'f076c531-ddfb-4869-867c-28f25cae4d53', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17744, N'Column 1', N'56e3e416-3125-4abf-aa02-44af0e092b17', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17745, N'Column 2', N'621fa142-e780-4d67-a1f8-7c42e2c99e69', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17746, N'Column 3', N'8dcb0112-1fec-4633-945d-43bc37331754', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17747, N'Column 1', N'934e0b2e-6a89-4597-93f0-a419b63b8072', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17748, N'Column 2', N'240208a8-3a1a-4150-b7d4-84b35487f07d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17749, N'Column 3', N'362eb557-bd57-4f22-b567-799e5ae18aad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17750, N'Column 1', N'82b072a6-5fff-493b-a3da-8dc1a41a61f2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17751, N'Column 2', N'823a6c93-0c76-486f-bfab-cdc33804bc74', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17752, N'Column 3', N'd87f5448-7588-4ee6-8784-b385054849d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17753, N'Column 1', N'0217096a-abcb-45af-a877-a82eacb8353c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17754, N'Column 2', N'ee49d3c7-ca09-49d4-994b-36c404418ab5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17755, N'Column 3', N'be7ca656-8881-4ffd-80ed-0b6237606042', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17756, N'Column 1', N'46956728-0602-4f43-b18b-f063e28ef5d9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17757, N'Column 2', N'cdc9983a-393c-48de-b65c-cd8afc2c2b3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17758, N'Column 3', N'c2f19460-8c42-4849-ada4-8031a2dd7c16', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17759, N'Column 1', N'12077e1a-e00d-41db-a922-77a498228788', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17760, N'Column 2', N'58e1d47a-4d4e-4ea5-876e-df719f528802', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17761, N'Column 3', N'c394347b-a0c8-4c87-99a6-3dcb5e103907', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17762, N'Column 1', N'b792cd91-2635-4712-bf5d-74614be24ebd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17763, N'Column 2', N'8d6bf2af-454a-47ec-9eec-6efa884ab213', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17764, N'Column 3', N'85f75ea6-b28c-4a09-889a-a9e144677077', 0)
GO
print 'Processed 2600 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17765, N'Column 1', N'6ae90efa-0b21-4c80-968a-b51a4dde1a2c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17766, N'Column 2', N'429fdb1d-3d1e-405d-9b47-289d06092bec', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17767, N'Column 3', N'8af0084c-ae6a-42da-b269-d69b7cd9a2e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17768, N'Column 1', N'a53c2d09-c856-4827-9e0e-f85831d08be3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17769, N'Column 2', N'a682f1f2-0a70-451e-a9b3-60ba6ae16464', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17770, N'Column 3', N'ed3deae0-d08f-4ae9-bbcc-66539f0f4141', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17771, N'Column 1', N'983908c1-6695-43b0-a95e-34eca1b2e807', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17772, N'Column 2', N'a99dd9d1-d18e-47d0-a967-4609e34f0bcc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17773, N'Column 3', N'13e614a8-6d2f-4da1-b4fa-bfba11b86e0d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17774, N'Column 1', N'5c5cf61d-29de-4170-b3f3-b64597b30761', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17775, N'Column 2', N'c683835e-995b-4939-ae80-0a83d28884e3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17776, N'Column 3', N'219f6de9-873b-4ff8-b697-d7eb06cc76f1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17777, N'Column 1', N'd746c38b-66b2-4e71-b992-202f1877e7b1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17778, N'Column 2', N'43e55825-aa57-416b-bfc5-83653c1c5873', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17779, N'Column 3', N'a75f276d-67d6-4c85-b32d-3741bd101485', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17780, N'Column 1', N'4411e0e8-78d9-43cd-810e-f44ba8e040d1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17781, N'Column 2', N'4aaefe5a-639e-4a0c-97b0-dc51c4b0b589', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17782, N'Column 3', N'4027a263-184a-43b8-9201-9dceb5599637', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17783, N'Column 1', N'd6d41e7f-d2fb-475e-b01c-fd7554222c4d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17784, N'Column 2', N'6d39d3cc-5b74-4e75-8f60-8aeb513c82f4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17785, N'Column 3', N'e8bbe20c-12a1-4d74-937f-b1b02de32159', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17786, N'Column 1', N'8f747293-b449-416a-b8a9-c0c8702cddf4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17787, N'Column 2', N'fc13ce59-1030-4aee-ac3a-79f311619e82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17788, N'Column 3', N'168c24ff-c421-4385-84b1-fb0bdcd3ac3f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17789, N'Column 1', N'8225e7f2-9980-4e77-a983-79085959d9c1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17790, N'Column 2', N'8a1e1b95-5387-4033-9413-4494f7af2e46', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17791, N'Column 3', N'0194cc11-9a51-4108-b9f3-7ce74aa9a216', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17792, N'Column 1', N'3ea0dd03-e05b-49aa-a11b-1aa22218f627', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17793, N'Column 2', N'9b9f5333-7193-4d47-aaca-47b3d4fe459a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17794, N'Column 3', N'9b10004f-0ab1-481a-8e2b-0b5a50a270c2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17795, N'Column 1', N'c7e875d6-9ff5-4532-b412-7cc8fd2c718a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17796, N'Column 2', N'5778b026-bf9e-48f6-81d8-ecdc01e91486', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17797, N'Column 3', N'2b807abf-f39f-4c91-8928-fcbe04ef9ac7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17798, N'Column 1', N'18a26467-ed6a-4fd1-8ed6-f25b11cfdc73', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17799, N'Column 2', N'a683ba53-2586-4c65-ba9e-8a373cf80679', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17800, N'Column 3', N'f9453c5d-ed2e-450b-a50c-b331ec433340', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17801, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17802, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17803, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17804, N'Column 1', N'78d0db20-7a8b-4a99-8854-c41bdb14db12', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17805, N'Column 2', N'3e0d9620-bc71-46b5-a363-8ac9b524db37', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17806, N'Column 3', N'3bdfa7e4-ec23-4c11-b9e7-80d59050736c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17807, N'Column 1', N'542c462b-557c-466d-99ca-5a554bd94db0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17808, N'Column 2', N'9cfc2a0a-27e7-4bb6-9013-aacb41b25bde', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17809, N'Column 3', N'9f051211-d475-4587-b30e-5ffaa836f685', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17810, N'Column 1', N'b5f83630-6ba5-485c-b6f3-92594db5cc08', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17811, N'Column 2', N'20ae250f-1003-4105-a9c8-b6f6c749a9fe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17812, N'Column 3', N'a5a98d1c-e3f1-475d-b9d7-27382103bee7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17813, N'Column 1', N'e0e874df-6c74-4d29-b80c-719fe35f56e5', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17814, N'Column 2', N'b5af5c26-4d1c-464c-a8a1-11cee65ca376', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17815, N'Column 3', N'01947734-e362-45ee-b8c0-ba164c08637a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17816, N'Column 1', N'fca9ddb7-366b-45ef-b194-f1752022a422', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17817, N'Column 2', N'0098ba91-31eb-4d96-bddf-fcb6780c7e01', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17818, N'Column 3', N'533ac48b-0b75-4242-9f8c-190ae6aa95fd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17819, N'Column 1', N'5b3aaeb1-5d2b-4df7-920d-0b61780d1650', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17820, N'Column 2', N'654fc3db-c821-465d-a955-d0649d9b9960', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17821, N'Column 3', N'51e55d27-6cc1-4310-8ede-db893d442e35', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17822, N'Column 1', N'88319b9a-8b16-4774-9bf9-c67c0233b1c2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17823, N'Column 2', N'6d1eaa66-5ab2-444f-a293-0be46f9aca42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17824, N'Column 3', N'9377af04-6d7e-42de-8c3f-00e839b8a304', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17825, N'Column 1', N'73caac7c-4605-491a-9320-a4059b28d5fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17826, N'Column 2', N'6318376f-fa56-49d8-9951-b28548dfc2ad', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17827, N'Column 3', N'24b01ea8-5721-44ff-a86a-967a3ed65da1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17828, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17829, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17830, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17831, N'Column 1', N'691dd721-51d3-4fe9-82c0-2af7146c2fc0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17832, N'Column 2', N'5718781a-3445-4029-8985-dbca61d7f2d0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17833, N'Column 3', N'20378f06-d965-491f-aa46-0f7b80668053', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17834, N'Column 1', N'52ea20a5-3ff5-4d3c-809d-6e4fe1ff0a63', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17835, N'Column 2', N'27bd2eca-2e95-454b-a028-1aea75e581d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17836, N'Column 3', N'0da116fa-0452-4988-b7ee-936e2892b286', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17837, N'Column 1', N'682d8f50-cb67-4b2c-9bd7-c9c1d9db896d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17838, N'Column 2', N'77ace222-6cad-4db7-b505-818650e5d09a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17839, N'Column 3', N'ba51d29d-ab1c-4865-9bf1-2fa260e3dbd8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17840, N'Column 1', N'8fc8727d-13d1-4aaa-b961-90b35a5267c6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17841, N'Column 2', N'792f73b7-df43-4afa-a9a5-a4cef1a417f7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17842, N'Column 3', N'9581c62d-dc72-4cf6-9352-cc6c529b4d56', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17843, N'Column 1', N'7dc4f185-a43a-41e0-8d00-fa46d653cfa3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17844, N'Column 2', N'018416d2-0eba-48d1-87f9-85c68bffe14d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17845, N'Column 3', N'626c81a3-9684-4f19-be4b-9ee93479a7b2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17846, N'Column 1', N'18f7659a-e3ed-4ee4-a8ef-776c1a8a42f8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17847, N'Column 2', N'762f8a39-cea1-46b9-a11f-2e02fec65fd1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17848, N'Column 3', N'c176c90b-29d7-414b-a808-d99dbd3e5412', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17849, N'Column 1', N'212618cb-c3ee-422c-914f-e8dec2e08a8e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17850, N'Column 2', N'5a5a2af5-5614-4f39-8bac-dfdea1b250fa', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17851, N'Column 3', N'6d64210c-6cbd-41dc-8499-b0a0db8de40c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17852, N'Column 1', N'a5b70d4b-0a57-40b6-9016-726dbc581cdd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17853, N'Column 2', N'5aebf8b8-dce4-4817-9b3b-402e91610691', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17854, N'Column 3', N'570b9cbd-57eb-47b5-ab33-300e4f9993ae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17855, N'Column 1', N'f3ca64d2-582b-41b8-ae9e-59c8f6fcba15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17856, N'Column 2', N'd1fc53aa-6dfb-4d02-b948-af4b83234a45', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17857, N'Column 3', N'4dfac4eb-4e7f-4b3b-9f34-db7927e7ebd7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17858, N'Column 1', N'6c64dfeb-3046-4b65-be09-563a2e56f999', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17859, N'Column 2', N'175ad6a5-0c23-4ab0-8126-4621a97eef43', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17860, N'Column 3', N'9d8c4df4-f726-4da1-bc51-b3b3e621f277', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17861, N'Column 1', N'0c3c0450-831c-49b0-b4dc-356f4eb50d10', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17862, N'Column 2', N'53ea4e27-2d42-45f4-84af-9e5d5e75edee', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17863, N'Column 3', N'fcef272a-2c4d-4696-91a1-fac81a1d35c0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17864, N'Column 1', N'bdc99cd4-2fcc-4f00-89c7-f6dbd5a46dd3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17865, N'Column 2', N'637e6185-f6a3-4770-a551-26831868e441', 0)
GO
print 'Processed 2700 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17866, N'Column 3', N'504dbc9b-7447-40af-a991-26ca2c676a82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17867, N'Column 1', N'826bc527-96f0-4f88-8c65-bc1856a8bb05', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17868, N'Column 2', N'8f919f81-72b4-441f-8654-e3379c686314', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17869, N'Column 3', N'044690f0-db4b-4bd5-8cf1-55dbb4f34873', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17870, N'Column 1', N'3a1990f5-3e5e-4885-8bb2-fe12363305cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17871, N'Column 2', N'4a7d1315-c5b3-4a7d-9a3a-cb9d99eae974', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17872, N'Column 3', N'f716fd49-2a26-4cf7-a887-3f49fa202e69', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17873, N'Column 1', N'3a759d7b-425c-46b6-b32e-16d72c1f30d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17874, N'Column 2', N'7130b353-40b6-40af-8588-7c533a7e7357', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17875, N'Column 3', N'db7fff10-7322-4fff-b06b-9ddddbb0a8c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17876, N'Column 1', N'cc055f84-f708-46fa-9dae-6b1e8007b52c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17877, N'Column 2', N'2d6456da-b791-4393-a612-d83f1b51b9a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17878, N'Column 3', N'd6e641a6-762d-4b84-8715-9c24d5c5aab2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17879, N'Column 1', N'0e8c4848-5f23-482b-80f6-16cc18b9b165', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17880, N'Column 2', N'ea5e17a2-427a-4a53-90c2-dbd0e039e9c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17881, N'Column 3', N'3464478c-9e0b-4a76-9f62-b5d545d1253f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17882, N'Column 1', N'aef8417c-c82b-4cda-babe-8b2974566cc3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17883, N'Column 2', N'b4562962-b5c2-45a9-a146-475ab510f7bb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17884, N'Column 3', N'8262e83b-deba-49df-9af3-449dad3957f0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17885, N'Column 1', N'30784caa-53af-4d5a-8105-da2591e07963', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17886, N'Column 2', N'339bed71-24ad-4f34-8c99-1aaef999cf42', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17887, N'Column 3', N'9f039ae1-815d-4500-b0d1-0ec6a5b225cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17888, N'Column 1', N'd0ca5d03-59f7-4125-9778-f8818d7f5e90', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17889, N'Column 2', N'ea40b0f7-c91c-43af-8fdb-a1c6d84d6525', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17890, N'Column 3', N'592e3b35-b673-401d-a4aa-f6b3fa395092', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17891, N'Column 1', N'1b57549c-f390-4368-9dc2-9f02094d094d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17892, N'Column 2', N'7e61d64f-daf3-40bf-96ed-4b8999be3b14', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17893, N'Column 3', N'fba92e18-96c3-4f22-9f2b-08f92795e8cc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17894, N'Column 1', N'326b921a-5531-4aae-a7eb-eb68b0a4cafb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17895, N'Column 2', N'd40aa2e7-7164-498b-8b2a-cf7426d571d9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17896, N'Column 3', N'af992451-3d5e-48ee-a308-aff44e48442e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17897, N'Column 1', N'47f0f418-e0b9-4532-acd9-1309ca12765c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17898, N'Column 2', N'67489db2-2a21-4359-95fc-da46f5d55cbb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17899, N'Column 3', N'ba23b8f8-9bce-4d96-90df-1de47ea675d8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17900, N'Column 1', N'b9ebcc17-9ece-4884-aa02-5c35fedacd65', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17901, N'Column 2', N'45fc3be5-e4a7-499c-b8f9-bd872151d854', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17902, N'Column 3', N'b9bcca24-0cc0-4fa0-96cb-46c14d6ce274', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17903, N'Column 1', N'a5ec666b-967c-4445-bb76-7ea7ce311d88', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17904, N'Column 2', N'4b322efc-7d16-43ef-abb0-95af178db48b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17905, N'Column 3', N'83611e2b-494d-4688-910c-c93e0cef75ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17906, N'Column 1', N'0d4bd697-e9cb-4281-a01b-b3c4fb2425b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17907, N'Column 2', N'5bf804c8-2f71-4f55-a49b-4b5bb917bf3a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17908, N'Column 3', N'93a7b598-6833-473c-9f61-f1251df9e79c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17909, N'Column 1', N'ce51ebaa-c0ae-422f-857b-acd78af597e6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17910, N'Column 2', N'd1016feb-c36a-4a8a-b96b-52c0b7a6d094', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17911, N'Column 3', N'a2471ffa-e1fa-46dc-b6b7-14c799bf71b9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17912, N'Column 1', N'3552b09b-f788-4421-95d8-d34f0f4e25a3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17913, N'Column 2', N'bea5b02b-8182-46ea-a9f6-3899dedb3c51', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17914, N'Column 3', N'9c06d52f-8f93-4b81-b10e-fab720e5199d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17915, N'Column 1', N'Column 1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17916, N'Column 2', N'Column 2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17917, N'Column 3', N'Column 3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17918, N'Column 1', N'de3cd7ca-7f30-400f-971e-29621ee2992d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17919, N'Column 2', N'1ef4e57b-cfd3-4639-9ab1-3b48fc043f3e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17920, N'Column 3', N'22c3d041-6613-4fc9-905d-c13457d1b38a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17921, N'Column 1', N'5df9456b-3f15-403f-89ee-a9b29c56e5bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17922, N'Column 2', N'954efc58-9738-4926-b1c6-3bebd9ae4f49', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17923, N'Column 3', N'ab7697cc-adde-46fb-8b2b-489b78158673', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17924, N'Column 1', N'879a0a49-b79e-4daf-b3ac-16986df8b367', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17925, N'Column 2', N'1a220b75-e85d-4f69-bad6-eaf11f3780d6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17926, N'Column 3', N'd36a2f22-c16d-4324-aed8-ede3f92eb8fc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17927, N'Column 1', N'26ee36bc-94dc-4146-b5e0-0e983c250b21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17928, N'Column 2', N'08e43183-52d2-42f0-a83a-519fc4a67705', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17929, N'Column 3', N'be7a049e-bcb2-408e-8cc8-7b121ec49f26', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17930, N'Column 1', N'62e632b9-be2f-422b-8029-2ed2681a8be4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17931, N'Column 2', N'be10229e-591a-4785-b8b0-c122a4a3e22c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17932, N'Column 3', N'80b76499-ac48-457f-acf3-19cc390c59bc', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17933, N'Column 1', N'6b65fa16-1c1d-4226-b79e-e88be23d12c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17934, N'Column 2', N'e0f51cde-5ed7-4827-b757-291654357a82', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17935, N'Column 3', N'702d9f20-f65f-4b67-ad95-63f47315ad15', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17936, N'Column 1', N'3b1e1bee-f78e-4ee2-84c9-4e38bb994dde', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17937, N'Column 2', N'eda52267-6e71-428d-9227-8059605eadf4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17938, N'Column 3', N'0d345231-4782-46f8-802d-21c4c149a43a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17939, N'Column 1', N'bc8a6566-1e0e-40f6-8bde-3f7ef323a589', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17940, N'Column 2', N'93d3bdaa-4be2-4094-9d2c-1d25d308e3a8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17941, N'Column 3', N'58cf2b69-99ef-4e49-9fe1-16fb97261a92', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17942, N'Column 1', N'4d6f16f6-0741-475a-99e5-8ba73c7ea262', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17943, N'Column 1', N'98345321-0965-4d42-9550-fb50adfed8b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17944, N'Column 2', N'4d92dc20-88da-4cc0-8c60-eec45efc819e', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17945, N'Column 2', N'e301fbae-9f80-42b6-b819-f7bbd826aeb4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17946, N'Column 3', N'fd6edcb2-09f2-4e9d-bfde-d01561b2db1c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17947, N'Column 3', N'16b09d6e-7768-4fe2-89f8-813570bff63f', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17948, N'Column 1', N'd5b526f8-27aa-4f33-8c16-be6134c35820', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17949, N'Column 1', N'ea8f0b43-6f6a-4fe2-b27b-d4c3c02d51cb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17950, N'Column 2', N'878b5d78-68ec-4e6e-adc2-7f9ff8c5403d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17951, N'Column 2', N'a1a17a1a-1353-4d54-b955-96c0ca887230', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17952, N'Column 3', N'26753fdf-3ba9-4140-a978-492ea7754dc1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17953, N'Column 3', N'6bd7793a-c976-4e6c-a994-68f8b6ba55b7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17954, N'Column 1', N'679377a9-66ae-432e-997e-112dee5a74c4', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17955, N'Column 2', N'8faff0db-dff8-4022-a0f3-cc5b674589f8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17956, N'Column 3', N'bbc4fbc3-12ef-48ba-8fc1-19fb36aaeb18', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17957, N'Column 1', N'8851fe75-2d30-4a6c-aaf4-89fea13d1aae', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17958, N'Column 2', N'730f7f17-c710-4f5e-b39f-aa8d599266be', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17959, N'Column 3', N'ea4b90fd-fe8c-40af-9d64-d0ef14e0d719', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17960, N'Column 1', N'42d5eb32-6290-4276-8f70-c852f76af0eb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17961, N'Column 2', N'eaab493c-0a9b-4ac7-b906-1ccd9217aa4a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17962, N'Column 3', N'7f087269-173e-4ae6-8353-50f5d7f890ac', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17963, N'Column 1', N'af98be7b-a178-4046-b883-87ec371ee298', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17964, N'Column 2', N'30a6fc8c-304e-4f07-b3d2-b6f682768c22', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17965, N'Column 3', N'1a95cdcb-61cc-4110-9388-8daf1f996ee7', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17966, N'Column 1', N'c68a0f86-9a41-497d-96c7-938c27e0bdb0', 0)
GO
print 'Processed 2800 total records'
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17967, N'Column 2', N'7398cf8f-33c3-4094-ae82-fc6922981747', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17968, N'Column 3', N'8543c0e7-9cee-426f-8d13-e27353999193', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17969, N'Column 1', N'65b714b6-1314-4f28-bb09-0e4b46bb87b8', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17970, N'Column 2', N'd01b9c70-1500-4490-90f4-94b87ebba1a1', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17971, N'Column 3', N'376f2cd0-2310-478c-868c-2339eab330a2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17972, N'Column 1', N'd2b9946e-1cb6-4c23-a30d-ff63a59f6ebe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17973, N'Column 2', N'30725a6a-3fb0-4f8c-b817-aba13360cbc2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17974, N'Column 3', N'11d01732-7054-412f-8e15-201672152795', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17975, N'Column 1', N'37c3532b-a276-488a-8126-24b2b170b875', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17976, N'Column 2', N'422757d7-c049-432d-bd20-9c913bd4f4c0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17977, N'Column 3', N'05498a48-d7b2-40a4-a8da-09df13e7e595', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17978, N'Column 1', N'968bd9aa-99b3-4fb5-9a40-70c05c6fad21', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17979, N'Column 2', N'2f8b09b9-18e8-4281-83b1-e2938b8b46fe', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17980, N'Column 3', N'ff101f5a-25d4-443b-a8b8-ad75185d79c9', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17981, N'Column 1', N'83b01ca1-be64-4895-bc2d-3e0379649725', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17982, N'Column 2', N'98147fee-b1cc-4df0-b6ba-775871d386e2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17983, N'Column 3', N'1889160d-c541-4081-a5a0-8becaaf4f60a', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17984, N'Column 1', N'197ea90c-acb6-4f31-b8ae-8f352521e16d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17985, N'Column 2', N'31f85d1d-9bf8-4c48-a247-7cde3c36afb2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17986, N'Column 3', N'24cf381e-dc32-492d-a44a-be523733b923', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17987, N'Column 1', N'9d086740-8db7-48eb-ad48-b77ba285c064', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17988, N'Column 2', N'944390e2-274f-465e-8702-7adc09e6f77d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17989, N'Column 3', N'd3565323-0525-4aa3-9821-69f53a6e6cf3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17990, N'Column 1', N'edf145ed-1740-4c0a-9f73-531dc56f8a78', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17991, N'Column 2', N'e3afb962-406b-4ea2-a888-843989314ede', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17992, N'Column 3', N'9599adb5-013b-43b3-9ed4-d1a4532d2fdf', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17993, N'Column 1', N'd3aba922-b39d-4678-a291-09ce7971652d', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17994, N'Column 2', N'19d8df09-a1e5-4af6-ada2-51eb0bbebf61', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17995, N'Column 3', N'616f9ffa-90d9-4445-910a-8534445dbed6', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17996, N'Column 1', N'390ce54d-bc43-4623-83d2-e5785d13341b', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17997, N'Column 2', N'2e8d1a7d-a43f-40f8-bd05-6a9450cd1984', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17998, N'Column 3', N'ab059f16-64fe-4408-8afa-eb716c94574c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (17999, N'Column 1', N'0c9220b9-ec17-437f-977c-b143a0628a6c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18000, N'Column 2', N'ff7a4b1b-d67b-492e-a6ea-3ad11830c7ba', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18001, N'Column 3', N'9cc3221b-e0aa-43b9-8922-4b80d90987d2', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18002, N'Column 1', N'd710eebc-528d-4854-89e4-f058714bca1c', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18003, N'Column 2', N'9049f365-c04a-4184-aa68-c448966c82ff', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18004, N'Column 3', N'fdb3bf92-a264-46a6-bdc5-eea0fb7feafb', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18005, N'Column 1', N'807229a7-d930-457f-95ab-89456f61a416', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18006, N'Column 2', N'84b087b6-98da-42ee-a41b-4e019be6a014', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18007, N'Column 3', N'89f6df3d-e2df-4387-9db5-4fc53563abe0', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18008, N'Column 1', N'643a4d56-7935-47c4-8c91-0085131239d3', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18009, N'Column 2', N'72b42121-33ec-4334-aade-26a468ba49dd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18010, N'Column 3', N'24c7cc27-de1c-4ef0-a545-dbb5f2d3c0cd', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18011, N'Column 1', N'70281906-cc24-4222-b7e5-d6af0c001958', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18012, N'Column 2', N'a2e43502-f96e-4270-a7a5-529eefaada61', 0)
INSERT [dbo].[WidgetZone] ([ID], [Title], [UniqueID], [OrderNo]) VALUES (18013, N'Column 3', N'bd38881f-1035-4c05-b8f0-5a80eed2580a', 0)
SET IDENTITY_INSERT [dbo].[WidgetZone] OFF
/****** Object:  Table [dbo].[Widget]    Script Date: 12/16/2010 22:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Widget](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DefaultState] [nvarchar](max) NOT NULL,
	[Icon] [varchar](255) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[VersionNo] [int] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
	[WidgetType] [int] NOT NULL,
 CONSTRAINT [PK_Widget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_IsDefault] ON [dbo].[Widget] 
(
	[IsDefault] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Widget] ON
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (4, N'Flickr', N'Widgets\FlickrWidget.ascx', N'Flickr Photo Widget which shows photos from Flickr', N'<state><type>MostRecent</type><tag /></state>', N'Widgets/FlickrIcon.gif', 0, N'registeredUser', 0, 0, CAST(0x0000989000000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (6, N'Widget Tester', N'~/Widgets\WidgetTester.ascx', N'Widget Tester', N'', N'Widgets/RSS.gif', 0, N'registeredUser', 0, 0, CAST(0x0000989B00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (7, N'CNN.com', N'Widgets\RSSWidget.ascx', N'CNN.com Top News', N'<state><url>http://rss.cnn.com/rss/cnn_topstories.rss</url><count>10</count></state>', N'Widgets/RSS.gif', 4, N'guest', 0, 1, CAST(0x0000989E00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (8, N'How to of the Day', N'Widgets\RSSWidget.ascx', N'How to of the Day', N'<state><url>http://www.wikihow.com/feed.rss</url></state>', N'Widgets/RSS.gif', 1, N'registeredUser', 0, 1, CAST(0x0000989E00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (169, N'BBC World', N'Widgets/RssWidget.ascx', N'BBC World', N'<state><url>http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/world/rss.xml</url></state>', N'Widgets/RSS.gif', 7, N'registeredUser', 0, 1, CAST(0x000098A0001E1590 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (547, N'Omar''s Blog (Fast RSS)', N'~/Widgets/FastRssWidget.ascx', N'Fast RSS Widget', N'<state><url>http://feeds.feedburner.com/OmarAlZabirBlog</url><count>10</count></state>', N'Widgets/RSS.gif', 12, N'guest', 0, 1, CAST(0x000099AA00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (549, N'Fast Flickr', N'Widgets/FastFlickrWidget.ascx', N'Fast Flickr Widget', N'<state><type>MostPopular</type><tag /></state>', N'Widgets/FlickrIcon.gif', 5, N'registeredUser', 0, 1, CAST(0x000099AB00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (623, N'Horoscope', N'widgets/horoscopewidget.ascx', N'Horoscope', N'', N'Widgets/horoscope.png', 8, N'registeredUser', 0, 1, CAST(0x000099BF00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (624, N'Weather', N'widgets/weatherwidget.ascx', N'Weather', N'', N'Widgets/WeatherChannel.ico', 6, N'registeredUser', 0, 1, CAST(0x000099BF00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (640, N'Book on building Dropthings', N'widgets/TemplateWidget.ascx', N'Book on building Dropthing', N' ', N'~/Widgets/RSS.gif', 9, N'guest', 1, 1, CAST(0x00009A3A00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (641, N'IFrame Widget', N'widgets/IFrameWidget.ascx', N'Generic IFrame', N'<state><url>http://www.labpixies.com/campaigns/notes/notes.html</url><width>300</width><height>200</height></state>', N'Widgets/RSS.gif', 0, N'guest', 0, 0, CAST(0x00009A4A00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (642, N'HTML', N'widgets/HtmlWidget.ascx', N'Generic HTML', N'<state><![CDATA[<center>This is an <big>HTML</big> widget. You can put <b>any</b> HTML here as you like. You can put <i>pictures</i>, <u>videos</u>, animations, color full text, tables and <small>so on</small>.</center>]]></state>', N'Widgets/RSS.gif', 11, N'guest', 0, 1, CAST(0x00009A4B00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (644, N'Travelocity', N'widgets/IFrameWidget.ascx', N'Travelocity', N'<state><url>http://cdn.labpixies.com/campaigns/travelocity/travelocity.html</url><width>275</width><height>285</height></state>', N'Widgets/RSS.gif', 10, N'guest', 0, 1, CAST(0x00009A4A00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (645, N'Sports', N'widgets/IFrameWidget.ascx', N'Sports', N'<state><url>http://cdn.labpixies.com/campaigns/sports/sports.html</url><width>276</width><height>318</height></state>', N'Widgets/RSS.gif', 3, N'guest', 0, 1, CAST(0x00009A4A00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (646, N'Stock', N'widgets/IFrameWidget.ascx', N'Stock', N'<state><url>http://gmodules.com/ig/ifr?url=http://www.labpixies.com/campaigns/finance/finance.xml</url><width>287</width><height>200</height></state>', N'Widgets/RSS.gif', 2, N'guest', 0, 1, CAST(0x00009A4A00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (647, N'NatGeo Photo', N'widgets/HtmlWidget.ascx', N'NatGeo Photo', N'<state><![CDATA[<object type="application/x-shockwave-flash" data="http://widgets.clearspring.com/o/4755bfb548454fb1/47c18f292a290c79/47a88fbec346263d/9bbabd9e" id="W4755bfb548454fb147c18f292a290c79" height="250" width="300"><param value="http://widgets.clearspring.com/o/4755bfb548454fb1/47c18f292a290c79/47a88fbec346263d/9bbabd9e" name="movie"/><param value="transparent" name="wmode"><param value="all" name="allowNetworking"><param value="always" name="allowScriptAccess"></object>]]></state>', N'Widgets/RSS.gif', 0, N'guest', 0, 0, CAST(0x00009A4B00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (648, N'Digg', N'widgets/DiggWidget.ascx', N'Dig Silverlight Widget', N'<state><topic>basketball</topic></state>', N'Widgets/RSS.gif', 0, N'guest', 0, 1, CAST(0x00009CB400000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (649, N'Master Widget', N'widgets/EventTest/MasterWidget.ascx', N'Master Widget to Test Event', N'<state></state>', N'Widgets/Rss.gif', 0, N'guest', 0, 0, CAST(0x00009BBF00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (650, N'Child Widget', N'widgets/EventTest/ChildWidget.ascx', N'Child Widget to Test Event', N'<state></state>', N'Widgets/Rss.gif', 0, N'guest', 0, 0, CAST(0x00009BBF00000000 AS DateTime), 1, 0)
INSERT [dbo].[Widget] ([ID], [Name], [Url], [Description], [DefaultState], [Icon], [OrderNo], [RoleName], [IsLocked], [IsDefault], [CreatedDate], [VersionNo], [WidgetType]) VALUES (651, N'Twitter', N'widgets/TwitterWidget.ascx', N'Twitter Widget', N'<state></state>', N'Widgets/TwitterIcon.gif', 0, N'guest', 0, 1, CAST(0x0000901A00000000 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Widget] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 12/16/2010 22:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(20)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'Dashboard', N'dashboard', N'fd639154-299a-4a9d-b273-69dc28eb6388', NULL)
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'4e7c1e10-4e20-43a0-bfd8-93b2cac372e3', N'admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'b1df176b-ba0c-48f0-891c-a6b856c44ad5', N'Guest', N'guest', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'284396d6-c1fb-4888-bfa4-70693e34008d', N'RegisteredUser', N'registereduser', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', N'anon_user@yourdomain.com', N'anon_user@yourdomain.com', NULL, 0, CAST(0x00009E4E016D58C6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'78b56cd2-7e16-4480-b062-9284b2165a5f', N'reg_user@yourdomain.com', N'reg_user@yourdomain.com', NULL, 0, CAST(0x00009C8A00E83230 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[WidgetInstance]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WidgetInstance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WidgetZoneId] [int] NOT NULL,
	[WidgetId] [int] NOT NULL,
	[OrderNo] [int] NOT NULL,
	[Expanded] [bit] NOT NULL,
	[Maximized] [bit] NOT NULL,
	[Resized] [bit] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[VersionNo] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
 CONSTRAINT [PK_WidgetInstance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Widget_WidgetZoneId_OrderNo] ON [dbo].[WidgetInstance] 
(
	[WidgetZoneId] ASC,
	[OrderNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WidgetInstance] ON
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31190, 15109, 648, 1, 1, 0, 0, 0, 0, N'Digg - Silverlight Widget', N'<state>
  <topic>Web 2.0 Programming</topic>
</state>', 1, CAST(0x00009C8A015B8D35 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31191, 15107, 8, 0, 1, 0, 0, 0, 0, N'How to of the Day', N'<state><url>http://www.wikihow.com/feed.rss</url><count>3</count></state>', 1, CAST(0x00009C8A015B8D3C AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31194, 15107, 7, 3, 1, 0, 0, 0, 0, N'CNN.com', N'<state><url>http://rss.cnn.com/rss/cnn_topstories.rss</url><count>10</count></state>', 1, CAST(0x00009C8A015B8D4B AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31197, 15107, 169, 2, 1, 0, 0, 0, 0, N'BBC World', N'<state><url>http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/world/rss.xml</url><count>5</count></state>', 1, CAST(0x00009C8A015B8D63 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31199, 15109, 640, 0, 1, 0, 0, 0, 0, N'Book on building Dropthings', N' ', 1, CAST(0x00009C8A015B8D70 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31201, 15109, 642, 2, 1, 0, 0, 0, 0, N'HTML', N'<state><![CDATA[<center>This is an <big>HTML</big> widget. You can put <b>any</b> HTML here as you like. You can put <i>pictures</i>, <u>videos</u>, animations, color full text, tables and <small>so on</small>.</center>]]></state>', 1, CAST(0x00009C8A015B8D77 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31203, 15110, 648, 0, 1, 0, 0, 0, 0, N'Digg', N'<state><topic>basketball</topic></state>', 1, CAST(0x00009C8A015B8F62 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31204, 15110, 8, 1, 1, 0, 0, 0, 0, N'How to of the Day', N'<state><url>http://www.wikihow.com/feed.rss</url></state>', 1, CAST(0x00009C8A015B8F67 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31205, 15110, 646, 2, 1, 0, 0, 0, 0, N'Stock', N'<state><url>http://gmodules.com/ig/ifr?url=http://www.labpixies.com/campaigns/finance/finance.xml</url><width>287</width><height>200</height></state>', 1, CAST(0x00009C8A015B8F6C AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31206, 15110, 645, 3, 1, 0, 0, 0, 0, N'Sports', N'<state><url>http://cdn.labpixies.com/campaigns/sports/sports.html</url><width>276</width><height>318</height></state>', 1, CAST(0x00009C8A015B8F71 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31207, 15110, 7, 4, 1, 0, 0, 0, 0, N'CNN.com', N'<state><url>http://rss.cnn.com/rss/cnn_topstories.rss</url><count>10</count></state>', 1, CAST(0x00009C8A015B8F75 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31208, 15111, 549, 0, 1, 0, 0, 0, 0, N'Fast Flickr', N'<state><type>MostPopular</type><tag /></state>', 1, CAST(0x00009C8A015B8F79 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31209, 15111, 624, 1, 1, 0, 0, 0, 0, N'Weather', N'', 1, CAST(0x00009C8A015B8F7D AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31210, 15111, 169, 2, 1, 0, 0, 0, 0, N'BBC World', N'<state><url>http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/world/rss.xml</url></state>', 1, CAST(0x00009C8A015B8F8B AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31211, 15111, 623, 3, 1, 0, 0, 0, 0, N'Horoscope', N'', 1, CAST(0x00009C8A015B8F98 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31212, 15111, 640, 4, 1, 0, 0, 0, 0, N'Book on building Dropthings', N' ', 1, CAST(0x00009C8A015B8FAA AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31213, 15112, 644, 0, 1, 0, 0, 0, 0, N'Travelocity', N'<state><url>http://cdn.labpixies.com/campaigns/travelocity/travelocity.html</url><width>275</width><height>285</height></state>', 1, CAST(0x00009C8A015B8FB4 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31214, 15112, 642, 1, 1, 0, 0, 0, 0, N'HTML', N'<state><![CDATA[<center>This is an <big>HTML</big> widget. You can put <b>any</b> HTML here as you like. You can put <i>pictures</i>, <u>videos</u>, animations, color full text, tables and <small>so on</small>.</center>]]></state>', 1, CAST(0x00009C8A015B8FB9 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31215, 15112, 547, 2, 1, 0, 0, 0, 0, N'Omar''s Blog (Fast RSS)', N'<state><url>http://msmvps.com/blogs/omar/rss.aspx</url><count>10</count></state>', 1, CAST(0x00009C8A015B8FC5 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31736, 15107, 651, 1, 1, 0, 0, 0, 0, N'Twitter', N'<state></state>', 1, CAST(0x00009C98015E018D AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31737, 15108, 549, 0, 1, 0, 0, 0, 0, N'Fast Flickr', N'<state><type>MostPopular</type><tag>landscape</tag></state>', 1, CAST(0x00009C98015E1F9F AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (31768, 15108, 624, 2, 1, 0, 0, 0, 0, N'Weather', N'', 1, CAST(0x00009CA4010A11A0 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (32554, 15764, 649, 0, 1, 0, 0, 0, 0, N'Master Widget', N'<state></state>', 1, CAST(0x00009CAC0163A1FD AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (32555, 15765, 650, 0, 1, 0, 0, 0, 0, N'Child Widget', N'<state></state>', 1, CAST(0x00009CAC0163AA00 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (32556, 15766, 650, 0, 1, 0, 0, 0, 0, N'Child Widget', N'<state></state>', 1, CAST(0x00009CAC0163BA71 AS DateTime))
INSERT [dbo].[WidgetInstance] ([Id], [WidgetZoneId], [WidgetId], [OrderNo], [Expanded], [Maximized], [Resized], [Width], [Height], [Title], [State], [VersionNo], [CreatedDate]) VALUES (37619, 15108, 547, 1, 1, 0, 0, 0, 0, N'Omar''s Blog (Fast RSS)', N'<state><url>http://feeds.feedburner.com/OmarAlZabirBlog</url><count>6</count></state>', 0, CAST(0x00009E4201484BBC AS DateTime))
SET IDENTITY_INSERT [dbo].[WidgetInstance] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 12/16/2010 22:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LastUpdated] [timestamp] NOT NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Token_UniqueID] ON [dbo].[Token] 
(
	[UniqueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleTemplate]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[TemplateUserId] [uniqueidentifier] NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_RoleTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RoleTemplate] ON
INSERT [dbo].[RoleTemplate] ([Id], [RoleId], [TemplateUserId], [Priority]) VALUES (120, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5', N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', 1)
INSERT [dbo].[RoleTemplate] ([Id], [RoleId], [TemplateUserId], [Priority]) VALUES (122, N'284396d6-c1fb-4888-bfa4-70693e34008d', N'78b56cd2-7e16-4480-b062-9284b2165a5f', 2)
SET IDENTITY_INSERT [dbo].[RoleTemplate] OFF
/****** Object:  Table [dbo].[Page]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[VersionNo] [int] NOT NULL,
	[LayoutType] [int] NOT NULL,
	[PageType] [int] NOT NULL,
	[ColumnCount] [int] NOT NULL,
	[LastUpdated] [timestamp] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[LastLockedStatusChangedAt] [datetime] NULL,
	[IsDownForMaintenance] [bit] NOT NULL,
	[LastDownForMaintenanceAt] [datetime] NULL,
	[ServeAsStartPageAfterLogin] [bit] NULL,
	[OrderNo] [int] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Page_UserId] ON [dbo].[Page] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Page] ON
INSERT [dbo].[Page] ([ID], [Title], [UserId], [CreatedDate], [VersionNo], [LayoutType], [PageType], [ColumnCount], [IsLocked], [LastLockedStatusChangedAt], [IsDownForMaintenance], [LastDownForMaintenanceAt], [ServeAsStartPageAfterLogin], [OrderNo]) VALUES (144, N'First Page', N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', CAST(0x00009C8A015B8C3E AS DateTime), 1, 0, 0, 3, 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Page] ([ID], [Title], [UserId], [CreatedDate], [VersionNo], [LayoutType], [PageType], [ColumnCount], [IsLocked], [LastLockedStatusChangedAt], [IsDownForMaintenance], [LastDownForMaintenanceAt], [ServeAsStartPageAfterLogin], [OrderNo]) VALUES (145, N'First Page', N'78b56cd2-7e16-4480-b062-9284b2165a5f', CAST(0x00009C8A015B8ED7 AS DateTime), 1, 0, 0, 3, 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Page] ([ID], [Title], [UserId], [CreatedDate], [VersionNo], [LayoutType], [PageType], [ColumnCount], [IsLocked], [LastLockedStatusChangedAt], [IsDownForMaintenance], [LastDownForMaintenanceAt], [ServeAsStartPageAfterLogin], [OrderNo]) VALUES (367, N'Widget to Widget', N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', CAST(0x00009CAC01638344 AS DateTime), 1, 0, 0, 3, 0, NULL, 0, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Page] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[WidgetsInRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WidgetsInRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WidgetId] [int] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_WidgetsInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WidgetsInRoles] ON
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1507, 648, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1508, 8, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1509, 646, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1510, 645, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1511, 7, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1512, 549, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1513, 624, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1514, 169, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1515, 623, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1516, 640, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1517, 644, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1518, 642, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1519, 547, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1520, 648, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1521, 8, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1522, 646, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1523, 645, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1524, 7, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1525, 549, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1526, 624, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1527, 169, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1528, 623, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1529, 640, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1530, 644, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1531, 642, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1532, 547, N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1533, 649, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1534, 650, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1535, 651, N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
INSERT [dbo].[WidgetsInRoles] ([Id], [WidgetId], [RoleId]) VALUES (1537, 6, N'4e7c1e10-4e20-43a0-bfd8-93b2cac372e3')
SET IDENTITY_INSERT [dbo].[WidgetsInRoles] OFF
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'78b56cd2-7e16-4480-b062-9284b2165a5f', N'284396d6-c1fb-4888-bfa4-70693e34008d')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', N'b1df176b-ba0c-48f0-891c-a6b856c44ad5')
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', N'LastActivityAt:S:0:91:IsFirstVisitAfterLogin:S:91:5:', N'<?xml version="1.0" encoding="utf-16"?>
<dateTime>2010-12-16T22:10:21.204+00:00</dateTime>False', 0x, CAST(0x00009E4E016D6479 AS DateTime))
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', N'changeme', 0, N'9XmaOWcxbMlj4lVcKOR9mg==', NULL, N'anon_user@yourdomain.com', N'anon_user@yourdomain.com', NULL, NULL, 1, 0, CAST(0x00009C8A00E82FD8 AS DateTime), CAST(0x00009E4E016D58C6 AS DateTime), CAST(0x00009E43013A5B6C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'fd639154-299a-4a9d-b273-69dc28eb6388', N'78b56cd2-7e16-4480-b062-9284b2165a5f', N'changeme', 0, N'S13MlMn4F6c7Gspj06ZdQg==', NULL, N'reg_user@yourdomain.com', N'reg_user@yourdomain.com', NULL, NULL, 1, 0, CAST(0x00009C8A00E83230 AS DateTime), CAST(0x00009C8A00E83230 AS DateTime), CAST(0x00009C8A00E83230 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m -- WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    
	SELECT  @UserId = NULL
    
	SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership -- WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, @CurrentTimeUtc, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u WITH(NOLOCK),
            dbo.aspnet_Applications a WITH(NOLOCK),
            dbo.aspnet_Membership m WITH(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
	DECLARE @ExistingLastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId, @ExistingLastActivityDate = LastActivityDate
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

	IF DateDiff(n, @ExistingLastActivityDate, @CurrentTimeUtc) > 30
	BEGIN
		UPDATE dbo.aspnet_Users
		SET    LastActivityDate=@CurrentTimeUtc
		WHERE  UserId = @UserId
	END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
	-- 1. Please no more locks during reads
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    --SELECT  @ApplicationId = NULL
    --SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    --IF (@ApplicationId IS NULL)
    --    RETURN
    
    -- 2. No more call to Application table. We have only one app dude!
	SET @ApplicationId = dbo.udfGetAppId()

    DECLARE @UserId uniqueidentifier
	DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL

    SELECT @UserId = UserId, @LastActivityDate = LastActivityDate
    FROM   dbo.aspnet_Users 
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
		-- 3. Do not update the same user within an hour
		IF DateDiff(n, @LastActivityDate, @CurrentTimeUtc) > 30
		BEGIN
			-- 4. Use ROWLOCK to lock only a row since we know this query
			-- is highly selective
			UPDATE dbo.aspnet_Users WITH(ROWLOCK)
			SET    LastActivityDate=@CurrentTimeUtc
			WHERE  UserId = @UserId
		END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN


	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	

    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  Table [dbo].[UserSetting]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSetting](
	[UserId] [uniqueidentifier] NOT NULL,
	[CurrentPageId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_UserSetting_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserSetting] ([UserId], [CurrentPageId], [CreatedDate]) VALUES (N'78b56cd2-7e16-4480-b062-9284b2165a5f', 145, CAST(0x00009C8A015B8F39 AS DateTime))
INSERT [dbo].[UserSetting] ([UserId], [CurrentPageId], [CreatedDate]) VALUES (N'a00ec46a-5a8e-4523-83cb-ebd7f0155464', 144, CAST(0x00009C8A015B8CDB AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteWidgetCascade]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteWidgetCascade]
	(
	@WidgetId int,	
	@RESULT int OUT
	)	
AS
	/* SET NOCOUNT ON */
	delete from WidgetsInRoles where WidgetId = @widgetId
	delete from WidgetInstance where WidgetId = @widgetid
	delete from Widget where ID = @WidgetId
	SELECT @@ROWCOUNT
GO
/****** Object:  Table [dbo].[Column]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Column](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NOT NULL,
	[WidgetZoneId] [int] NOT NULL,
	[ColumnNo] [int] NOT NULL,
	[ColumnWidth] [int] NOT NULL,
	[LastUpdated] [timestamp] NOT NULL,
 CONSTRAINT [PK_Column] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Column_PageId] ON [dbo].[Column] 
(
	[PageId] ASC,
	[ColumnNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Column] ON
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15106, 144, 15107, 0, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15107, 144, 15108, 1, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15108, 144, 15109, 2, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15109, 145, 15110, 0, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15110, 145, 15111, 1, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15111, 145, 15112, 2, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15763, 367, 15764, 0, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15764, 367, 15765, 1, 33)
INSERT [dbo].[Column] ([ID], [PageId], [WidgetZoneId], [ColumnNo], [ColumnWidth]) VALUES (15765, 367, 15766, 2, 33)
SET IDENTITY_INSERT [dbo].[Column] OFF
/****** Object:  StoredProcedure [dbo].[Resurrection]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Resurrection]
AS

drop table #temp_users_to_delete 

-- Select all users from database except the template users
select UserID into #temp_users_to_delete from aspnet_users 
	where loweredusername NOT IN ('anon_user@yourdomain.com', 'reg_user@yourdomain.com')


delete from WidgetInstance where WidgetZoneID in (
	select WidgetZoneID from [Column] where PageID in (
		select ID from Page where UserID IN (
			select UserID from #temp_users_to_delete
		)
	)
)

delete from [Column] where PageId IN (
	select ID from Page where UserID IN (
		select UserID from #temp_users_to_delete
	)
)

delete from WidgetZone where ID IN (
	select WidgetZoneID from [Column] where PageID in (
		select ID from Page where UserID IN (
			select UserID from #temp_users_to_delete
		)
	)
)

delete from UserSetting where UserID IN (
	select UserID from #temp_users_to_delete
)

delete from Page where UserID IN (
	select UserID from #temp_users_to_delete
)

delete from Token where UserID IN (
	select UserID from #temp_users_to_delete
)
delete from aspnet_UsersInRoles where UserID IN (
	select UserID from #temp_users_to_delete
)
delete from aspnet_membership where UserID IN (
	select UserID from #temp_users_to_delete
)
delete from aspnet_profile where UserID IN (
	select UserID from #temp_users_to_delete
)
delete from aspnet_users where UserID IN (
	select UserID from #temp_users_to_delete
)
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 12/16/2010 22:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Default [DF__Widget__DefaultS__05D8E0BE]    Script Date: 12/16/2010 22:13:30 ******/
ALTER TABLE [dbo].[Widget] ADD  CONSTRAINT [DF__Widget__DefaultS__05D8E0BE]  DEFAULT ('') FOR [DefaultState]
GO
/****** Object:  Default [DF__Widget__Icon__06CD04F7]    Script Date: 12/16/2010 22:13:30 ******/
ALTER TABLE [dbo].[Widget] ADD  CONSTRAINT [DF__Widget__Icon__06CD04F7]  DEFAULT ('') FOR [Icon]
GO
/****** Object:  Default [DF_Widget_OrderNo]    Script Date: 12/16/2010 22:13:30 ******/
ALTER TABLE [dbo].[Widget] ADD  CONSTRAINT [DF_Widget_OrderNo]  DEFAULT ((1)) FOR [OrderNo]
GO
/****** Object:  Default [DF_Widget_IsLocked]    Script Date: 12/16/2010 22:13:30 ******/
ALTER TABLE [dbo].[Widget] ADD  CONSTRAINT [DF_Widget_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO
/****** Object:  Default [DF_Widget_IsDefault]    Script Date: 12/16/2010 22:13:30 ******/
ALTER TABLE [dbo].[Widget] ADD  CONSTRAINT [DF_Widget_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Widget_WidgetType]    Script Date: 12/16/2010 22:13:30 ******/
ALTER TABLE [dbo].[Widget] ADD  CONSTRAINT [DF_Widget_WidgetType]  DEFAULT ((0)) FOR [WidgetType]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__060DEAE8]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__4BAC3F29]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__38996AB5]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__09DE7BCC]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0AD2A005]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__0BC6C43E]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_WidgetInstance_Maximized]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[WidgetInstance] ADD  CONSTRAINT [DF_WidgetInstance_Maximized]  DEFAULT ((0)) FOR [Maximized]
GO
/****** Object:  Default [DF_WidgetInstance_Resized]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[WidgetInstance] ADD  CONSTRAINT [DF_WidgetInstance_Resized]  DEFAULT ((0)) FOR [Resized]
GO
/****** Object:  Default [DF_WidgetInstance_Width]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[WidgetInstance] ADD  CONSTRAINT [DF_WidgetInstance_Width]  DEFAULT ((0)) FOR [Width]
GO
/****** Object:  Default [DF_WidgetInstance_Height]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[WidgetInstance] ADD  CONSTRAINT [DF_WidgetInstance_Height]  DEFAULT ((0)) FOR [Height]
GO
/****** Object:  Default [DF_Page_CreatedDate]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Page_VersionNo]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_VersionNo]  DEFAULT ((1)) FOR [VersionNo]
GO
/****** Object:  Default [DF__Page__LayoutType__114A936A]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF__Page__LayoutType__114A936A]  DEFAULT ((1)) FOR [LayoutType]
GO
/****** Object:  Default [DF_Page_PageType]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_PageType]  DEFAULT ((0)) FOR [PageType]
GO
/****** Object:  Default [DF_Page_ColumnCount]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_ColumnCount]  DEFAULT ((3)) FOR [ColumnCount]
GO
/****** Object:  Default [DF_Page_IsLocked]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__534D60F1]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__1B0907CE]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__4AB81AF0]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__37A5467C]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__08EA5793]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_WidgetInstance_Widget]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[WidgetInstance]  WITH CHECK ADD  CONSTRAINT [FK_WidgetInstance_Widget] FOREIGN KEY([WidgetId])
REFERENCES [dbo].[Widget] ([ID])
GO
ALTER TABLE [dbo].[WidgetInstance] CHECK CONSTRAINT [FK_WidgetInstance_Widget]
GO
/****** Object:  ForeignKey [FK_WidgetInstance_WidgetZone]    Script Date: 12/16/2010 22:13:31 ******/
ALTER TABLE [dbo].[WidgetInstance]  WITH CHECK ADD  CONSTRAINT [FK_WidgetInstance_WidgetZone] FOREIGN KEY([WidgetZoneId])
REFERENCES [dbo].[WidgetZone] ([ID])
GO
ALTER TABLE [dbo].[WidgetInstance] CHECK CONSTRAINT [FK_WidgetInstance_WidgetZone]
GO
/****** Object:  ForeignKey [FK_Token_aspnet_Users]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Token]  WITH CHECK ADD  CONSTRAINT [FK_Token_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Token] CHECK CONSTRAINT [FK_Token_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_RoleTemplate_aspnet_Roles]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[RoleTemplate]  WITH CHECK ADD  CONSTRAINT [FK_RoleTemplate_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RoleTemplate] CHECK CONSTRAINT [FK_RoleTemplate_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_RoleTemplate_aspnet_Users]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[RoleTemplate]  WITH CHECK ADD  CONSTRAINT [FK_RoleTemplate_aspnet_Users] FOREIGN KEY([TemplateUserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[RoleTemplate] CHECK CONSTRAINT [FK_RoleTemplate_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_Page_aspnet_Users]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_WidgetsInRoles_aspnet_Roles]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[WidgetsInRoles]  WITH CHECK ADD  CONSTRAINT [FK_WidgetsInRoles_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[WidgetsInRoles] CHECK CONSTRAINT [FK_WidgetsInRoles_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_WidgetsInRoles_Widget]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[WidgetsInRoles]  WITH CHECK ADD  CONSTRAINT [FK_WidgetsInRoles_Widget] FOREIGN KEY([WidgetId])
REFERENCES [dbo].[Widget] ([ID])
GO
ALTER TABLE [dbo].[WidgetsInRoles] CHECK CONSTRAINT [FK_WidgetsInRoles_Widget]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__3C69FB99]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__3B75D760]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__5441852A]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__5535A963]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__2E1BDC42]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__1920BF5C]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__1A14E395]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__5070F446]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK_UserSetting_aspnet_Users]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[UserSetting]  WITH CHECK ADD  CONSTRAINT [FK_UserSetting_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[UserSetting] CHECK CONSTRAINT [FK_UserSetting_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_UserSetting_Page]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[UserSetting]  WITH CHECK ADD  CONSTRAINT [FK_UserSetting_Page] FOREIGN KEY([CurrentPageId])
REFERENCES [dbo].[Page] ([ID])
GO
ALTER TABLE [dbo].[UserSetting] CHECK CONSTRAINT [FK_UserSetting_Page]
GO
/****** Object:  ForeignKey [FK_Column_Page]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Column]  WITH CHECK ADD  CONSTRAINT [FK_Column_Page] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([ID])
GO
ALTER TABLE [dbo].[Column] CHECK CONSTRAINT [FK_Column_Page]
GO
/****** Object:  ForeignKey [FK_Column_WidgetZone]    Script Date: 12/16/2010 22:13:32 ******/
ALTER TABLE [dbo].[Column]  WITH CHECK ADD  CONSTRAINT [FK_Column_WidgetZone] FOREIGN KEY([WidgetZoneId])
REFERENCES [dbo].[WidgetZone] ([ID])
GO
ALTER TABLE [dbo].[Column] CHECK CONSTRAINT [FK_Column_WidgetZone]
GO
