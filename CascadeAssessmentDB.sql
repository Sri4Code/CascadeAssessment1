USE [master]
GO
/****** Object:  Database [CascadeAssessment]    Script Date: 3/26/23 4:58:34 PM ******/
CREATE DATABASE [CascadeAssessment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CascadeAssessment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CascadeAssessment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CascadeAssessment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CascadeAssessment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CascadeAssessment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CascadeAssessment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CascadeAssessment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CascadeAssessment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CascadeAssessment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CascadeAssessment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CascadeAssessment] SET ARITHABORT OFF 
GO
ALTER DATABASE [CascadeAssessment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CascadeAssessment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CascadeAssessment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CascadeAssessment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CascadeAssessment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CascadeAssessment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CascadeAssessment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CascadeAssessment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CascadeAssessment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CascadeAssessment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CascadeAssessment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CascadeAssessment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CascadeAssessment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CascadeAssessment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CascadeAssessment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CascadeAssessment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CascadeAssessment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CascadeAssessment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CascadeAssessment] SET  MULTI_USER 
GO
ALTER DATABASE [CascadeAssessment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CascadeAssessment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CascadeAssessment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CascadeAssessment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CascadeAssessment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CascadeAssessment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CascadeAssessment] SET QUERY_STORE = ON
GO
ALTER DATABASE [CascadeAssessment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CascadeAssessment]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/26/23 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Publisher] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[AuthorLastName] [varchar](50) NULL,
	[AuthorFirstName] [varchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[TitleContainer] [varchar](50) NULL,
	[PublicationDate] [date] NULL,
	[PageNumberRange] [varchar](50) NULL,
	[Url] [varchar](100) NULL,
	[Volume] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetBooks]    Script Date: 3/26/23 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBooks]
AS
BEGIN
	SELECT  [Id]
      ,[Publisher]
      ,[Title]
      ,[AuthorLastName]
      ,[AuthorFirstName]
      ,[Price]
      ,[TitleContainer]
      ,[PublicationDate]
      ,[PageNumberRange]
      ,[Url]
      ,[Volume]
  FROM [CascadeAssessment].[dbo].[Book] 
  order by 
  [Publisher],
  [AuthorLastName],
  [AuthorFirstName],
  [Title]
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBook]    Script Date: 3/26/23 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertBook]
		   @Publisher varchar(50),
           @Title varchar(50),
           @AuthorLastName varchar(50),
           @AuthorFirstName varchar(50),
           @Price decimal(18,0),
		   @TitleContainer varchar(50),
		   @PublicationDate date,
		   @PageNumberRange varchar(50),
		   @Url varchar(100),
		   @Volume int
		   
AS
BEGIN

INSERT INTO [dbo].[Book]
           ([Publisher]
           ,[Title]
           ,[AuthorLastName]
           ,[AuthorFirstName]
           ,[Price]
		   ,[TitleContainer]
			,[PublicationDate]
			,[PageNumberRange]
			,[Url]
			,[Volume])
     VALUES
           (@Publisher,
		   @Title,
		   @AuthorLastName,
		   @AuthorFirstName,
		   @Price
			,@TitleContainer
			,@PublicationDate
			,@PageNumberRange
			,@Url
			,@Volume
		   )

END
GO
USE [master]
GO
ALTER DATABASE [CascadeAssessment] SET  READ_WRITE 
GO
