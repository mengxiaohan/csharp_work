USE [AttendanceSystem]
GO
/****** Object:  Table [dbo].[zhigong]    Script Date: 12/27/2016 01:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zhigong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[user_number] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[zhigong] ON
INSERT [dbo].[zhigong] ([id], [user_name], [user_number]) VALUES (1, N'张三', N'001')
INSERT [dbo].[zhigong] ([id], [user_name], [user_number]) VALUES (2, N'李四', N'002')
SET IDENTITY_INSERT [dbo].[zhigong] OFF
/****** Object:  Table [dbo].[kaoqing]    Script Date: 12/27/2016 01:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kaoqing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[begin_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[day] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[kaoqing] ON
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (9, 1, CAST(0x0000A6E8018B751C AS DateTime), NULL, N'2016-12-26')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (10, 1, CAST(0x0000A6E90000A53C AS DateTime), CAST(0x0000A6E90000A794 AS DateTime), N'2016-12-27')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (11, 2, CAST(0x0000A6E90000AD70 AS DateTime), CAST(0x0000A6E90000A9EC AS DateTime), N'2016-12-27')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (13, 2, CAST(0x0000A6E70008A6D8 AS DateTime), CAST(0x0000A6E70008AA5C AS DateTime), N'2016-12-25')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (15, 1, CAST(0x0000A6E60019F35C AS DateTime), CAST(0x0000A6E60019F80C AS DateTime), N'2016-12-24')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (17, 1, CAST(0x0000A6EC00B2F8CC AS DateTime), CAST(0x0000A6EC0136C314 AS DateTime), N'2016-12-30')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (12, 1, CAST(0x0000A6E70007C254 AS DateTime), CAST(0x0000A6E70007C4AC AS DateTime), N'2016-12-25')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (14, 1, CAST(0x0000A6EA0019B2E8 AS DateTime), CAST(0x0000A6EA0019B798 AS DateTime), N'2016-12-28')
INSERT [dbo].[kaoqing] ([id], [user_id], [begin_time], [end_time], [day]) VALUES (16, 1, CAST(0x0000A6EB001E378C AS DateTime), CAST(0x0000A6EB01366A04 AS DateTime), N'2016-12-29')
SET IDENTITY_INSERT [dbo].[kaoqing] OFF
