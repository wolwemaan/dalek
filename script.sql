USE [master]
GO
/****** Object:  Database [Dalek_Smallville]    Script Date: 4/11/2019 2:36:00 AM ******/
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
/****** Object:  Table [dbo].[Assignment]    Script Date: 4/11/2019 2:36:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[CustomerNumber] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[CustomerNumber] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/11/2019 2:36:00 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 4/11/2019 2:36:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](30) NULL,
	[EmailAddress] [varchar](40) NULL,
	[Street] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[State] [char](2) NULL,
	[PhoneNumber] [varchar](14) NULL,
	[EmploymentType] [varchar](20) NULL,
	[ZipCode] [char](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourlyEmployee]    Script Date: 4/11/2019 2:36:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourlyEmployee](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[HoursPerDay] [char](2) NULL,
	[Compensation] [smallmoney] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/11/2019 2:36:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 4/11/2019 2:36:00 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 4/11/2019 2:36:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductNumber] [int] IDENTITY(100,1) NOT NULL,
	[ProductDescription] [varchar](50) NOT NULL,
	[ListPrice] [smallmoney] NOT NULL,
	[QuantityOnHand] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryEmployee]    Script Date: 4/11/2019 2:36:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryEmployee](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[Salary] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesRepresentative]    Script Date: 4/11/2019 2:36:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesRepresentative](
	[EmployeeID] [int] IDENTITY(100,1) NOT NULL,
	[CommissionRate] [smallmoney] NULL,
	[SalesMade] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 4/11/2019 2:36:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ProductID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[DateOfOrder] [date] NOT NULL,
	[NumberOfUnits] [smallint] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/11/2019 2:36:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[CompanyID] [int] IDENTITY(100,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[Street] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](5) NULL,
	[PhoneNumber] [varchar](14) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [PK__Customer__48D47E1E62D9408C]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [PK__Customer__48D47E1E62D9408C] PRIMARY KEY NONCLUSTERED 
(
	[CustomerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__Employee__7AD04FF0BC92B2A6]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[Employee] ADD PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__HourlyEm__7AD04FF0DE923369]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[HourlyEmployee] ADD PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__Product__49A3C839F988B1AB]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [PK__Product__49A3C839F988B1AB] PRIMARY KEY NONCLUSTERED 
(
	[ProductNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SalaryEm__7AD04FF03029461E]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[SalaryEmployee] ADD PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SalesRep__7AD04FF0D1DA004F]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[SalesRepresentative] ADD PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__Supplier__2D971C4DE0199EA6]    Script Date: 4/11/2019 2:36:01 AM ******/
ALTER TABLE [dbo].[Supplier] ADD PRIMARY KEY NONCLUSTERED 
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
USE [master]
GO
ALTER DATABASE [Dalek_Smallville] SET  READ_WRITE 
GO
