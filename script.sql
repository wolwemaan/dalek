USE [master]
GO
/****** Object:  Database [Dalek_Smallville]    Script Date: 4/10/2019 11:39:59 PM ******/
CREATE DATABASE [Dalek_Smallville]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dalek_Smallville', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Dalek_Smallville.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dalek_Smallville_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Dalek_Smallville_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dalek_Smallville] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dalek_Smallville].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dalek_Smallville] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Dalek_Smallville] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dalek_Smallville] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dalek_Smallville] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dalek_Smallville] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dalek_Smallville] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dalek_Smallville] SET  MULTI_USER 
GO
ALTER DATABASE [Dalek_Smallville] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dalek_Smallville] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dalek_Smallville] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dalek_Smallville] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dalek_Smallville] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dalek_Smallville] SET QUERY_STORE = OFF
GO
USE [Dalek_Smallville]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[CompanyID] [int] IDENTITY(100,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[ZipCode] [varchar](5) NOT NULL,
	[PhoneNumber] [varchar](14) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductNumber] [int] IDENTITY(100,1) NOT NULL,
	[ProductDescription] [varchar](50) NULL,
	[ListPrice] [smallmoney] NOT NULL,
	[QuantityOnHand] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ProductNumber] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[DateOfOrder] [date] NOT NULL,
	[NumberOfUnits] [smallint] NOT NULL,
 CONSTRAINT [CPK_Shipment_ProdNo_CompID] PRIMARY KEY CLUSTERED 
(
	[ProductNumber] ASC,
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductDetails_vw]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProductDetails_vw] as
select
   P.ProductNumber, NumberOfUnits Units, ListPrice, DateOfOrder [Date], S.CompanyName [Company]

FROM Product P
LEFT JOIN Shipment SH on P.ProductNumber = SH.ProductNumber 
LEFT JOIN Supplier S ON SH.CompanyID = S.CompanyID

GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[CustomerNumber] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [CPK_Assignment] PRIMARY KEY CLUSTERED 
(
	[CustomerNumber] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerNumber] [int] IDENTITY(100,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[PhoneNumber] [varchar](14) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[EmailAddress] [varchar](40) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [char](2) NOT NULL,
	[PhoneNumber] [varchar](14) NOT NULL,
	[EmploymentType] [varchar](20) NOT NULL,
	[ZipCode] [char](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourlyEmployee]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourlyEmployee](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[HoursPerDay] [char](2) NOT NULL,
	[Compensation] [smallmoney] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[CustomerNumber] [int] IDENTITY(100,1) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[OrderNumber] [int] NOT NULL,
	[ProductNumber] [int] NOT NULL,
	[QuantityOrdered] [smallint] NOT NULL,
	[QuantitySupplied] [smallint] NOT NULL,
	[QuantityPrice] [smallmoney] NOT NULL,
 CONSTRAINT [CPK_OrderLine_Order_Product] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC,
	[ProductNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryEmployee]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryEmployee](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[Salary] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesRepresentative]    Script Date: 4/10/2019 11:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesRepresentative](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[CommissionRate] [smallmoney] NOT NULL,
	[SalesMade] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductNumber], [ProductDescription], [ListPrice], [QuantityOnHand]) VALUES (100, N'Red striped shirt.', 13.0000, 12)
