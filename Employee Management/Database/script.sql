USE [master]
GO
/****** Object:  Database [TASK1]    Script Date: 01/03/2019 1:36:50 PM ******/
CREATE DATABASE [TASK1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TASK1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TASK1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TASK1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TASK1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TASK1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TASK1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TASK1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TASK1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TASK1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TASK1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TASK1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TASK1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TASK1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TASK1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TASK1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TASK1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TASK1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TASK1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TASK1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TASK1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TASK1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TASK1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TASK1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TASK1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TASK1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TASK1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TASK1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TASK1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TASK1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TASK1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TASK1] SET  MULTI_USER 
GO
ALTER DATABASE [TASK1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TASK1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TASK1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TASK1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TASK1]
GO
/****** Object:  Table [dbo].[city]    Script Date: 01/03/2019 1:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryid] [int] NOT NULL,
	[stateid] [int] NOT NULL,
	[code] [varchar](3) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 01/03/2019 1:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](3) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01/03/2019 1:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[eno] [varchar](5) NOT NULL,
	[ename] [varchar](50) NOT NULL,
	[edept] [varchar](50) NULL,
	[econtact] [varchar](10) NULL,
	[eemail] [varchar](50) NOT NULL,
	[estatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 01/03/2019 1:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[ispermanant] [bit] NOT NULL,
	[addressline1] [varchar](500) NULL,
	[addressline2] [varchar](500) NULL,
	[landmark] [varchar](50) NULL,
	[country] [int] NULL,
	[state] [int] NULL,
	[city] [int] NULL,
	[pin] [varchar](50) NULL,
	[contact] [varchar](15) NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_EmployeeAddress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state]    Script Date: 01/03/2019 1:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryid] [int] NOT NULL,
	[code] [varchar](3) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (1, 1, 1, N'CH', N'Chennai', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (2, 1, 1, N'MA', N'Madurai', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (3, 1, 1, N'TR', N'Trichy', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (4, 1, 1, N'CO', N'Coimbatore', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (5, 1, 2, N'AL', N'Alleppey', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (6, 1, 2, N'KO', N'Kochi', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (7, 1, 2, N'MU', N'Munnar', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (8, 1, 3, N'BA', N'Bangalore', 1)
INSERT [dbo].[city] ([id], [countryid], [stateid], [code], [name], [status]) VALUES (9, 1, 3, N'MY', N'Mysore', 1)
SET IDENTITY_INSERT [dbo].[city] OFF
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [code], [name], [status]) VALUES (1, N'IND', N'India', 1)
INSERT [dbo].[country] ([id], [code], [name], [status]) VALUES (2, N'PAK', N'Pakistan', 1)
INSERT [dbo].[country] ([id], [code], [name], [status]) VALUES (3, N'USA', N'United States of America', 1)
INSERT [dbo].[country] ([id], [code], [name], [status]) VALUES (4, N'AUS', N'Australia', 1)
SET IDENTITY_INSERT [dbo].[country] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([eid], [eno], [ename], [edept], [econtact], [eemail], [estatus]) VALUES (1, N'E0001', N'Prakash Kumar', N'Developement', N'9940793046', N'prakashapr27@yahoo.in', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeAddress] ON 

INSERT [dbo].[EmployeeAddress] ([id], [eid], [ispermanant], [addressline1], [addressline2], [landmark], [country], [state], [city], [pin], [contact], [status]) VALUES (1, 1, 1, N'126,Kattabomman Street', N'Ettivadi', N'Next Pillayar Kovil ', 1, 1, 1, N'606907', N'9940793046', 1)
SET IDENTITY_INSERT [dbo].[EmployeeAddress] OFF
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (1, 1, N'TN', N'Tamil Nadu', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (2, 1, N'KL', N'Kerala', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (3, 1, N'KA', N'Karnataka', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (4, 2, N'PU', N'Punjab', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (5, 2, N'KP', N'Khyber-Pakhtunkhwa', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (6, 2, N'SI', N'Sindh', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (7, 4, N'SY', N'Sydney', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (8, 4, N'VI', N'Victoria', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (9, 3, N'CA', N'California', 1)
INSERT [dbo].[state] ([id], [countryid], [code], [name], [status]) VALUES (10, 3, N'AT', N'Atlanta', 1)
SET IDENTITY_INSERT [dbo].[state] OFF
ALTER TABLE [dbo].[city] ADD  CONSTRAINT [DF_city_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [DF_country_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_estatus]  DEFAULT ((1)) FOR [estatus]
GO
ALTER TABLE [dbo].[EmployeeAddress] ADD  CONSTRAINT [DF_EmployeeAddress_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[state] ADD  CONSTRAINT [DF_state_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_city_country] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_country]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_city_state] FOREIGN KEY([stateid])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_state]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_city] FOREIGN KEY([city])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_city]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_country] FOREIGN KEY([country])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_country]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_Employee]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_state] FOREIGN KEY([state])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_state]
GO
ALTER TABLE [dbo].[state]  WITH CHECK ADD  CONSTRAINT [FK_state_country] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[state] CHECK CONSTRAINT [FK_state_country]
GO
USE [master]
GO
ALTER DATABASE [TASK1] SET  READ_WRITE 
GO
