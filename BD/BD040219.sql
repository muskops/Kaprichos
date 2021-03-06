USE [master]
GO
/****** Object:  Database [Kaprichos]    Script Date: 02/04/2019 23:23:22 ******/
CREATE DATABASE [Kaprichos] ON  PRIMARY 
( NAME = N'Kaprichos', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Kaprichos.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kaprichos_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Kaprichos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Kaprichos] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kaprichos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kaprichos] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Kaprichos] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Kaprichos] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Kaprichos] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Kaprichos] SET ARITHABORT OFF
GO
ALTER DATABASE [Kaprichos] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Kaprichos] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Kaprichos] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Kaprichos] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Kaprichos] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Kaprichos] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Kaprichos] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Kaprichos] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Kaprichos] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Kaprichos] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Kaprichos] SET  DISABLE_BROKER
GO
ALTER DATABASE [Kaprichos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Kaprichos] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Kaprichos] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Kaprichos] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Kaprichos] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Kaprichos] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Kaprichos] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Kaprichos] SET  READ_WRITE
GO
ALTER DATABASE [Kaprichos] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Kaprichos] SET  MULTI_USER
GO
ALTER DATABASE [Kaprichos] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Kaprichos] SET DB_CHAINING OFF
GO
USE [Kaprichos]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 02/04/2019 23:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuario] [varchar](20) NOT NULL,
	[cargo] [varchar](20) NULL,
	[contraseña] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[usuarios] ([usuario], [cargo], [contraseña]) VALUES (N'Admin', N'Administrador', N'muski')
INSERT [dbo].[usuarios] ([usuario], [cargo], [contraseña]) VALUES (N'Andre', N'Cajero', N'muski')
INSERT [dbo].[usuarios] ([usuario], [cargo], [contraseña]) VALUES (N'Rubi', N'Jefe', N'muski')
/****** Object:  StoredProcedure [dbo].[MostrarUsuarios]    Script Date: 02/04/2019 23:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MostrarUsuarios] 
as
select usuario from usuarios
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 02/04/2019 23:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IniciarSesion]
@Usuario varchar(20),
@Contraseña varchar(20)
as
select * from usuarios where usuario=@Usuario and contraseña=@Contraseña
GO
