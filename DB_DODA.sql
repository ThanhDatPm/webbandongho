USE [master]
GO
/****** Object:  Database [DB_DODA]    Script Date: 24/04/2021 10:59:37 CH ******/
CREATE DATABASE [DB_DODA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_DODA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_DODA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_DODA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_DODA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_DODA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_DODA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_DODA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_DODA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_DODA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_DODA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_DODA] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_DODA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_DODA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_DODA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_DODA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_DODA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_DODA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_DODA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_DODA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_DODA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_DODA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_DODA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_DODA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_DODA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_DODA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_DODA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_DODA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_DODA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_DODA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_DODA] SET  MULTI_USER 
GO
ALTER DATABASE [DB_DODA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_DODA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_DODA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_DODA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_DODA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_DODA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_DODA', N'ON'
GO
ALTER DATABASE [DB_DODA] SET QUERY_STORE = OFF
GO
USE [DB_DODA]
GO
/****** Object:  Table [dbo].[tbl_anhsanpham]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_anhsanpham](
	[id_anhsanpham] [uniqueidentifier] NOT NULL,
	[fk_sanpham] [uniqueidentifier] NOT NULL,
	[c_image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_anhsanpham] PRIMARY KEY CLUSTERED 
(
	[id_anhsanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chitietdonhang]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chitietdonhang](
	[id_chitietdonhang] [uniqueidentifier] NOT NULL,
	[fk_donhang] [uniqueidentifier] NOT NULL,
	[fk_sanpham] [uniqueidentifier] NOT NULL,
	[c_soluong] [int] NOT NULL,
	[c_dongia] [real] NOT NULL,
	[c_thanhtien] [real] NOT NULL,
 CONSTRAINT [PK_tbl_chitietdonhang] PRIMARY KEY CLUSTERED 
(
	[id_chitietdonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_danhmucsanpham]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_danhmucsanpham](
	[id_danhmucsanpham] [uniqueidentifier] NOT NULL,
	[c_tendanhmuc] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_danhmucsanpham] PRIMARY KEY CLUSTERED 
(
	[id_danhmucsanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_donhang]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_donhang](
	[id_donhang] [uniqueidentifier] NOT NULL,
	[fk_khachhang] [uniqueidentifier] NOT NULL,
	[c_ngaymua] [datetime] NOT NULL,
	[c_gia] [real] NOT NULL,
	[c_trangthai] [bit] NOT NULL,
	[c_ghichu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_donhang] PRIMARY KEY CLUSTERED 
(
	[id_donhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_khachhang]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_khachhang](
	[id_khachhang] [uniqueidentifier] NOT NULL,
	[c_tenkhachhang] [nvarchar](50) NOT NULL,
	[c_diachi] [nvarchar](500) NOT NULL,
	[c_sodienthoai] [nvarchar](50) NOT NULL,
	[c_email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_khachhang] PRIMARY KEY CLUSTERED 
(
	[id_khachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sanpham]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sanpham](
	[id_sanpham] [uniqueidentifier] NOT NULL,
	[c_tensanpham] [nvarchar](500) NOT NULL,
	[fk_danhmucsanpham] [uniqueidentifier] NOT NULL,
	[c_gia] [real] NOT NULL,
	[c_thongtinchitiet] [nvarchar](max) NULL,
	[c_sanphamhot] [bit] NULL,
	[c_sanphamkhuyenmai] [bit] NULL,
	[c_soluong] [int] NOT NULL,
	[c_mota] [nvarchar](max) NULL,
	[c_ngaytao] [datetime] NULL,
 CONSTRAINT [PK_tbl_sanpham] PRIMARY KEY CLUSTERED 
(
	[id_sanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_slide]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_slide](
	[id_slide] [uniqueidentifier] NOT NULL,
	[c_image1] [nvarchar](500) NOT NULL,
	[c_image2] [nvarchar](500) NOT NULL,
	[c_image3] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_slide] PRIMARY KEY CLUSTERED 
(
	[id_slide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tintuc]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tintuc](
	[id_tintuc] [uniqueidentifier] NOT NULL,
	[c_tieude] [nvarchar](200) NOT NULL,
	[c_mota] [nvarchar](500) NOT NULL,
	[c_chitiet] [nvarchar](max) NOT NULL,
	[c_image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_tintuc] PRIMARY KEY CLUSTERED 
(
	[id_tintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 24/04/2021 10:59:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[c_account] [nvarchar](50) NOT NULL,
	[c_password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[c_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'b3061ef3-3951-4990-92dd-00b0b1d8767b', N'8a92a801-7d5a-43b8-870d-9d7cb4c6f5ab', N'20042021_105512_SA_tui7-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'6eac528f-bdc8-42f9-b27a-01400b6e69e9', N'73602780-2d4e-4ed3-b205-d0a1f18a7b91', N'20042021_104807_SA_tui4-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'f1c6c659-7302-462d-b2fe-022afe03574f', N'5b24dbed-2d05-4af6-80bd-7002957b2f55', N'20042021_114049_SA_kinh2-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'51f22e25-4435-46cb-a72a-02ebf582da63', N'3295db26-a0e1-4c7f-8a4c-99a59db61d48', N'20042021_113802_SA_kinh1-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'd052c72c-9b05-4720-9d6e-0340694312c6', N'bab4dcb1-6faa-493a-9cf9-30bbfffb9641', N'20042021_015626_CH_kinh13-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'43f3ca56-882a-4abd-b77c-036fb2344527', N'6a82aa27-b1ce-4e3d-9fa4-9cac8f243681', N'20042021_114500_SA_kinh4-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'fc607f88-c2b9-4693-a7aa-0618b9a0563a', N'6ab5a885-d02f-48c6-9ba8-33cb2084005a', N'20042021_115210_SA_kinh5-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'1d5e1ec1-1cee-44e0-9ec1-0680ec78bb2e', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_105021_SA_tui1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'20b79524-aa41-4f91-a1aa-0965eeb6a222', N'99493e8d-e3ab-4266-936e-594b15a85760', N'20042021_115413_SA_kinh7-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'6091b5d9-4323-45bb-b0c0-098efa7ccdda', N'c04c4e63-f218-4967-99cd-c363a5fb1299', N'20042021_104606_SA_tui3-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'36927098-8f4c-4eaf-8acc-0b049da23dec', N'93a292b8-54a4-4620-ac36-45a9043ed2a6', N'20042021_105426_SA_tui6-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'7c886e5f-983b-4948-95b7-0db014e2b721', N'61b3924d-70d5-417a-8e4a-d00ebf508dd7', N'20042021_105745_SA_tui8-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'2e42cfe6-6d34-4c73-b0e1-0df1e5f52efb', N'99493e8d-e3ab-4266-936e-594b15a85760', N'20042021_115413_SA_kinh7-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'92393545-8ed6-49af-81dc-1100f4e177f1', N'30107d94-e37a-4735-82eb-51f2a92e0142', N'20042021_015043_CH_kinh9-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'1576f757-4de6-40e3-971c-1f825a789dea', N'3b11c850-5e91-46df-9f21-8c29d056a886', N'20042021_015536_CH_kinh12-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'2d5c4c24-d142-4db4-8d50-1fafbbf1f47e', N'58bcf4a0-57bd-41b1-b789-ebb712cde8ec', N'20042021_114358_SA_kinh3-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'8c8025a7-98f2-4a18-a3c4-1fb87370128e', N'b96f603c-36d2-4b4e-89ec-26b748a3bea6', N'20042021_105916_SA_tui9-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'70072e9e-40fe-4f2a-ae68-1ffa7de763eb', N'5b24dbed-2d05-4af6-80bd-7002957b2f55', N'20042021_114049_SA_kinh2-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'89e63260-bfdf-4f16-86d2-219de28dcee1', N'92854fe0-38f0-4e77-bcd0-b64aed78eab2', N'20042021_104423_SA_tui2-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'97a56447-23b6-48f0-aada-23dfef901a08', N'92854fe0-38f0-4e77-bcd0-b64aed78eab2', N'20042021_104423_SA_tui2-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'cf9aa39e-0d28-48a9-ac66-24cdff40c38e', N'3295db26-a0e1-4c7f-8a4c-99a59db61d48', N'20042021_113802_SA_kinh1-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'2f1b4634-cde5-4008-8323-2b0f05397661', N'6510c8e3-0734-4984-ace3-18b428fdecee', N'20042021_015412_CH_kinh11-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'c6245a00-d250-4fe3-899f-2cdc1c31f93b', N'92854fe0-38f0-4e77-bcd0-b64aed78eab2', N'20042021_104423_SA_tui2-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'7eecacbb-23f2-48e5-8cd4-30e5d743b2b6', N'655de235-641a-44b2-9fa2-09a687f6439f', N'20042021_015249_CH_kinh10-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'4fa6f37f-6acc-4c90-811c-347aa085118b', N'8a92a801-7d5a-43b8-870d-9d7cb4c6f5ab', N'20042021_105512_SA_tui7-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'c9ce804b-9e75-4274-bde6-393121dd67aa', N'73602780-2d4e-4ed3-b205-d0a1f18a7b91', N'20042021_104807_SA_tui4-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'a8a15996-6aaf-4e9e-8b98-3a65bc2a9950', N'5df118d3-1652-4349-8b67-3101353a3e0a', N'20042021_110119_SA_tui10-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'66d4d28e-2ed0-4645-b09b-3d0b72788eac', N'6ab5a885-d02f-48c6-9ba8-33cb2084005a', N'20042021_115210_SA_kinh5-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'353e426e-cbe1-42ca-b3b9-3d65992b9838', N'6a82aa27-b1ce-4e3d-9fa4-9cac8f243681', N'20042021_114500_SA_kinh4-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'b457a314-1bea-4b7f-8505-42155e59780c', N'6ab5a885-d02f-48c6-9ba8-33cb2084005a', N'20042021_115210_SA_kinh5-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'78333995-4ee9-478b-a05f-42ba66364d93', N'c04c4e63-f218-4967-99cd-c363a5fb1299', N'20042021_104606_SA_tui3-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'ff0bb66a-6d70-467d-8c0a-46df03d41f95', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_105021_SA_tui1-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'4086db4f-b05b-4671-ad69-48054584bf89', N'8a92a801-7d5a-43b8-870d-9d7cb4c6f5ab', N'20042021_105512_SA_tui7-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'41e87345-af94-4faa-bc9b-4f043e2ddf86', N'e26a4a08-ff9a-42e1-b462-d941c0712def', N'20042021_014934_CH_kinh8-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'ce072b26-71a5-4b45-8402-4fd53330a4ff', N'5df118d3-1652-4349-8b67-3101353a3e0a', N'20042021_110120_SA_tui10-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'6e4d0772-20b9-4fb4-a322-50d1c1712d14', N'99493e8d-e3ab-4266-936e-594b15a85760', N'20042021_115413_SA_kinh7-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'c28ee99c-ece5-4f25-954e-50dc4d0a156f', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_105021_SA_tui1-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'6bd80a0f-7bce-4efa-acd4-52cde58dae1f', N'e26a4a08-ff9a-42e1-b462-d941c0712def', N'20042021_014934_CH_kinh8-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'6fbbc88c-35d9-473f-84ca-55e977e5eddc', N'6dccd48a-d079-4218-96e2-d5adc090c883', N'20042021_015851_CH_kinh15-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'5574ddf4-14be-4015-84bb-56f5980ee9a2', N'3295db26-a0e1-4c7f-8a4c-99a59db61d48', N'20042021_113802_SA_kinh1-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'c863cf03-55b9-49d1-92fb-577791558be3', N'3b11c850-5e91-46df-9f21-8c29d056a886', N'20042021_015536_CH_kinh12-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'9cd92e1d-50f0-4e34-b468-5838d5e021ff', N'e26a4a08-ff9a-42e1-b462-d941c0712def', N'20042021_014934_CH_kinh8-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'e5dabff8-dae9-418c-a5ef-5c69c420f92f', N'6dccd48a-d079-4218-96e2-d5adc090c883', N'20042021_015851_CH_kinh15-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'004897e1-6078-4677-9364-5dadac9c08e3', N'c6fd4835-b7c7-4056-96e8-cd6a5644ed0a', N'20042021_015731_CH_kinh14-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'ed0ddeb7-8293-42be-8c67-5f44945b464a', N'99493e8d-e3ab-4266-936e-594b15a85760', N'20042021_115413_SA_kinh7-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'd1622f01-4bd3-44a9-b4e1-65b402bdc3fb', N'c04c4e63-f218-4967-99cd-c363a5fb1299', N'20042021_104606_SA_tui3-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'705c92e6-af14-4c67-9ccc-65cde4107fd8', N'30107d94-e37a-4735-82eb-51f2a92e0142', N'20042021_015043_CH_kinh9-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'100ce0d8-a597-48dd-8786-672f51c81586', N'bab4dcb1-6faa-493a-9cf9-30bbfffb9641', N'20042021_015626_CH_kinh13-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'4be8f11a-1fcc-4338-92b6-69f7dcb36a25', N'bab4dcb1-6faa-493a-9cf9-30bbfffb9641', N'20042021_015626_CH_kinh13-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'3d8a8a88-88ae-4b1a-81df-6a1af1c7726e', N'8a92a801-7d5a-43b8-870d-9d7cb4c6f5ab', N'20042021_105512_SA_tui7-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'25274558-f57f-4fbb-8327-6aed2803fc31', N'c6fd4835-b7c7-4056-96e8-cd6a5644ed0a', N'20042021_015731_CH_kinh14-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'698eb702-894d-456a-ad6f-6cb614f6b298', N'f682b59e-49aa-43a4-b319-ba270e6f8097', N'20042021_105309_SA_tui5-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'e433f931-8c52-421f-b01d-79ec689df5f1', N'2130b6c9-73f9-46bf-85e0-95faabb883fe', N'20042021_115319_SA_kinh6-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'c10bb9ef-e94d-4d17-a52d-7c5b662a10a7', N'f682b59e-49aa-43a4-b319-ba270e6f8097', N'20042021_105309_SA_tui5-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'83c36a90-2c7e-4c5d-9471-7cba655a087d', N'30107d94-e37a-4735-82eb-51f2a92e0142', N'20042021_015043_CH_kinh9-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'38ca867b-51ce-4c60-a2ac-889cbc8d1dcd', N'b96f603c-36d2-4b4e-89ec-26b748a3bea6', N'20042021_105916_SA_tui9-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'31ac7910-eb22-408d-889f-8a4db2fcb2e3', N'2130b6c9-73f9-46bf-85e0-95faabb883fe', N'20042021_115319_SA_kinh6-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'cb148c8b-e7a1-45d1-b646-8d001f0911f3', N'6510c8e3-0734-4984-ace3-18b428fdecee', N'20042021_015412_CH_kinh11-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'55c4b066-1ed5-4109-b553-8f97ebf80acf', N'61b3924d-70d5-417a-8e4a-d00ebf508dd7', N'20042021_105745_SA_tui8-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'd9a86367-2a4c-4a51-9e93-97e5bb4bdf4d', N'58bcf4a0-57bd-41b1-b789-ebb712cde8ec', N'20042021_114358_SA_kinh3-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'42591b88-394a-42c8-b583-9e12128c7fa2', N'93a292b8-54a4-4620-ac36-45a9043ed2a6', N'20042021_105426_SA_tui6-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'9d054632-f3f7-4095-8c7e-9ee471eb5d00', N'6a82aa27-b1ce-4e3d-9fa4-9cac8f243681', N'20042021_114500_SA_kinh4-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'e7f8c996-e422-4ab2-90f5-a1ad038d6c2d', N'5df118d3-1652-4349-8b67-3101353a3e0a', N'20042021_110120_SA_tui10-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'e01646f6-63d1-42bf-b2b8-a30f59371e58', N'5df118d3-1652-4349-8b67-3101353a3e0a', N'20042021_110120_SA_tui10-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'1dc30308-04d9-43d5-b9e4-a31126ef4d65', N'6a82aa27-b1ce-4e3d-9fa4-9cac8f243681', N'20042021_114500_SA_kinh4-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'518ada05-8993-4845-87da-a3325fc589c5', N'30107d94-e37a-4735-82eb-51f2a92e0142', N'20042021_015043_CH_kinh9-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'8bfe8a6f-4a24-47bf-b637-a3cdd5202b9a', N'c6fd4835-b7c7-4056-96e8-cd6a5644ed0a', N'20042021_015731_CH_kinh14-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'2350db66-ebd4-4641-a347-a6090db80263', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_105021_SA_tui1-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'342d1071-8b6d-4626-899a-a96c38ec161c', N'b96f603c-36d2-4b4e-89ec-26b748a3bea6', N'20042021_105916_SA_tui9-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'd797c81f-8cf4-42ba-a0cc-aa9b472d9c8f', N'5b24dbed-2d05-4af6-80bd-7002957b2f55', N'20042021_114049_SA_kinh2-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'a7b204f3-b0ba-4362-9d3c-ac922e829874', N'2130b6c9-73f9-46bf-85e0-95faabb883fe', N'20042021_115319_SA_kinh6-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'afbdef50-49db-4b81-9e1f-ad767844a20c', N'5b24dbed-2d05-4af6-80bd-7002957b2f55', N'20042021_114049_SA_kinh2-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'999c503e-be26-40cd-ab10-b495546b148e', N'c04c4e63-f218-4967-99cd-c363a5fb1299', N'20042021_104606_SA_tui3-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'8d7f7fed-70dd-4d32-aee1-b6b2bec39814', N'93a292b8-54a4-4620-ac36-45a9043ed2a6', N'20042021_105426_SA_tui6-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'1749d550-25cb-4dbe-b4fe-b9494ba3ac39', N'3b11c850-5e91-46df-9f21-8c29d056a886', N'20042021_015536_CH_kinh12-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'7947c1bd-e1b6-4b25-8e24-bb558089fb6b', N'61b3924d-70d5-417a-8e4a-d00ebf508dd7', N'20042021_105745_SA_tui8-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'8dae2865-405d-42a4-801a-bee9c75cce2c', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_104256_SA_tui1-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'9c660704-d8cc-4710-9491-bf03f86414ae', N'e26a4a08-ff9a-42e1-b462-d941c0712def', N'20042021_014934_CH_kinh8-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'0dc7f259-704d-4122-8169-c326be2d7dc1', N'3295db26-a0e1-4c7f-8a4c-99a59db61d48', N'20042021_113802_SA_kinh1-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'a7a599c7-7c82-4351-b6c9-c3294dee2d20', N'61b3924d-70d5-417a-8e4a-d00ebf508dd7', N'20042021_105745_SA_tui8-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'03271fea-7ad5-420d-836b-c70b91a10960', N'f682b59e-49aa-43a4-b319-ba270e6f8097', N'20042021_105309_SA_tui5-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'99a2e2c6-91c5-4fec-973a-c9474a1d59fc', N'6dccd48a-d079-4218-96e2-d5adc090c883', N'20042021_015851_CH_kinh15-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'31f43cc2-464b-4d36-8fe2-cce0349671fe', N'73602780-2d4e-4ed3-b205-d0a1f18a7b91', N'20042021_104807_SA_tui4-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'20711382-7de1-479f-97f6-ce7e93c33153', N'655de235-641a-44b2-9fa2-09a687f6439f', N'20042021_015249_CH_kinh10-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'31d8057c-9888-4d4d-b6ff-ceb57310ea6b', N'73602780-2d4e-4ed3-b205-d0a1f18a7b91', N'20042021_104807_SA_tui4-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'97ef06a7-f913-4eb1-9e46-d0e74e9fcfa3', N'b96f603c-36d2-4b4e-89ec-26b748a3bea6', N'20042021_105916_SA_tui9-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'f702316f-04e3-47aa-88b6-d160f7792c4e', N'2130b6c9-73f9-46bf-85e0-95faabb883fe', N'20042021_115319_SA_kinh6-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'e5e88a49-d5c5-42ad-8838-d525a6ca2d33', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_103309_SA_tui1-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'7f0a3a84-92f1-4cd8-ba74-d88fdc88ad24', N'c273cb10-2268-488a-ba36-d73820293518', N'20042021_103309_SA_tui1-2.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'b4f21244-ec89-4e9e-8f44-da0573b61bf4', N'f682b59e-49aa-43a4-b319-ba270e6f8097', N'20042021_105309_SA_tui5-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'3c834ea4-8a52-4fe9-8d28-daeb4d4d8fe1', N'58bcf4a0-57bd-41b1-b789-ebb712cde8ec', N'20042021_114358_SA_kinh3-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'21e12ed6-3ed0-4a25-afc8-dbb03443c35f', N'92854fe0-38f0-4e77-bcd0-b64aed78eab2', N'20042021_104423_SA_tui2-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'47bfe399-763a-4a3c-aa6b-dce629d762af', N'58bcf4a0-57bd-41b1-b789-ebb712cde8ec', N'20042021_114358_SA_kinh3-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'8b13e098-5e28-4f03-bb0d-dd46bca1a4d9', N'3b11c850-5e91-46df-9f21-8c29d056a886', N'20042021_015536_CH_kinh12-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'55663d55-700a-4694-a37c-e1849f927e80', N'bab4dcb1-6faa-493a-9cf9-30bbfffb9641', N'20042021_015626_CH_kinh13-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'9e149ea0-3126-4401-95d1-e3fae7a2705f', N'6510c8e3-0734-4984-ace3-18b428fdecee', N'20042021_015412_CH_kinh11-3.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'ceee46c7-f3d7-4340-a80f-e79d5da9ab7b', N'655de235-641a-44b2-9fa2-09a687f6439f', N'20042021_015249_CH_kinh10-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'926e9ebf-4a01-4520-9a92-e9de56345f5f', N'6dccd48a-d079-4218-96e2-d5adc090c883', N'20042021_015851_CH_kinh15-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'82373f94-0f5b-4244-88a3-ed231e180720', N'c6fd4835-b7c7-4056-96e8-cd6a5644ed0a', N'20042021_015731_CH_kinh14-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'122fe529-f656-4a2a-b913-ed31ab13b29b', N'6ab5a885-d02f-48c6-9ba8-33cb2084005a', N'20042021_115210_SA_kinh5-1.jpg')
GO
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'c8dc6155-df0a-4a16-bf60-f4aafc0c3d3f', N'655de235-641a-44b2-9fa2-09a687f6439f', N'20042021_015249_CH_kinh10-4.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'e54a0cbc-b48f-4b7a-9407-f73f5c277043', N'93a292b8-54a4-4620-ac36-45a9043ed2a6', N'20042021_105426_SA_tui6-1.jpg')
INSERT [dbo].[tbl_anhsanpham] ([id_anhsanpham], [fk_sanpham], [c_image]) VALUES (N'9b210ec8-c663-4419-b717-f9aaf78bc929', N'6510c8e3-0734-4984-ace3-18b428fdecee', N'20042021_015412_CH_kinh11-4.jpg')
GO
INSERT [dbo].[tbl_chitietdonhang] ([id_chitietdonhang], [fk_donhang], [fk_sanpham], [c_soluong], [c_dongia], [c_thanhtien]) VALUES (N'b5fc7e6d-27cd-43e3-a335-ae56d72834a4', N'ae299685-469b-41af-902f-2ce170d25c3c', N'6dccd48a-d079-4218-96e2-d5adc090c883', 1, 235000, 235000)
GO
INSERT [dbo].[tbl_danhmucsanpham] ([id_danhmucsanpham], [c_tendanhmuc]) VALUES (N'82116438-4865-4fb3-8b12-5587757b22ed', N'Túi xách')
INSERT [dbo].[tbl_danhmucsanpham] ([id_danhmucsanpham], [c_tendanhmuc]) VALUES (N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', N'Kính thời trang')
INSERT [dbo].[tbl_danhmucsanpham] ([id_danhmucsanpham], [c_tendanhmuc]) VALUES (N'dd39642b-0ff2-4eaf-a572-b1b48d1f73b8', N'Dây chuyền')
INSERT [dbo].[tbl_danhmucsanpham] ([id_danhmucsanpham], [c_tendanhmuc]) VALUES (N'ec18dfb2-5259-4733-93f2-d91b83baa2dd', N'Giày cao gót')
GO
INSERT [dbo].[tbl_donhang] ([id_donhang], [fk_khachhang], [c_ngaymua], [c_gia], [c_trangthai], [c_ghichu]) VALUES (N'ae299685-469b-41af-902f-2ce170d25c3c', N'1a5c01ff-fa3b-4eaf-8a4d-635b8af68cf0', CAST(N'2021-04-20T14:17:39.710' AS DateTime), 235000, 0, N'')
GO
INSERT [dbo].[tbl_khachhang] ([id_khachhang], [c_tenkhachhang], [c_diachi], [c_sodienthoai], [c_email]) VALUES (N'1a5c01ff-fa3b-4eaf-8a4d-635b8af68cf0', N'Lê Trung Cương', N'Hà Nội', N'090909', N'ltc@mail.com')
GO
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'655de235-641a-44b2-9fa2-09a687f6439f', N'Mắt Kính Hình Bướm Tràn Viền', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 345000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 56, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:52:49.277' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'6510c8e3-0734-4984-ace3-18b428fdecee', N'Mắt Kính Tròn Tràn Viền Kim Loại', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 800000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 90, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:54:12.220' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'b96f603c-36d2-4b4e-89ec-26b748a3bea6', N'Túi Xách Nhỏ Dạng Hộp', N'82116438-4865-4fb3-8b12-5587757b22ed', 250000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 0, 70, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'bab4dcb1-6faa-493a-9cf9-30bbfffb9641', N'Mắt Kính Hình Bướm Nhựa Phối Kim Loại', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 543000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 15, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:56:26.043' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'5df118d3-1652-4349-8b67-3101353a3e0a', N'Túi Xách Nhỏ Dáng Hộp Top-Handle', N'82116438-4865-4fb3-8b12-5587757b22ed', 800000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 0, 15, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'6ab5a885-d02f-48c6-9ba8-33cb2084005a', N'Mắt Kính Mắt Mèo Kim Loại Hai Cầu', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 670000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 10, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T11:52:10.073' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'93a292b8-54a4-4620-ac36-45a9043ed2a6', N'Túi Xách Trung Dập Hiệu Ứng Lập Thể', N'82116438-4865-4fb3-8b12-5587757b22ed', 1100000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 0, 25, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'30107d94-e37a-4735-82eb-51f2a92e0142', N'Mắt Kính Hình Bướm Gọng Đôi Cách Điệu', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 567000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 45, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:50:43.523' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'99493e8d-e3ab-4266-936e-594b15a85760', N'Mắt Kính Mắt Mèo Gọng Đôi Cách Điệu', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 450000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 67, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T11:54:13.190' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'5b24dbed-2d05-4af6-80bd-7002957b2f55', N'Mắt Kính Oversize Kim Loại Phối Nhựa', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 435000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 1, 15, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'3b11c850-5e91-46df-9f21-8c29d056a886', N'Mắt Kính Hình Bướm Kim Loại Phối Nhựa', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 670000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 78, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:55:36.747' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'2130b6c9-73f9-46bf-85e0-95faabb883fe', N'Mắt Kính Lục Giác Gọng Kim Loại', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 550000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 90, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T11:53:19.940' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'3295db26-a0e1-4c7f-8a4c-99a59db61d48', N'Mắt Kính Đa Giác Kim Loại', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 455000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 1, 0, 20, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'6a82aa27-b1ce-4e3d-9fa4-9cac8f243681', N'Mắt Kính Mắt Mèo Gọng Kim Loại Mảnh', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 255000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 1, 89, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'8a92a801-7d5a-43b8-870d-9d7cb4c6f5ab', N'Túi Xách Nhỏ Minnie Hình Hộp', N'82116438-4865-4fb3-8b12-5587757b22ed', 450000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 0, 34, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'92854fe0-38f0-4e77-bcd0-b64aed78eab2', N'Túi Xách Nhỏ Dạng Hộp Chần Bông Trang Trí Xích', N'82116438-4865-4fb3-8b12-5587757b22ed', 600000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 1, 30, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'f682b59e-49aa-43a4-b319-ba270e6f8097', N'Túi Xách Trung Multi-Bag', N'82116438-4865-4fb3-8b12-5587757b22ed', 700000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 0, 45, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'c04c4e63-f218-4967-99cd-c363a5fb1299', N'Balo Tròn Khóa Bấm', N'82116438-4865-4fb3-8b12-5587757b22ed', 600000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 1, 20, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'c6fd4835-b7c7-4056-96e8-cd6a5644ed0a', N'Mắt Kính Mắt Mèo Kim Loại Phối Nhựa', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 345000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 34, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:57:31.100' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'61b3924d-70d5-417a-8e4a-d00ebf508dd7', N'Túi Xách Nhỏ Minnie Gắn Charm Minnie', N'82116438-4865-4fb3-8b12-5587757b22ed', 900000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 0, 0, 56, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'73602780-2d4e-4ed3-b205-d0a1f18a7b91', N'Túi Xách Trung Tote Trung Phối Khác Chất Liệu', N'82116438-4865-4fb3-8b12-5587757b22ed', 500000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', 1, 0, 35, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'6dccd48a-d079-4218-96e2-d5adc090c883', N'Mắt Kính Mắt Mèo Gọng Kim Loại Mảnh', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 235000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 24, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:58:51.227' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'c273cb10-2268-488a-ba36-d73820293518', N'Túi Xách Nhỏ Nhỏ Nắp Tuck-In', N'82116438-4865-4fb3-8b12-5587757b22ed', 500000, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.&nbsp;Chất liệu da tổng hợp cao cấp, ph&ugrave; hợp mang nhiều dịp: đi l&agrave;m, dạo phố, dự tiệc</p>
', 1, 0, 60, N'<p>T&uacute;i x&aacute;ch nhỏ nắp c&aacute;ch điệu lạ mắt. Chiếc t&uacute;i độc đ&aacute;o với kiểu d&aacute;ng mới dễ sử dụng. Nắp t&uacute;i được c&aacute;ch điệu v&ocirc; c&ugrave;ng th&uacute; vị. T&uacute;i c&oacute; 3 sự lựa chọn về m&agrave;u sắc, dễ phối đồ.<br />
B&ecirc;n trong gồm 1 ngăn lớn v&agrave; 1 ngăn c&oacute; kh&oacute;a k&eacute;o. T&uacute;i k&egrave;m d&acirc;y đeo da c&oacute; thể điều chỉnh độ d&agrave;i.</p>
', NULL)
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'e26a4a08-ff9a-42e1-b462-d941c0712def', N'Mắt Kính Hình Bướm Gọng Kim Loại Phối Nhựa', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 245000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 0, 0, 5, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', CAST(N'2021-04-20T13:49:34.590' AS DateTime))
INSERT [dbo].[tbl_sanpham] ([id_sanpham], [c_tensanpham], [fk_danhmucsanpham], [c_gia], [c_thongtinchitiet], [c_sanphamhot], [c_sanphamkhuyenmai], [c_soluong], [c_mota], [c_ngaytao]) VALUES (N'58bcf4a0-57bd-41b1-b789-ebb712cde8ec', N'Mắt Kính Đa Giác Kim Loại', N'f96f2ae0-ed80-4bc6-9eff-9b033e54c117', 340000, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', 1, 0, 67, N'<p>K&iacute;nh m&aacute;t gọng đa gi&aacute;c s&agrave;nh điệu, thanh lịch. Tr&ograve;ng chuyển m&agrave;u c&aacute; t&iacute;nh, ph&acirc;n cực chống. Chất liệu gọng kim loại cao cấp</p>
', NULL)
GO
INSERT [dbo].[tbl_slide] ([id_slide], [c_image1], [c_image2], [c_image3]) VALUES (N'83315dde-8bfc-4514-9454-30956a7dbbcd', N'20042021_091054_SA_banner.jpg', N'20042021_091054_SA_slideshow_4.jpg', N'20042021_091054_SA_slideshow_2.jpg')
GO
INSERT [dbo].[tbl_tintuc] ([id_tintuc], [c_tieude], [c_mota], [c_chitiet], [c_image]) VALUES (N'869cbc46-7e89-41ce-a71c-fe3d262546cf', N'Hàng hot hit', N'<p>h&agrave;ng fake</p>
', N'<p>h&agrave;ng fake</p>
', N'20042021_022242_CH_tui10-4.jpg')
GO
INSERT [dbo].[tbl_user] ([c_account], [c_password]) VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3')
INSERT [dbo].[tbl_user] ([c_account], [c_password]) VALUES (N'test', N'202cb962ac59075b964b07152d234b70')
GO
ALTER TABLE [dbo].[tbl_anhsanpham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_anhsanpham_tbl_sanpham] FOREIGN KEY([fk_sanpham])
REFERENCES [dbo].[tbl_sanpham] ([id_sanpham])
GO
ALTER TABLE [dbo].[tbl_anhsanpham] CHECK CONSTRAINT [FK_tbl_anhsanpham_tbl_sanpham]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_donhang] FOREIGN KEY([fk_donhang])
REFERENCES [dbo].[tbl_donhang] ([id_donhang])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_donhang]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_sanpham] FOREIGN KEY([fk_sanpham])
REFERENCES [dbo].[tbl_sanpham] ([id_sanpham])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_sanpham]
GO
ALTER TABLE [dbo].[tbl_donhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_donhang_tbl_khachhang] FOREIGN KEY([fk_khachhang])
REFERENCES [dbo].[tbl_khachhang] ([id_khachhang])
GO
ALTER TABLE [dbo].[tbl_donhang] CHECK CONSTRAINT [FK_tbl_donhang_tbl_khachhang]
GO
ALTER TABLE [dbo].[tbl_sanpham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sanpham_tbl_danhmucsanpham] FOREIGN KEY([fk_danhmucsanpham])
REFERENCES [dbo].[tbl_danhmucsanpham] ([id_danhmucsanpham])
GO
ALTER TABLE [dbo].[tbl_sanpham] CHECK CONSTRAINT [FK_tbl_sanpham_tbl_danhmucsanpham]
GO
USE [master]
GO
ALTER DATABASE [DB_DODA] SET  READ_WRITE 
GO
