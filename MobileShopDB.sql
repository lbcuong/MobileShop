USE [master]
GO
/****** Object:  Database [MobileShopContext]    Script Date: 1/14/2022 3:59:37 PM ******/
CREATE DATABASE [MobileShopContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobileShopContext', FILENAME = N'C:\Users\lecuo\MobileShopContext.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MobileShopContext_log', FILENAME = N'C:\Users\lecuo\MobileShopContext_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MobileShopContext] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobileShopContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobileShopContext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobileShopContext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobileShopContext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobileShopContext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobileShopContext] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobileShopContext] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MobileShopContext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobileShopContext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobileShopContext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobileShopContext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobileShopContext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobileShopContext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobileShopContext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobileShopContext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobileShopContext] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MobileShopContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobileShopContext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobileShopContext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobileShopContext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobileShopContext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobileShopContext] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MobileShopContext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobileShopContext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MobileShopContext] SET  MULTI_USER 
GO
ALTER DATABASE [MobileShopContext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobileShopContext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobileShopContext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobileShopContext] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MobileShopContext] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MobileShopContext] SET QUERY_STORE = OFF
GO
USE [MobileShopContext]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MobileShopContext]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemCategoryId] [int] NOT NULL,
	[ItemGroupId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[PromotionBannerId] [int] NULL,
	[Price] [decimal](15, 0) NOT NULL,
	[PromotionPercentage] [decimal](2, 1) NULL,
	[Quantity] [int] NOT NULL,
	[Image] [varchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[ItemCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[ItemCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemGroup]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemGroup](
	[ItemGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ItemGroup] PRIMARY KEY CLUSTERED 
(
	[ItemGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemImage]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemImage](
	[ItemImageId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Images] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItemImage] PRIMARY KEY CLUSTERED 
(
	[ItemImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionBanner]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionBanner](
	[PromotionBannerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[PromotionPercentageLimit] [decimal](2, 1) NOT NULL,
	[PromotionStartDate] [datetime2](7) NOT NULL,
	[PromotionEndDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PromotionBanner] PRIMARY KEY CLUSTERED 
(
	[PromotionBannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Total] [decimal](15, 0) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[PurchaseOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImportPrice] [decimal](15, 0) NOT NULL,
 CONSTRAINT [PK_PurchaseOrderDetail] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyReview]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyReview](
	[ReplyReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserRole] [nvarchar](256) NULL,
	[Comment] [nvarchar](max) NULL,
	[ReplyDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ReplyReview] PRIMARY KEY CLUSTERED 
(
	[ReplyReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[UserRole] [nvarchar](256) NULL,
	[ItemId] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rate] [int] NOT NULL,
	[CommentDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrder]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrder](
	[SalesOrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Total] [decimal](15, 0) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[SalesOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderDetail]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetail](
	[SalesOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SalesPrice] [decimal](15, 0) NOT NULL,
 CONSTRAINT [PK_SalesOrderDetail] PRIMARY KEY CLUSTERED 
(
	[SalesOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/14/2022 3:59:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211031024246_UpdateItemGroup', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211031025002_UpdateItemGroup31102021', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211101030338_UpdateItemGroup01112021', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211101031001_UpdateItemGroup011120211009AM', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211101080042_UpdateItemCategory011120211009AM', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102023724_UpdateItem02112021937AM', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102025800_UpdateItemGroup021120210957', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102031441_UpdateItemGroup021120211014', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102032124_UpdateItemCategory021120211021', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102034254_UpdateItem021120211042', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102043245_UpdateItem021120211132', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102084955_UpdateItem021120211549', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102090945_UpdateMobilePhone021120211609', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102092614_UpdateItem021120211626', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102093541_UpdateMobilePhone021120211635', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102095819_UpdateMobilePhone021120211658', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102101708_UpdatePhoneCase021120211716', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102102622_UpdateEarPhone021120211726', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102104252_UpdateOldMobilePhone021120211742', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105073321_UpdateItemColor051120211433', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105074927_UpdateItemColor051120211447', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105082027_UpdateItem051120211520', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105082635_UpdateItemColor051120211521', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105083403_UpdateItem051120211533', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105083449_UpdateItem051120211533', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105084637_UpdateMobilePhones051120211546', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105090448_UpdateMobilePhones051120211604', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211105094927_UpdateMobilePhones051120211649', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107032023_UpdateStock071120211020', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107040058_UpdateStock071120211020', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107065141_UpdateStock071120211020', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107065659_UpdateStock071120211020', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107082822_UpdateStock071120211020', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107093623_UpdateStock071120211020', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107100712_UpdateStock071120211025', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211107100817_UpdateStock071120211025', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211112032240_UpdateItemImage111220211022', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211112080204_UpdateItemImage111220211024', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211116035250_CustomUserData111620211010', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211116040307_CustomUserData111620211012', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211116042055_CustomUserData111620211012', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211116072652_CustomUserData111620211012', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211116074410_CustomUserData111620211013', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120090019_UpdatePaymentMethod', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120092536_UpdatePaymentMethodChangeRequired', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120092819_UpdatePaymentMethodChangeRequired1', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120093932_UpdateDeliveryUnit', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211120101241_UpdateDeliveryOption', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211122012027_UpdatePersonalData', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211122081855_UpdateCartAction', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211123151337_UpdatePaymentMethod', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211124093054_UpdateReviewTable', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211124134251_UpdateReviewTable1', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211124134327_UpdateReviewTable2', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125092116_UpdateReplyReview', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125113216_UpdateUserRoleReplyReview', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125120103_UpdateUserRoleReplyReview1', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211126082334_UpdateReviewIntRate', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211127013808_UpdateOrderAndOrderDetail', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211127021821_UpdateQuantityOrderDetail', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211128031506_UpdateNewColumnOrder', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211128031749_UpdateNewColumnOrder1', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211128032519_UpdateNewColumnOrder2', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211128104434_UpdateNewColumnOrder3', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130091305_UpdateItem', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130091357_UpdateItemAdjust', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130091448_UpdateItem1', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130125307_UpdateItemTable', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130165903_UpdateItemImageTable', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130170511_UpdateOrderDetailTable10', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130171221_UpdateItemImageTable2', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130172102_UpdateReviewAndReplyTable', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211202072012_UpdateItemImageDeleteDate', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211202152114_UpdateBannerTable', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211203014953_UpdateBannerTableAddColumns', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211208020806_AddSupplier', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211208021515_ChangeColumnNameSalesOrder', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211227032612_UpdateItemTable2', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211227034503_UpdateItemTable3', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211227102516_UpdateSalesOrderDetailTable2', N'5.0.12')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', N'54dd2cc7-2e21-45f7-83d5-477740d5852e')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'Staff', N'STAFF', N'54dd2cc7-2e21-45f7-83d5-477740d5853e')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3', N'Member', N'MEMBER', N'54dd2cc7-2e21-45f7-83d5-477740d5854e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'33401181-ad89-47bd-a35c-392a52a33c2c', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'068ac672-3ab5-4840-a7ea-5da67b5721b1', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'91974785-9147-4e6e-8350-ba5fc24cd916', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b168f2ef-ecbe-4456-aedb-05ceffcf52ff', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba7932c9-bc29-492a-9218-05aecbd45179', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'facffc55-941b-41d2-a74f-03bd913109e5', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'01bfb6c3-044e-429b-b445-a175bd97c396', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'134eb0fa-b5b9-47fb-8a3e-92049c4c705a', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'26597d99-9f4f-4277-8379-48878f833e9e', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'38c03bb7-cb9e-45d5-9de3-9796098a04b7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9838f642-4869-41e1-ab99-f1c704c6dba2', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a36d29cf-977a-496c-a12f-d7bd78a4db19', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'acb10c46-1bd2-49b9-9bd3-8f59aa47d32d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b293935c-aee4-4420-8d4e-6304d9bccde6', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4cfc95a-3071-4bc7-b34a-b1adb8e5c242', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd886ddee-c1da-4bf1-a5c2-7c42e49ecf76', N'3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'01bfb6c3-044e-429b-b445-a175bd97c396', N'cuongb1706975@student.ctu.edu.vn', N'CUONGB1706975@STUDENT.CTU.EDU.VN', N'cuongb1706975@student.ctu.edu.vn', N'CUONGB1706975@STUDENT.CTU.EDU.VN', 1, N'AQAAAAEAACcQAAAAEAJAZPyLVszijIfnamQMPNXe5/dU9yA2Xh4qJhSwu/quV+Kot16cQLy43IeeLU5wTA==', N'LRNW7RKANIS73X5XRM6A65CXYPMYLKSQ', N'7f8b890d-a288-49a9-923e-0fc361a45e40', N'0942511715', 0, 0, NULL, 1, 0, CAST(N'1999-01-17T00:00:00.0000000' AS DateTime2), N'Male', N'Le Bao Cuong', N'1053 Ngo Quyen')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'068ac672-3ab5-4840-a7ea-5da67b5721b1', N'Staff10@mobileshop.com', N'STAFF10@MOBILESHOP.COM', N'Staff10@mobileshop.com', N'STAFF10@MOBILESHOP.COM', 1, N'AQAAAAEAACcQAAAAEI4DzYVdXvGFmxRsM41i8WH+/7j4D1ooTgeFp5tOGsGy5kILHh34R0YWvqI99P3i7w==', N'TTNORNLIT7E5S7VR2UN3CZSLP3W76FSO', N'c8cfa1b9-fcd3-46e9-8d97-39b6b5c420c2', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'0d8ef7b0-f528-4f7c-83ef-720a95f5bb30', N'member2@gmail.com', N'MEMBER2@GMAIL.COM', N'member2@gmail.com', N'MEMBER2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAxm1lTxZKkaGMkpLrAMZdFYSoc9vCtB3kJ9481AS6Na1Fy92gnuM9xaULErH2RZtA==', N'NMBNMCGWRIICGJZ2MGLSD7B422T77E6S', N'b4a0fa7c-d11f-4829-986b-4528aa14e415', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'134eb0fa-b5b9-47fb-8a3e-92049c4c705a', N'member7@gmail.com', N'MEMBER7@GMAIL.COM', N'member7@gmail.com', N'MEMBER7@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEA6UXhaQCv9ErsKA1VjnyxXEThfOLGwyZ6PbIfrDLIcqtzI3DdHGFUZfG9L4j3M9LA==', N'A76FABU2TYVFD3GCZ3EBM4O752RH4JYG', N'7ab608c6-bbc2-4042-94b2-e1bba36a8f34', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'1ac6d467-aa94-40f4-9096-c59bc1fbcd5e', N'member1@gmail.com', N'MEMBER1@GMAIL.COM', N'member1@gmail.com', N'MEMBER1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDiyj6fVX6IfqMyzcvD4Pm0LaeoKz7/c/Vn9ndOwrVAyxKDDifjTNDwMPKvWtAzcMQ==', N'C3GKPWGWTJAPTLWFI2IY3LS2DKMQ27XW', N'02c97c6c-06bf-4e2d-b5ee-7c932fb83413', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'26597d99-9f4f-4277-8379-48878f833e9e', N'member5@gmail.com', N'MEMBER5@GMAIL.COM', N'member5@gmail.com', N'MEMBER5@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAELeh21lqhXkLvV3L+nRR3YADjipq8VxdvcCAcTAN+kz9341AwRRDVQ1TG+VA45eXxA==', N'LKUQV4GU6AQY4YDFVTRDEWDJIEFZOUES', N'fa09250b-a51b-495a-bc09-196fbea9e5d5', N'0942511715', 0, 0, NULL, 1, 0, CAST(N'2021-11-17T00:00:00.0000000' AS DateTime2), N'Male', N'Le Bao Cuong', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'33401181-ad89-47bd-a35c-392a52a33c2c', N'admin@mobileshop.com', N'ADMIN@MOBILESHOP.COM', N'admin@mobileshop.com', N'ADMIN@MOBILESHOP.COM', 1, N'AQAAAAEAACcQAAAAEEx40UgglwjDHrW7LBExcaZvHqZxcZCSRMCpWXDKf5AXXk73ovT4YVFhNRLdYzcasg==', N'RZPGUEKBX6ANC2C4VZ7S2ALKLOAIFS5C', N'a0f15235-2865-4dfc-92db-5ab2dda5ad15', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'38c03bb7-cb9e-45d5-9de3-9796098a04b7', N'abcd@gmail.com', N'ABCD@GMAIL.COM', N'abcd@gmail.com', N'ABCD@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFZcCocN/S0PSpsEumCrAafNuHqR3jXfihvzMU0Rn3L3WmBGHTJJpvPgi9GXXqYD6g==', N'Y25NNS3ZKSYEHPG6BZOFFPULSVZRLEXM', N'e319f5a2-59eb-417e-8bfc-63462666da6e', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'6a7d4eec-986d-439b-81c3-3cab6bb810fa', N'abce@gmail.com', N'ABCE@GMAIL.COM', N'abce@gmail.com', N'ABCE@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEBy6F6yjBOkGHWA/UL3d1zqDGo/oBS5jc++dz04Vl4e08uM2SK2kC4sv7mrKGL00qw==', N'U6C7YYS3KWX2KA34OO3IQX6TSXXZXORG', N'18255790-b0f4-4742-8487-9e8b1780e8f0', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'91974785-9147-4e6e-8350-ba5fc24cd916', N'staff2@mobileshop.com', N'STAFF2@MOBILESHOP.COM', N'staff2@mobileshop.com', N'STAFF2@MOBILESHOP.COM', 1, N'AQAAAAEAACcQAAAAEE+fngsqQZqqYlIh6W3eOCaho/UUcSZOd/k+GkxUwe/YxQ3+TJaif3q7pExvkzrwPw==', N'PVXAWUIMQ4SFO5PPEEXLJFYQE4JXOPXF', N'858f6851-ead6-4823-b82e-c9e21260191b', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'92bf9136-d404-4f61-aed8-9295b2053f97', N'abc@gmail.com', N'ABC@GMAIL.COM', N'abc@gmail.com', N'ABC@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJCLmTJJIqwyyIPMl++iZ4QOizaMzLzr8s9v6fLBzXzYEiNNPxeMxsnIUqgEcBwbOg==', N'VXU6LRNYKZA5SCVBIYYPCWDH6ASMCTBL', N'1ab28ced-ca95-4cb9-8ed4-305c86950870', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'9838f642-4869-41e1-ab99-f1c704c6dba2', N'member6@gmail.com', N'MEMBER6@GMAIL.COM', N'member6@gmail.com', N'MEMBER6@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMRUiZaoLzX8FWuPSmeVcE/C63+dwzUtZtKYNvI+L4orNFQR/NqCYM3gOPFoMQY+3g==', N'XAH7XRKZW6Y5WI5VS4TXNCA6YM3HVC54', N'dfe3dc42-3338-4edf-9e31-78bd10e1f4fc', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'a36d29cf-977a-496c-a12f-d7bd78a4db19', N'lecuong1521999@gmail.com', N'LECUONG1521999@GMAIL.COM', N'lecuong1521999@gmail.com', N'LECUONG1521999@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECskbN1ZnYg+FTNiBMMsdW37abgDaWkL9bSXe447GteLeIxvMHpkRdKmdYA1W57vlg==', N'GIGIE4OHYY6ACOKKBOG56HTXJXEKQ2A2', N'bb4ea079-a439-4a91-a65c-78c09e7bb0ee', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'acb10c46-1bd2-49b9-9bd3-8f59aa47d32d', N'member8@gmail.com', N'MEMBER8@GMAIL.COM', N'member8@gmail.com', N'MEMBER8@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIfKvMOLQ+a2YcPfypile9aXDWAXk5t11/CdZaNymNCSlKccLbYJa2vFF3rUMmN/4A==', N'PGCIRTTFFH3CWXFWFF4MBUKBRN24IKR6', N'5c182af3-8b4c-4780-acf7-22f5482f1a38', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'b168f2ef-ecbe-4456-aedb-05ceffcf52ff', N'staff1@mobileshop.com', N'STAFF1@MOBILESHOP.COM', N'staff1@mobileshop.com', N'STAFF1@MOBILESHOP.COM', 1, N'AQAAAAEAACcQAAAAENJUfLDslcHW+nDs0ZaVZ/oirvFeXnVhdc9mzVexFsz+Tyr4IOyggyKjxN3M97mmNQ==', N'SZ5TIZOFQLIWG7J6GET4GRI2BDT2ZIAD', N'0d96e2b9-d146-41d9-9218-bfbb8136cbd1', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'b293935c-aee4-4420-8d4e-6304d9bccde6', N'member11@gmail.co', N'MEMBER11@GMAIL.CO', N'member11@gmail.co', N'MEMBER11@GMAIL.CO', 1, N'AQAAAAEAACcQAAAAEPvfEa1fC4lFtW5x8JnJFOQ3+O06RUlITMSWD1vtnkvG5mrOW0cR6h5eEDhqj/M6kA==', N'OIQ64MT4L57TMJOIT4B7HVZWQR5WOOVP', N'476962e7-5afe-4f6a-9124-5314ddcb96b2', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'b4cfc95a-3071-4bc7-b34a-b1adb8e5c242', N'member9@gmail.com', N'MEMBER9@GMAIL.COM', N'member9@gmail.com', N'MEMBER9@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFUENTMqCQaWXQNeE+d47bbMe6/Vh4fxpBWZ8ujhXUJtm3uT38KLFjzsfO6D0w4w7A==', N'O5XOMHLGG2EU4DGCC2SINXAEFU2LL4CK', N'a82b1e8a-92b3-4728-8891-5d6b55081473', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'ba7932c9-bc29-492a-9218-05aecbd45179', N'staff3@mobileshop.com', N'STAFF3@MOBILESHOP.COM', N'staff3@mobileshop.com', N'STAFF3@MOBILESHOP.COM', 1, N'AQAAAAEAACcQAAAAEH2b2JxG9nMA/icIlKBMyUkGyGjptrMFnNQF42f8nqBw2IEnIydhQNwz2OQ9CnFqAQ==', N'TUOMM4UKXP5K4TZDEZFO2GZ7QTHNPBQR', N'd00fa0e1-10e8-4d6c-85a5-8fd9d9a8e4e2', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'd886ddee-c1da-4bf1-a5c2-7c42e49ecf76', N'member4@gmail.com', N'MEMBER4@GMAIL.COM', N'member4@gmail.com', N'MEMBER4@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFr1WSfHDvDzCQiOagFWJW2wB7eSh5R6EXeuPY5/ON1mVS4+vAnsOr+mE5/U/WGZNw==', N'K7YJNJTZ3BJHZ5TKBNQF37DDBWJRBKBM', N'62dab1ad-2842-4411-8a5a-1d3bc09010fb', N'0942511715', 0, 0, NULL, 1, 0, CAST(N'1999-01-26T00:00:00.0000000' AS DateTime2), N'Male', N'Le Bao Cuong', N'1053 Ngo Quyen')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'facffc55-941b-41d2-a74f-03bd913109e5', N'staff@mobileshop.com', N'STAFF@MOBILESHOP.COM', N'staff@mobileshop.com', N'STAFF@MOBILESHOP.COM', 1, N'AQAAAAEAACcQAAAAEIcGGHmhE3obshTWLUq5jNg6L+6EahhOGZHBvcJqzimbKs8na2iGsimXnIw8yG8jRQ==', N'7P5IKNIH2WQ5HBLVOZ6VZ4UZV6I2RFWG', N'5fa272d0-ef29-4ad2-b387-3f4d194903ab', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender], [Name], [Address]) VALUES (N'fd672b9d-2447-43c4-811f-c9b126cfc46f', N'member@gmail.com', N'MEMBER@GMAIL.COM', N'member@gmail.com', N'MEMBER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENnyb/oqAQycbHpWMUM2Yt5mXtKxMoLix0F/VzIfbps84Y6t/rFTAb0jp/L1xbA53A==', N'OSCB2A5COIBY24AD24Y4OERGGFMWMJIQ', N'54dd2cc7-2e21-45f7-83d5-477740d5851d', NULL, 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (1, 4, 5, N'Apple IPhone 12 128GB 4GB RAM White', N'<p><strong>Specifications of Apple IPhone 12 128GB 4GB White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP, 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>4GB</td></tr><tr><td><strong>Storage</strong></td><td>128GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', 1, CAST(20990000 AS Decimal(15, 0)), CAST(0.1 AS Decimal(2, 1)), 9, N'apple-iphone-12-white.jpg_cc2b593e-19df-4c28-ac36-9a42c440123b.jpg', CAST(N'2021-11-04T14:47:00.0000000' AS DateTime2), CAST(N'2021-12-30T17:09:36.5612143' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (2, 4, 5, N'Apple IPhone 13 Pro Max 256GB 6GB RAM Blue', N'<p><strong>Specifications of Apple IPhone 13 Pro Max 256GB 6GB RAM Blue</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.7 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Triple 12 MP, 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 15, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A15 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.22 GHz Avalanche + 4xX.X GHz Blizzard)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (5-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM/eSIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 4352 mAh, non-removable (16.75 Wh)</td></tr></tbody></table></figure>', 1, CAST(36990000 AS Decimal(15, 0)), CAST(0.2 AS Decimal(2, 1)), 9, N'apple-iphone-13-pro-max-blue.jpg_86f59e5c-f98e-45b2-abbf-8bb6dfa7cc81.jpg', CAST(N'2021-11-04T14:50:00.0000000' AS DateTime2), CAST(N'2021-12-30T09:41:59.9909136' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (3, 4, 5, N'Apple IPhone 13 Pro 128GB 6GB RAM Silver', N'<p><strong>Specifications of Apple IPhone 13 Pro 128GB 6GB RAM Silver</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Triple 12 MP, 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>128GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', 2, CAST(30990000 AS Decimal(15, 0)), CAST(0.1 AS Decimal(2, 1)), 6, N'apple-iphone-13-pro-silver.jpg_d9f98edc-8ac0-4853-b9c6-b47918e5a520.jpg', CAST(N'2021-11-04T14:52:00.0000000' AS DateTime2), CAST(N'2021-11-04T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (4, 4, 5, N'Apple IPhone 12 Pro Max 256GB 6GB RAM Blue', N'<p><strong>Specifications of Apple IPhone 12 Pro Max 256GB 6GB RAM Blue</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Triple 12 MP, 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', 2, CAST(37990000 AS Decimal(15, 0)), CAST(0.1 AS Decimal(2, 1)), 0, N'apple-iphone-12-pro-max-blue.jpg_a31421ec-27d5-4796-af97-ddc005f56596.jpg', CAST(N'2021-11-04T14:55:00.0000000' AS DateTime2), CAST(N'2021-11-04T15:01:00.0000000' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (5, 4, 5, N'Apple IPhone 12 Pro 512GB 6GB RAM Gold', N'<p><strong>Specifications of Apple IPhone 12 Pro 512GB 6GB RAM Gold</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Triple 12 MP, 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>512GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(38490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 1, N'apple-iphone-12-pro-gold.jpg_a71f002a-f363-4e67-a0bf-c5efd3e4cfd9.jpg', CAST(N'2021-11-04T14:57:00.0000000' AS DateTime2), CAST(N'2021-11-04T15:01:00.0000000' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (6, 4, 5, N'Apple IPhone 13 128GB 4GB RAM Black', N'<p><strong>Specifications of Apple IPhone 13 128GB 4GB RAM Black</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(24990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'apple-iphone-13-black.jpg_3683188f-f1d7-49bc-a1fb-48cbc68e08a9.jpg', CAST(N'2021-11-04T15:03:00.0000000' AS DateTime2), CAST(N'2021-12-23T10:17:13.8122066' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (7, 4, 5, N'Apple IPhone 13 Mini 256GB 4GB RAM White', N'<p><strong>Specifications of Apple IPhone 13 Mini 256GB 4GB RAM White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(24990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 5, N'apple-iphone-13-mini-white.jpg_c94fe17b-59ba-4d3c-b086-4afc280349db.jpg', CAST(N'2021-11-04T15:05:00.0000000' AS DateTime2), CAST(N'2021-12-09T20:03:54.6932209' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (8, 4, 5, N'Apple IPhone 12 Mini 256GB 4GB RAM White', N'<p><strong>Specifications of Apple IPhone 12 Mini 256GB 4GB RAM White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(20990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 1, N'apple-iphone-12-mini-white.jpg_51df9341-10fa-4559-a45e-a2afc95e6a82.jpg', CAST(N'2021-11-04T15:06:00.0000000' AS DateTime2), CAST(N'2021-12-27T17:42:26.0360418' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (9, 4, 5, N'Apple IPhone 11 128GB 4GB RAM Red', N'<p><strong>Specifications of Apple IPhone 11 128GB 4GB RAM Red</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(20990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 0, N'apple-iphone-11-red.jpg_e0db098a-f1cf-4982-9e26-c94ea9f0de0a.jpg', CAST(N'2021-11-04T15:08:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (10, 4, 5, N'Apple IPhone XR 128GB 3GB RAM Coral', N'<p><strong>Specifications of Apple IPhone XR 128GB 3GB RAM Coral</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(16490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 0, N'apple-iphone-xr-coral.jpg_de64496b-6eca-4b6f-a4d1-bcd0dc9fb079.jpg', CAST(N'2021-11-04T15:09:00.0000000' AS DateTime2), CAST(N'2021-12-10T10:58:48.5224841' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (11, 4, 5, N'Apple IPhone SE 64GB 2GB RAM Black', N'<p><strong>Specifications of Apple IPhone SE 64GB 2GB RAM Black</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(11990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 7, N'apple-iphone-se-black.jpg_a2cf64fe-209e-4118-a432-11c1f1313154.jpg', CAST(N'2021-11-04T15:10:00.0000000' AS DateTime2), CAST(N'2021-12-04T23:47:54.6133848' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (12, 4, 6, N'Samsung Galaxy Z Fold3 5G 512GB 12GB RAM Phantom Silver', N'<p><strong>Specifications of Samsung Galaxy Z Fold3 5G 512GB 12GB RAM Phantom Silver</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(44990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 3, N'samsung-galaxy-z-fold-3-5g-phantom-silver.jpg_15e31d98-e71c-4bd6-9448-728ae38f1a16.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (13, 4, 6, N'Samsung Galaxy A03s 64GB 4GB RAM White', N'<p><strong>Specifications of Samsung Galaxy A03s 64GB 4GB RAM White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(3690000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 5, N'samsung-galaxy-a03s-white.jpg_e1e20c40-2456-43b2-b2e5-88d53b37fc18.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), CAST(N'2021-12-05T08:35:38.4983008' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (14, 4, 6, N'Samsung Galaxy S20 FE 256GB 8GB RAM Cloud Mint', N'<p><strong>Specifications of Samsung Galaxy S20 FE 256GB 8GB RAM Cloud Mint</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(13490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 3, N'samsung-galaxy-s20-fe-cloud-mint.jpg_d614b2ab-ba31-4708-bbd2-b22c1bb6aa50.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (15, 4, 6, N'Samsung Galaxy Z Fold2 5G 256GB 12GB RAM Mystic Black', N'<p><strong>Specifications of Samsung Galaxy Z Fold2 5G 256GB 12GB RAM Mystic Black</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(44000000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 6, N'samsung-galaxy-z-fold-2-5g-mystic-black.jpg_39767a37-1b34-4c19-9b64-bfda2aaad882.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (16, 4, 6, N'Samsung Galaxy Z Flip3 5G 256GB 8GB RAM Lavender', N'<p><strong>Specifications of Samsung Galaxy Z Flip3 5G 256GB 8GB RAM Lavender</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(26990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'samsung-galaxy-z-flip-3-5g-lavender.jpg_543f5a5a-0f11-4ec4-aea0-a85732d5e764.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (17, 4, 6, N'Samsung Galaxy S21 Ultra 5G 128GB 12GB RAM Phantom Silver', N'<p><strong>Specifications of Samsung Galaxy S21 Ultra 5G 128GB 12GB RAM Phantom Silver</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(21990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 3, N'samsung-galaxy-s21-ultra-5g-phantom-silver.jpg_e38e49fb-fbd6-4d91-8c7b-4805aa7f82f1.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (18, 4, 6, N'Samsung Galaxy S21 Plus 5G 256GB 8GB RAM Black', N'<p><strong>Specifications of Samsung Galaxy S21 Plus 5G 256GB 8GB RAM Black</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(20990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 0, N'samsung-galaxy-s21-plus-5g-black.jpg_e7a11215-95a6-4679-82cc-203776c1b06b.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (19, 4, 6, N'Samsung Galaxy S21 5G 128GB 8GB RAM Phantom Gray', N'<p><strong>Specifications of Samsung Galaxy S21 5G 128GB 8GB RAM Phantom Gray</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(14990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 0, N'samsung-galaxy-s21-5g-phantom-gray.jpg_e25487bb-d959-41ce-8559-f42ffc299104.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (20, 4, 6, N'Samsung Galaxy Note 20 256GB 8GB RAM Mystic Bronze', N'<p><strong>Specifications of Samsung Galaxy Note 20 256GB 8GB RAM Mystic Bronze</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(15990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 2, N'samsung-galaxy-note-20-mystic-bronze.jpg_6ffb7dfc-176a-4661-9925-fe0271b8a123.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (21, 4, 6, N'Samsung Galaxy A52 256GB 8GB RAM Awesome White', N'<p><strong>Specifications of Samsung Galaxy A52 256GB 8GB RAM Awesome White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(10290000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'samsung-galaxy-a52-awesome-white.jpg_8864d5a1-caf9-4ede-a575-5aab924bf351.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), CAST(N'2021-12-10T10:58:45.8889700' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (22, 4, 6, N'Samsung Galaxy A32 128GB 6GB RAM Awesome Blue', N'<p><strong>Specifications of Samsung Galaxy A32 128GB 6GB RAM Awesome Blue</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(6690000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'samsung-galaxy-a32-awesome-blue.jpg_9cc448c2-4685-4add-987e-14ecc9e1dca5.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (23, 4, 7, N'Xiaomi 11T 256GB 8GB RAM Moonlight White', N'<p><strong>Specifications of Xiaomi 11T 256GB 8GB RAM Moonlight White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(11490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 1, N'xiaomi-11t-moonlight-white.jpg_3f591da4-c02c-468b-99df-c9092a8047cc.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (26, 4, 7, N'Xiaomi Mi 11 256GB 8GB RAM Horizon Blue', N'<p><strong>Specifications of Xiaomi Mi 11 256GB 8GB RAM Horizon Blue</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(19990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 2, N'xiaomi-mi-11-horizon-blue.jpg_a84883b0-2423-4817-bcee-e558cbb6f282.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), CAST(N'2021-12-01T17:05:33.1975870' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (28, 4, 7, N'Xiaomi Redmi Note 10 Pro 128GB 8GB RAM Onyx Gray', N'<p><strong>Specifications of Xiaomi Redmi Note 10 Pro 128GB 8GB RAM Onyx Gray</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(7490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 2, N'xiaomi-redmi-note-10-pro-onyx-gray.jpg_0e8c75f5-4d26-4fcf-8921-427bd873c704.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (29, 4, 7, N'Xiaomi Redmi Note 10S 128GB 8GB RAM Shadow Black', N'<p><strong>Specifications of Xiaomi Redmi Note 10S 128GB 8GB RAM Shadow Black</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(6490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'xiaomi-redmi-note-10s-shadow-black.jpg_fc547e57-cdbf-40a2-b755-84b745b35328.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), CAST(N'2021-12-10T10:26:10.4150528' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (31, 4, 7, N'Xiaomi Redmi 9T 64GB 4GB RAM Sunrise Orange', N'<p><strong>Specifications of Xiaomi Redmi 9T 64GB 4GB RAM Sunrise Orange</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(3990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 0, N'xiaomi-redmi-9t-sunrise-orange.jpg_f86117d6-8a95-4583-86a2-214c13bbf458.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (39, 4, 9, N'Realme C21Y 32GB 3GB RAM Cross Black', N'<p><strong>Specifications of Realme C21Y 32GB 3GB RAM Cross Black</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(3490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 11, N'realme-c21y-cross-black.jpg_69ec39dc-74ab-4052-b2d8-da326d39b9a6.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), CAST(N'2021-12-10T10:58:45.8889875' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (40, 4, 9, N'Realme 7 Pro 128GB 8GB RAM Mirror Silver', N'<p><strong>Specifications of Realme 7 Pro 128GB 8GB RAM Mirror Silver</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(8690000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 2, N'realme-7-pro-mirror-silver.jpg_0a6961cf-639c-4f59-b130-0a40288ae630.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (44, 4, 9, N'Realme 7 128GB 8GB RAM Mist White', N'<p><strong>Specifications of Realme 7 128GB 8GB RAM Mist White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(6790000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 0, N'realme-7-mist-white.jpg_6217bbab-0747-44f6-b084-ea367eb8fd39.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (46, 4, 9, N'Realme 6 128GB 4GB Comet White', N'<p><strong>Specifications of Realme 6 128GB 4GB Comet White</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(5990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 3, N'realme-6-comet-white.jpg_26e8daeb-6c6f-4d43-810f-903a92fb60a6.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), CAST(N'2021-12-05T08:35:38.4954982' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (47, 4, 9, N'Realme C17 128GB 6GB Navy Blue', N'<p><strong>Specifications of Realme C17 128GB 6GB Navy Blue</strong></p><figure class="table"><table><tbody><tr><td><strong>Screen</strong></td><td>Super Retina XDR OLED, 6.1 inches</td></tr><tr><td><strong>Main Camera</strong></td><td>Dual 12 MP , 12 MP</td></tr><tr><td><strong>Selfie Camera</strong></td><td>Single 12 MP</td></tr><tr><td><strong>RAM</strong></td><td>6GB</td></tr><tr><td><strong>Storage</strong></td><td>256GB</td></tr><tr><td><strong>OS</strong></td><td>iOS 14.1, upgradable to iOS 15.1</td></tr><tr><td><strong>Chipset</strong></td><td>Apple A14 Bionic</td></tr><tr><td><strong>CPU</strong></td><td>Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</td></tr><tr><td><strong>GPU</strong></td><td>Apple GPU (4-core graphics)</td></tr><tr><td><strong>SIM</strong></td><td>Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td><strong>Pin</strong></td><td>Li-Ion 2815 mAh, non-removable (10.78 Wh)</td></tr></tbody></table></figure>', NULL, CAST(5290000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 2, N'realme-c17-navy-blue.jpg_6483c03f-253a-4077-aeb3-c775ecf715a6.jpg', CAST(N'2021-11-04T15:28:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (81, 6, 6, N'Samsung Galaxy Buds+ R175 True Wireless Black Earbud', N'<p><strong>Specifications of Samsung Galaxy Buds+ R175 True Wireless Black Earbud</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>11h or 22h with charging box</td></tr><tr><td>Charging Port</td><td>Type-C</td></tr><tr><td>Audio Technology</td><td>Ambient Sound, AKG Sound</td></tr><tr><td>Compatibility</td><td>Android, iOS, Windows</td></tr><tr><td>Utilities</td><td>microphone, Wireless charging, Ear cushions</td></tr><tr><td>Connection</td><td>Bluetooth 5.0</td></tr></tbody></table></figure>', NULL, CAST(1490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 14, N'samsung-galaxy-bud-plus-r175-tws-black.jpg_fb715acf-a862-4817-ae86-13994f25e594.jpg', CAST(N'2021-12-06T08:50:29.5530000' AS DateTime2), CAST(N'2021-12-10T10:26:10.4149969' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (82, 6, 5, N'Apple AirPods Pro MagSafe Charge MLWK3 White In-ear', N'<p><strong>Specifications of Apple AirPods Pro MagSafe Charge MLWK3 White In-ear</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>4.5h</td></tr><tr><td>Charging Port</td><td>Lightning, MagSafe</td></tr><tr><td>Audio Technology</td><td>Active Noise Cancellation, Adaptive EQ, Transparency Mode</td></tr><tr><td>Compatibility</td><td>Android, iOS, iPadOS, MacOS</td></tr><tr><td>Utilities</td><td>Waterproof IPX4</td></tr><tr><td>Connection</td><td>Bluetooth 5.0</td></tr></tbody></table></figure>', NULL, CAST(5490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 19, N'apple-airpods-pro-magsafe-charge-mlwk3-white.jpg_ede44f2e-c13c-4c04-9953-0ebeb79c5ab4.jpg', CAST(N'2021-12-06T08:59:24.8320000' AS DateTime2), CAST(N'2021-12-23T10:15:00.4457968' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (83, 6, 16, N'Mozard TS11 mini True Wireless White Earbud', N'<p><strong>Specifications of Apple AirPods Pro MagSafe Charge MLWK3 White Earbud</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>3.5h or 8.75h with charging box</td></tr><tr><td>Charging Port</td><td>Type-C</td></tr><tr><td>Audio Technology</td><td>Ambient Sound, AKG Sound</td></tr><tr><td>Compatibility</td><td>Android, iOS, Windows</td></tr><tr><td>Utilities</td><td>microphone, Ear cushions</td></tr><tr><td>Connection</td><td>Bluetooth 5.0</td></tr></tbody></table></figure>', NULL, CAST(760000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 10, N'mozard-ts11-mini-true-wireless-white.jpg_7f12ed31-3ab3-42e0-8e73-63ab7de3574a.jpg', CAST(N'2021-12-06T09:02:57.8020000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (84, 6, 6, N'Samsung Galaxy Buds Pro True Wireless Silver Earbud', N'<p><strong>Specifications of Samsung Galaxy Buds Pro True Wireless Silver Earbud</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>8h or 20h with charging box</td></tr><tr><td>Charging Port</td><td>Type-C</td></tr><tr><td>Audio Technology</td><td>Active Noise Cancellation, Dolby Head Tracking</td></tr><tr><td>Compatibility</td><td>Android, iOS, Windows</td></tr><tr><td>Utilities</td><td>Waterproof, Anti-noise</td></tr><tr><td>Connection</td><td>Bluetooth 5.0</td></tr></tbody></table></figure>', NULL, CAST(3990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 7, N'samsung-galaxy-buds-true-wireless-pro-silver.jpg_538a5d54-294a-4886-be02-f5d38cebe7f2.jpg', CAST(N'2021-12-06T09:06:27.1520000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (85, 6, 5, N'Apple AirPods 2 MV7N2 White In-ear', N'<p><strong>Specifications of Apple AirPods 2 MV7N2 White In-ear</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>5h</td></tr><tr><td>Charging Port</td><td>Lightning</td></tr><tr><td>Compatibility</td><td>Android, iOS</td></tr><tr><td>Utilities</td><td>microphone</td></tr><tr><td>Connection</td><td>Bluetooth</td></tr></tbody></table></figure>', NULL, CAST(3590000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 11, N'apple-airpods-2-mv7n2-white-inear.jpg_d0a2c25e-92ee-476e-bf88-dbadd6450978.jpg', CAST(N'2021-12-06T09:25:44.4122254' AS DateTime2), CAST(N'2021-12-10T10:58:43.2687734' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (86, 6, 16, N'Mozard Z7000A Black In-ear', N'<p><strong>Specifications of Mozard Z7000A Black In-ear</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>6.5h</td></tr><tr><td>Charging Port</td><td>Micro USB</td></tr><tr><td>Compatibility</td><td>Android, iOS, Windows, Windows Phone</td></tr><tr><td>Utilities</td><td>Waterproof, Anti-noise</td></tr></tbody></table></figure>', NULL, CAST(700000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 6, N'mozard-z7000a-black-inear.jpg_bea90b2f-b4a5-4045-a823-6856ffb23214.jpg', CAST(N'2021-12-06T09:29:47.4463535' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (87, 6, 17, N'Beats Flex MYMC2 Wireless Black In-ear', N'<p><strong>Specifications of Beats Flex MYMC2 Wireless Black In-ear</strong></p><figure class="table"><table><tbody><tr><td>Pin</td><td>12h</td></tr><tr><td>Charging Port</td><td>Type-C</td></tr><tr><td>Audio Technology</td><td>Audio Sharing</td></tr><tr><td>Compatibility</td><td>Android, iOS, Windows</td></tr><tr><td>Utilities</td><td>Fast Charge</td></tr><tr><td>Connection</td><td>Bluetooth</td></tr></tbody></table></figure>', NULL, CAST(990000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 5, N'beats-flex-mymc2-wireless-black-inear.jpg_aafa3b39-133e-4726-aaa1-3332453d9cdb.jpg', CAST(N'2021-12-06T09:34:17.5985437' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (88, 6, 5, N'Apple EarPods Lightning MMTN2 White In-ear', N'<p><strong>Specifications of Apple EarPods Lightning MMTN2 White In-ear</strong></p><figure class="table"><table><tbody><tr><td>Jack Port</td><td>Lightning</td></tr><tr><td>Compatibility</td><td>iOS</td></tr><tr><td>Utilities</td><td>Microphone</td></tr></tbody></table></figure>', NULL, CAST(790000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 9, N'apple-earpods-cong-lightning-mmtn2-white-inear.jpg_83b66be5-41c7-4138-8487-2c401b7b25d4.jpg', CAST(N'2021-12-06T09:40:08.3063912' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (89, 6, 11, N'OPPO EP MH151 Black In-ear', N'<p><strong>Specifications of OPPO EP MH151 Black In-ear</strong></p><figure class="table"><table><tbody><tr><td>Jack Port</td><td>3.5 mm</td></tr><tr><td>Compatibility</td><td>Android, Windows</td></tr><tr><td>Utilities</td><td>Microphone</td></tr></tbody></table></figure>', NULL, CAST(590000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'oppo-ep-mh151-black-inear.jpg_275a758c-420f-4077-b51e-50c7babe584e.jpg', CAST(N'2021-12-06T09:43:09.3112799' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (90, 6, 18, N'Rapoo EP28 Black In-ear', N'<p><strong>Specifications of Rapoo EP28 Black In-ear</strong></p><figure class="table"><table><tbody><tr><td>Jack Port</td><td>3.5 mm</td></tr><tr><td>Compatibility</td><td>Android, iOS</td></tr><tr><td>Utilities</td><td>Microphone</td></tr></tbody></table></figure>', NULL, CAST(179000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 3, N'rapoo-ep28-black-inear.jpg_ece7355b-8567-46a4-b340-22423e73a518.jpg', CAST(N'2021-12-06T09:47:43.0423496' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (91, 5, 5, N'Apple iPhone 13 Pro Max Silicone Black Case', N'<p><strong>Specifications of Apple iPhone 13 Pro Max Silicone Black Case</strong></p><figure class="table"><table><tbody><tr><td>Material</td><td>Silicon</td></tr><tr><td>Compatibility</td><td>iPhone 13 Pro Max</td></tr><tr><td>Utilities</td><td>Scratch-resistant, Compatible with MagSafe wireless charging</td></tr></tbody></table></figure>', NULL, CAST(1590000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 11, N'apple-iphone-13-pro-max-silicone-black-case.jpg_15357839-b0ce-441c-a36b-5921e37fb3b6.jpg', CAST(N'2021-12-06T10:01:04.6801687' AS DateTime2), CAST(N'2021-12-10T10:58:43.2677849' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (92, 5, 19, N'Mipow Apple IPhone 13 Pro Max Silver Case', N'<p><strong>Specifications of Mipow Apple IPhone 13 Pro Max Silver Case</strong></p><figure class="table"><table><tbody><tr><td>Material</td><td>Silicon</td></tr><tr><td>Compatibility</td><td>iPhone 13 Pro Max</td></tr><tr><td>Utilities</td><td>Shockproof, Anti-scratch Camera</td></tr></tbody></table></figure>', NULL, CAST(432000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 9, N'mipow-apple-iphone-13-pro-max-silver-case.jpg_3bf5877a-07d5-459b-968f-12b9a295999c.jpg', CAST(N'2021-12-06T10:09:49.4344379' AS DateTime2), CAST(N'2021-12-23T10:15:00.4458262' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (93, 5, 20, N'Osmia Samsung Galaxy A32 CK-T015-20 Black Case', N'<p><strong>Specifications of Osmia Samsung Galaxy A32 CK-T015-20 Black Case</strong></p><figure class="table"><table><tbody><tr><td>Material</td><td>Plastic</td></tr><tr><td>Compatibility</td><td>Samsung Galaxy A32</td></tr><tr><td>Utilities</td><td>Anti-scratch, Anti-Shock</td></tr></tbody></table></figure>', NULL, CAST(700000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 15, N'osmia samsung-galaxy-a32-ck-t015-20-black-case.jpg_01d4cc21-bb58-4031-ab70-0caa54918d17.jpg', CAST(N'2021-12-06T10:17:13.9243417' AS DateTime2), CAST(N'2021-12-10T10:26:10.4150368' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (94, 5, 21, N'UAG Apple IPhone 12 Pro Plasma Case', N'<p><strong>Specifications of UAG Apple iPhone 12 Pro Plasma Case</strong></p><figure class="table"><table><tbody><tr><td>Material</td><td>Silicon</td></tr><tr><td>Compatibility</td><td>Apple IPhone 12 Pro</td></tr><tr><td>Utilities</td><td>Shockproof, Anti-scratch Camera</td></tr></tbody></table></figure>', NULL, CAST(760000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 22, N'uag-apple-iphone-12-pro-plasma-ice-case.jpg_205d8519-9aaf-4f17-a769-bc917e6685c6.jpg', CAST(N'2021-12-06T10:27:03.1047894' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (95, 5, 5, N'Apple IPhone 11 Pro Max Suft Blue Case', N'<p><strong>Specifications of Apple IPhone 11 Pro Max Suft Blue Case</strong></p><figure class="table"><table><tbody><tr><td>Material</td><td>Silicon</td></tr><tr><td>Compatibility</td><td>Apple IPhone 11 Pro Max</td></tr><tr><td>Utilities</td><td>Shockproof, Anti-scratch Camera</td></tr></tbody></table></figure>', NULL, CAST(1099000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 5, N'apple-iphone-11-pro-max-suft-blue-case.jpg_3f10de82-436d-4e4b-a0e5-4db5ffc76fdc.jpg', CAST(N'2021-12-06T10:30:55.8020045' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (96, 8, 22, N'Belkin Pocket Power BPB002', N'<p><strong>Specifications of Belkin Pocket Power BPB002 Backup Charger</strong></p><figure class="table"><table><tbody><tr><td><strong>Charging performance</strong></td><td>60%</td></tr><tr><td><strong>Capacity</strong></td><td>20.000 mAh</td></tr><tr><td><strong>Input</strong></td><td>Type C: 5V - 3A, 9V - 3A, 12V - 2.5A, 15V - 2A, 20V - 1.5A</td></tr><tr><td><strong>Output</strong></td><td>Type C: 5V - 3A, 9V - 3A, 12V - 2.5A, 15V - 2A, 20V - 1.5AUSB: 5V - 2.4A</td></tr><tr><td><strong>Battery core</strong></td><td>Polymer</td></tr><tr><td><strong>Technology/Utilities</strong></td><td>Power Delivery</td></tr></tbody></table></figure>', NULL, CAST(1710000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 4, N'belkin-pocket-power-back-up-charger.jpg_61cfb771-7afd-4733-945d-37431d6d5fef.jpg', CAST(N'2021-12-06T19:35:00.0270000' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (97, 8, 23, N'Mophie Powerstation', N'<p><strong>Specifications of Mophie Powerstation Backup Charger</strong></p><figure class="table"><table><tbody><tr><td><strong>Charging performance</strong></td><td>60%</td></tr><tr><td><strong>Capacity</strong></td><td>20.000 mAh</td></tr><tr><td><strong>Input</strong></td><td>Type C (PD): 5V - 3A, 9V - 2A, 12V - 1.5A</td></tr><tr><td><strong>Output</strong></td><td>Type-C PD: 5V - 3A, 9V - 2A, 12V - 1.5AUSB: 5V - 2.4A</td></tr><tr><td><strong>Battery core</strong></td><td>Polymer</td></tr><tr><td><strong>Technology/Utilities</strong></td><td>LED indicator light, Power Delivery</td></tr></tbody></table></figure>', NULL, CAST(1490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 11, N'mophie-powerstation-back-up-charger.jpg_15ce5df3-506f-4f15-9a10-f47d97892382.jpg', CAST(N'2021-12-06T19:38:26.3995768' AS DateTime2), CAST(N'2021-12-28T10:42:09.7833834' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (98, 8, 6, N'Samsung EB-P5300', N'<p><strong>Specifications of Samsung EB-P5300 Backup Charger</strong></p><figure class="table"><table><tbody><tr><td><strong>Charging performance</strong></td><td>60%</td></tr><tr><td><strong>Capacity</strong></td><td>20.000 mAh</td></tr><tr><td><strong>Input</strong></td><td>Type C: 5V - 3A, 9V - 2.77A, 12V - 2.1A, 15V - 1.66A, 20V - 1.25A</td></tr><tr><td><strong>Output</strong></td><td>Type C (PD): 5V - 3A, 9V - 2.77A, 15V - 1.66A, 20V - 1.25A, (PPS) 3.3-5.9V - 3A, 3.3-11V - 2.25A USB: 5V - 2A, 9V - 2A, 12V - 2.1A</td></tr><tr><td><strong>Battery core</strong></td><td>Polymer</td></tr><tr><td><strong>Technology/Utilities</strong></td><td>LED indicator light, Power Delivery</td></tr></tbody></table></figure>', NULL, CAST(1490000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 6, N'samsung-eb-p5300-back-up-charger.jpg_a0aea486-084d-469c-b569-844db3a5f126.jpg', CAST(N'2021-12-06T19:41:29.3914506' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (100, 8, 25, N'Xmobile Atela 10', N'<p><strong>Specifications of Xmobile Atela 10 Backup Charger</strong></p><figure class="table"><table><tbody><tr><td><strong>Charging performance</strong></td><td>65%</td></tr><tr><td><strong>Battery charge time</strong></td><td>10 - 11 hours with Adapter 1A, 6 - 8 hours with Adapter 2A</td></tr><tr><td><strong>Capacity</strong></td><td>10.000 mAh</td></tr><tr><td><strong>Input</strong></td><td>Micro USB/Type-C: 5V - 2A, 9V - 2A, 12V - 1.5A</td></tr><tr><td><strong>Output</strong></td><td>USB: 5V - 3AType-C PD: 5V - 3A, 9V - 2A, 12V - 1.5A</td></tr><tr><td><strong>Battery core</strong></td><td>Polymer</td></tr><tr><td><strong>Technology/Utilities</strong></td><td>LED Indicator</td></tr></tbody></table></figure>', NULL, CAST(600000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 21, N'xmobile-atela-10-back-up-charger.jpg_9d254777-ee8d-411a-afb6-00d49917baee.jpg', CAST(N'2021-12-06T19:49:19.3573790' AS DateTime2), CAST(N'2021-12-10T10:58:43.2688067' AS DateTime2))
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (101, 8, 26, N'AVA+ PB100S', N'<p><strong>Specifications of AUKEY PB-XN10 Backup Charger</strong></p><figure class="table"><table><tbody><tr><td><strong>Charging performance</strong></td><td>65%</td></tr><tr><td><strong>Battery charge time</strong></td><td>10 - 11 hours with Adapter 1A, 5 - 6 hours with Adapter 2A</td></tr><tr><td><strong>Capacity</strong></td><td>10.000 mAh</td></tr><tr><td><strong>Input</strong></td><td>Micro USB/Type-C: 5V - 2A</td></tr><tr><td><strong>Output</strong></td><td>Type-C: 5V - 2A, USB: 5V - 2A</td></tr><tr><td><strong>Battery core</strong></td><td>Polymer</td></tr><tr><td><strong>Technology/Utilities</strong></td><td>LED Indicator</td></tr></tbody></table></figure>', NULL, CAST(467000 AS Decimal(15, 0)), CAST(0.0 AS Decimal(2, 1)), 5, N'ava-plus-pb100s-back-up-charger.jpg_6c7466b4-e3a6-4d43-bcfa-7c9bb90cd936.jpg', CAST(N'2021-12-06T19:52:11.9805475' AS DateTime2), NULL)
INSERT [dbo].[Item] ([ItemId], [ItemCategoryId], [ItemGroupId], [Name], [Detail], [PromotionBannerId], [Price], [PromotionPercentage], [Quantity], [Image], [CreatedDate], [UpdatedDate]) VALUES (104, 4, 5, N'qwe', N'<p>qw</p>', 1, CAST(1490000 AS Decimal(15, 0)), CAST(0.3 AS Decimal(2, 1)), 12, N'xmobile-atela-10-back-up-charger-view1.jpg_2aaf2292-0f94-4645-b981-512a1ca7846b.jpg', CAST(N'2021-12-27T15:12:56.6819625' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemCategory] ON 

INSERT [dbo].[ItemCategory] ([ItemCategoryId], [Name], [CreatedDate], [UpdatedDate]) VALUES (4, N'Mobile Phones', CAST(N'2021-11-04T14:31:00.0000000' AS DateTime2), CAST(N'2021-12-08T16:14:00.0000000' AS DateTime2))
INSERT [dbo].[ItemCategory] ([ItemCategoryId], [Name], [CreatedDate], [UpdatedDate]) VALUES (5, N'Phone Cases', CAST(N'2021-11-04T14:31:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemCategory] ([ItemCategoryId], [Name], [CreatedDate], [UpdatedDate]) VALUES (6, N'Earphones', CAST(N'2021-11-04T14:31:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemCategory] ([ItemCategoryId], [Name], [CreatedDate], [UpdatedDate]) VALUES (7, N'Old Mobile Phones', CAST(N'2021-11-04T14:31:00.0000000' AS DateTime2), CAST(N'2021-11-04T14:31:00.0000000' AS DateTime2))
INSERT [dbo].[ItemCategory] ([ItemCategoryId], [Name], [CreatedDate], [UpdatedDate]) VALUES (8, N'Backup Chargers', CAST(N'2021-12-06T19:27:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[ItemCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemGroup] ON 

INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (5, N'Apple', CAST(N'2021-11-04T14:32:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (6, N'Samsung', CAST(N'2021-11-04T14:32:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (7, N'Xiaomi', CAST(N'2021-11-04T14:33:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (8, N'Nokia', CAST(N'2021-11-04T14:33:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (9, N'Realme', CAST(N'2021-11-04T14:34:00.0000000' AS DateTime2), CAST(N'2021-11-04T16:31:00.0000000' AS DateTime2))
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (10, N'LG', CAST(N'2021-11-04T14:34:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (11, N'Oppo', CAST(N'2021-11-04T14:34:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (12, N'Vivo', CAST(N'2021-11-04T14:34:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (13, N'Sony', CAST(N'2021-11-04T14:34:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (15, N'Huawei', CAST(N'2021-11-09T16:43:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (16, N'Mozard', CAST(N'2021-12-06T08:13:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (17, N'Beats', CAST(N'2021-12-06T08:13:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (18, N'Rapoo', CAST(N'2021-12-06T08:13:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (19, N'Mipow', CAST(N'2021-12-06T10:02:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (20, N'Osmia', CAST(N'2021-12-06T10:16:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (21, N'UAG', CAST(N'2021-12-06T10:23:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (22, N'Belkin', CAST(N'2021-12-06T19:25:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (23, N'Mophie', CAST(N'2021-12-06T19:26:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (24, N'AUKEY', CAST(N'2021-12-06T19:26:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (25, N'Xmobile', CAST(N'2021-12-06T19:26:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[ItemGroup] ([ItemGroupId], [Name], [CreatedDate], [UpdatedDate]) VALUES (26, N'AVA+', CAST(N'2021-12-06T19:26:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[ItemGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemImage] ON 

INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (1, 1, N'apple-iphone-12-white.jpg_773e98b7-7955-4d85-a611-9f5367a8af6b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (2, 1, N'apple-iphone-12-view.jpg_be82b247-e2e7-448b-8450-bc0e4580e5b1.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (3, 1, N'apple-iphone-12-view2.jpg_5f48b765-13ea-44da-ac30-59d84e80d31b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (4, 2, N'apple-iphone-13-pro-max-blue.jpg_cb8b9281-9282-422e-aa9d-d3d05735f5fd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (5, 2, N'apple-iphone-13-pro-max-view.jpg_454c3027-a10f-4e57-9bf5-baea6baa954b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (44, 2, N'apple-iphone-13-pro-max-view1.jpg_71fb68b8-1f81-4bc6-8f8b-9320ab27e44e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (45, 2, N'apple-iphone-13-pro-max-view2.jpg_89e6584f-9433-4d4f-8cd2-031dee5a3333.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (46, 3, N'apple-iphone-13-pro-silver.jpg_0ea50b49-c48a-4faf-bf76-5375f67603ea.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (47, 3, N'apple-iphone-13-pro-max-view2.jpg_bd801d05-b896-4e0f-a481-d565b89c315d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (48, 3, N'apple-iphone-13-pro-max-view1.jpg_1633286f-bdd2-4252-aafb-e3c1c952bd08.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (49, 3, N'apple-iphone-13-pro-max-view.jpg_727fbcf4-0066-49d1-a285-715b61ea4587.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (50, 4, N'apple-iphone-12-pro-max-view2.jpg_dd97ed68-7eb7-4eab-ba5b-52eaec28d30e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (51, 4, N'apple-iphone-12-pro-max-view1.jpg_44ac267e-8c7e-429e-9946-019adc9c1339.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (52, 4, N'apple-iphone-12-pro-max-view.jpg_63a45e72-d030-43aa-ac80-eb0fcd10e33a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (53, 4, N'apple-iphone-12-pro-max-blue.jpg_715fd790-8b20-4a4f-baaa-85b8528d3e8d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (54, 5, N'apple-iphone-12-pro-view4.jpg_52018c7b-89a9-4aa2-91f2-332dbd2564b4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (55, 5, N'apple-iphone-12-pro-view3.jpg_f4e6d66e-0613-433c-9eff-88ed439aab3b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (56, 5, N'apple-iphone-12-pro-view2.jpg_a4ffceec-bf75-4663-9935-e5cc508b87cd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (57, 5, N'apple-iphone-12-pro-view1.jpg_603070c3-5511-4b1b-81e4-cc95fe5ea56b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (58, 5, N'apple-iphone-12-pro-view.jpg_1846a4d1-8ae1-48ad-b3f9-1dbccc7f5bcd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (59, 5, N'apple-iphone-12-pro-gold.jpg_c4cb4a80-d2db-41c6-aed5-b1a18a00f8f2.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (60, 6, N'apple-iphone-13-view2.jpg_838125a1-ae03-4a39-99ba-f068e2d0a4b2.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (61, 6, N'apple-iphone-13-view1.jpg_3311113d-e2b7-459d-a46f-b5ae46a12692.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (62, 6, N'apple-iphone-13-view.jpg_28e91bfb-29cc-4d40-825d-32cda1fedc6b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (63, 6, N'apple-iphone-13-black.jpg_2586acda-e8cd-42ae-99ce-282e23650475.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (64, 7, N'apple-iphone-13-mini-view3.jpg_08f5748c-f89f-4432-a4bd-5491f6c907fc.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (65, 7, N'apple-iphone-13-mini-view2.jpg_6be26614-b86a-4411-8273-e22e22ab62c7.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (66, 7, N'apple-iphone-13-mini-view1.jpg_e81082a5-295d-4dae-96b3-5b8fac38f7fa.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (67, 7, N'apple-iphone-13-mini-view.jpg_0564a9f3-fd2a-40f2-8d31-8fa268f5af2b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (68, 7, N'apple-iphone-13-mini-white.jpg_44e15831-5c4e-4f4f-a047-b22e145e8768.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (69, 8, N'apple-iphone-12-mini-view3.jpg_b3cae45f-416b-4b2b-8859-aeed9645034e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (70, 8, N'apple-iphone-12-mini-view2.jpg_a8e6bf0a-60a8-4eed-85d8-8bf1bf1cae21.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (71, 8, N'apple-iphone-12-mini-view1.jpg_47a993b7-7fc8-40ba-b119-4cd0b2cb6eb4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (72, 8, N'apple-iphone-12-mini-view.jpg_3ae52d15-f29c-4989-ae71-5f25af3e0200.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (73, 8, N'apple-iphone-12-mini-white.jpg_05ec340b-666f-4360-94fa-9b354085c9ba.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (74, 9, N'apple-iphone-11-red.jpg_9c4fd976-c413-485f-9637-6cb6d8bee47f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (75, 9, N'apple-iphone-11-view.jpg_6d2a1e26-bcd0-424a-ac16-c9fdddfca66f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (76, 9, N'apple-iphone-11-view1.jpg_b1181ba8-a59d-4fa6-8d4c-ae8e094687b1.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (77, 9, N'apple-iphone-11-view2.jpg_28c8e612-b9e2-41ba-bc5d-ed6809123655.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (78, 9, N'apple-iphone-11-view3.jpg_1bc5ad5e-42fd-4fe1-8372-d58763a981dd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (79, 10, N'apple-iphone-xr-coral.jpg_dfe9e084-e746-466c-ae1a-c50ff056c905.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (80, 10, N'apple-iphone-xr-view.jpg_22fbbb60-f0a4-40fb-a245-40540452129c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (81, 10, N'apple-iphone-xr-view1.jpg_674d3515-bb46-435e-804d-39bdf23d566a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (82, 10, N'apple-iphone-xr-view2.jpg_dd0972f3-ff76-4655-9172-f13fbb7a1bee.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (83, 11, N'apple-iphone-se-black.jpg_c7d3c509-20e6-42b1-bb68-476b982c04c7.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (84, 11, N'apple-iphone-se-view.jpg_d7d8a660-ea15-4627-b23d-419e56ec0243.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (85, 11, N'apple-iphone-se-view1.jpg_3cf0c455-85dc-424c-ba3e-9aca7dbeff63.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (86, 11, N'apple-iphone-se-view2.jpg_afd02fdf-16d8-4d65-84a4-33261cdc2e0f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (87, 11, N'apple-iphone-se-view3.jpg_f6ad57fe-2842-4290-bdb8-08a21360c68e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (88, 12, N'samsung-galaxy-z-fold-3-5g-view3.jpg_568ec46c-2973-471e-96a7-1eae7e3d7799.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (89, 12, N'samsung-galaxy-z-fold-3-5g-view2.jpg_5372827a-1a8d-437a-9d55-af8e5a1073e1.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (90, 12, N'samsung-galaxy-z-fold-3-5g-view1.jpg_a8ef233f-f3a8-4ad7-b80e-281931902ed4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (91, 12, N'samsung-galaxy-z-fold-3-5g-view.jpg_4f36452b-5b20-427a-a381-50cc52c71cd3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (92, 12, N'samsung-galaxy-z-fold-3-5g-phantom-silver.jpg_81c4eef0-b412-4503-997e-843e2939963f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (93, 13, N'samsung-galaxy-a03s-view.jpg_5d0dd770-775e-4fb2-9302-b0b2a6187b04.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (94, 13, N'samsung-galaxy-a03s-white.jpg_d37ce973-643b-4017-84aa-7f847111568b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (95, 14, N'samsung-galaxy-s20-fe-cloud-mint.jpg_9100a350-d5fe-4e8b-ada8-dc862e645d98.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (96, 14, N'samsung-galaxy-s20-fe-view.jpg_7d6e1272-70bf-4010-80de-ad242a3a13de.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (97, 14, N'samsung-galaxy-s20-fe-view1.jpg_ecc4362f-44c5-4d00-921a-69bcf7094340.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (98, 14, N'samsung-galaxy-s20-fe-view2.jpg_a9aa7583-a9e9-49af-93ad-35ea0470602b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (100, 15, N'samsung-galaxy-z-fold-2-5g-view.jpg_b57fe9a1-4e72-4361-a291-c1b9af52a886.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (101, 15, N'samsung-galaxy-z-fold-2-5g-view1.jpg_bf99a5e5-0f7f-4063-a542-98ec8e933f9d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (102, 15, N'samsung-galaxy-z-fold-2-5g-view2.jpg_b9047b76-adea-4eda-a28f-7c3f10896b75.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (103, 15, N'samsung-galaxy-z-fold-2-5g-view3.jpg_5d1cbeee-d597-4925-9c7b-d2747eedf80c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (104, 16, N'samsung-galaxy-z-flip-3-5g-lavender.jpg_ddb2cdaa-1ae2-4b95-af53-a75f37ee34c7.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (105, 16, N'samsung-galaxy-z-flip-3-5g-view1.jpg_5ec7c91c-36e8-4884-a94c-4e4dad6fd08b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (106, 16, N'samsung-galaxy-z-flip-3-5g-view2.jpg_cebfb512-49be-4390-b43c-525c3c5d338a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (107, 16, N'samsung-galaxy-z-flip-3-5g-view3.jpg_2005174c-2195-405c-bc8f-fc4c4df5086e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (108, 17, N'samsung-galaxy-s21-ultra-5g-phantom-silver.jpg_1103117b-3a2e-40c1-8ef7-81b90650dc12.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (109, 17, N'samsung-galaxy-s21-ultra-5g-view.jpg_36c5c132-05d9-4414-a3a0-d280e31907b0.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (110, 17, N'samsung-galaxy-s21-ultra-5g-view1.jpg_5a6fb175-726a-48d4-ade7-a3791d8158e5.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (111, 17, N'samsung-galaxy-s21-ultra-5g-view2.jpg_88aef8fe-4914-485f-9dba-e4324d21405f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (112, 17, N'samsung-galaxy-s21-ultra-5g-view3.jpg_b37bfbd3-1d0e-44ce-ac51-5d7183c00f05.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (113, 18, N'samsung-galaxy-s21-plus-5g-black.jpg_8828e538-149e-47f7-af28-ad4ef34bc6b2.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (114, 18, N'samsung-galaxy-s21-plus-5g-view.jpg_fc933a24-2fa1-41ce-b86c-17054942ee03.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (115, 18, N'samsung-galaxy-s21-plus-5g-view1.jpg_93479295-ae2b-4b92-b40a-d72f05bbfb4b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (116, 18, N'samsung-galaxy-s21-plus-5g-view2.jpg_add0173b-d160-40a5-a5ae-8a79fa3389e4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (117, 18, N'samsung-galaxy-s21-plus-5g-view3.jpg_803e1784-f66e-44bb-a9f3-deaaa66676f3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (118, 19, N'samsung-galaxy-s21-5g-phantom-gray.jpg_eddf391d-6be2-4a34-af6c-e4f372d6b700.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (119, 19, N'samsung-galaxy-s21-5g-view.jpg_2f1b13d9-c930-48db-bc58-f98eb6e8e5ce.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (120, 19, N'samsung-galaxy-s21-5g-view1.jpg_759693ba-7d16-453d-9a33-fa0e6e00ff62.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (121, 19, N'samsung-galaxy-s21-5g-view2.jpg_a3d90dfc-976d-4baa-b85d-d631817069f2.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (122, 20, N'samsung-galaxy-note-20-mystic-bronze.jpg_80914c27-1a4c-477d-a1c4-5c4fdc5f5bef.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (123, 20, N'samsung-galaxy-note-20-view.jpg_d49a052e-229a-4b7f-ab93-d5b79ae826f6.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (124, 20, N'samsung-galaxy-note-20-view1.jpg_af954013-af9c-4fa4-8c2f-36887720ac21.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (125, 20, N'samsung-galaxy-note-20-view2.jpg_b83c896e-a966-4a5f-a8e8-912141729c98.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (126, 21, N'samsung-galaxy-a52-awesome-white.jpg_3bf3a171-6fbf-4e92-83f2-6d37e68cbc74.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (127, 21, N'samsung-galaxy-a52-view.jpg_14e0d8ba-d21e-4cd8-81ae-16786c578a7e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (128, 21, N'samsung-galaxy-a52-view1.jpg_1b00bd04-294b-49d2-8864-83c59892f973.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (129, 21, N'samsung-galaxy-a52-view2.jpg_d911a3c6-4d5c-4c5b-8dc3-0e14e05f8a4d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (130, 21, N'samsung-galaxy-a52-view3.jpg_5e634780-65ec-4f4c-a643-d3328f43e356.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (131, 22, N'samsung-galaxy-a32-awesome-blue.jpg_14d26e38-0f7e-4d1b-86a7-ec4aa01f146a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (132, 22, N'samsung-galaxy-a32-view.jpg_69299542-ed2b-49d7-8c35-7f2c0f53af8b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (133, 22, N'samsung-galaxy-a32-view1.jpg_8a995129-d113-4bf0-b3b3-2c54de8deb5e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (134, 22, N'samsung-galaxy-a32-view2.jpg_c8dbf2d6-b9f0-4752-b6ec-acdd0522201c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (135, 22, N'samsung-galaxy-a32-view3.jpg_aa62e2b3-bba2-4782-b614-e89e804dbe32.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (136, 23, N'xiaomi-11t-view3.jpg_8526ecff-3adc-4e76-9145-3d187cebc442.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (137, 23, N'xiaomi-11t-view2.jpg_69130ef7-19f2-48d3-bcf8-bab3180b197c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (138, 23, N'xiaomi-11t-view1.jpg_edc33e32-3234-49b7-bc6e-2d20e8ca2e75.jpg')
GO
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (139, 23, N'xiaomi-11t-view.jpg_2b864533-154d-4d4d-9ea5-312171c100d4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (140, 23, N'xiaomi-11t-moonlight-white.jpg_505085f3-e675-4f0a-a6ba-7d13063245b8.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (141, 26, N'xiaomi-mi-11-view3.jpg_bcf34592-aafc-4c64-973c-f43a7aca55d6.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (142, 26, N'xiaomi-mi-11-view2.jpg_619cb588-99cb-46ba-a01b-64584441defd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (143, 26, N'xiaomi-mi-11-view1.jpg_7cba2d96-2268-408e-bd9e-dedb88e61b8c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (144, 26, N'xiaomi-mi-11-view.jpg_529091de-8be8-4369-b741-fc34b9c6de23.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (145, 26, N'xiaomi-mi-11-horizon-blue.jpg_357b1e97-22ec-4d24-bd08-c6eac792d73e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (146, 28, N'xiaomi-redmi-note-10-pro-view3.jpg_0b99b803-8374-475f-bad0-dd02f87b25d2.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (147, 28, N'xiaomi-redmi-note-10-pro-view2.jpg_6baa5fba-3238-4d2b-8070-abdd270d0d70.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (148, 28, N'xiaomi-redmi-note-10-pro-view1.jpg_45c3ee6b-0521-414b-afce-833a9683ee42.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (149, 28, N'xiaomi-redmi-note-10-pro-view.jpg_95af8747-c389-49e8-9c89-d2fe22e3708a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (150, 28, N'xiaomi-redmi-note-10-pro-onyx-gray.jpg_1c930a46-1743-40fd-aa58-724dbd996e11.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (151, 29, N'xiaomi-redmi-note-10s-view3.jpg_813da446-cd7e-4c92-8399-0d3d62664654.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (152, 29, N'xiaomi-redmi-note-10s-view2.jpg_73e6efbd-b90a-41ba-99ea-a46e1e6d5181.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (153, 29, N'xiaomi-redmi-note-10s-view1.jpg_6e9c20dc-4848-4937-ac76-e87747302881.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (154, 29, N'xiaomi-redmi-note-10s-view.jpg_fe965832-c8a7-4704-a261-5c7e2b802762.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (155, 29, N'xiaomi-redmi-note-10s-shadow-black.jpg_b3a7c7eb-0b93-42f3-9d4c-b08bff31de82.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (156, 31, N'xiaomi-redmi-9t-view2.jpg_701f8157-6a64-48b3-bff7-ffa42ff8ee92.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (157, 31, N'xiaomi-redmi-9t-view1.jpg_6c7a2e9f-acf5-485b-b6f1-8100d86d9622.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (158, 31, N'xiaomi-redmi-9t-view.jpg_2e9a2efe-306c-4cdf-80a3-9bb564c786bb.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (159, 31, N'xiaomi-redmi-9t-sunrise-orange.jpg_065470e4-d8a5-4c8f-89a4-e379ad44c5eb.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (160, 39, N'realme-c21y-view.jpg_93153d57-eeed-43e5-a17e-fd5e8d3ad0e7.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (161, 39, N'realme-c21y-view2.jpg_ba0f0890-b08f-4fe2-aab3-fe1a1329be5c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (162, 39, N'realme-c21y-view3.jpg_caa6329f-bb48-4edc-adf7-84697373f508.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (163, 39, N'realme-c21y-view1.jpg_6634395a-06cc-4bf6-92e7-42a880961374.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (164, 39, N'realme-c21y-cross-black.jpg_f153ce12-11b8-4c4d-8185-1e40d7f5b84f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (165, 40, N'realme-7-pro-view3.jpg_7b03563f-6f02-4308-b235-789e21edbd44.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (166, 40, N'realme-7-pro-view2.jpg_fab33e9f-5097-41da-aab6-174c7789bfde.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (167, 40, N'realme-7-pro-view1.jpg_16370eb4-cead-4525-89a7-b77cae5db89a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (168, 40, N'realme-7-pro-view.jpg_79dadd31-8fe3-4c7e-8164-add443baf546.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (169, 40, N'realme-7-pro-mirror-silver.jpg_b4af0ca4-03ed-450d-8ee1-0d8e46e719ce.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (170, 44, N'realme-7-view3.jpg_e4414e67-5fd8-468c-b5f3-971832564a55.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (171, 44, N'realme-7-view2.jpg_ceb32eb6-1cc5-401c-96c1-a1b134bd2bb3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (172, 44, N'realme-7-view1.jpg_c3cf16a1-c931-4503-9cd2-3d572be7c5b3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (173, 44, N'realme-7-view.jpg_00df38cd-4891-41fc-a947-af4417388bfc.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (174, 44, N'realme-7-mist-white.jpg_67982d7a-97f2-4955-8e5d-f0c14541cc66.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (175, 46, N'realme-6-view3.jpg_884ddb43-18af-4acf-8688-086d474f2e60.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (176, 46, N'realme-6-view2.jpg_69756e2d-fb5f-42e5-b140-68061b2638b7.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (177, 46, N'realme-6-view1.jpg_d0b021e3-ef9a-402f-a9c9-5de902e0eeff.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (178, 46, N'realme-6-view.jpg_89dd9b0c-197a-4fb4-83e1-c8105f692197.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (179, 46, N'realme-6-comet-white.jpg_d463d427-b039-4405-a588-d45c96ef4b97.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (180, 47, N'realme-c17-view3.jpg_64f18360-6355-4e41-abfe-070c826aff4b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (181, 47, N'realme-c17-view2.jpg_634ec145-06d8-4b51-83e7-de47eb04226b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (182, 47, N'realme-c17-view1.jpg_3fac1300-0ba1-4861-ba44-0138d1e4939a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (183, 47, N'realme-c17-view.jpg_f3317099-9f5f-467b-b9cb-e7c8a2603593.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (184, 47, N'realme-c17-navy-blue.jpg_7f2ea529-21a8-47b5-8206-7ea846320f09.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (185, 81, N'samsung-galaxy-bud-plus-r175-tws-black-view4.jpg_a5e412d0-a70a-41af-82f9-704480eb7790.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (186, 81, N'samsung-galaxy-bud-plus-r175-tws-black-view3.jpg_4b8b8cdc-323c-4ffa-8896-be076fbe6fc0.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (187, 81, N'samsung-galaxy-bud-plus-r175-tws-black-view2.jpg_365347f5-34d7-4586-bf42-0ea96833977b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (188, 81, N'samsung-galaxy-bud-plus-r175-tws-black-view1.jpg_7f8c599e-abfd-4b32-af9f-3e41b8b5b9e6.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (189, 81, N'samsung-galaxy-bud-plus-r175-tws-black-view.jpg_8062f008-340f-45b3-9f85-b18b5ce7a938.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (190, 81, N'samsung-galaxy-bud-plus-r175-tws-black.jpg_cd32d561-1aca-445e-8a2e-5416ab48e433.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (191, 82, N'apple-airpods-pro-magsafe-charge-mlwk3-white-view2.jpg_54914bb8-18a8-4c8c-b1c4-3eb0cc9705a8.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (192, 82, N'apple-airpods-pro-magsafe-charge-mlwk3-white-view1.jpg_27bd8047-b3f4-4588-92e5-312f2b8e0320.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (193, 82, N'apple-airpods-pro-magsafe-charge-mlwk3-white-view.jpg_70f5fa17-4e54-4878-998b-cb9931ff764a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (194, 82, N'apple-airpods-pro-magsafe-charge-mlwk3-white.jpg_f07168bd-e822-43f5-b7f1-1fadedf2f57a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (195, 83, N'mozard-ts11-mini-true-wireless-white-view4.jpg_2255e5eb-09fa-48f6-aab9-cf2ae016366c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (196, 83, N'mozard-ts11-mini-true-wireless-white-view3.jpg_534fb857-96e2-4e3b-8687-e05120ec1c5b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (197, 83, N'mozard-ts11-mini-true-wireless-white-view2.jpg_c35151e4-4b85-447e-bb29-cdd5e9f772c2.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (198, 83, N'mozard-ts11-mini-true-wireless-white-view1.jpg_a797c7be-ceaf-4869-858f-a4468257ef55.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (199, 83, N'mozard-ts11-mini-true-wireless-white-view.jpg_7852ee35-2225-4313-9b20-14703fe8cbcf.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (200, 83, N'mozard-ts11-mini-true-wireless-white.jpg_924f3df5-483e-4ff1-b902-5b48cba4aa0c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (201, 84, N'samsung-galaxy-buds-true-wireless-pro-silver-view3.jpg_89c7c226-0555-4ca9-9db5-b47e187b1ddb.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (202, 84, N'samsung-galaxy-buds-true-wireless-pro-silver-view2.jpg_8bca693c-2065-4ee4-880e-6c1ef78ec7c6.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (203, 84, N'samsung-galaxy-buds-true-wireless-pro-silver-view1.jpg_1e1b827f-4fed-442a-8769-2f21082262c0.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (204, 84, N'samsung-galaxy-buds-true-wireless-pro-silver-view.jpg_33cb75a3-fb46-401b-98ae-3e98d50614f4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (205, 84, N'samsung-galaxy-buds-true-wireless-pro-silver.jpg_742bfaae-3dff-4d90-9e96-83300898e47b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (206, 85, N'apple-airpods-2-mv7n2-white-inear-view2.jpg_7f3b8190-abc4-4a46-abb7-cc81526b63f8.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (207, 85, N'apple-airpods-2-mv7n2-white-inear-view1.jpg_213622cb-62f5-4a2d-a29d-b61123319820.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (208, 85, N'apple-airpods-2-mv7n2-white-inear-view.jpg_8f501ed4-6505-4d2b-892b-c5eaea41b97c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (209, 85, N'apple-airpods-2-mv7n2-white-inear.jpg_8bd8fbd6-42d7-423c-80d2-5933585f5fdf.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (210, 86, N'mozard-z7000a-black-inear-view3.jpg_f860c59d-22b2-4ab8-8e13-581b461e8d79.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (211, 86, N'mozard-z7000a-black-inear-view2.jpg_df8c2a74-56c4-4e8a-9e63-b0922e67f79a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (212, 86, N'mozard-z7000a-black-inear-view1.jpg_75c18368-66f6-4a28-9e35-19db001dd82d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (213, 86, N'mozard-z7000a-black-inear-view.jpg_f28eb545-0720-4c11-a8ee-f139938baccd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (214, 86, N'mozard-z7000a-black-inear.jpg_8b2bad5c-058e-431a-aabc-06a474684d7d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (215, 87, N'beats-flex-mymc2-wireless-black-inear-view3.jpg_bbb887b9-bb0a-4d49-acad-9155a2c6e6f4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (216, 87, N'beats-flex-mymc2-wireless-black-inear-view2.jpg_07b5c1c9-3c1c-4a66-8fc8-e8e5a0b5a7ba.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (217, 87, N'beats-flex-mymc2-wireless-black-inear-view1.jpg_b75fc359-b96e-406f-b155-bc4a5e8e9260.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (218, 87, N'beats-flex-mymc2-wireless-black-inear-view.jpg_a6a59b92-0437-4bf8-bbbd-ba4cf376c0a3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (219, 87, N'beats-flex-mymc2-wireless-black-inear.jpg_16c39d89-4eb3-4dfa-9590-c8c754d58bd8.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (220, 88, N'apple-earpods-cong-lightning-mmtn2-white-inear-view3.jpg_2692740d-eeed-4175-8988-040be2412f80.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (221, 88, N'apple-earpods-cong-lightning-mmtn2-white-inear-view2.jpg_1968a539-14ad-4395-be5d-5f929519b4de.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (222, 88, N'apple-earpods-cong-lightning-mmtn2-white-inear-view1.jpg_ed14c3d5-e1ed-448b-a2dd-8722a0d86efd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (223, 88, N'apple-earpods-cong-lightning-mmtn2-white-inear-view.jpg_fa52d598-843f-4c59-b22d-d7c92a62c496.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (224, 88, N'apple-earpods-cong-lightning-mmtn2-white-inear.jpg_3300c4be-fbd4-4dcf-9266-81339e0bb129.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (225, 89, N'oppo-ep-mh151-black-inear-view2.jpg_f60fd2f0-97b5-4b5d-9b4c-e5f7cb2b715b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (226, 89, N'oppo-ep-mh151-black-inear-view1.jpg_9a6e00a6-33c2-46d5-852f-b832f6111542.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (227, 89, N'oppo-ep-mh151-black-inear-view.jpg_ad5694ce-7b74-45bf-ac74-9dbe13d9dd54.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (228, 89, N'oppo-ep-mh151-black-inear.jpg_7f0a1f21-5bd0-4785-bfd7-1146e9048cca.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (229, 90, N'rapoo-ep28-black-inear-view2.jpg_ab8117b4-9794-4272-bf32-d480c01d7af4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (230, 90, N'rapoo-ep28-black-inear-view1.jpg_e802a931-1bab-450e-a981-4ab46120fa5d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (231, 90, N'rapoo-ep28-black-inear-view.jpg_7b62cb32-58a1-4a1b-b154-2ff5224c34f5.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (232, 90, N'rapoo-ep28-black-inear.jpg_5e61783f-d00e-440a-8e0c-6ace343fdf20.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (233, 91, N'apple-iphone-13-pro-max-silicone-black-case-view2.jpg_f4433a52-24c5-4a34-a2d5-6ac18986fe6b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (234, 91, N'apple-iphone-13-pro-max-silicone-black-case-view1.jpg_cbd9de9f-d95d-4312-936b-cef2352c42cd.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (235, 91, N'apple-iphone-13-pro-max-silicone-black-case-view.jpg_13a1942e-f0f3-49d1-beca-ba1317bc96de.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (236, 91, N'apple-iphone-13-pro-max-silicone-black-case.jpg_8886775b-377e-4818-91b3-92173f14a7a4.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (237, 92, N'mipow-apple-iphone-13-pro-max-silver-case-view.jpg_53452b83-e2b0-4ccc-b4ed-c0dd6cea536f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (238, 92, N'mipow-apple-iphone-13-pro-max-silver-case.jpg_e2d97c2e-b10b-4c8a-a815-10ea87a58dec.jpg')
GO
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (239, 93, N'osmia samsung-galaxy-a32-ck-t015-20-black-case-view3.jpg_bce22d8d-24dc-4594-82ac-927ba0021f23.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (240, 93, N'osmia samsung-galaxy-a32-ck-t015-20-black-case-view2.jpg_95e3fe9f-7b28-438e-a6a1-971fdbe79f11.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (241, 93, N'osmia samsung-galaxy-a32-ck-t015-20-black-case-view1.jpg_8d1d9e41-f3da-4ae9-8f3c-cc051b7c20d6.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (242, 93, N'osmia samsung-galaxy-a32-ck-t015-20-black-case-view.jpg_ecfe7337-b080-4080-834d-38199adb2aad.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (243, 93, N'osmia samsung-galaxy-a32-ck-t015-20-black-case.jpg_74240f0d-6837-4f22-adcf-d36e19d0cb6a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (244, 94, N'uag-apple-iphone-12-pro-plasma-ice-case-view2.jpg_15961196-e6d0-4079-93cb-f251380fdb51.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (245, 94, N'uag-apple-iphone-12-pro-plasma-ice-case-view1.jpg_01ef55f8-b726-438e-a1d1-4f68f8666e9a.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (246, 94, N'uag-apple-iphone-12-pro-plasma-ice-case-view.jpg_87de3cf0-3f3d-4ded-9c96-f4e08d413e9e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (247, 94, N'uag-apple-iphone-12-pro-plasma-ice-case.jpg_4201638c-d73a-4d57-b0af-e2f359271c66.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (248, 95, N'apple-iphone-11-pro-max-suft-blue-case-view3.jpg_5880230a-5dfa-4f2c-844a-49f72e39e235.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (249, 95, N'apple-iphone-11-pro-max-suft-blue-case-view2.jpg_3384b681-1466-4c9f-a46b-0495771f2e90.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (250, 95, N'apple-iphone-11-pro-max-suft-blue-case-view1.jpg_19f9ce51-a89f-424f-9122-b454545bafe3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (251, 95, N'apple-iphone-11-pro-max-suft-blue-case-view.jpg_774707bc-6dbe-4681-943a-0719c3cd9953.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (252, 95, N'apple-iphone-11-pro-max-suft-blue-case.jpg_c267440c-a67d-492a-9e3e-f120d19e64c6.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (253, 96, N'belkin-pocket-power-back-up-charger-view1.jpg_9c592065-96fb-4e47-a573-8ea88954e99f.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (254, 96, N'belkin-pocket-power-back-up-charger-view.jpg_5fabdafb-ab5b-4821-ae42-15c3db89ff8e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (255, 96, N'belkin-pocket-power-back-up-charger.jpg_50a124a3-7e98-454f-84f1-f1afec33edef.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (256, 97, N'mophie-powerstation-back-up-charger-view2.jpg_97b66a20-a4b2-4dd5-bfa5-586a7868753c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (257, 97, N'mophie-powerstation-back-up-charger-view1.jpg_cbf18893-06b2-4e1d-b9cc-0977b5575d43.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (258, 97, N'mophie-powerstation-back-up-charger-view.jpg_f215189e-a2bf-4417-922f-6b01371141c8.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (259, 97, N'mophie-powerstation-back-up-charger.jpg_c5601e92-f596-4134-8f7b-438b820ac722.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (260, 98, N'samsung-eb-p5300-back-up-charger-view2.jpg_181d2f42-0f78-4e4b-92b3-0580fcaeca53.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (261, 98, N'samsung-eb-p5300-back-up-charger-view1.jpg_49a9df8f-ba03-4f24-86b8-5bb321a3da2d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (262, 98, N'samsung-eb-p5300-back-up-charger-view.jpg_0a32d2ea-c03f-404c-9352-0b99808e9bac.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (263, 98, N'samsung-eb-p5300-back-up-charger.jpg_c8319311-8925-45ab-ad24-6ad416c41287.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (268, 100, N'xmobile-atela-10-back-up-charger-view3.jpg_342023dd-d24a-4c61-9822-9c678e5d4b55.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (269, 100, N'xmobile-atela-10-back-up-charger-view2.jpg_c24d4cd9-7fa7-4526-a7e7-8af499cad23c.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (270, 100, N'xmobile-atela-10-back-up-charger-view1.jpg_d93197b5-e66b-45dc-ab2e-5c57a5be935b.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (271, 100, N'xmobile-atela-10-back-up-charger-view.jpg_dfd980f6-3764-4d36-b2d1-228fdd86f8f3.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (272, 100, N'xmobile-atela-10-back-up-charger.jpg_de81882d-1ec6-4cc5-a19e-e23136a5523d.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (273, 101, N'ava-plus-pb100s-back-up-charger-view2.jpg_4dcfc3df-ebaa-4829-811f-92da11c84b39.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (274, 101, N'ava-plus-pb100s-back-up-charger-view1.jpg_3bd92476-4a63-4905-b5f5-b386b0f58a30.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (275, 101, N'ava-plus-pb100s-back-up-charger-view.jpg_c72d5f7a-2b1c-45df-a40c-0212eb9fd948.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (276, 101, N'ava-plus-pb100s-back-up-charger.jpg_82bd2f7e-6c54-4609-8790-bb24f1630b6e.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (335, 104, N'xmobile-atela-10-back-up-charger-view1.jpg_617df223-7c80-48f8-8dae-365af19a2712.jpg')
INSERT [dbo].[ItemImage] ([ItemImageId], [ItemId], [Images]) VALUES (336, 104, N'xmobile-atela-10-back-up-charger-view.jpg_4b396cd3-fd15-44bb-ad71-11a255ba5dcd.jpg')
SET IDENTITY_INSERT [dbo].[ItemImage] OFF
GO
SET IDENTITY_INSERT [dbo].[PromotionBanner] ON 

INSERT [dbo].[PromotionBanner] ([PromotionBannerId], [Name], [Image], [PromotionPercentageLimit], [PromotionStartDate], [PromotionEndDate], [CreatedDate], [UpdatedDate]) VALUES (1, N'Winter Sales 2021', N'winter-sale-banner.jpg_1e7cfbd3-3272-41bf-b2fc-2dec358768a7.jpg', CAST(0.5 AS Decimal(2, 1)), CAST(N'2021-12-27T11:11:00.0000000' AS DateTime2), CAST(N'2022-01-08T11:11:00.0000000' AS DateTime2), CAST(N'2021-12-27T11:12:39.3780000' AS DateTime2), CAST(N'2021-12-28T09:43:57.3367173' AS DateTime2))
INSERT [dbo].[PromotionBanner] ([PromotionBannerId], [Name], [Image], [PromotionPercentageLimit], [PromotionStartDate], [PromotionEndDate], [CreatedDate], [UpdatedDate]) VALUES (2, N'12/12/2021 Sale', N'12-12-sale-banner.jpg_2934adca-e470-4dbb-b14d-369ae31c9452.jpg', CAST(0.5 AS Decimal(2, 1)), CAST(N'2021-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-27T11:15:14.8654071' AS DateTime2), NULL)
INSERT [dbo].[PromotionBanner] ([PromotionBannerId], [Name], [Image], [PromotionPercentageLimit], [PromotionStartDate], [PromotionEndDate], [CreatedDate], [UpdatedDate]) VALUES (3, N'Black Friday', N'black-friday-sale-banner.jpg_c37ee457-1e7b-42d5-8062-1d37549333ce.jpg', CAST(0.4 AS Decimal(2, 1)), CAST(N'2021-12-31T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-31T12:59:00.0000000' AS DateTime2), CAST(N'2021-12-27T11:22:12.0560000' AS DateTime2), CAST(N'2021-12-27T11:26:16.8903940' AS DateTime2))
SET IDENTITY_INSERT [dbo].[PromotionBanner] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON 

INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [SupplierId], [Total], [OrderDate], [Status]) VALUES (49, 1, CAST(15000000 AS Decimal(15, 0)), CAST(N'2021-11-07T09:31:29.0000000' AS DateTime2), N'Received')
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [SupplierId], [Total], [OrderDate], [Status]) VALUES (61, 1, CAST(246667 AS Decimal(15, 0)), CAST(N'2021-12-23T19:23:24.2773303' AS DateTime2), N'Ordered')
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [SupplierId], [Total], [OrderDate], [Status]) VALUES (62, 1, CAST(212000000 AS Decimal(15, 0)), CAST(N'2021-12-30T09:41:49.4790000' AS DateTime2), N'Received')
SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] ON 

INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ItemId], [Quantity], [ImportPrice]) VALUES (24, 49, 1, 7, CAST(14000000 AS Decimal(15, 0)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ItemId], [Quantity], [ImportPrice]) VALUES (25, 49, 7, 1, CAST(23 AS Decimal(15, 0)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ItemId], [Quantity], [ImportPrice]) VALUES (40, 61, 2, 2, CAST(123213 AS Decimal(15, 0)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ItemId], [Quantity], [ImportPrice]) VALUES (41, 61, 4, 2, CAST(123454 AS Decimal(15, 0)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ItemId], [Quantity], [ImportPrice]) VALUES (42, 62, 1, 5, CAST(20000000 AS Decimal(15, 0)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ItemId], [Quantity], [ImportPrice]) VALUES (43, 62, 2, 4, CAST(28000000 AS Decimal(15, 0)))
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ReplyReview] ON 

INSERT [dbo].[ReplyReview] ([ReplyReviewId], [ReviewId], [UserName], [UserRole], [Comment], [ReplyDate]) VALUES (1, 6, N'member4@gmail.com', N'Member', N'Thanks You', CAST(N'2021-12-01T08:54:37.2181609' AS DateTime2))
INSERT [dbo].[ReplyReview] ([ReplyReviewId], [ReviewId], [UserName], [UserRole], [Comment], [ReplyDate]) VALUES (2, 8, N'member5@gmail.com', N'Member', N'Thanks you', CAST(N'2021-12-06T19:13:52.8721637' AS DateTime2))
INSERT [dbo].[ReplyReview] ([ReplyReviewId], [ReviewId], [UserName], [UserRole], [Comment], [ReplyDate]) VALUES (3, 15, N'staff@mobileshop.com', N'Staff', N'Thanks you', CAST(N'2021-12-12T10:47:03.0331161' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ReplyReview] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (6, N'member4@gmail.com', N'Member', 1, N'Nice', 4, CAST(N'2021-12-01T08:54:24.8485227' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (7, N'member4@gmail.com', N'Member', 26, N'Nice', 4, CAST(N'2021-12-01T17:05:12.8850620' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (8, N'member5@gmail.com', N'Member', 95, N'Beautiful case', 4, CAST(N'2021-12-06T19:13:45.4776607' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (9, N'member5@gmail.com', N'Member', 1, N'asd', 4, CAST(N'2021-12-07T17:39:58.1239819' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (10, N'member5@gmail.com', N'Member', 1, N'a', 4, CAST(N'2021-12-07T17:50:58.6901568' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (11, N'member5@gmail.com', N'Member', 1, N'nice
', 2, CAST(N'2021-12-07T19:04:47.7217745' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (12, N'member5@gmail.com', N'Member', 2, N'Very Nice!', 4, CAST(N'2021-12-08T09:30:06.2065263' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (13, N'member5@gmail.com', N'Member', 96, N'Nice', 4, CAST(N'2021-12-10T09:45:04.8609163' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (14, N'member5@gmail.com', N'Member', 97, N'Nice', 3, CAST(N'2021-12-10T09:45:19.7281960' AS DateTime2))
INSERT [dbo].[Review] ([ReviewId], [UserName], [UserRole], [ItemId], [Comment], [Rate], [CommentDate]) VALUES (15, N'cuongb1706975@student.ctu.edu.vn', N'Member', 5, N'Nice', 4, CAST(N'2021-12-12T10:46:30.5561567' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesOrder] ON 

INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (1, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(36990000 AS Decimal(15, 0)), CAST(N'2021-10-08T09:31:29.0000000' AS DateTime2), N'Cancelled')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (2, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(41980000 AS Decimal(15, 0)), CAST(N'2021-10-08T09:36:08.0000000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (3, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(43350000 AS Decimal(15, 0)), CAST(N'2021-11-10T10:21:26.0000000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (4, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(16490000 AS Decimal(15, 0)), CAST(N'2021-11-10T10:55:50.0000000' AS DateTime2), N'Delivering')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (5, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(52040000 AS Decimal(15, 0)), CAST(N'2021-12-10T10:56:32.3450000' AS DateTime2), N'Delivering')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (6, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(6980000 AS Decimal(15, 0)), CAST(N'2021-12-10T10:58:23.8610000' AS DateTime2), N'Delivering')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (7, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(20990000 AS Decimal(15, 0)), CAST(N'2021-12-22T15:06:45.0000000' AS DateTime2), N'Delivering')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (8, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(36990000 AS Decimal(15, 0)), CAST(N'2021-12-22T15:29:46.0000000' AS DateTime2), N'Cancelled')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (9, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(36990000 AS Decimal(15, 0)), CAST(N'2021-12-22T15:31:14.0000000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (13, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(43344000 AS Decimal(15, 0)), CAST(N'2021-12-23T10:14:31.5260000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (14, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(24990000 AS Decimal(15, 0)), CAST(N'2021-12-23T10:16:55.7770000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (15, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(136950000 AS Decimal(15, 0)), CAST(N'2021-12-24T16:54:09.0210000' AS DateTime2), N'Cancelled')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (16, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(58772000 AS Decimal(15, 0)), CAST(N'2021-12-27T16:56:18.1760000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (17, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(48483000 AS Decimal(15, 0)), CAST(N'2021-12-27T17:40:50.0100000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (18, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(54281000 AS Decimal(15, 0)), CAST(N'2021-12-28T10:12:26.1270000' AS DateTime2), N'Cancelled')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (19, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(54281000 AS Decimal(15, 0)), CAST(N'2021-12-28T10:17:11.3300000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (20, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(31082000 AS Decimal(15, 0)), CAST(N'2021-12-28T10:41:02.2350000' AS DateTime2), N'Delivered')
INSERT [dbo].[SalesOrder] ([SalesOrderId], [UserName], [Name], [PhoneNumber], [Address], [Total], [OrderDate], [Status]) VALUES (22, N'member5@gmail.com', N'Le Bao Cuong', N'0942511715', N'1771, 3/2 Street, Ninh Kieu District, Can Tho City', CAST(18891000 AS Decimal(15, 0)), CAST(N'2021-12-30T17:05:49.4110000' AS DateTime2), N'Delivered')
SET IDENTITY_INSERT [dbo].[SalesOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesOrderDetail] ON 

INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (1, 1, 2, 1, CAST(36990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (2, 2, 1, 2, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (3, 3, 1, 1, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (4, 3, 81, 1, CAST(1490000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (5, 3, 93, 2, CAST(700000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (6, 3, 29, 3, CAST(6490000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (7, 4, 10, 1, CAST(16490000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (8, 5, 8, 1, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (9, 5, 21, 2, CAST(10290000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (10, 5, 39, 3, CAST(3490000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (11, 6, 91, 1, CAST(1590000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (12, 6, 85, 1, CAST(3590000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (13, 6, 100, 3, CAST(600000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (14, 7, 1, 1, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (15, 8, 2, 1, CAST(36990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (16, 9, 2, 1, CAST(36990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (21, 13, 2, 1, CAST(36990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (22, 13, 82, 1, CAST(5490000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (23, 13, 92, 2, CAST(432000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (24, 14, 6, 1, CAST(24990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (25, 15, 1, 3, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (26, 15, 2, 2, CAST(36990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (27, 16, 1, 2, CAST(18891000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (28, 16, 8, 1, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (29, 17, 1, 1, CAST(18891000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (30, 17, 2, 1, CAST(29592000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (31, 18, 1, 1, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (32, 18, 2, 1, CAST(33291000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (33, 19, 1, 1, CAST(20990000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (34, 19, 2, 1, CAST(33291000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (35, 20, 2, 1, CAST(29592000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (36, 20, 97, 1, CAST(1490000 AS Decimal(15, 0)))
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailId], [SalesOrderId], [ItemId], [Quantity], [SalesPrice]) VALUES (37, 22, 1, 1, CAST(18891000 AS Decimal(15, 0)))
SET IDENTITY_INSERT [dbo].[SalesOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [Name], [Address], [PhoneNumber], [CreatedDate], [UpdatedDate]) VALUES (1, N'Nguyen Van A Supplier', N'1375, 3/2 Street, Ninh Kieu District, Can Tho City', N'0123456798', CAST(N'2021-12-08T10:02:00.0000000' AS DateTime2), CAST(N'2021-12-26T15:33:36.7511012' AS DateTime2))
INSERT [dbo].[Supplier] ([SupplierId], [Name], [Address], [PhoneNumber], [CreatedDate], [UpdatedDate]) VALUES (2, N'Nguyen Van B Supplier', N'12 1A Street, Cai Rang District, Can Tho City', N'0123456123', CAST(N'2021-12-08T10:07:00.0000000' AS DateTime2), CAST(N'2021-12-26T15:34:14.2426944' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_ItemCategoryId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_ItemCategoryId] ON [dbo].[Item]
(
	[ItemCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_ItemGroupId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_ItemGroupId] ON [dbo].[Item]
(
	[ItemGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_PromotionBannerId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_PromotionBannerId] ON [dbo].[Item]
(
	[PromotionBannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemImage_ItemId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemImage_ItemId] ON [dbo].[ItemImage]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrder_SupplierId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder_SupplierId] ON [dbo].[PurchaseOrder]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderDetail_ItemId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_ItemId] ON [dbo].[PurchaseOrderDetail]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderDetail_PurchaseOrderId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_PurchaseOrderId] ON [dbo].[PurchaseOrderDetail]
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReplyReview_ReviewId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReplyReview_ReviewId] ON [dbo].[ReplyReview]
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Review_ItemId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Review_ItemId] ON [dbo].[Review]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalesOrderDetail_ItemId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_ItemId] ON [dbo].[SalesOrderDetail]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalesOrderDetail_SalesOrderId]    Script Date: 1/14/2022 3:59:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_SalesOrderId] ON [dbo].[SalesOrderDetail]
(
	[SalesOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DOB]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Price__2882FE7D]  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Quantity__297722B6]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ItemCategory] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[SalesOrderDetail] ADD  DEFAULT ((0.0)) FOR [SalesPrice]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemCategory_ItemCategoryId] FOREIGN KEY([ItemCategoryId])
REFERENCES [dbo].[ItemCategory] ([ItemCategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemCategory_ItemCategoryId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemGroup_ItemGroupId] FOREIGN KEY([ItemGroupId])
REFERENCES [dbo].[ItemGroup] ([ItemGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemGroup_ItemGroupId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_PromotionBanner_PromotionBannerId] FOREIGN KEY([PromotionBannerId])
REFERENCES [dbo].[PromotionBanner] ([PromotionBannerId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_PromotionBanner_PromotionBannerId]
GO
ALTER TABLE [dbo].[ItemImage]  WITH CHECK ADD  CONSTRAINT [FK_ItemImage_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemImage] CHECK CONSTRAINT [FK_ItemImage_Item_ItemId]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetail_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_Item_ItemId]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrder_PurchaseOrderId] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrder_PurchaseOrderId]
GO
ALTER TABLE [dbo].[ReplyReview]  WITH CHECK ADD  CONSTRAINT [FK_ReplyReview_Review_ReviewId] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[Review] ([ReviewId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReplyReview] CHECK CONSTRAINT [FK_ReplyReview_Review_ReviewId]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Item_ItemId]
GO
ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_Item_ItemId]
GO
ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_SalesOrder_SalesOrderId] FOREIGN KEY([SalesOrderId])
REFERENCES [dbo].[SalesOrder] ([SalesOrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_SalesOrder_SalesOrderId]
GO
USE [master]
GO
ALTER DATABASE [MobileShopContext] SET  READ_WRITE 
GO
