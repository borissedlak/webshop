USE [master]
GO
/****** Object:  Database [shop]    Script Date: 19.06.2017 20:13:00 ******/
DROP DATABASE IF EXISTS [shop]
CREATE DATABASE [shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\shop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop] SET RECOVERY FULL 
GO
ALTER DATABASE [shop] SET  MULTI_USER 
GO
ALTER DATABASE [shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shop] SET QUERY_STORE = OFF
GO
USE [shop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [shop]
GO
/****** Object:  Table [dbo].[tblIngredients]    Script Date: 19.06.2017 20:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIngredients](
	[ingredient_id] [int] IDENTITY(1,1) NOT NULL,
	[ingredient_name] [nvarchar](255) NOT NULL,
	[ingredient_unit] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblIngredients] PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 19.06.2017 20:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[order_created] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder_Product]    Script Date: 19.06.2017 20:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder_Product](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_amount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct_Ingredients]    Script Date: 19.06.2017 20:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct_Ingredients](
	[prodingr_product_id] [int] NOT NULL,
	[prodingr_ingredient_id] [int] NOT NULL,
	[prodingr_amount] [int] NOT NULL,
 CONSTRAINT [PK_tblProduct_Ingredients] PRIMARY KEY CLUSTERED 
(
	[prodingr_product_id] ASC,
	[prodingr_ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 19.06.2017 20:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[product_price] [decimal](18, 2) NOT NULL,
	[product_description] [nvarchar](max) NULL,
	[product_thumbnail] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 19.06.2017 20:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_salutation] [nvarchar](10) NOT NULL,
	[user_title] [nvarchar](20) NULL,
	[user_firstname] [nvarchar](50) NOT NULL,
	[user_lastname] [nvarchar](50) NOT NULL,
	[user_email] [nvarchar](50) NOT NULL,
	[user_tel] [nvarchar](30) NOT NULL,
	[user_password] [nvarchar](1024) NOT NULL,
	[user_bill_street] [nvarchar](255) NOT NULL,
	[user_bill_zipcode] [nvarchar](10) NOT NULL,
	[user_bill_city] [nvarchar](255) NOT NULL,
	[user_bill_country] [nvarchar](2) NOT NULL,
	[user_delivery_street] [nvarchar](255) NOT NULL,
	[user_delivery_zipcode] [nvarchar](10) NOT NULL,
	[user_delivery_city] [nvarchar](255) NOT NULL,
	[user_delivery_country] [nvarchar](2) NOT NULL,
	[user_vatid] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProducts] ADD  CONSTRAINT [DF_tblProducts_product_price]  DEFAULT ((0)) FOR [product_price]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_tblUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([user_id])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_Order_tblUser]
GO
ALTER TABLE [dbo].[tblOrder_Product]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_Product_tblOrder] FOREIGN KEY([order_id])
REFERENCES [dbo].[tblOrder] ([order_id])
GO
ALTER TABLE [dbo].[tblOrder_Product] CHECK CONSTRAINT [FK_tblOrder_Product_tblOrder]
GO
ALTER TABLE [dbo].[tblOrder_Product]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_Product_tblUser] FOREIGN KEY([product_id])
REFERENCES [dbo].[tblProducts] ([product_id])
GO
ALTER TABLE [dbo].[tblOrder_Product] CHECK CONSTRAINT [FK_tblOrder_Product_tblUser]
GO
USE [master]
GO
ALTER DATABASE [shop] SET  READ_WRITE 
GO
