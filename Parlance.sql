USE [master]
GO
/****** Object:  Database [ParlanceDB]    Script Date: 28.03.2021 18:01:32 ******/
CREATE DATABASE [ParlanceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacebookDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FacebookDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FacebookDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FacebookDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ParlanceDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParlanceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParlanceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParlanceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParlanceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParlanceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParlanceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParlanceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ParlanceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParlanceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParlanceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParlanceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParlanceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParlanceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParlanceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParlanceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParlanceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ParlanceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParlanceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParlanceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParlanceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParlanceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParlanceDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ParlanceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParlanceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ParlanceDB] SET  MULTI_USER 
GO
ALTER DATABASE [ParlanceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParlanceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParlanceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParlanceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ParlanceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ParlanceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ParlanceDB', N'ON'
GO
ALTER DATABASE [ParlanceDB] SET QUERY_STORE = OFF
GO
USE [ParlanceDB]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserOne] [int] NOT NULL,
	[UserTwo] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[Message] [varchar](300) NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[CommenterID] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[ComImgPath] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PostID] ASC,
	[CommenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendship]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendship](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NOT NULL,
	[ReceipentID] [int] NOT NULL,
	[IsFriend] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[EditedOn] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Friendship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[OwnerID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[EditedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nchar](300) NULL,
	[ImgPath] [nchar](256) NULL,
	[SenderID] [int] NULL,
	[ChatID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerID] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[PostImgPath] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[EditedOn] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.03.2021 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[AvatarImgPath] [nvarchar](max) NULL,
	[BgImgPath] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Tel] [nvarchar](max) NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[EditedOn] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_CommenterID]    Script Date: 28.03.2021 18:01:32 ******/
CREATE NONCLUSTERED INDEX [IX_Comment_CommenterID] ON [dbo].[Comment]
(
	[CommenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_PostID]    Script Date: 28.03.2021 18:01:32 ******/
CREATE NONCLUSTERED INDEX [IX_Comment_PostID] ON [dbo].[Comment]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Like_OwnerID]    Script Date: 28.03.2021 18:01:32 ******/
CREATE NONCLUSTERED INDEX [IX_Like_OwnerID] ON [dbo].[Like]
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_OwnerID]    Script Date: 28.03.2021 18:01:32 ******/
CREATE NONCLUSTERED INDEX [IX_Post_OwnerID] ON [dbo].[Post]
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RoleId]  DEFAULT ((1)) FOR [RoleId]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_User] FOREIGN KEY([UserOne])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_User]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_User1] FOREIGN KEY([UserTwo])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_User1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post_PostID] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post_PostID]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User_CommenterID] FOREIGN KEY([CommenterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User_CommenterID]
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD  CONSTRAINT [FK_Friendship_User] FOREIGN KEY([SenderID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Friendship] CHECK CONSTRAINT [FK_Friendship_User]
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD  CONSTRAINT [FK_Friendship_User1] FOREIGN KEY([ReceipentID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Friendship] CHECK CONSTRAINT [FK_Friendship_User1]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Post]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_User_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_User_OwnerID]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Chat] FOREIGN KEY([ChatID])
REFERENCES [dbo].[Chat] ([ID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Chat]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User] FOREIGN KEY([SenderID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User_OwnerID]
GO
USE [master]
GO
ALTER DATABASE [ParlanceDB] SET  READ_WRITE 
GO
