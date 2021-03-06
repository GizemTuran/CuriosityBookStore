USE [master]
GO
/****** Object:  Database [CuriosityBookStore]    Script Date: 13.02.2021 21:55:05 ******/
CREATE DATABASE [CuriosityBookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CuriosityBookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CuriosityBookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CuriosityBookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CuriosityBookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CuriosityBookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CuriosityBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CuriosityBookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CuriosityBookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CuriosityBookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CuriosityBookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CuriosityBookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [CuriosityBookStore] SET  MULTI_USER 
GO
ALTER DATABASE [CuriosityBookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CuriosityBookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CuriosityBookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CuriosityBookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CuriosityBookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CuriosityBookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CuriosityBookStore', N'ON'
GO
ALTER DATABASE [CuriosityBookStore] SET QUERY_STORE = OFF
GO
USE [CuriosityBookStore]
GO
/****** Object:  Table [dbo].[BooksTable]    Script Date: 13.02.2021 21:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksTable](
	[BookName] [nvarchar](40) NOT NULL,
	[BookPrice] [float] NOT NULL,
	[WritersNameSurname] [nvarchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookPhoto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BooksTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 13.02.2021 21:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserMail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserNickname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WritersTable]    Script Date: 13.02.2021 21:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WritersTable](
	[WritersNameSurname] [nvarchar](50) NOT NULL,
	[SignatureDate] [date] NOT NULL,
	[Time] [time](0) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WritersPhoto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WritersTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BooksTable] ON 

INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'Origin', 40, N'Dan Brown', 1, N'danbrown.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'And There Were None', 18, N'Agatha Christie', 3, N'a.christie.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'The Interpretation Of Dreams', 55, N'Sigmund Freud', 5, N'freud.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'Nutuk', 50, N'M.Kemal Atatürk', 6, N'nutuk.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'Tesla', 40, N'Vladimir Pistalo', 7, N'tesla.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'Of Mice And Men', 14, N'John Steinbeck', 8, N'fareler.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'The Boy in the Striped Pyjamas', 27, N'Johne Boyne', 9, N'theboy.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'The Da Vinci Code', 35, N'Dan Brown', 10, N'davinci.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'Improbable', 35, N'Adam Fawer', 11, N'imp.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'War and Peace', 28, N'Tolstoy', 12, N'war.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'My Sweat Orange Tree', 17, N'José Mauro De Vasconcelos', 13, N'orangetree.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'The Brief History of Time', 15, N'Stephen Hawking', 14, N'brieftime.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'Incognito', 38, N'David Eagleman', 15, N'incognito.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'The Runaway Species', 24, N'David Eagleman', 16, N'cmind.jpg')
INSERT [dbo].[BooksTable] ([BookName], [BookPrice], [WritersNameSurname], [ID], [BookPhoto]) VALUES (N'The Alchemist', 16, N'Paulo Coelho', 17, N'alchemist.jpg')
SET IDENTITY_INSERT [dbo].[BooksTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (1, N'gizem@hotmail.com', N'1234', N'Gizem')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (7, N'tr@hotmail.com', N'79513', N'gtest')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (8, N'meric@hotmail.com', N'1546', N'Meric')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (9, N'test@hotmail.com', N'9754', N'test')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (10, N'gizemturan16@hotmail.com', N'6479', N'Gizemm')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (11, N'merich@hotmail.com', N'2839', N'meriççççç')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (12, N'will@hotmail.com', N'hannibal<3', N'Will')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (13, N'tugce@hotmail.com', N'tugceee', N'tuğçe')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (14, N'ecemturan@hotmail.com', N'HarryP', N'Ecem')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (16, N'admin', N'admin', N'admin')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (17, N'admin', N'admin', N'admin')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (18, N'admin', N'admin', N'admin')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (19, N'gizemturan16@hotmail.com', N'6479', N'Gizemm')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (20, N'ecemm@hotmail.com', N'4978', N'ecemm')
INSERT [dbo].[UserTable] ([UserID], [UserMail], [UserPassword], [UserNickname]) VALUES (21, N'gizemturan16@hotmail.com', N'6479', N'Gizemm')
SET IDENTITY_INSERT [dbo].[UserTable] OFF
GO
SET IDENTITY_INSERT [dbo].[WritersTable] ON 

INSERT [dbo].[WritersTable] ([WritersNameSurname], [SignatureDate], [Time], [ID], [WritersPhoto]) VALUES (N'M.Kemal Atatürk', CAST(N'1998-08-30' AS Date), CAST(N'12:00:00' AS Time), 1, N'./images/Atatürk.jpg')
INSERT [dbo].[WritersTable] ([WritersNameSurname], [SignatureDate], [Time], [ID], [WritersPhoto]) VALUES (N'Dan Brown', CAST(N'2021-01-24' AS Date), CAST(N'13:00:00' AS Time), 3, N'./images/Danbrown.jpg')
INSERT [dbo].[WritersTable] ([WritersNameSurname], [SignatureDate], [Time], [ID], [WritersPhoto]) VALUES (N'David Eagleman', CAST(N'2021-02-24' AS Date), CAST(N'14:00:00' AS Time), 5, N'./images/d.eagleman.jpg')
SET IDENTITY_INSERT [dbo].[WritersTable] OFF
GO
USE [master]
GO
ALTER DATABASE [CuriosityBookStore] SET  READ_WRITE 
GO
