USE [master]
GO
/****** Object:  Database [Northwind_Mart]    Script Date: 26/05/2023 21:11:00 ******/
CREATE DATABASE [Northwind_Mart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Northwind_Mart', FILENAME = N'C:\DataBase\Northwind_Mart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Northwind_Mart_log', FILENAME = N'C:\DataBase\Northwind_Mart_1.ldf' , SIZE = 7616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Northwind_Mart] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Northwind_Mart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ARITHABORT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Northwind_Mart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Northwind_Mart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Northwind_Mart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Northwind_Mart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Northwind_Mart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Northwind_Mart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Northwind_Mart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Northwind_Mart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Northwind_Mart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Northwind_Mart] SET RECOVERY FULL 
GO
ALTER DATABASE [Northwind_Mart] SET  MULTI_USER 
GO
ALTER DATABASE [Northwind_Mart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Northwind_Mart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Northwind_Mart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Northwind_Mart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Northwind_Mart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Northwind_Mart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Northwind_Mart', N'ON'
GO
ALTER DATABASE [Northwind_Mart] SET QUERY_STORE = OFF
GO
USE [Northwind_Mart]
GO
/****** Object:  Table [dbo].[Customer_Dim]    Script Date: 26/05/2023 21:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Dim](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[Region] [nvarchar](15) NOT NULL,
	[Country] [nvarchar](15) NOT NULL,
	[ContactTitle] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[City] [nvarchar](15) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyNAme] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Customer_Dim] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Dim]    Script Date: 26/05/2023 21:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Dim](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](40) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[HireDate] [datetime] NULL,
 CONSTRAINT [PK_Employee_Dim] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Dim]    Script Date: 26/05/2023 21:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Dim](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierName] [nvarchar](40) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ListUnitPrice] [money] NOT NULL,
 CONSTRAINT [PK_Product_Dim] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Fact]    Script Date: 26/05/2023 21:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Fact](
	[ProductKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[TimeKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[ShipperKey] [int] NOT NULL,
	[LineItemDiscount] [money] NOT NULL,
	[LineItemQuantity] [smallint] NOT NULL,
	[LineItemFreight] [money] NOT NULL,
	[LineItemTotal] [money] NOT NULL,
 CONSTRAINT [PK_Sales_Fact] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC,
	[EmployeeKey] ASC,
	[TimeKey] ASC,
	[CustomerKey] ASC,
	[ShipperKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper_Dim]    Script Date: 26/05/2023 21:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper_Dim](
	[ShipperKey] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](40) NOT NULL,
	[ShipperID] [int] NOT NULL,
 CONSTRAINT [PK_Shipper_Dim] PRIMARY KEY CLUSTERED 
(
	[ShipperKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time_Dim]    Script Date: 26/05/2023 21:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Dim](
	[TimeKey] [int] IDENTITY(1,1) NOT NULL,
	[YearMonth] [nchar](61) NOT NULL,
	[DayOfWeek] [nchar](30) NOT NULL,
	[Quarter] [int] NOT NULL,
	[DayOfYear] [int] NOT NULL,
	[WeekOfYear] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[TheDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Time_Dim] PRIMARY KEY CLUSTERED 
(
	[TimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Customer_Dim] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer_Dim] ([CustomerKey])
GO
ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Customer_Dim]
GO
ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Employee_Dim] FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[Employee_Dim] ([EmployeeKey])
GO
ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Employee_Dim]
GO
ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Product_Dim] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Product_Dim] ([ProductKey])
GO
ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Product_Dim]
GO
ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Shipper_Dim] FOREIGN KEY([ShipperKey])
REFERENCES [dbo].[Shipper_Dim] ([ShipperKey])
GO
ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Shipper_Dim]
GO
ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Time_Dim] FOREIGN KEY([TimeKey])
REFERENCES [dbo].[Time_Dim] ([TimeKey])
GO
ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Time_Dim]
GO
USE [master]
GO
ALTER DATABASE [Northwind_Mart] SET  READ_WRITE 
GO
