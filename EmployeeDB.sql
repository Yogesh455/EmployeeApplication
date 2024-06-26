USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[tbl_DepartmentDetails]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DepartmentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeparmentName] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_DepartmentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmployeeDetails]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmployeeDetails](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[DepartmentId] [int] NULL,
	[HireDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_EmployeeDetails] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_DepartmentDetails] ON 

INSERT [dbo].[tbl_DepartmentDetails] ([Id], [DeparmentName], [CreatedDate]) VALUES (1, N'HR', CAST(N'2024-03-19T18:53:00.610' AS DateTime))
INSERT [dbo].[tbl_DepartmentDetails] ([Id], [DeparmentName], [CreatedDate]) VALUES (2, N'Account', CAST(N'2024-03-19T18:53:00.610' AS DateTime))
INSERT [dbo].[tbl_DepartmentDetails] ([Id], [DeparmentName], [CreatedDate]) VALUES (3, N'IT-Oprations', CAST(N'2024-03-19T18:53:00.610' AS DateTime))
INSERT [dbo].[tbl_DepartmentDetails] ([Id], [DeparmentName], [CreatedDate]) VALUES (4, N'AMS', CAST(N'2024-03-19T18:53:00.610' AS DateTime))
INSERT [dbo].[tbl_DepartmentDetails] ([Id], [DeparmentName], [CreatedDate]) VALUES (5, N'BUPA', CAST(N'2024-03-19T18:53:00.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_DepartmentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EmployeeDetails] ON 

INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (1, N'Lalit', N'Chaudhari', N'lrchaudhari49@gmail.com', N'8484838151', 1, CAST(N'2024-03-01T13:58:00.000' AS DateTime), CAST(N'2024-03-20T13:58:08.623' AS DateTime), NULL)
INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (2, N'ketan', N'kumar', N'ketan@gmail.com', N'9884838166', 2, CAST(N'2024-03-02T13:58:00.000' AS DateTime), CAST(N'2024-03-20T13:58:24.163' AS DateTime), NULL)
INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (3, N'Umesh', N'Patil', N'umesh@gmail.com', N'9988776655', 3, CAST(N'2024-03-04T13:58:00.000' AS DateTime), CAST(N'2024-03-20T13:58:44.643' AS DateTime), NULL)
INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (4, N'pratik', N'Pawar', N'lrchaudhari49@gmail.com', N'9988776655', 4, CAST(N'2024-03-05T14:00:00.000' AS DateTime), CAST(N'2024-03-20T14:01:00.410' AS DateTime), NULL)
INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (5, N'Mahesh', N'Patil', N'mahesh@gmail.com', N'8877665544', 5, CAST(N'2024-03-07T14:04:00.000' AS DateTime), CAST(N'2024-03-20T14:04:08.097' AS DateTime), NULL)
INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (6, N'Harish', N'Patil', N'harish@gmail.com', N'9988776655', 2, CAST(N'2024-03-02T14:06:00.000' AS DateTime), CAST(N'2024-03-20T14:06:49.693' AS DateTime), NULL)
INSERT [dbo].[tbl_EmployeeDetails] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [DepartmentId], [HireDate], [CreatedDate], [UpdatedDate]) VALUES (7, N'Govind', N'Mahajan', N'hgovind@gmail.com', N'7766554433', 3, CAST(N'2024-03-04T14:07:00.000' AS DateTime), CAST(N'2024-03-20T14:07:39.610' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_EmployeeDetails] OFF
GO
ALTER TABLE [dbo].[tbl_EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeDetails_tbl_DepartmentDetails1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tbl_DepartmentDetails] ([Id])
GO
ALTER TABLE [dbo].[tbl_EmployeeDetails] CHECK CONSTRAINT [FK_tbl_EmployeeDetails_tbl_DepartmentDetails1]
GO
/****** Object:  StoredProcedure [dbo].[DeletedEmployeeRecords]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletedEmployeeRecords]
 @EmployeeId int
AS
BEGIN
	delete from [dbo].[tbl_EmployeeDetails] where EmployeeId=@EmployeeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentRecords]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDepartmentRecords]
AS
BEGIN
	select * from [dbo].[tbl_DepartmentDetails]
END
GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentRecordsByID]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDepartmentRecordsByID]
  @Id int
AS
BEGIN
	select * from [dbo].[tbl_DepartmentDetails] where Id= @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeRecords]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEmployeeRecords]

AS
BEGIN
	select * from [dbo].[tbl_EmployeeDetails]
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeRecordsByID]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEmployeeRecordsByID]
  @EmployeeId int
AS
BEGIN
	select * from [dbo].[tbl_EmployeeDetails] where EmployeeId= @EmployeeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmpRecordsAll]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEmpRecordsAll]
AS
BEGIN
select *,[dbo].[tbl_DepartmentDetails].DeparmentName from [dbo].[tbl_EmployeeDetails] inner join [dbo].[tbl_DepartmentDetails] on [dbo].[tbl_EmployeeDetails].DepartmentId= [dbo].[tbl_DepartmentDetails].Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmpRecordsDetailsSingle]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEmpRecordsDetailsSingle]
@EmployeeId int
AS
BEGIN
select [dbo].[tbl_EmployeeDetails].EmployeeId,[dbo].[tbl_EmployeeDetails].FirstName,[dbo].[tbl_EmployeeDetails].LastName,[dbo].[tbl_EmployeeDetails].Email,[dbo].[tbl_EmployeeDetails].Phone,
[dbo].[tbl_EmployeeDetails].DepartmentId,[dbo].[tbl_EmployeeDetails].HireDate,
[dbo].[tbl_EmployeeDetails].CreatedDate,[dbo].[tbl_EmployeeDetails].UpdatedDate,[dbo].[tbl_DepartmentDetails].Id,
[dbo].[tbl_DepartmentDetails].DeparmentName from [dbo].[tbl_EmployeeDetails] inner join [dbo].[tbl_DepartmentDetails] on [dbo].[tbl_EmployeeDetails].DepartmentId= [dbo].[tbl_DepartmentDetails].Id
where EmployeeId= @EmployeeId
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployeeRecords]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertEmployeeRecords]
 @FirstName nvarchar(255),
 @LastName nvarchar(255),
 @Email nvarchar(255),
 @Phone nvarchar(20),
 @DepartmentId int,
 @HireDate datetime
AS
BEGIN
	insert into [dbo].[tbl_EmployeeDetails](FirstName,LastName,Email,Phone,DepartmentId,HireDate,CreatedDate) values(@FirstName,@LastName,@Email,@Phone,@DepartmentId,@HireDate,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeeRecords]    Script Date: 20-03-2024 14:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateEmployeeRecords]
 @EmployeeId int,
 @FirstName nvarchar(255),
 @LastName nvarchar(255),
 @Email nvarchar(255),
 @Phone nvarchar(20),
 @DepartmentId int,
 @HireDate datetime
AS
BEGIN
	update [dbo].[tbl_EmployeeDetails] set FirstName=@FirstName,LastName=@LastName,Email=@Email,Phone=@Phone,DepartmentId=@DepartmentId,HireDate=@HireDate,UpdatedDate=GETDATE() where EmployeeId=@EmployeeId
END
GO