INSERT [dbo].[Product] ([ProductNumber], [ProductDescription], [ListPrice], [QuantityOnHand]) VALUES (101, N'Blue pants.', 22.0000, 35)
INSERT [dbo].[Product] ([ProductNumber], [ProductDescription], [ListPrice], [QuantityOnHand]) VALUES (102, N'Yellow lace-up shoes.', 30.0000, 19)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Shipment] ([ProductNumber], [CompanyID], [CompanyName], [DateOfOrder], [NumberOfUnits]) VALUES (100, 116, N'Shirts Co.', CAST(N'2019-03-05' AS Date), 10)
INSERT [dbo].[Shipment] ([ProductNumber], [CompanyID], [CompanyName], [DateOfOrder], [NumberOfUnits]) VALUES (101, 115, N'Clothes Co.', CAST(N'2019-02-13' AS Date), 25)
INSERT [dbo].[Shipment] ([ProductNumber], [CompanyID], [CompanyName], [DateOfOrder], [NumberOfUnits]) VALUES (101, 117, N'Pants Co.', CAST(N'2018-06-07' AS Date), 20)
INSERT [dbo].[Shipment] ([ProductNumber], [CompanyID], [CompanyName], [DateOfOrder], [NumberOfUnits]) VALUES (102, 118, N'Old Navy', CAST(N'2019-04-10' AS Date), 10)
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([CompanyID], [CompanyName], [Street], [City], [State], [ZipCode], [PhoneNumber]) VALUES (115, N'Clothes Co.', N'1234 Street Street', N'Tampa', N'FL', N'33613', N'(111) 323-1234')
INSERT [dbo].[Supplier] ([CompanyID], [CompanyName], [Street], [City], [State], [ZipCode], [PhoneNumber]) VALUES (116, N'Shirts Co.', N'2222 Road Street', N'Tampa', N'FL', N'33613', N'(123) 444-1234')
INSERT [dbo].[Supplier] ([CompanyID], [CompanyName], [Street], [City], [State], [ZipCode], [PhoneNumber]) VALUES (117, N'Pants Co.', N'1678 Lane Street', N'Clearwater', N'FL', N'33761', N'(101) 234-0987')
INSERT [dbo].[Supplier] ([CompanyID], [CompanyName], [Street], [City], [State], [ZipCode], [PhoneNumber]) VALUES (118, N'Old Navy', N'1338 Lane Street', N'Clearwater', N'FL', N'33761', N'(141) 555-0987')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
/****** Object:  Index [PK_Customer_CustomerNo]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [PK_Customer_CustomerNo] PRIMARY KEY NONCLUSTERED 
(
	[CustomerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Employee_EmpID]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [PK_Employee_EmpID] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_HourlyEm_EmpID]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[HourlyEmployee] ADD  CONSTRAINT [PK_HourlyEm_EmpID] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__Product__49A3C839F988B1AB]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [PK__Product__49A3C839F988B1AB] PRIMARY KEY NONCLUSTERED 
(
	[ProductNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_SalaryEmp_EmpID]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[SalaryEmployee] ADD  CONSTRAINT [PK_SalaryEmp_EmpID] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_SalesRep_EmpID]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[SalesRepresentative] ADD  CONSTRAINT [PK_SalesRep_EmpID] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__Supplier__2D971C4DF36BF768]    Script Date: 4/10/2019 11:40:01 PM ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [PK__Supplier__2D971C4DF36BF768] PRIMARY KEY NONCLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Customer_CustNo] FOREIGN KEY([CustomerNumber])
REFERENCES [dbo].[Customer] ([CustomerNumber])
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Customer_CustNo]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Employee_EmpID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Employee_EmpID]
GO
ALTER TABLE [dbo].[HourlyEmployee]  WITH CHECK ADD  CONSTRAINT [FK_HourlyEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[HourlyEmployee] CHECK CONSTRAINT [FK_HourlyEmployee_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_CustNo] FOREIGN KEY([CustomerNumber])
REFERENCES [dbo].[Customer] ([CustomerNumber])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_CustNo]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Order_OrderNo] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[Order] ([OrderNumber])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order_OrderNo]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Product_ProdNo] FOREIGN KEY([ProductNumber])
REFERENCES [dbo].[Product] ([ProductNumber])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Product_ProdNo]
GO
ALTER TABLE [dbo].[SalaryEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SalaryEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SalaryEmployee] CHECK CONSTRAINT [FK_SalaryEmployee_Employee]
GO
ALTER TABLE [dbo].[SalesRepresentative]  WITH CHECK ADD  CONSTRAINT [FK_SalesRepresentative_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SalesRepresentative] CHECK CONSTRAINT [FK_SalesRepresentative_Employee]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Product_ProdNo] FOREIGN KEY([ProductNumber])
REFERENCES [dbo].[Product] ([ProductNumber])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Product_ProdNo]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Supplier_CompID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Supplier] ([CompanyID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Supplier_CompID]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_Customer_PhoneNumber] CHECK  (([PhoneNumber] like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_Customer_PhoneNumber]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_Customer_State] CHECK  (([State] like '[A-Z][A-Z]'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_Customer_State]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_Customer_ZipCode] CHECK  (([ZipCode] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_Customer_ZipCode]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_EmpType] CHECK  (([EmploymentType]='R' OR [EmploymentType]='H' OR [EmploymentType]='S'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_EmpType]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_PhoneNumber] CHECK  (([PhoneNumber] like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_PhoneNumber]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_State] CHECK  (([State] like '[A-Z][A-Z]'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_State]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_ZipCode] CHECK  (([ZipCode] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_ZipCode]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [CK_OrderDate_CurrentDate] CHECK  (([OrderDate]<=getdate()))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [CK_OrderDate_CurrentDate]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [CK_Supplier_PhoneNumber] CHECK  (([PhoneNumber] like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [CK_Supplier_PhoneNumber]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [CK_Supplier_State] CHECK  (([State] like '[A-Z][A-Z]'))
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [CK_Supplier_State]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [CK_Supplier_ZipCode] CHECK  (([ZipCode] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [CK_Supplier_ZipCode]
GO
/****** Object:  StoredProcedure [dbo].[spUnitsShippedSince]    Script Date: 4/10/2019 11:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spUnitsShippedSince] 
AS

--Declare @SinceDate as Jan 01, 2019
DECLARE @SinceDate date
SET @SinceDate = '01-01-19';

BEGIN

 SELECT
   ProductNumber, SUM(Units) 'Units Ordered', ListPrice 'List Price', 
   SUM(ListPrice * Units) 'Total Cost', [Date] 'Order Date', Company 'Company Name'

 FROM ProductDetails_vw
 WHERE [Date] >= @SinceDate
 GROUP BY ProductNumber, ListPrice, [Date], Company
-- SPROC ordered by total cost of products in descending order
 ORDER BY [Total Cost] DESC; 

END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'R= Sales Rep, H= Hourly, S=Salary' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'CONSTRAINT',@level2name=N'CK_Employee_EmpType'
GO
USE [master]
GO
ALTER DATABASE [Dalek_Smallville] SET  READ_WRITE 
GO
