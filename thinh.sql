USE [vanphongnew0110]
GO
/****** Object:  User [tungnt]    Script Date: 10/14/2019 15:05:06 ******/
CREATE USER [tungnt] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[PostByNews]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostByNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NULL,
	[PostContent] [nvarchar](max) NULL,
	[PostBy] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsLock] [int] NULL,
 CONSTRAINT [PK_PostByNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[OrderNo] [char](10) NOT NULL,
	[ProductID] [int] NULL,
	[Price] [money] NULL,
	[Quanity] [int] NULL,
	[CreateBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [int] NULL,
	[ApproveBy] [nvarchar](50) NULL,
	[ApproveDate] [datetime] NULL,
	[DeliverytDate] [datetime] NULL,
	[DeliveryOk] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(39 AS Numeric(18, 0)), N'191002001 ', 133, 5800.0000, 1, N'guest', CAST(0x0000AADA000BA5DE AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(40 AS Numeric(18, 0)), N'191002002 ', 132, 1320.0000, 1, N'guest', CAST(0x0000AADA00112278 AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(41 AS Numeric(18, 0)), N'191002002 ', 130, 120000.0000, 1, N'guest', CAST(0x0000AADA00112279 AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(42 AS Numeric(18, 0)), N'191002003 ', 134, 1000.0000, 1, N'guest', CAST(0x0000AADA00117192 AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(43 AS Numeric(18, 0)), N'191002004 ', 133, 5800.0000, 1, N'guest', CAST(0x0000AADA0014132D AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(44 AS Numeric(18, 0)), N'191002004 ', 132, 1320.0000, 1, N'guest', CAST(0x0000AADA00141332 AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(45 AS Numeric(18, 0)), N'191002005 ', 133, 5800.0000, 1, N'guest', CAST(0x0000AADA00150E54 AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(46 AS Numeric(18, 0)), N'191002006 ', 133, 5800.0000, 1, N'guest', CAST(0x0000AADA00883F88 AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(47 AS Numeric(18, 0)), N'191002006 ', 79, 1000.0000, 1, N'guest', CAST(0x0000AADA00883F8E AS DateTime), 0, NULL, NULL, NULL, 0)
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderNo], [ProductID], [Price], [Quanity], [CreateBy], [CreateDate], [Status], [ApproveBy], [ApproveDate], [DeliverytDate], [DeliveryOk]) VALUES (CAST(48 AS Numeric(18, 0)), N'191002006 ', 130, 120000.0000, 1, N'guest', CAST(0x0000AADA00883F94 AS DateTime), 0, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNo] [char](10) NOT NULL,
	[Name] [nvarchar](350) NULL,
	[Address] [nvarchar](350) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiscountAmount] [money] NULL,
	[DiscountReason] [nvarchar](250) NULL,
	[AddedAmount] [money] NULL,
	[AddedReason] [nvarchar](250) NULL,
	[OrderDate] [smalldatetime] NULL,
	[Notes] [ntext] NULL,
	[Total] [money] NULL,
	[ModifiedDate] [datetime] NULL,
	[FinishedDate] [datetime] NULL,
	[TransactionCosts] [money] NULL,
	[BankID] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[CouponText] [nvarchar](250) NULL,
	[CouponValue] [decimal](18, 2) NULL,
	[IDcustom] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Order] ([OrderNo], [Name], [Address], [Sdt], [Email], [DiscountAmount], [DiscountReason], [AddedAmount], [AddedReason], [OrderDate], [Notes], [Total], [ModifiedDate], [FinishedDate], [TransactionCosts], [BankID], [Status], [CouponText], [CouponValue], [IDcustom]) VALUES (N'191002001 ', N'dao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAADA002A AS SmallDateTime), N'sdsdasd', 5800.0000, NULL, NULL, NULL, N'abc', 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderNo], [Name], [Address], [Sdt], [Email], [DiscountAmount], [DiscountReason], [AddedAmount], [AddedReason], [OrderDate], [Notes], [Total], [ModifiedDate], [FinishedDate], [TransactionCosts], [BankID], [Status], [CouponText], [CouponValue], [IDcustom]) VALUES (N'191002002 ', N'oke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAADA003E AS SmallDateTime), N'sdsads', 121320.0000, NULL, NULL, NULL, N'abc', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderNo], [Name], [Address], [Sdt], [Email], [DiscountAmount], [DiscountReason], [AddedAmount], [AddedReason], [OrderDate], [Notes], [Total], [ModifiedDate], [FinishedDate], [TransactionCosts], [BankID], [Status], [CouponText], [CouponValue], [IDcustom]) VALUES (N'191002003 ', N'oke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAADA0040 AS SmallDateTime), NULL, 1000.0000, NULL, NULL, NULL, N'abc', 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderNo], [Name], [Address], [Sdt], [Email], [DiscountAmount], [DiscountReason], [AddedAmount], [AddedReason], [OrderDate], [Notes], [Total], [ModifiedDate], [FinishedDate], [TransactionCosts], [BankID], [Status], [CouponText], [CouponValue], [IDcustom]) VALUES (N'191002004 ', N'thinh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAADA0049 AS SmallDateTime), N'123', 7120.0000, NULL, NULL, NULL, N'abc', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderNo], [Name], [Address], [Sdt], [Email], [DiscountAmount], [DiscountReason], [AddedAmount], [AddedReason], [OrderDate], [Notes], [Total], [ModifiedDate], [FinishedDate], [TransactionCosts], [BankID], [Status], [CouponText], [CouponValue], [IDcustom]) VALUES (N'191002005 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAADA004D AS SmallDateTime), NULL, 5800.0000, NULL, NULL, NULL, N'abc', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderNo], [Name], [Address], [Sdt], [Email], [DiscountAmount], [DiscountReason], [AddedAmount], [AddedReason], [OrderDate], [Notes], [Total], [ModifiedDate], [FinishedDate], [TransactionCosts], [BankID], [Status], [CouponText], [CouponValue], [IDcustom]) VALUES (N'191002006 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xAADA01F0 AS SmallDateTime), NULL, 126800.0000, NULL, NULL, NULL, N'abc', 0, NULL, NULL, NULL)
/****** Object:  Table [dbo].[News]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[SubTitle] [nvarchar](500) NULL,
	[ShowSubTitle] [bit] NOT NULL,
	[Summary] [nvarchar](1000) NULL,
	[Detail] [ntext] NULL,
	[Author] [nvarchar](50) NULL,
	[Source] [nvarchar](100) NULL,
	[IconPath] [nvarchar](500) NULL,
	[ImagePath] [nvarchar](500) NULL,
	[Hit] [int] NOT NULL,
	[ExpireDate] [datetime] NULL,
	[Approved] [tinyint] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [tinyint] NOT NULL,
	[DisplayAt] [varchar](50) NULL,
 CONSTRAINT [PK_eShopContent] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (100, 162, N'Liên Hệ', N'Liên Hệ', 0, N'Liên Hệ', N'<div class="article-content">
<p class="com-map" style="margin: 15px auto; text-align: left; color: rgb(51, 51, 51); font-family: Tahoma, Arial, sans-serif; background-color: rgb(245, 245, 245);"><span style="font-size: large;"><strong>C&ocirc;ng Ty TNHH thương mại xxxxxxx<br />
</strong></span></p>
<p class="com-map" style="margin: 15px auto; text-align: left; color: rgb(51, 51, 51); font-family: Tahoma, Arial, sans-serif; background-color: rgb(245, 245, 245);"><strong>Đ/c</strong>: xxxxxxxx, Thanh Xu&acirc;n ,H&agrave; Nội&nbsp;</p>
<p class="com-map" style="margin: 15px auto; text-align: left; color: rgb(51, 51, 51); font-family: Tahoma, Arial, sans-serif; background-color: rgb(245, 245, 245);">(04) 6681 7583&nbsp;</p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;"><span style="color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; line-height: 17.5636348724365px; text-align: justify;">Lịch l&agrave;m việc như sau:&nbsp;</span></p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;"><br style="color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; line-height: 17.5636348724365px; text-align: justify;" />
<strong style="color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; line-height: 17.5636348724365px; text-align: justify;"><span style="font-size: 18px;"><span class="text_exposed_show" style="display: inline;">- Ng&agrave;y : Thứ 2 - thứ 7&nbsp;</span></span></strong></p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;"><strong style="color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; line-height: 17.5636348724365px; text-align: justify;"><span style="font-size: 18px;"><span class="text_exposed_show" style="display: inline;"><span>&nbsp;</span><br />
- Giờ : 8h - 12h / 13h15 - 17h15</span></span></strong></p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;">&nbsp;</p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;">&nbsp;</p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;">&nbsp;</p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;">&nbsp;</p>
<p style="margin: 3px 0px; font-size: 11px; color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif;">&nbsp;</p>
<iframe width="600" height="450" frameborder="0" allowfullscreen="" style="border:0" src="https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d1809.4672907503739!2d105.82482064918895!3d20.99354066306004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e6!4m0!4m3!3m2!1d20.992946699999997!2d105.82602639999999!5e0!3m2!1svi!2s!4v1444383441452"></iframe></div>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A51801244D59 AS DateTime), N'admin', CAST(0x0000AABA01729E36 AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (101, 162, N'Chính sách đại lý', N'Chính sách đại lý', 0, N'Chính sách đại lý', N'<p>&nbsp;</p>
<p>load....</p>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A51801248AF3 AS DateTime), N'admin', CAST(0x0000AABA01737B01 AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (102, 162, N'Hợp tác Kinh Doanh', N'Hợp tác Kinh Doanh', 0, N'Hợp tác Kinh Doanh', N'<p>&nbsp;</p>
<p>load...</p>', N'admin', N'admin', NULL, N'20150919/panel_small2.jpg', -2147483648, NULL, 1, NULL, NULL, CAST(0x0000A518012500A5 AS DateTime), N'admin', CAST(0x0000AABA0173673B AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (103, 162, N'Quy Định Bảo Hành', N'Quy Định Bảo Hành', 0, N'Quy Định Bảo Hành', N'<p>&nbsp;</p>
<p>load...</p>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A51801252B5C AS DateTime), N'admin', CAST(0x0000AABA01735268 AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (104, 162, N'Dịch Vụ', N'Dịch Vụ', 0, N'Dịch Vụ', N'<div class="article-content">
<p><span style="font-size:24px;"><strong>C&aacute;c dịch vụ c&ocirc;ng ty vvvv:</strong></span></p>
<p>&nbsp;</p>
</div>
<p>&nbsp;</p>', N'admin', N'admin', NULL, N'20190901/banner-tren-2-chiet-khau-570x202.jpg', -2147483648, NULL, 1, NULL, NULL, CAST(0x0000A518012567A4 AS DateTime), N'admin', CAST(0x0000AABB00933190 AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (105, 162, N'Giới thiệu', N'Giới thiệu', 0, N'Giới thiệu', N'<p>load.....</p>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A5180125B25E AS DateTime), N'admin', CAST(0x0000AABA017304B7 AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (106, 162, N'Tuyển Dụng', N'Tuyển Dụng', 0, N'Tuyển Dụng', N'<p>&nbsp;</p>
<p>load</p>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A5180125ED24 AS DateTime), N'admin', CAST(0x0000AABA0172E7A7 AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (107, 162, N'Quy Trình', N'Quy Trình', 0, N'Quy Trình', N'<p>&nbsp;</p>
<p>load</p>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A5180126212F AS DateTime), N'admin', CAST(0x0000AABA0172C72A AS DateTime), N'admin', 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (108, 162, N'Tải bảng giá', N'Tải bảng giá', 0, N'Tải bảng giá', N'<p>Nội dung đang được cập nhật. Vui l&ograve;ng quay lại sau.</p>', N'admin', N'admin', NULL, NULL, -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A51801264729 AS DateTime), N'admin', NULL, NULL, 2, NULL)
INSERT [dbo].[News] ([NewsID], [CategoryID], [Title], [SubTitle], [ShowSubTitle], [Summary], [Detail], [Author], [Source], [IconPath], [ImagePath], [Hit], [ExpireDate], [Approved], [ApprovedOn], [ApprovedBy], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [DisplayAt]) VALUES (113, 166, N'Ngày hội giảm giá', N'Ngày hội giảm giá', 0, N'Ngày hội giảm giá', N'<p>&nbsp;</p>
<p>Ng&agrave;y hội giảm gi&aacute;</p>', N'suu tam', N'suu tam', NULL, N'20190831/12qas.jpg', -2147483648, NULL, 0, NULL, NULL, CAST(0x0000A52B0175FEED AS DateTime), N'admin', CAST(0x0000AABA01723E28 AS DateTime), N'admin', 0, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[Nationals]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationals](
	[NationalID] [int] IDENTITY(1,1) NOT NULL,
	[NationalName] [nvarchar](150) NULL,
	[NationalAdd] [nvarchar](500) NULL,
	[NationalPhone] [nvarchar](250) NULL,
	[NationalLogo] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__National__FD0A6FA31E6F845E] PRIMARY KEY CLUSTERED 
(
	[NationalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Nationals] ON
INSERT [dbo].[Nationals] ([NationalID], [NationalName], [NationalAdd], [NationalPhone], [NationalLogo], [Status]) VALUES (1, N'LG', N'123/345 gdt ha noi', N'0987654321', NULL, 0)
INSERT [dbo].[Nationals] ([NationalID], [NationalName], [NationalAdd], [NationalPhone], [NationalLogo], [Status]) VALUES (3, N'Pana', N'123/345 gdt ha noi', N'0987654321', N'20150830/SAM_0468.JPG', 6)
INSERT [dbo].[Nationals] ([NationalID], [NationalName], [NationalAdd], [NationalPhone], [NationalLogo], [Status]) VALUES (4, N'Samsung', N'123/345 gdt ha noi', N'0987654321', NULL, 0)
SET IDENTITY_INSERT [dbo].[Nationals] OFF
/****** Object:  Table [dbo].[Module]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [int] NULL,
	[NameModule] [nvarchar](250) NULL,
	[Type] [int] NULL,
	[Target] [int] NULL,
	[Url] [varchar](250) NULL,
	[DateStart] [datetime] NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Made]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Made](
	[MadeID] [int] IDENTITY(1,1) NOT NULL,
	[MadeName] [nvarchar](50) NULL,
	[MadeCode] [varchar](10) NULL,
	[MadeLogo] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Province__FD0A6FA31E6F845E] PRIMARY KEY CLUSTERED 
(
	[MadeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Made] ON
INSERT [dbo].[Made] ([MadeID], [MadeName], [MadeCode], [MadeLogo], [Status]) VALUES (1, N'Viet nam', NULL, NULL, 0)
INSERT [dbo].[Made] ([MadeID], [MadeName], [MadeCode], [MadeLogo], [Status]) VALUES (2, N'thai lan', NULL, NULL, 1)
INSERT [dbo].[Made] ([MadeID], [MadeName], [MadeCode], [MadeLogo], [Status]) VALUES (4, N'sigapore', NULL, NULL, 3)
INSERT [dbo].[Made] ([MadeID], [MadeName], [MadeCode], [MadeLogo], [Status]) VALUES (5, N'Trung quốc', NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[Made] OFF
/****** Object:  Table [dbo].[LastKey]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LastKey](
	[TABLENAME] [char](8) NULL,
	[KEYSTRING] [varchar](20) NULL,
	[LASTKEY] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'130314', 5)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'130316', 2)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'130522', 1)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'130523', 5)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'130617', 1)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'140711', 1)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'140811', 7)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'150911', 4)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'190923', 3)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'191001', 4)
INSERT [dbo].[LastKey] ([TABLENAME], [KEYSTRING], [LASTKEY]) VALUES (N'Order   ', N'191002', 6)
/****** Object:  Table [dbo].[HtmlBox]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HtmlBox](
	[HtmlBoxID] [int] IDENTITY(1,1) NOT NULL,
	[HtmlBoxName] [nvarchar](50) NULL,
	[HtmlBoxContent] [ntext] NOT NULL,
	[LinkImage] [nvarchar](150) NULL,
	[Link] [nvarchar](250) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HtmlBox] ON
INSERT [dbo].[HtmlBox] ([HtmlBoxID], [HtmlBoxName], [HtmlBoxContent], [LinkImage], [Link]) VALUES (16, N'sảm phẩm top 1', N'<p>sảm phẩm top 1</p>', N'20190831/đâsd.jpg', N'#')
INSERT [dbo].[HtmlBox] ([HtmlBoxID], [HtmlBoxName], [HtmlBoxContent], [LinkImage], [Link]) VALUES (18, N'sảm phẩm top 2', N'<p>sảm phẩm top 1</p>', N'20190831/fdsfsdfs.jpg', N'#')
INSERT [dbo].[HtmlBox] ([HtmlBoxID], [HtmlBoxName], [HtmlBoxContent], [LinkImage], [Link]) VALUES (19, N'sảm phẩm top 3', N'<p>&nbsp;sảm phẩm top 3</p>', N'20190831/cd6a3888-tu-vung-tieng-anh-van-phong-pham-thong-dung.jpg', N'#')
SET IDENTITY_INSERT [dbo].[HtmlBox] OFF
/****** Object:  Table [dbo].[HeadFooter]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadFooter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Contents] [ntext] NULL,
 CONSTRAINT [PK_HeadFooter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HeadFooter] ON
INSERT [dbo].[HeadFooter] ([ID], [Type], [Contents]) VALUES (1, 2, N'<div class="comIntro">
<p class="comName">C&ocirc;ng ty TNHH văn ph&ograve;ng phẩm</p>
<p>Địa chỉ:&nbsp; &nbsp;Ho&agrave;ng Quốc Việt , H&agrave; Nội</p>
<p><strong>Hotline: 0987654321<br />
</strong></p>
<p>Điện thoại: (024) 0987654321</p>
</div>
<p>&nbsp;</p>')
INSERT [dbo].[HeadFooter] ([ID], [Type], [Contents]) VALUES (2, 1, N'20190831/logo.png')
SET IDENTITY_INSERT [dbo].[HeadFooter] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[IDcustom] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[Users] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[gender] [int] NULL,
	[Address] [ntext] NULL,
	[phonenumber] [nvarchar](50) NULL,
	[comment] [ntext] NULL,
	[createdate] [datetime] NULL,
	[lastlog] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[IDcustom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Colorname] [nvarchar](250) NULL,
	[IconPath] [varchar](500) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[LongDescription] [ntext] NULL,
	[CreateOn] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON
INSERT [dbo].[Color] ([ColorID], [Colorname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (1, N'đỏ ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Color] ([ColorID], [Colorname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (2, N'xanh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Color] ([ColorID], [Colorname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (4, N'Vang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL)
SET IDENTITY_INSERT [dbo].[Color] OFF
/****** Object:  Table [dbo].[Slider]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[SliderID] [int] IDENTITY(1,1) NOT NULL,
	[SliderName] [nvarchar](150) NULL,
	[SliderContent] [ntext] NOT NULL,
	[SliderImage] [nvarchar](250) NULL,
	[SliderLink] [nvarchar](250) NULL,
	[SliderClass] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Slider] ON
INSERT [dbo].[Slider] ([SliderID], [SliderName], [SliderContent], [SliderImage], [SliderLink], [SliderClass]) VALUES (9, N'anh dai dien 1', N'<p>anh dai dien 1</p>', N'20190831/Banner-daily-1-07_-855x382.jpg', N'#', N'cubeSize')
INSERT [dbo].[Slider] ([SliderID], [SliderName], [SliderContent], [SliderImage], [SliderLink], [SliderClass]) VALUES (10, N'anh dai dien 2', N'<p>anh dai dien 2</p>', N'20190831/banner-giao-hang-855x382.jpg', N'#', N'cube')
INSERT [dbo].[Slider] ([SliderID], [SliderName], [SliderContent], [SliderImage], [SliderLink], [SliderClass]) VALUES (11, N'anh dai dien 3', N'<p>anh dai dien 3</p>', N'20190831/123.jpg', N'#', N'cubeRandom')
INSERT [dbo].[Slider] ([SliderID], [SliderName], [SliderContent], [SliderImage], [SliderLink], [SliderClass]) VALUES (14, N'anh dai dien 4', N'<p>anh dai dien 4</p>', N'20190831/index.jpg', N'#', N'cube')
INSERT [dbo].[Slider] ([SliderID], [SliderName], [SliderContent], [SliderImage], [SliderLink], [SliderClass]) VALUES (15, N'anh dai dien 5', N'<p>anh dai dien 5</p>', N'20190831/dsadasd.jpg', N'#', N'cube')
SET IDENTITY_INSERT [dbo].[Slider] OFF
/****** Object:  Table [dbo].[Size]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[Sizename] [nvarchar](250) NULL,
	[IconPath] [varchar](500) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[LongDescription] [ntext] NULL,
	[CreateOn] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON
INSERT [dbo].[Size] ([SizeID], [Sizename], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (1, N'sieu lon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Size] ([SizeID], [Sizename], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (2, N'Nhỏ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Size] OFF
/****** Object:  Table [dbo].[Setting]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeSetting] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[ValueSetting] [nvarchar](150) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Setting] ON
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (1, N'EMO', N'Cài đặt email nhận đơn hàng', N'abc@gmail.com', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (2, N'EMC', N'Cài đặt email nhận liên hệ ', N'abc@gmail.com', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (3, N'HOTLINE', N'Hotline', N'0987654321', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (4, N'KEYWORDS', N'the seo cua web site tam 160-200 ký tự', N'văn phòng phẩm cao cáp giá rẻ', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (5, N'DESCRIPTON', N'Mô tả những nội dung chính của website(160-170 ký  tự)', N'văn phòng phẩm cao cáp giá rẻ', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (6, N'TITLE', N'Tiêu đề chính của website (15-20 ký tự kể cả dấu cách)', N'văn phòng phẩm cao cáp giá rẻ', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (7, N'URL', N'url', N'#', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (8, N'FACEBOOK', N'facebook', N'ThinhTuanNguyen', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (9, N'GOOGLEPLUS', N'googleplus', N'dasda', 1)
INSERT [dbo].[Setting] ([ID], [CodeSetting], [Description], [ValueSetting], [Status]) VALUES (10, N'TIWTTER', N'tiwtter', N'casdasd', 1)
SET IDENTITY_INSERT [dbo].[Setting] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[Module] [nvarchar](100) NOT NULL,
	[RoleName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_eShopRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (1, N'User', N'User_View', N'Xem thông tin tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (2, N'User', N'User_Create', N'Tạo tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (3, N'User', N'User_Modify', N'Sửa tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (4, N'User', N'User_Delete', N'Xóa tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (5, N'User', N'User_ResetPass', N'Reset tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (6, N'User', N'User_List', N'Xem toàn bộ tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (7, N'User', N'User_AsignRole', N'Phân quyền cho tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (8, N'News', N'News_View', N'Xem tin tức')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (9, N'News', N'News_Create', N'Thêm mới tin tức')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (10, N'News', N'News_Modify', N'Sửa tin ')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (11, N'News', N'News_Delete', N'Xóa tin')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (13, N'News', N'News_List', N'Xem toàn bộ tin')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (14, N'System', N'News_Delete', N'Xoa tin tuc')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (15, N'Credit', N'Credit', N'Xem sửa nạp tiền')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (16, N'Debit', N'Debit', N'Xem sửa rút tiền')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (17, N'Order', N'Order_View', N'Xem thông tin đơn đơn hàng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (18, N'Order', N'Order_Edit', N'Sửa trạng thái đơn hàng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (19, N'Adward', N'Adward_Ok', N'Duyệt danh sách trúng thưởng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (20, N'Adward', N'Adward_View', N'Xem danh sách trúng thưởng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (21, N'Account', N'Account_List', N'Xem danh sách tài khoản')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (22, N'Order', N'Order_List', N'Xem danh sách đơn hàng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (23, N'Account', N'Account_View', N'Xem tài khoản khách hàng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (24, N'Account', N'Account_Edit', N'Sửa tài khoản khách hàng')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (25, N'Log', N'Log_View', N'Xem lịch sử log')
INSERT [dbo].[Role] ([RoleID], [Module], [RoleName], [Description]) VALUES (52, N'News', N'News_Approve', N'Đặt trang thái cho tin')
/****** Object:  Table [dbo].[registry]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registry](
	[RegistryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_Registry] PRIMARY KEY CLUSTERED 
(
	[RegistryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[DisplayType] [tinyint] NULL,
	[IconPath] [varchar](500) NULL,
	[ParentID] [int] NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[LongDescription] [ntext] NULL,
	[CreateOn] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[TreeDetech] [varchar](100) NULL,
	[OrderNo] [tinyint] NOT NULL,
 CONSTRAINT [PK_eShopCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (1, N'Tin Tức', 0, NULL, 0, N'Tin Tức', NULL, CAST(0x0000A1B800E351CD AS DateTime), NULL, CAST(0x0000A1B800E351CD AS DateTime), NULL, 0, NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (70, N'Giấy in', 0, NULL, 0, N'Giấy in', N'20190831/cd6a3888-tu-vung-tieng-anh-van-phong-pham-thong-dung.jpg', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (71, N'File hồ sơ', 0, NULL, 0, N'File hồ sơ', N'20190831/xxx.jpg', NULL, NULL, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (79, N'Bút - mực', 0, NULL, 0, N'Gạt lớn(nhỏ)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (81, N'Băng keo - Giao kéo', 0, NULL, 0, N'Cắt băng keo cầm tay 5P nhựa', N'20190831/cat-keo-cam-tay-6p.jpg', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (124, N'Dụng cụ học sinh', 0, NULL, 0, N'Dụng cụ học sinh', N'20151008/cate_promote (1).jpg', NULL, NULL, NULL, NULL, 1, NULL, 4)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (162, N'Dịch vụ khác', 0, NULL, 0, N'Dịch vụ khác', NULL, NULL, NULL, NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (163, N'Tin Công Nghệ', 0, NULL, 1, N'TIn Cập nhật moi nhat ve cong nghe', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (164, N'Giao Nhan Hang', 0, NULL, 0, N'Giao Hàng Free Trong Bán Kính 10 Km', NULL, NULL, NULL, NULL, NULL, 2, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (166, N'May in', 0, NULL, 1, N'tin ve san pham may in', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (171, N'Giấy Note', 0, NULL, 70, N'Giấy Note', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (172, N'Giấy Note', 0, NULL, 0, N'Giấy Note', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (174, N'Băng keo - Giao kéo', 0, NULL, 0, N'Cắt băng keo cầm tay 5P nhựa', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (175, N'Cắt băng keo cầm tay 5P nhựa', 0, NULL, 0, N'Cắt băng keo cầm tay 5P nhựa', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (176, N'dụng cụ học tập', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 6)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (177, N'dụng cụ học tập', 0, NULL, 0, N'dụng cụ học tập', NULL, NULL, NULL, NULL, NULL, 0, NULL, 6)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (178, N'dụng cụ học tập', 0, NULL, 0, N'Cắt băng keo cầm tay 5P nhựa', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (179, N'dụng cụ học tập', 0, NULL, 0, N'dụng cụ học tập', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (180, N'dụng cụ học tập', 0, NULL, 0, N'Giấy in', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (181, N'dụng cụ học tập', 0, NULL, 0, N'dụng cụ học tập', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DisplayType], [IconPath], [ParentID], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [TreeDetech], [OrderNo]) VALUES (182, N'dụng cụ học tập', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 6)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[BankList]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankList](
	[BankID] [int] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](5) NOT NULL,
	[BankName] [nvarchar](250) NOT NULL,
	[TransValue] [decimal](18, 4) NOT NULL,
	[TransRate] [decimal](18, 4) NOT NULL,
	[Currency] [varchar](5) NULL,
	[CouponValue] [decimal](18, 4) NULL,
	[CouponRate] [decimal](18, 4) NULL,
	[CouponText] [nvarchar](250) NULL,
	[Logo] [varchar](50) NULL,
	[OrderNo] [int] NOT NULL,
	[Status] [tinyint] NULL,
	[Provider] [nvarchar](50) NULL,
 CONSTRAINT [PK_BankList] PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BankList] ON
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (1, N'VCB', N'VietcomBank', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/vcb.gif', 1, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (2, N'NL', N'Ngân lượng', CAST(1000.0000 AS Decimal(18, 4)), CAST(0.0110 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/nganluong.png', 8, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (3, N'VTB', N'VietinBank', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/vtb.gif', 3, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (4, N'OPI', N'VISA/MasterCard', CAST(6600.0000 AS Decimal(18, 4)), CAST(0.0385 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'', N'msdropdown/banks/visa_master.gif', 10, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (5, N'BIDV', N'BIDV', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/bidv.gif', 2, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (6, N'HDB', N'HDBank', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/hdb.gif', 5, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (7, N'VIB', N'VIBank', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/vib.gif', 4, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (8, N'BK', N'Bảo Kim', CAST(1000.0000 AS Decimal(18, 4)), CAST(0.0110 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/bk.gif', 9, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (9, N'AGB', N'AgiBank', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/agribank.jpg', 6, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (10, N'TCB', N'TechComBank', CAST(1600.0000 AS Decimal(18, 4)), CAST(0.0220 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'KM phi giao dich', N'msdropdown/banks/techcombank.gif', 7, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (11, N'ABB', N'AnBinhBank', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), NULL, N'msdropdown/banks/abbank.jpg', 11, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (12, N'NAB', N'NamABank', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), NULL, N'msdropdown/banks/seabank.gif', 12, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (13, N'SGB', N'SaigonBank', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), NULL, N'msdropdown/banks/saigonbank.gif', 13, 1, N'onepay')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (14, N'NAB', N'NamABank', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'VND', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), NULL, N'msdropdown/banks/seabank.gif', 14, 1, N'banknet')
INSERT [dbo].[BankList] ([BankID], [BankCode], [BankName], [TransValue], [TransRate], [Currency], [CouponValue], [CouponRate], [CouponText], [Logo], [OrderNo], [Status], [Provider]) VALUES (15, N'PP', N'PayPal', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0400 AS Decimal(18, 4)), N'USD', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'Thanh toan qua paypal', N'msdropdown/banks/paypal.gif', 15, 1, N'onepay')
SET IDENTITY_INSERT [dbo].[BankList] OFF
/****** Object:  Table [dbo].[Abount]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abount](
	[AbountID] [int] IDENTITY(1,1) NOT NULL,
	[AbountContent] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Abount] ON
INSERT [dbo].[Abount] ([AbountID], [AbountContent]) VALUES (3, NULL)
SET IDENTITY_INSERT [dbo].[Abount] OFF
/****** Object:  StoredProcedure [dbo].[SP_Delete_Product]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Product]
(
	@ProductId INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Product WHERE ProductId = @ProductId

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Provider]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Provider]
(
	@ID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Provider WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Provider]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Provider]
(
	@ProviderName NVARCHAR(250) /*Must check to convert type*/,
	@Logo NVARCHAR(150),
	@Status INT,
	@OrderNo INT
)AS
BEGIN
	INSERT INTO Provider(ProviderName,Logo, Status, OrderNo) VALUES (@ProviderName,@Logo, @Status, @OrderNo)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Product]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Product]
(
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeBy NVARCHAR(250) /*Must check to convert type*/,
	@NationalBy NVARCHAR(250) /*Must check to convert type*/,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus NVARCHAR(250),
	@Description NTEXT /*Must check to convert type*/,
	@ProductType INT,
	@ShowOk INT,
	@TopOk INT,
	@ProductOther NVARCHAR(500)
	)AS
BEGIN
	INSERT INTO Product(ProductName, ProductImage, ProductCode, ProductMaterial, MadeBy, NationalBy, ProductPrice, Warranty, ProductStatus, [Description], ProductType,ShowOk,
	            TopOk,ProductOther) VALUES (@ProductName, @ProductImage, @ProductCode, @ProductMaterial, @MadeBy, @NationalBy, @ProductPrice, @Warranty, @ProductStatus, @Description, @ProductType,@ShowOk,@TopOk,@ProductOther)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_User]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_User]
(
	@Password NVARCHAR(250) /*Must check to convert type*/,
	@FullName NVARCHAR(250) /*Must check to convert type*/,
	@Email NVARCHAR(250) /*Must check to convert type*/,
	@Mobile NVARCHAR(250) /*Must check to convert type*/,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@LastLogin DATETIME /*Must check to convert type*/,
	@CreatedDate DATETIME /*Must check to convert type*/,
	@CreatedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Adresss NVARCHAR(250) /*Must check to convert type*/,
	@Others NVARCHAR(250) /*Must check to convert type*/
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@Password IS NOT NULL)
		SET @Command = @Command + 'Password = ''' + @Password + ''' AND '

	IF (@FullName IS NOT NULL)
		SET @Command = @Command + 'FullName = ''' + @FullName + ''' AND '

	IF (@Email IS NOT NULL)
		SET @Command = @Command + 'Email = ''' + @Email + ''' AND '

	IF (@Mobile IS NOT NULL)
		SET @Command = @Command + 'Mobile = ''' + @Mobile + ''' AND '

	IF (@Title IS NOT NULL)
		SET @Command = @Command + 'Title = ''' + @Title + ''' AND '

	IF (@LastLogin IS NOT NULL)
		SET @Command = @Command + 'LastLogin = ''' + CONVERT(VARCHAR, @LastLogin) + ''' AND '

	IF (@CreatedDate IS NOT NULL)
		SET @Command = @Command + 'CreatedDate = ''' + CONVERT(VARCHAR, @CreatedDate) + ''' AND '

	IF (@CreatedBy IS NOT NULL)
		SET @Command = @Command + 'CreatedBy = ''' + @CreatedBy + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@Adresss IS NOT NULL)
		SET @Command = @Command + 'Adresss = ''' + @Adresss + ''' AND '

	IF (@Others IS NOT NULL)
		SET @Command = @Command + 'Others = ''' + @Others + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM User ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Unit]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Unit]
(
	@Unitname NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@Unitname IS NOT NULL)
		SET @Command = @Command + 'Unitname = ''' + @Unitname + ''' AND '

	IF (@IconPath IS NOT NULL)
		SET @Command = @Command + 'IconPath = ''' + @IconPath + ''' AND '

	IF (@ShortDescription IS NOT NULL)
		SET @Command = @Command + 'ShortDescription = ''' + @ShortDescription + ''' AND '

	IF (@LongDescription IS NOT NULL)
		SET @Command = @Command + 'LongDescription = ''' + @LongDescription + ''' AND '

	IF (@CreateOn IS NOT NULL)
		SET @Command = @Command + 'CreateOn = ''' + CONVERT(VARCHAR, @CreateOn) + ''' AND '

	IF (@CreateBy IS NOT NULL)
		SET @Command = @Command + 'CreateBy = ''' + @CreateBy + ''' AND '

	IF (@ModifiedOn IS NOT NULL)
		SET @Command = @Command + 'ModifiedOn = ''' + CONVERT(VARCHAR, @ModifiedOn) + ''' AND '

	IF (@ModifiedBy IS NOT NULL)
		SET @Command = @Command + 'ModifiedBy = ''' + @ModifiedBy + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@Position IS NOT NULL)
		SET @Command = @Command + 'Position = ''' + CONVERT(VARCHAR, @Position) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Unit ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Size]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Size]
(
	@Sizename NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@Sizename IS NOT NULL)
		SET @Command = @Command + 'Sizename = ''' + @Sizename + ''' AND '

	IF (@IconPath IS NOT NULL)
		SET @Command = @Command + 'IconPath = ''' + @IconPath + ''' AND '

	IF (@ShortDescription IS NOT NULL)
		SET @Command = @Command + 'ShortDescription = ''' + @ShortDescription + ''' AND '

	IF (@LongDescription IS NOT NULL)
		SET @Command = @Command + 'LongDescription = ''' + @LongDescription + ''' AND '

	IF (@CreateOn IS NOT NULL)
		SET @Command = @Command + 'CreateOn = ''' + CONVERT(VARCHAR, @CreateOn) + ''' AND '

	IF (@CreateBy IS NOT NULL)
		SET @Command = @Command + 'CreateBy = ''' + @CreateBy + ''' AND '

	IF (@ModifiedOn IS NOT NULL)
		SET @Command = @Command + 'ModifiedOn = ''' + CONVERT(VARCHAR, @ModifiedOn) + ''' AND '

	IF (@ModifiedBy IS NOT NULL)
		SET @Command = @Command + 'ModifiedBy = ''' + @ModifiedBy + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@Position IS NOT NULL)
		SET @Command = @Command + 'Position = ''' + CONVERT(VARCHAR, @Position) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Size ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Role]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Role]
(
	@Module NVARCHAR(250) /*Must check to convert type*/,
	@RoleName NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@Module IS NOT NULL)
		SET @Command = @Command + 'Module = ''' + @Module + ''' AND '

	IF (@RoleName IS NOT NULL)
		SET @Command = @Command + 'RoleName = ''' + @RoleName + ''' AND '

	IF (@Description IS NOT NULL)
		SET @Command = @Command + 'Description = ''' + @Description + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Role ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Provider]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Provider]
(
	@ProviderName NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@OrderNo INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@ProviderName IS NOT NULL)
		SET @Command = @Command + 'ProviderName = ''' + @ProviderName + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@OrderNo IS NOT NULL)
		SET @Command = @Command + 'OrderNo = ''' + CONVERT(VARCHAR, @OrderNo) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Provider ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Products]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Products]
(
	@CategoryID INT,
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@SubProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeID INT,
	@ColorID INT,
	@SizeID INT,
	@UnitID INT,
	@NationalID INT,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Discount DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus NVARCHAR(250) /*Must check to convert type*/,
	@Vat NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@ProductImageList NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@QuantityBy SMALLINT,
	@HaveOk INT,
	@Status INT,
	@ShowOk INT,
	@TopOk INT,
	@Count INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@CategoryID IS NOT NULL)
		SET @Command = @Command + 'CategoryID = ''' + CONVERT(VARCHAR, @CategoryID) + ''' AND '

	IF (@ProductName IS NOT NULL)
		SET @Command = @Command + 'ProductName = ''' + @ProductName + ''' AND '

	IF (@SubProductName IS NOT NULL)
		SET @Command = @Command + 'SubProductName = ''' + @SubProductName + ''' AND '

	IF (@ProductImage IS NOT NULL)
		SET @Command = @Command + 'ProductImage = ''' + @ProductImage + ''' AND '

	IF (@ProductCode IS NOT NULL)
		SET @Command = @Command + 'ProductCode = ''' + @ProductCode + ''' AND '

	IF (@ProductMaterial IS NOT NULL)
		SET @Command = @Command + 'ProductMaterial = ''' + @ProductMaterial + ''' AND '

	IF (@MadeID IS NOT NULL)
		SET @Command = @Command + 'MadeID = ''' + CONVERT(VARCHAR, @MadeID) + ''' AND '

	IF (@ColorID IS NOT NULL)
		SET @Command = @Command + 'ColorID = ''' + CONVERT(VARCHAR, @ColorID) + ''' AND '

	IF (@SizeID IS NOT NULL)
		SET @Command = @Command + 'SizeID = ''' + CONVERT(VARCHAR, @SizeID) + ''' AND '

	IF (@UnitID IS NOT NULL)
		SET @Command = @Command + 'UnitID = ''' + CONVERT(VARCHAR, @UnitID) + ''' AND '

	IF (@NationalID IS NOT NULL)
		SET @Command = @Command + 'NationalID = ''' + CONVERT(VARCHAR, @NationalID) + ''' AND '

	IF (@ProductPrice IS NOT NULL)
		SET @Command = @Command + 'ProductPrice = ''' + CONVERT(VARCHAR, @ProductPrice) + ''' AND '

	IF (@Discount IS NOT NULL)
		SET @Command = @Command + 'Discount = ''' + CONVERT(VARCHAR, @Discount) + ''' AND '

	IF (@Warranty IS NOT NULL)
		SET @Command = @Command + 'Warranty = ''' + @Warranty + ''' AND '

	IF (@ProductStatus IS NOT NULL)
		SET @Command = @Command + 'ProductStatus = ''' + @ProductStatus + ''' AND '

	IF (@Vat IS NOT NULL)
		SET @Command = @Command + 'Vat = ''' + @Vat + ''' AND '

	IF (@Description IS NOT NULL)
		SET @Command = @Command + 'Description = ''' + @Description + ''' AND '

	IF (@ProductImageList IS NOT NULL)
		SET @Command = @Command + 'ProductImageList = ''' + @ProductImageList + ''' AND '

	IF (@CreateOn IS NOT NULL)
		SET @Command = @Command + 'CreateOn = ''' + CONVERT(VARCHAR, @CreateOn) + ''' AND '

	IF (@CreateBy IS NOT NULL)
		SET @Command = @Command + 'CreateBy = ''' + @CreateBy + ''' AND '

	IF (@ModifiedOn IS NOT NULL)
		SET @Command = @Command + 'ModifiedOn = ''' + CONVERT(VARCHAR, @ModifiedOn) + ''' AND '

	IF (@ModifiedBy IS NOT NULL)
		SET @Command = @Command + 'ModifiedBy = ''' + @ModifiedBy + ''' AND '

	IF (@QuantityBy IS NOT NULL)
		SET @Command = @Command + 'QuantityBy = ''' + CONVERT(VARCHAR, @QuantityBy) + ''' AND '

	IF (@HaveOk IS NOT NULL)
		SET @Command = @Command + 'HaveOk = ''' + CONVERT(VARCHAR, @HaveOk) + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@ShowOk IS NOT NULL)
		SET @Command = @Command + 'ShowOk = ''' + CONVERT(VARCHAR, @ShowOk) + ''' AND '

	IF (@TopOk IS NOT NULL)
		SET @Command = @Command + 'TopOk = ''' + CONVERT(VARCHAR, @TopOk) + ''' AND '

	IF (@Count IS NOT NULL)
		SET @Command = @Command + 'Count = ''' + CONVERT(VARCHAR, @Count) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Products ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Product]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Product]
(
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeBy NVARCHAR(250) /*Must check to convert type*/,
	@NationalBy NVARCHAR(250) /*Must check to convert type*/,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus INT,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@HaveOk INT,
	@Status INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@ProductName IS NOT NULL)
		SET @Command = @Command + 'ProductName = ''' + @ProductName + ''' AND '

	IF (@ProductImage IS NOT NULL)
		SET @Command = @Command + 'ProductImage = ''' + @ProductImage + ''' AND '

	IF (@ProductCode IS NOT NULL)
		SET @Command = @Command + 'ProductCode = ''' + @ProductCode + ''' AND '

	IF (@ProductMaterial IS NOT NULL)
		SET @Command = @Command + 'ProductMaterial = ''' + @ProductMaterial + ''' AND '

	IF (@MadeBy IS NOT NULL)
		SET @Command = @Command + 'MadeBy = ''' + @MadeBy + ''' AND '

	IF (@NationalBy IS NOT NULL)
		SET @Command = @Command + 'NationalBy = ''' + @NationalBy + ''' AND '

	IF (@ProductPrice IS NOT NULL)
		SET @Command = @Command + 'ProductPrice = ''' + CONVERT(VARCHAR, @ProductPrice) + ''' AND '

	IF (@Warranty IS NOT NULL)
		SET @Command = @Command + 'Warranty = ''' + @Warranty + ''' AND '

	IF (@ProductStatus IS NOT NULL)
		SET @Command = @Command + 'ProductStatus = ''' + CONVERT(VARCHAR, @ProductStatus) + ''' AND '

	IF (@Description IS NOT NULL)
		SET @Command = @Command + 'Description = ''' + @Description + ''' AND '

	IF (@HaveOk IS NOT NULL)
		SET @Command = @Command + 'HaveOk = ''' + CONVERT(VARCHAR, @HaveOk) + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Product ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_PostByNews]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_PostByNews]
(
	@NewsID INT,
	@PostContent NVARCHAR(250) /*Must check to convert type*/,
	@PostBy NVARCHAR(250) /*Must check to convert type*/,
	@CreatedDate DATETIME /*Must check to convert type*/,
	@ModifiedDate DATETIME /*Must check to convert type*/,
	@Status INT,
	@IsLock INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@NewsID IS NOT NULL)
		SET @Command = @Command + 'NewsID = ''' + CONVERT(VARCHAR, @NewsID) + ''' AND '

	IF (@PostContent IS NOT NULL)
		SET @Command = @Command + 'PostContent = ''' + @PostContent + ''' AND '

	IF (@PostBy IS NOT NULL)
		SET @Command = @Command + 'PostBy = ''' + @PostBy + ''' AND '

	IF (@CreatedDate IS NOT NULL)
		SET @Command = @Command + 'CreatedDate = ''' + CONVERT(VARCHAR, @CreatedDate) + ''' AND '

	IF (@ModifiedDate IS NOT NULL)
		SET @Command = @Command + 'ModifiedDate = ''' + CONVERT(VARCHAR, @ModifiedDate) + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@IsLock IS NOT NULL)
		SET @Command = @Command + 'IsLock = ''' + CONVERT(VARCHAR, @IsLock) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM PostByNews ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_OrderItem]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_OrderItem]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/,
	@ProductID INT,
	@Price DECIMAL(18,0) /*Must check to convert type*/,
	@Quanity INT,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@CreateDate DATETIME /*Must check to convert type*/,
	@Status INT,
	@ApproveBy NVARCHAR(250) /*Must check to convert type*/,
	@ApproveDate DATETIME /*Must check to convert type*/,
	@DeliverytDate DATETIME /*Must check to convert type*/,
	@DeliveryOk INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@OrderNo IS NOT NULL)
		SET @Command = @Command + 'OrderNo = ''' + @OrderNo + ''' AND '

	IF (@ProductID IS NOT NULL)
		SET @Command = @Command + 'ProductID = ''' + CONVERT(VARCHAR, @ProductID) + ''' AND '

	IF (@Price IS NOT NULL)
		SET @Command = @Command + 'Price = ''' + CONVERT(VARCHAR, @Price) + ''' AND '

	IF (@Quanity IS NOT NULL)
		SET @Command = @Command + 'Quanity = ''' + CONVERT(VARCHAR, @Quanity) + ''' AND '

	IF (@CreateBy IS NOT NULL)
		SET @Command = @Command + 'CreateBy = ''' + @CreateBy + ''' AND '

	IF (@CreateDate IS NOT NULL)
		SET @Command = @Command + 'CreateDate = ''' + CONVERT(VARCHAR, @CreateDate) + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@ApproveBy IS NOT NULL)
		SET @Command = @Command + 'ApproveBy = ''' + @ApproveBy + ''' AND '

	IF (@ApproveDate IS NOT NULL)
		SET @Command = @Command + 'ApproveDate = ''' + CONVERT(VARCHAR, @ApproveDate) + ''' AND '

	IF (@DeliverytDate IS NOT NULL)
		SET @Command = @Command + 'DeliverytDate = ''' + CONVERT(VARCHAR, @DeliverytDate) + ''' AND '

	IF (@DeliveryOk IS NOT NULL)
		SET @Command = @Command + 'DeliveryOk = ''' + CONVERT(VARCHAR, @DeliveryOk) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM OrderItem ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Order]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Order]
(
	@Name NVARCHAR(250) /*Must check to convert type*/,
	@Address NVARCHAR(250) /*Must check to convert type*/,
	@Sdt NVARCHAR(250) /*Must check to convert type*/,
	@Email NVARCHAR(250) /*Must check to convert type*/,
	@DiscountAmount DECIMAL(18,0) /*Must check to convert type*/,
	@DiscountReason NVARCHAR(250) /*Must check to convert type*/,
	@AddedAmount DECIMAL(18,0) /*Must check to convert type*/,
	@AddedReason NVARCHAR(250) /*Must check to convert type*/,
	@OrderDate DATETIME /*Must check to convert type*/,
	@Notes NVARCHAR(250) /*Must check to convert type*/,
	@Total DECIMAL(18,0) /*Must check to convert type*/,
	@ModifiedDate DATETIME /*Must check to convert type*/,
	@FinishedDate DATETIME /*Must check to convert type*/,
	@TransactionCosts DECIMAL(18,0) /*Must check to convert type*/,
	@BankID NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@CouponText NVARCHAR(250) /*Must check to convert type*/,
	@CouponValue DECIMAL(18,0) /*Must check to convert type*/
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@Name IS NOT NULL)
		SET @Command = @Command + 'Name = ''' + @Name + ''' AND '

	IF (@Address IS NOT NULL)
		SET @Command = @Command + 'Address = ''' + @Address + ''' AND '

	IF (@Sdt IS NOT NULL)
		SET @Command = @Command + 'Sdt = ''' + @Sdt + ''' AND '

	IF (@Email IS NOT NULL)
		SET @Command = @Command + 'Email = ''' + @Email + ''' AND '

	IF (@DiscountAmount IS NOT NULL)
		SET @Command = @Command + 'DiscountAmount = ''' + CONVERT(VARCHAR, @DiscountAmount) + ''' AND '

	IF (@DiscountReason IS NOT NULL)
		SET @Command = @Command + 'DiscountReason = ''' + @DiscountReason + ''' AND '

	IF (@AddedAmount IS NOT NULL)
		SET @Command = @Command + 'AddedAmount = ''' + CONVERT(VARCHAR, @AddedAmount) + ''' AND '

	IF (@AddedReason IS NOT NULL)
		SET @Command = @Command + 'AddedReason = ''' + @AddedReason + ''' AND '

	IF (@OrderDate IS NOT NULL)
		SET @Command = @Command + 'OrderDate = ''' + CONVERT(VARCHAR, @OrderDate) + ''' AND '

	IF (@Notes IS NOT NULL)
		SET @Command = @Command + 'Notes = ''' + @Notes + ''' AND '

	IF (@Total IS NOT NULL)
		SET @Command = @Command + 'Total = ''' + CONVERT(VARCHAR, @Total) + ''' AND '

	IF (@ModifiedDate IS NOT NULL)
		SET @Command = @Command + 'ModifiedDate = ''' + CONVERT(VARCHAR, @ModifiedDate) + ''' AND '

	IF (@FinishedDate IS NOT NULL)
		SET @Command = @Command + 'FinishedDate = ''' + CONVERT(VARCHAR, @FinishedDate) + ''' AND '

	IF (@TransactionCosts IS NOT NULL)
		SET @Command = @Command + 'TransactionCosts = ''' + CONVERT(VARCHAR, @TransactionCosts) + ''' AND '

	IF (@BankID IS NOT NULL)
		SET @Command = @Command + 'BankID = ''' + @BankID + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@CouponText IS NOT NULL)
		SET @Command = @Command + 'CouponText = ''' + @CouponText + ''' AND '

	IF (@CouponValue IS NOT NULL)
		SET @Command = @Command + 'CouponValue = ''' + CONVERT(VARCHAR, @CouponValue) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Order ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_News]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_News]
(
	@CategoryID INT,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@SubTitle NVARCHAR(250) /*Must check to convert type*/,
	@ShowSubTitle BIT,
	@Summary NVARCHAR(250) /*Must check to convert type*/,
	@Detail NVARCHAR(250) /*Must check to convert type*/,
	@Author NVARCHAR(250) /*Must check to convert type*/,
	@Source NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ImagePath NVARCHAR(250) /*Must check to convert type*/,
	@Hit INT,
	@ExpireDate DATETIME /*Must check to convert type*/,
	@Approved TINYINT,
	@ApprovedOn DATETIME /*Must check to convert type*/,
	@ApprovedBy NVARCHAR(250) /*Must check to convert type*/,
	@CreatedOn DATETIME /*Must check to convert type*/,
	@CreatedBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@DisplayAt NVARCHAR(250) /*Must check to convert type*/
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@CategoryID IS NOT NULL)
		SET @Command = @Command + 'CategoryID = ''' + CONVERT(VARCHAR, @CategoryID) + ''' AND '

	IF (@Title IS NOT NULL)
		SET @Command = @Command + 'Title = ''' + @Title + ''' AND '

	IF (@SubTitle IS NOT NULL)
		SET @Command = @Command + 'SubTitle = ''' + @SubTitle + ''' AND '

	IF (@ShowSubTitle IS NOT NULL)
		SET @Command = @Command + 'ShowSubTitle = ''' + CONVERT(VARCHAR, @ShowSubTitle) + ''' AND '

	IF (@Summary IS NOT NULL)
		SET @Command = @Command + 'Summary = ''' + @Summary + ''' AND '

	IF (@Detail IS NOT NULL)
		SET @Command = @Command + 'Detail = ''' + @Detail + ''' AND '

	IF (@Author IS NOT NULL)
		SET @Command = @Command + 'Author = ''' + @Author + ''' AND '

	IF (@Source IS NOT NULL)
		SET @Command = @Command + 'Source = ''' + @Source + ''' AND '

	IF (@IconPath IS NOT NULL)
		SET @Command = @Command + 'IconPath = ''' + @IconPath + ''' AND '

	IF (@ImagePath IS NOT NULL)
		SET @Command = @Command + 'ImagePath = ''' + @ImagePath + ''' AND '

	IF (@Hit IS NOT NULL)
		SET @Command = @Command + 'Hit = ''' + CONVERT(VARCHAR, @Hit) + ''' AND '

	IF (@ExpireDate IS NOT NULL)
		SET @Command = @Command + 'ExpireDate = ''' + CONVERT(VARCHAR, @ExpireDate) + ''' AND '

	IF (@Approved IS NOT NULL)
		SET @Command = @Command + 'Approved = ''' + CONVERT(VARCHAR, @Approved) + ''' AND '

	IF (@ApprovedOn IS NOT NULL)
		SET @Command = @Command + 'ApprovedOn = ''' + CONVERT(VARCHAR, @ApprovedOn) + ''' AND '

	IF (@ApprovedBy IS NOT NULL)
		SET @Command = @Command + 'ApprovedBy = ''' + @ApprovedBy + ''' AND '

	IF (@CreatedOn IS NOT NULL)
		SET @Command = @Command + 'CreatedOn = ''' + CONVERT(VARCHAR, @CreatedOn) + ''' AND '

	IF (@CreatedBy IS NOT NULL)
		SET @Command = @Command + 'CreatedBy = ''' + @CreatedBy + ''' AND '

	IF (@ModifiedOn IS NOT NULL)
		SET @Command = @Command + 'ModifiedOn = ''' + CONVERT(VARCHAR, @ModifiedOn) + ''' AND '

	IF (@ModifiedBy IS NOT NULL)
		SET @Command = @Command + 'ModifiedBy = ''' + @ModifiedBy + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@DisplayAt IS NOT NULL)
		SET @Command = @Command + 'DisplayAt = ''' + @DisplayAt + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM News ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Nationals]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Nationals]
(
	@NationalName NVARCHAR(250) /*Must check to convert type*/,
	@NationalAdd NVARCHAR(250) /*Must check to convert type*/,
	@NationalPhone NVARCHAR(250) /*Must check to convert type*/,
	@NationalLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@NationalName IS NOT NULL)
		SET @Command = @Command + 'NationalName = ''' + @NationalName + ''' AND '

	IF (@NationalAdd IS NOT NULL)
		SET @Command = @Command + 'NationalAdd = ''' + @NationalAdd + ''' AND '

	IF (@NationalPhone IS NOT NULL)
		SET @Command = @Command + 'NationalPhone = ''' + @NationalPhone + ''' AND '

	IF (@NationalLogo IS NOT NULL)
		SET @Command = @Command + 'NationalLogo = ''' + @NationalLogo + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Nationals ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_National]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_National]
(
	@NationalName NVARCHAR(250) /*Must check to convert type*/,
	@NationalAdd NVARCHAR(250) /*Must check to convert type*/,
	@NationalPhone NVARCHAR(250) /*Must check to convert type*/,
	@NationalLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@NationalName IS NOT NULL)
		SET @Command = @Command + 'NationalName = ''' + @NationalName + ''' AND '

	IF (@NationalAdd IS NOT NULL)
		SET @Command = @Command + 'NationalAdd = ''' + @NationalAdd + ''' AND '

	IF (@NationalPhone IS NOT NULL)
		SET @Command = @Command + 'NationalPhone = ''' + @NationalPhone + ''' AND '

	IF (@NationalLogo IS NOT NULL)
		SET @Command = @Command + 'NationalLogo = ''' + @NationalLogo + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM National ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Made]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Made]
(
	@MadeName NVARCHAR(250) /*Must check to convert type*/,
	@MadeCode NVARCHAR(250) /*Must check to convert type*/,
	@MadeLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@MadeName IS NOT NULL)
		SET @Command = @Command + 'MadeName = ''' + @MadeName + ''' AND '

	IF (@MadeCode IS NOT NULL)
		SET @Command = @Command + 'MadeCode = ''' + @MadeCode + ''' AND '

	IF (@MadeLogo IS NOT NULL)
		SET @Command = @Command + 'MadeLogo = ''' + @MadeLogo + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Made ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Color]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Color]
(
	@Colorname NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@Colorname IS NOT NULL)
		SET @Command = @Command + 'Colorname = ''' + @Colorname + ''' AND '

	IF (@IconPath IS NOT NULL)
		SET @Command = @Command + 'IconPath = ''' + @IconPath + ''' AND '

	IF (@ShortDescription IS NOT NULL)
		SET @Command = @Command + 'ShortDescription = ''' + @ShortDescription + ''' AND '

	IF (@LongDescription IS NOT NULL)
		SET @Command = @Command + 'LongDescription = ''' + @LongDescription + ''' AND '

	IF (@CreateOn IS NOT NULL)
		SET @Command = @Command + 'CreateOn = ''' + CONVERT(VARCHAR, @CreateOn) + ''' AND '

	IF (@CreateBy IS NOT NULL)
		SET @Command = @Command + 'CreateBy = ''' + @CreateBy + ''' AND '

	IF (@ModifiedOn IS NOT NULL)
		SET @Command = @Command + 'ModifiedOn = ''' + CONVERT(VARCHAR, @ModifiedOn) + ''' AND '

	IF (@ModifiedBy IS NOT NULL)
		SET @Command = @Command + 'ModifiedBy = ''' + @ModifiedBy + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@Position IS NOT NULL)
		SET @Command = @Command + 'Position = ''' + CONVERT(VARCHAR, @Position) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Color ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Search_Category]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Search_Category]
(
	@CategoryName NVARCHAR(250) /*Must check to convert type*/,
	@DisplayType TINYINT,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ParentID INT,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@TreeDetech NVARCHAR(250) /*Must check to convert type*/,
	@OrderNo TINYINT
)AS
DECLARE
	@Command NVARCHAR(4000)
BEGIN
	SET @Command = 'WHERE '

	IF (@CategoryName IS NOT NULL)
		SET @Command = @Command + 'CategoryName = ''' + @CategoryName + ''' AND '

	IF (@DisplayType IS NOT NULL)
		SET @Command = @Command + 'DisplayType = ''' + CONVERT(VARCHAR, @DisplayType) + ''' AND '

	IF (@IconPath IS NOT NULL)
		SET @Command = @Command + 'IconPath = ''' + @IconPath + ''' AND '

	IF (@ParentID IS NOT NULL)
		SET @Command = @Command + 'ParentID = ''' + CONVERT(VARCHAR, @ParentID) + ''' AND '

	IF (@ShortDescription IS NOT NULL)
		SET @Command = @Command + 'ShortDescription = ''' + @ShortDescription + ''' AND '

	IF (@LongDescription IS NOT NULL)
		SET @Command = @Command + 'LongDescription = ''' + @LongDescription + ''' AND '

	IF (@CreateOn IS NOT NULL)
		SET @Command = @Command + 'CreateOn = ''' + CONVERT(VARCHAR, @CreateOn) + ''' AND '

	IF (@CreateBy IS NOT NULL)
		SET @Command = @Command + 'CreateBy = ''' + @CreateBy + ''' AND '

	IF (@ModifiedOn IS NOT NULL)
		SET @Command = @Command + 'ModifiedOn = ''' + CONVERT(VARCHAR, @ModifiedOn) + ''' AND '

	IF (@ModifiedBy IS NOT NULL)
		SET @Command = @Command + 'ModifiedBy = ''' + @ModifiedBy + ''' AND '

	IF (@Status IS NOT NULL)
		SET @Command = @Command + 'Status = ''' + CONVERT(VARCHAR, @Status) + ''' AND '

	IF (@TreeDetech IS NOT NULL)
		SET @Command = @Command + 'TreeDetech = ''' + @TreeDetech + ''' AND '

	IF (@OrderNo IS NOT NULL)
		SET @Command = @Command + 'OrderNo = ''' + CONVERT(VARCHAR, @OrderNo) + ''' AND '
	IF @Command <> 'WHERE '
		BEGIN
			SET @Command = REVERSE(SUBSTRING(REVERSE(@Command), 5, LEN(@Command)))
			SET @Command = 'SELECT * FROM Category ' + @Command

		EXECUTE (@Command)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_News_TopRight]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_News_TopRight] --5
(
	@Top INT
)
AS
BEGIN
	DECLARE @Command NVARCHAR(4000)
	SET @Command = 'SELECT Top ' + CONVERT(VARCHAR,@Top) + '*
					FROM  dbo.News
					ORDER BY dbo.News.CreatedOn DESC'
 
	EXECUTE(@Command)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Provider]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Provider]
AS
BEGIN
	SELECT * FROM Provider
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Provider]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Provider]
(
	@ID INT
)AS
BEGIN
	SELECT * FROM Provider WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Product_New]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Select_Product_New]
as
select top 4 * from Product p order by p.ProductId desc
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Product]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Product]
AS
BEGIN
	SELECT * FROM Product
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectProductRight]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectProductRight] --5
(
	@Top INT
)
AS
BEGIN
	DECLARE @Command NVARCHAR(4000)
	SET @Command = 'SELECT Top ' + CONVERT(VARCHAR,@Top) + '*
					FROM  Product where TopOk=1 
					ORDER BY ProductId DESC'
 
	EXECUTE(@Command)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Product]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Product]
(
	@ProductId INT,
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeBy NVARCHAR(250) /*Must check to convert type*/,
	@NationalBy NVARCHAR(250) /*Must check to convert type*/,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus NVARCHAR(250),
	@Description NTEXT /*Must check to convert type*/,
	@ProductType INT,
	@ShowOk INT,
	@TopOk INT,
	@ProductOther NVARCHAR(500)
	)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Product SET ProductName = @ProductName, ProductImage = @ProductImage, ProductCode = @ProductCode, ProductMaterial = @ProductMaterial, MadeBy = @MadeBy, NationalBy = @NationalBy, ProductPrice = @ProductPrice, Warranty = @Warranty, ProductStatus = @ProductStatus, Description = @Description, ProductType=@ProductType,ShowOk = @ShowOk,
	                TopOk = @TopOk,ProductOther = @ProductOther WHERE ProductId = @ProductId

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Provider]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Provider]
(
	@ID INT,
	@ProviderName NVARCHAR(250) /*Must check to convert type*/,
	@Logo NVARCHAR(250),
	@Status INT,
	@OrderNo INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Provider SET ProviderName = @ProviderName,Logo = @Logo, Status = @Status, OrderNo = @OrderNo WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserName] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Permited] [bit] NOT NULL,
 CONSTRAINT [PK_UserGroupRole_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 1, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 2, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 3, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 4, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 5, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 6, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 7, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 8, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 9, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 10, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 11, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 12, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 13, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 15, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 16, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 17, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 18, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 19, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 20, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 21, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 22, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 23, 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID], [Permited]) VALUES (N'abc', 52, 1)
/****** Object:  Table [dbo].[User]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Mobile] [nvarchar](250) NULL,
	[Title] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Adresss] [ntext] NULL,
	[Others] [ntext] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[User] ([UserName], [Password], [FullName], [Email], [Mobile], [Title], [LastLogin], [CreatedDate], [CreatedBy], [Status], [Adresss], [Others]) VALUES (N'abc', N'KM5z6Pv0iHM=', N'abc gi do', N'sf', N'sdf', N'sdfsdf', CAST(0x0000A12A0119DA22 AS DateTime), CAST(0x0000A17F01040291 AS DateTime), NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([UserName], [Password], [FullName], [Email], [Mobile], [Title], [LastLogin], [CreatedDate], [CreatedBy], [Status], [Adresss], [Others]) VALUES (N'dao', N'KM5z6Pv0iHM=', N'trinh dao', N'abc@gmail.com', N'0987654321', NULL, NULL, CAST(0x0000AADA000BA5DF AS DateTime), NULL, 1, N'daotv', NULL)
INSERT [dbo].[User] ([UserName], [Password], [FullName], [Email], [Mobile], [Title], [LastLogin], [CreatedDate], [CreatedBy], [Status], [Adresss], [Others]) VALUES (N'oke', N'KM5z6Pv0iHM=', N'oke', N'abc@thinh.vn', N'0987654321', NULL, NULL, CAST(0x0000AADA0011227A AS DateTime), NULL, 1, N'dao tan', NULL)
INSERT [dbo].[User] ([UserName], [Password], [FullName], [Email], [Mobile], [Title], [LastLogin], [CreatedDate], [CreatedBy], [Status], [Adresss], [Others]) VALUES (N'thinh', N'KM5z6Pv0iHM=', N'thinh nguyen', N'abc@thinh.vn', N'0987654321', NULL, NULL, CAST(0x0000AADA00141333 AS DateTime), NULL, 1, N'dao tan', NULL)
/****** Object:  Table [dbo].[Unit]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[Unitname] [nvarchar](250) NULL,
	[IconPath] [varchar](500) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[LongDescription] [ntext] NULL,
	[CreateOn] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON
INSERT [dbo].[Unit] ([UnitID], [Unitname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (1, N'kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Unit] ([UnitID], [Unitname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (2, N'Tạ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Unit] ([UnitID], [Unitname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (4, N'Lít', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[Unit] ([UnitID], [Unitname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (5, N'Chiếc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[Unit] ([UnitID], [Unitname], [IconPath], [ShortDescription], [LongDescription], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [Status], [Position]) VALUES (6, N'hộp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL)
SET IDENTITY_INSERT [dbo].[Unit] OFF
/****** Object:  UserDefinedFunction [dbo].[ufn_catdau]    Script Date: 10/14/2019 15:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_catdau](@_p NVARCHAR(512))
RETURNS NVARCHAR(512)
AS
BEGIN
    DECLARE @_pr NVARCHAR(200)
    
    -- Cắt ký tự trắng. Giảm thời gian xữ lý chuổi
    SET @_p = LTRIM(RTRIM(@_p))
    
    -- Chuổi trả về của hàm
    SET @_pr = N''
    
    -- Thư viện tham chiếu
    DECLARE @_s1 NVARCHAR(64), @_s2 NVARCHAR(64)  
    SET @_s1 = N'êếềểễệéèẻẽẹ-ýỳỷỹỵ-ưứừửữựúùủũụ-íìỉĩị-ôốồổỗộơớờởỡợóòỏõọ-âấầẩẫậăắằẳẵặáàảãạ-đ'
    SET @_s2 = N'eeeeeeeeeee-yyyyy-uuuuuuuuuuu-iiiii-ooooooooooooooooo-aaaaaaaaaaaaaaaaa-d'
    
    -- Biến xữ lý
    DECLARE @_cnt INT
    DECLARE @_pos INT
    DECLARE @_sf NCHAR(1)
    DECLARE @_sr NCHAR(1)
    
    -- Duyệt qua từng ký tự của chuổi parameter để xữ lý
    SET @_cnt = 1
    WHILE @_cnt <= LEN(@_p)
    BEGIN
        SET @_sf = SUBSTRING(@_p, @_cnt, 1)
        
        -- Nếu là ký tự "-" không xữ lý => (Giảm thời gian xữ lý)
        IF @_sf = N'-'
        BEGIN
            SET @_pr = @_pr + @_sf
        END
        ELSE
        BEGIN
            SET @_pos = CHARINDEX(@_sf, @_s1, 1)
            
            -- Nếu không tồn tại trong chuổi tham chiếu. Không xữ lý => (Giảm thời gian xữ lý)
            IF @_pos = 0
            BEGIN
                SET @_pr = @_pr + @_sf
            END
            ELSE
            BEGIN
                -- Tham chiếu ký tự thay thế
                SET @_sr = SUBSTRING(@_s2, @_pos, 1)
                SET @_pr = @_pr + @_sr
            END    
        END    
        
        SET @_cnt = @_cnt + 1    
    END
    
    -- Chuổi ký tự mới đã được cắt dấu
    RETURN @_pr
END
GO
/****** Object:  Table [dbo].[Trans]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trans](
	[Vpc_Tran_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Vpc_MerchTxnRef] [varchar](255) NULL,
	[Vpc_Merchant] [varchar](255) NULL,
	[Vpc_OrderInfo] [varchar](255) NULL,
	[Vpc_Amount] [money] NULL,
	[Vpc_TicketNo] [varchar](255) NULL,
	[Vpc_Date] [datetime] NULL,
	[Vpc_ReturnUrl] [nvarchar](2000) NULL,
	[Vpc_TxnResponseCode] [int] NULL,
	[Vpc_BankType] [varchar](50) NULL,
 CONSTRAINT [PK_Trans] PRIMARY KEY CLUSTERED 
(
	[Vpc_Tran_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Trans] ON
INSERT [dbo].[Trans] ([Vpc_Tran_ID], [Vpc_MerchTxnRef], [Vpc_Merchant], [Vpc_OrderInfo], [Vpc_Amount], [Vpc_TicketNo], [Vpc_Date], [Vpc_ReturnUrl], [Vpc_TxnResponseCode], [Vpc_BankType]) VALUES (1, N'cad/vtb/noreply@musicvet.vn/013612', N'ONEPAY', N'140811004', 22500000.0000, N'127.0.0.1', CAST(0x0000A384001A6C61 AS DateTime), NULL, 0, N'vtb')
INSERT [dbo].[Trans] ([Vpc_Tran_ID], [Vpc_MerchTxnRef], [Vpc_Merchant], [Vpc_OrderInfo], [Vpc_Amount], [Vpc_TicketNo], [Vpc_Date], [Vpc_ReturnUrl], [Vpc_TxnResponseCode], [Vpc_BankType]) VALUES (2, N'cad/vtb/noreply@musicvet.vn/013839', N'ONEPAY', N'140811005', 22500000.0000, N'127.0.0.1', CAST(0x0000A384001B1941 AS DateTime), NULL, 0, N'vtb')
INSERT [dbo].[Trans] ([Vpc_Tran_ID], [Vpc_MerchTxnRef], [Vpc_Merchant], [Vpc_OrderInfo], [Vpc_Amount], [Vpc_TicketNo], [Vpc_Date], [Vpc_ReturnUrl], [Vpc_TxnResponseCode], [Vpc_BankType]) VALUES (3, N'cad/vcb/noreply@musicvet.vn/094828', N'Bluewave', N'140811006', 38400000.0000, N'127.0.0.1', CAST(0x0000A38400A1A0CD AS DateTime), NULL, 0, N'vcb')
INSERT [dbo].[Trans] ([Vpc_Tran_ID], [Vpc_MerchTxnRef], [Vpc_Merchant], [Vpc_OrderInfo], [Vpc_Amount], [Vpc_TicketNo], [Vpc_Date], [Vpc_ReturnUrl], [Vpc_TxnResponseCode], [Vpc_BankType]) VALUES (4, N'cad/vcb/noreply@musicvet.vn/095011', N'ONEPAY', N'140811007', 38400000.0000, N'127.0.0.1', CAST(0x0000A38400A21966 AS DateTime), NULL, 0, N'vcb')
SET IDENTITY_INSERT [dbo].[Trans] OFF
/****** Object:  Table [dbo].[Support]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Support](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Yahoo] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Support] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Support] ON
INSERT [dbo].[Support] ([ID], [Title], [Yahoo], [Phone], [Type]) VALUES (2, N'Tư vấn 1', N'oke', N'0987654321', 2)
INSERT [dbo].[Support] ([ID], [Title], [Yahoo], [Phone], [Type]) VALUES (4, N'Tư vấn2', N'kinhdoanh', N'0987654321', 2)
SET IDENTITY_INSERT [dbo].[Support] OFF
/****** Object:  StoredProcedure [dbo].[spregistry_save]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spregistry_save](
	@Name nvarchar(50),
	@Value NTEXT
) AS
BEGIN
	begin
		if exists(select 1 from [registry] where lower(Name)=lower(@Name))
			update [registry] set Value = @Value where lower(Name)=lower(@Name)
		else
		begin
			insert into [registry](Name,Value) values(lower(@Name),@Value)
		end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spregistry_list_all]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[spregistry_list_all]
AS
	SELECT * FROM dbo.registry
GO
/****** Object:  StoredProcedure [dbo].[spregistry_list]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spregistry_list]
AS
	SELECT * FROM dbo.registry
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateApproved_Status]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_UpdateApproved_Status]
(
	@Stauts INT,	
	@OrderNo NVARCHAR(250)
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE [Order] SET [Status] = @Stauts WHERE OrderNo = @OrderNo 

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateApproved_News]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateApproved_News]
(
	@NewsID INT,	
	@ApprovedBy NVARCHAR(50)
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE News SET Approved = 1, ApprovedOn = getdate(), ApprovedBy = @ApprovedBy WHERE NewsID = @NewsID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_User]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_User]
(
	@UserName NVARCHAR(250) /*Must check to convert type*/,
	@Password NVARCHAR(250) /*Must check to convert type*/,
	@FullName NVARCHAR(250) /*Must check to convert type*/,
	@Email NVARCHAR(250) /*Must check to convert type*/,
	@Mobile NVARCHAR(250) /*Must check to convert type*/,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@LastLogin DATETIME /*Must check to convert type*/,
	@CreatedDate DATETIME /*Must check to convert type*/,
	@CreatedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Adresss NVARCHAR(250) /*Must check to convert type*/,
	@Others NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE [User] SET Password = @Password, FullName = @FullName, Email = @Email, Mobile = @Mobile, Title = @Title, LastLogin = @LastLogin, CreatedDate = @CreatedDate, CreatedBy = @CreatedBy, Status = @Status, Adresss = @Adresss, Others = @Others WHERE UserName = @UserName

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Unit]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Unit]
(
	@UnitID INT,
	@Unitname NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Unit SET Unitname = @Unitname, IconPath = @IconPath, ShortDescription = @ShortDescription, LongDescription = @LongDescription, CreateOn = @CreateOn, CreateBy = @CreateBy, ModifiedOn = @ModifiedOn, ModifiedBy = @ModifiedBy, Status = @Status, Position = @Position WHERE UnitID = @UnitID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Trans]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Trans]
(
	@Vpc_Tran_ID BIGINT,
	@Vpc_MerchTxnRef NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_Merchant NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_OrderInfo NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_Amount DECIMAL(18,0) /*Must check to convert type*/,
	@Vpc_TicketNo NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_Date DATETIME /*Must check to convert type*/,
	@Vpc_ReturnUrl NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_TxnResponseCode INT,
	@Vpc_BankType NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Trans SET Vpc_MerchTxnRef = @Vpc_MerchTxnRef, Vpc_Merchant = @Vpc_Merchant, Vpc_OrderInfo = @Vpc_OrderInfo, Vpc_Amount = @Vpc_Amount, Vpc_TicketNo = @Vpc_TicketNo, Vpc_Date = @Vpc_Date, Vpc_ReturnUrl = @Vpc_ReturnUrl, Vpc_TxnResponseCode = @Vpc_TxnResponseCode, Vpc_BankType = @Vpc_BankType WHERE Vpc_Tran_ID = @Vpc_Tran_ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Support]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Support]
(
	@ID INT,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@Yahoo NVARCHAR(250) /*Must check to convert type*/,
	@Phone NVARCHAR(250) /*Must check to convert type*/,
	@Type INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Support SET Title = @Title, Yahoo = @Yahoo, Phone = @Phone, Type = @Type WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Slider]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Slider]
(
	@SliderID INT,
	@SliderName NVARCHAR(50) /*Must check to convert type*/,
	@SliderContent NTEXT /*Must check to convert type*/,
	@SliderImage NVARCHAR(150) /*Must check to convert type*/,
	@SliderLink NVARCHAR(250) /*Must check to convert type*/
	)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Slider SET SliderName = @SliderName,SliderContent = @SliderContent,SliderImage = @SliderImage,SliderLink =@SliderLink  WHERE SliderID = @SliderID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Size]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Size]
(
	@SizeID INT,
	@Sizename NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Size SET Sizename = @Sizename, IconPath = @IconPath, ShortDescription = @ShortDescription, LongDescription = @LongDescription, CreateOn = @CreateOn, CreateBy = @CreateBy, ModifiedOn = @ModifiedOn, ModifiedBy = @ModifiedBy, Status = @Status, Position = @Position WHERE SizeID = @SizeID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Setting]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Setting]
(
	@ID INT,
	@CodeSetting NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@ValueSetting NVARCHAR(250) /*Must check to convert type*/,
	@Status BIT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Setting SET CodeSetting = @CodeSetting, Description = @Description, ValueSetting = @ValueSetting, Status = @Status WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Role]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Role]
(
	@RoleID INT,
	@Module NVARCHAR(250) /*Must check to convert type*/,
	@RoleName NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Role SET Module = @Module, RoleName = @RoleName, Description = @Description WHERE RoleID = @RoleID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAllCate]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_SelectAllCate]
(
	@Cate INT
)
AS
SELECT * FROM Product p INNER JOIN Category c ON p.ProductType=c.CategoryID WHERE p.ProductType=@Cate OR c.ParentID=@Cate ORDER BY p.ProductId DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_PostByNews]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_PostByNews]
(
	@ID INT,
	@NewsID INT,
	@PostContent NVARCHAR(250) /*Must check to convert type*/,
	@PostBy NVARCHAR(250) /*Must check to convert type*/,
	@CreatedDate DATETIME /*Must check to convert type*/,
	@ModifiedDate DATETIME /*Must check to convert type*/,
	@Status INT,
	@IsLock INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE PostByNews SET NewsID = @NewsID, PostContent = @PostContent, PostBy = @PostBy, CreatedDate = @CreatedDate, ModifiedDate = @ModifiedDate, Status = @Status, IsLock = @IsLock WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_OrderItem]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_OrderItem]
(
	@OrderItemID DECIMAL(18,0) /*Must check to convert type*/,
	@OrderNo NVARCHAR(250) /*Must check to convert type*/,
	@ProductID INT,
	@Price DECIMAL(18,0) /*Must check to convert type*/,
	@Quanity INT,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@CreateDate DATETIME /*Must check to convert type*/,
	@Status INT,
	@ApproveBy NVARCHAR(250) /*Must check to convert type*/,
	@ApproveDate DATETIME /*Must check to convert type*/,
	@DeliverytDate DATETIME /*Must check to convert type*/,
	@DeliveryOk INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE OrderItem SET OrderNo = @OrderNo, ProductID = @ProductID, Price = @Price, Quanity = @Quanity, CreateBy = @CreateBy, CreateDate = @CreateDate, Status = @Status, ApproveBy = @ApproveBy, ApproveDate = @ApproveDate, DeliverytDate = @DeliverytDate, DeliveryOk = @DeliveryOk WHERE OrderItemID = @OrderItemID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Order_Status]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Order_Status]
(
	@OrderNo nvarchar(20),
	@Status int
)
as
update [Order] set [Status]= @Status where OrderNo=@OrderNo
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Order]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Order]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/,
	@Name NVARCHAR(250) /*Must check to convert type*/,
	@Address NVARCHAR(250) /*Must check to convert type*/,
	@Sdt NVARCHAR(250) /*Must check to convert type*/,
	@Email NVARCHAR(250) /*Must check to convert type*/,
	@DiscountAmount DECIMAL(18,0) /*Must check to convert type*/,
	@DiscountReason NVARCHAR(250) /*Must check to convert type*/,
	@AddedAmount DECIMAL(18,0) /*Must check to convert type*/,
	@AddedReason NVARCHAR(250) /*Must check to convert type*/,
	@OrderDate DATETIME /*Must check to convert type*/,
	@Notes NVARCHAR(250) /*Must check to convert type*/,
	@Total DECIMAL(18,0) /*Must check to convert type*/,
	@ModifiedDate DATETIME /*Must check to convert type*/,
	@FinishedDate DATETIME /*Must check to convert type*/,
	@TransactionCosts DECIMAL(18,0) /*Must check to convert type*/,
	@BankID NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@CouponText NVARCHAR(250) /*Must check to convert type*/,
	@CouponValue DECIMAL(18,0) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE [Order] SET Name = @Name, Address = @Address, Sdt = @Sdt, Email = @Email, DiscountAmount = @DiscountAmount, DiscountReason = @DiscountReason, AddedAmount = @AddedAmount, AddedReason = @AddedReason, OrderDate = @OrderDate, Notes = @Notes, Total = @Total, ModifiedDate = @ModifiedDate, FinishedDate = @FinishedDate, TransactionCosts = @TransactionCosts, BankID = @BankID, Status = @Status, CouponText = @CouponText, CouponValue = @CouponValue WHERE OrderNo = @OrderNo

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_News]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_News]
(
	@NewsID INT,
	@CategoryID INT,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@SubTitle NVARCHAR(250) /*Must check to convert type*/,
	@ShowSubTitle BIT,
	@Summary NVARCHAR(250) /*Must check to convert type*/,
	@Detail NTEXT /*Must check to convert type*/,
	@Author NVARCHAR(250) /*Must check to convert type*/,
	@Source NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ImagePath NVARCHAR(250) /*Must check to convert type*/,
	@Hit INT,
	@ExpireDate DATETIME /*Must check to convert type*/,
	@Approved TINYINT,
	@ApprovedOn DATETIME /*Must check to convert type*/,
	@ApprovedBy NVARCHAR(250) /*Must check to convert type*/,
	@CreatedOn DATETIME /*Must check to convert type*/,
	@CreatedBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@DisplayAt NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE News SET CategoryID = @CategoryID, Title = @Title, SubTitle = @SubTitle, ShowSubTitle = @ShowSubTitle, Summary = @Summary, Detail = @Detail, Author = @Author, Source = @Source, IconPath = @IconPath, ImagePath = @ImagePath, Hit = @Hit, ExpireDate = @ExpireDate, Approved = @Approved, ApprovedOn = @ApprovedOn, ApprovedBy = @ApprovedBy, CreatedOn = @CreatedOn, CreatedBy = @CreatedBy, ModifiedOn = GETDATE(), ModifiedBy = @ModifiedBy, Status = @Status, DisplayAt = @DisplayAt WHERE NewsID = @NewsID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Nationals]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Nationals]
(
	@NationalID INT,
	@NationalName NVARCHAR(250) /*Must check to convert type*/,
	@NationalAdd NVARCHAR(250) /*Must check to convert type*/,
	@NationalPhone NVARCHAR(250) /*Must check to convert type*/,
	@NationalLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Nationals SET NationalName = @NationalName, NationalAdd = @NationalAdd, NationalPhone = @NationalPhone, NationalLogo = @NationalLogo, Status = @Status WHERE NationalID = @NationalID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Module]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Module]
(
	@ID INT,
	@NameModule NVARCHAR(250) /*Must check to convert type*/,
	@Type INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Module SET NameModule = @NameModule, Type = @Type WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Made]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Made]
(
	@MadeID INT,
	@MadeName NVARCHAR(250) /*Must check to convert type*/,
	@MadeCode NVARCHAR(250) /*Must check to convert type*/,
	@MadeLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Made SET MadeName = @MadeName, MadeCode = @MadeCode, MadeLogo = @MadeLogo, Status = @Status WHERE MadeID = @MadeID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Link]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Link]
(
	@HtmlBoxID INT,
	@HtmlBoxName NVARCHAR(50) /*Must check to convert type*/,
	@HtmlBoxContent NTEXT /*Must check to convert type*/,
	@LinkImage NVARCHAR(150) /*Must check to convert type*/,
	@Link NVARCHAR(250) /*Must check to convert type*/
	)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE HtmlBox SET HtmlBoxName = @HtmlBoxName,HtmlBoxContent = @HtmlBoxContent,LinkImage = @LinkImage,Link =@Link  WHERE HtmlBoxID = @HtmlBoxID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_HeadFooter]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_HeadFooter]
(
	@ID INT,
	@Type INT,
	@Contents ntext /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE HeadFooter SET  Contents = @Contents WHERE [Type] = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Color]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Color]
(
	@ColorID INT,
	@Colorname NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Color SET Colorname = @Colorname, IconPath = @IconPath, ShortDescription = @ShortDescription, LongDescription = @LongDescription, CreateOn = @CreateOn, CreateBy = @CreateBy, ModifiedOn = @ModifiedOn, ModifiedBy = @ModifiedBy, Status = @Status, Position = @Position WHERE ColorID = @ColorID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Category]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Category]
(
	@CategoryID INT,
	@CategoryName NVARCHAR(250) /*Must check to convert type*/,
	@DisplayType TINYINT,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ParentID INT,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@TreeDetech NVARCHAR(250) /*Must check to convert type*/,
	@OrderNo TINYINT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Category SET CategoryName = @CategoryName, DisplayType = @DisplayType, IconPath = @IconPath, ParentID = @ParentID, ShortDescription = @ShortDescription, LongDescription = @LongDescription, CreateOn = @CreateOn, CreateBy = @CreateBy, ModifiedOn = @ModifiedOn, ModifiedBy = @ModifiedBy, Status = @Status, TreeDetech = @TreeDetech, OrderNo = @OrderNo WHERE CategoryID = @CategoryID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_BankList]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_BankList]
(
	@BankID INT,
	@BankCode NVARCHAR(250) /*Must check to convert type*/,
	@BankName NVARCHAR(250) /*Must check to convert type*/,
	@TransValue DECIMAL(18,0) /*Must check to convert type*/,
	@TransRate DECIMAL(18,0) /*Must check to convert type*/,
	@Currency NVARCHAR(250) /*Must check to convert type*/,
	@CouponValue DECIMAL(18,0) /*Must check to convert type*/,
	@CouponRate DECIMAL(18,0) /*Must check to convert type*/,
	@CouponText NVARCHAR(250) /*Must check to convert type*/,
	@Logo NVARCHAR(250) /*Must check to convert type*/,
	@OrderNo INT,
	@Status TINYINT,
	@Provider NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE BankList SET BankCode = @BankCode, BankName = @BankName, TransValue = @TransValue, TransRate = @TransRate, Currency = @Currency, CouponValue = @CouponValue, CouponRate = @CouponRate, CouponText = @CouponText, Logo = @Logo, OrderNo = @OrderNo, Status = @Status, Provider = @Provider WHERE BankID = @BankID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Abount]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Abount]
(
	@AbountID INT,
	@AbountContent NTEXT /*Must check to convert type*/
	)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE dbo.Abount SET AbountContent = @AbountContent  WHERE AbountID = @AbountID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectSetting]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectSetting]
(
	@code NVARCHAR(50)	
)
AS
SELECT * FROM Setting s WHERE s.CodeSetting=@code
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_User]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_User]
AS
BEGIN
	SELECT * FROM [User]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Unit]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Unit]
AS
BEGIN
	SELECT * FROM Unit
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Trans]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Trans]
AS
BEGIN
	SELECT * FROM Trans
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Support]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Support]
AS
BEGIN
	SELECT * FROM Support
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Slider]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Slider]
AS
BEGIN
	SELECT * FROM Slider
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Size]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Size]
AS
BEGIN
	SELECT * FROM Size
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Setting]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Setting]
AS
BEGIN
	SELECT * FROM Setting
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Role]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Role]
AS
BEGIN
	SELECT * FROM Role
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectParent_Category]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectParent_Category] --30
(
	@NewID int
)
AS
BEGIN
	
	Declare @CateID int 
	Select @CateID = CategoryID from News where NewsID = @NewID
    SELECT TOP 1 *  FROM Category WHERE CategoryID = @CateID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectOther_News]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_SelectOther_News] 
	@NewsID int 
as
	Declare @CateTmp int 
	Select @CateTmp = CategoryID from News where NEWSID = @NewsID 
	Select Title , NewsID ,CategoryID from News where CategoryID = @CateTmp and NewsID <> @NewsID
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectConfigPayGate]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectConfigPayGate]
(
	@Bank NVARCHAR(50)
)
AS
SELECT * FROM BankList b WHERE LOWER(b.BankCode)=LOWER(@Bank)
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectCode_Bank]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_SelectCode_Bank]
(
	@bankcode varchar(5)
)
AS
BEGIN
	SELECT * FROM BankList b where b.BankCode = @bankcode
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectByUserName_User]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_SelectByUserName_User]
(
	@UserName VARCHAR(50)
)AS
BEGIN
	SELECT * FROM [User] WHERE LOWER(LTRIM(RTRIM(UserName))) = LOWER(LTRIM(RTRIM(@UserName)))
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAvail_Bank]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAvail_Bank]
AS
BEGIN
	SELECT * FROM BankList AS bl WHERE bl.[Status]=1 ORDER BY bl.OrderNo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Nationals]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Nationals]
AS
BEGIN
	SELECT * FROM Nationals
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Module]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Module]
AS
BEGIN
	SELECT * FROM Module
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Made]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Made]
AS
BEGIN
	SELECT * FROM Made
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Link]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Link]
AS
BEGIN
	SELECT * FROM dbo.HtmlBox
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_HeadFooter]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_HeadFooter]
AS
BEGIN
	SELECT * FROM HeadFooter
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Color]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Color]
AS
BEGIN
	SELECT * FROM Color
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Category]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Category]
AS
BEGIN
	SELECT * FROM Category
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_BankList]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_BankList]
AS
BEGIN
	SELECT * FROM BankList
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Abount]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Abount]
AS
BEGIN
	SELECT * FROM dbo.Abount
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_User]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_User]
(
	@UserName NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	SELECT * FROM [User] WHERE UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Unit]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Unit]
(
	@UnitID INT
)AS
BEGIN
	SELECT * FROM Unit WHERE UnitID = @UnitID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Trans]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Trans]
(
	@Vpc_Tran_ID BIGINT
)AS
BEGIN
	SELECT * FROM Trans WHERE Vpc_Tran_ID = @Vpc_Tran_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Support]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Support]
(
	@ID INT
)AS
BEGIN
	SELECT * FROM Support WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_SubCateMenu]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_SELECT_SubCateMenu] 
	@ParentID int 
as 
	Select CategoryID, CategoryName from Category where CategoryID <>0 and ParentID = @ParentID
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Slider_Top]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Slider_Top] --5
(
	@Top INT
)
AS
BEGIN

	SELECT TOP 5 * FROM  Slider ORDER BY SliderID DESC
 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Slider]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Slider]
(
	@SliderID INT
)AS
BEGIN
	SELECT *
	  FROM Slider WHERE SliderID = @SliderID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Size]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Size]
(
	@SizeID INT
)AS
BEGIN
	SELECT * FROM Size WHERE SizeID = @SizeID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Setting]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Setting]
(
	@ID INT
)AS
BEGIN
	SELECT * FROM Setting WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Role]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Role]
(
	@RoleID INT
)AS
BEGIN
	SELECT * FROM Role WHERE RoleID = @RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_PostByNews]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_PostByNews]
AS
BEGIN
	SELECT * FROM PostByNews
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_OrderItem]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_OrderItem]
AS
BEGIN
	SELECT * FROM OrderItem
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Order]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Order]
AS
BEGIN
	SELECT * FROM [Order] as o,[User] as u where o.Name = u.UserName and u.[Status]=1   order by o.OrderDate desc 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Product]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Product] 
(
	@ProductId INT
)AS
BEGIN
	SELECT *,c.CategoryName,p2.ProviderName  
	  FROM Product p INNER JOIN Category c ON p.ProductType=c.CategoryID INNER JOIN Provider p2 ON p.MadeBy=p2.ID WHERE p.ProductId = @ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_PostByNews]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_PostByNews]
(
	@ID INT
)AS
BEGIN
	SELECT * FROM PostByNews WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_OrderItem_Vew]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Select_OrderItem_Vew]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	SELECT * FROM OrderItem WHERE OrderNo = @OrderNo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_OrderItem]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_OrderItem]
(
	@OrderItemID DECIMAL(18,0) /*Must check to convert type*/
)AS
BEGIN
	SELECT * FROM OrderItem WHERE OrderItemID = @OrderItemID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Order]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Order]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	SELECT * FROM [Order] WHERE OrderNo = @OrderNo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_One_News]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_One_News]
AS
	SELECT top 1 * FROM News WHERE [Status]=0 ORDER BY CreatedOn DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_News_Top6]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_News_Top6]
(
	@CategoryID INT
)AS
BEGIN
	SELECT * FROM News WHERE CategoryID = @CategoryID order by NewsID desc
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_News_Statut_Top]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_News_Statut_Top]
(
	@Statut INT
)AS
BEGIN
	SELECT TOP 2 * FROM News WHERE [Status] = @Statut AND Approved =1 order by NewsID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_News_Statut]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_News_Statut]
(
	@Statut INT
)AS
BEGIN
	SELECT * FROM News WHERE [Status] = @Statut order by NewsID ASC
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Select_News_Download]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Select_News_Download]
(
	@CategoryID INT
)AS
BEGIN
	SELECT * FROM News WHERE CategoryID = @CategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_News]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_News]
(
	@NewsID INT
)AS
BEGIN
	SELECT * FROM News WHERE NewsID = @NewsID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Nationals]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Nationals]
(
	@NationalID INT
)AS
BEGIN
	SELECT * FROM Nationals WHERE NationalID = @NationalID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Module]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Module]
(
	@ID INT
)AS
BEGIN
	SELECT * FROM Module WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Made]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Made]
(
	@MadeID INT
)AS
BEGIN
	SELECT * FROM Made WHERE MadeID = @MadeID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Link_Top]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Link_Top] --5
(
	@Top INT
)
AS
BEGIN

	SELECT TOP 5 * FROM  dbo.HtmlBox ORDER BY HtmlBoxID DESC
 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Link]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Link]
(
	@HtmlBoxID INT
)AS
BEGIN
	SELECT *
	  FROM dbo.HtmlBox WHERE HtmlBoxID = @HtmlBoxID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_HeadFooter]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_HeadFooter]
(
	@ID INT
)AS
BEGIN
	SELECT TOP 1 * FROM HeadFooter WHERE [Type]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Color]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Color]
(
	@ColorID INT
)AS
BEGIN
	SELECT * FROM Color WHERE ColorID = @ColorID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_CATPARENT]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SELECT_CATPARENT] --21
	@CateID int 
as
	Declare @ParentID int

	Select @ParentID = ParentID from Category where CategoryID = @CateID 
	
	if(@ParentID = 0)
		SELECT    cate.CategoryID, 
				  cate.CategoryName, 
				  cate.DisplayType, 
				  cate.IconPath, 
				  cate.ParentID, 
				  cate.ShortDescription, 
				  cate.LongDescription, 
				  cate.CreateOn, 
				  cate.CreateBy, 
				  cate.ModifiedOn, 
				  cate.ModifiedBy, 
				  cate.Status, 
				  cate.OrderNo
		FROM         dbo.Category cate
		WHERE    cate.CategoryID = @CateID
	else
		SELECT    cate.CategoryID, 
				  cate.CategoryName, 
				  cate.DisplayType, 
				  cate.IconPath, 
				  cate.ParentID, 
				  cate.ShortDescription, 
				  cate.LongDescription, 
				  cate.CreateOn, 
				  cate.CreateBy, 
				  cate.ModifiedOn, 
				  cate.ModifiedBy, 
				  cate.Status, 
				  cate.OrderNo
		FROM         dbo.Category cate
		WHERE    cate.CategoryID = @CateID
				 or cate.CategoryID = (Select CategoryID from Category where CategoryID = @ParentID)
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Category_Product]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Category_Product]
AS
BEGIN
	SELECT * FROM Category c WHERE c.[Status]=1 AND c.ParentID=0 ORDER BY OrderNo ASC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Category_News]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Category_News]
AS
BEGIN
	SELECT * FROM Category WHERE ParentID = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Category]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Category]
(
	@CategoryID INT
)AS
BEGIN
	SELECT * FROM Category WHERE CategoryID = @CategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_BankList]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_BankList]
(
	@BankID INT
)AS
BEGIN
	SELECT * FROM BankList WHERE BankID = @BankID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Abount]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Abount]
(
	@AbountID INT
)AS
BEGIN
	SELECT *
	  FROM dbo.Abount WHERE AbountID = @AbountID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Made]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Made]
(
	@MadeName NVARCHAR(250) /*Must check to convert type*/,
	@MadeCode NVARCHAR(250) /*Must check to convert type*/,
	@MadeLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
BEGIN
	INSERT INTO Made(MadeName, MadeCode, MadeLogo, Status) VALUES (@MadeName, @MadeCode, @MadeLogo, @Status)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Link]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Link]
(
	@HtmlBoxName NVARCHAR(50) /*Must check to convert type*/,
	@HtmlBoxContent NTEXT /*Must check to convert type*/,
	@LinkImage NVARCHAR(150) /*Must check to convert type*/,
	@Link NVARCHAR(250) /*Must check to convert type*/
	)AS
BEGIN
	INSERT INTO HtmlBox(HtmlBoxName, HtmlBoxContent, LinkImage, Link ) VALUES (@HtmlBoxName , @HtmlBoxContent, @LinkImage, @Link )
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_HeadFooter]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_HeadFooter]
(
	@Type INT,
	@Contents NTEXT /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO HeadFooter(Type, Contents) VALUES (@Type, @Contents)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Color]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Color]
(
	@Colorname NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
BEGIN
	INSERT INTO Color(Colorname, IconPath, ShortDescription, LongDescription, CreateOn, CreateBy, ModifiedOn, ModifiedBy, Status, Position) VALUES (@Colorname, @IconPath, @ShortDescription, @LongDescription, @CreateOn, @CreateBy, @ModifiedOn, @ModifiedBy, @Status, @Position)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Category]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Category]
(
	@CategoryName NVARCHAR(250) /*Must check to convert type*/,
	@DisplayType TINYINT,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ParentID INT,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@TreeDetech NVARCHAR(250) /*Must check to convert type*/,
	@OrderNo TINYINT
)AS
BEGIN
	INSERT INTO Category(CategoryName, DisplayType, IconPath, ParentID, ShortDescription, LongDescription, CreateOn, CreateBy, ModifiedOn, ModifiedBy, Status, TreeDetech, OrderNo) VALUES (@CategoryName, @DisplayType, @IconPath, @ParentID, @ShortDescription, @LongDescription, @CreateOn, @CreateBy, @ModifiedOn, @ModifiedBy, @Status, @TreeDetech, @OrderNo)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_BankList]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_BankList]
(
	@BankCode NVARCHAR(250) /*Must check to convert type*/,
	@BankName NVARCHAR(250) /*Must check to convert type*/,
	@TransValue DECIMAL(18,0) /*Must check to convert type*/,
	@TransRate DECIMAL(18,0) /*Must check to convert type*/,
	@Currency NVARCHAR(250) /*Must check to convert type*/,
	@CouponValue DECIMAL(18,0) /*Must check to convert type*/,
	@CouponRate DECIMAL(18,0) /*Must check to convert type*/,
	@CouponText NVARCHAR(250) /*Must check to convert type*/,
	@Logo NVARCHAR(250) /*Must check to convert type*/,
	@OrderNo INT,
	@Status TINYINT,
	@Provider NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO BankList(BankCode, BankName, TransValue, TransRate, Currency, CouponValue, CouponRate, CouponText, Logo, OrderNo, Status, Provider) VALUES (@BankCode, @BankName, @TransValue, @TransRate, @Currency, @CouponValue, @CouponRate, @CouponText, @Logo, @OrderNo, @Status, @Provider)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Abount]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Abount]
(

	@AbountContent NTEXT /*Must check to convert type*/

	)AS
BEGIN
	INSERT INTO  dbo.Abount
	        ( AbountContent )
	VALUES  ( @AbountContent
	          )
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenKey]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------- Created by Hoang Manh Hung.
--------  Created Date 20.08.2003
------- Purpose: Automatic create New ID keys

Create PROCEDURE [dbo].[SP_GenKey]  @NewKey varchar(20) OUTPUT, 
				    @TableName  char(8),
				    @StringKey1 varchar(20) ='', 
				    @StringKey2 varchar(20) ='',
				    @StringKey3 varchar(20)='', 
				    @OutputLen int = 10, 
				    @OutputOrder int = 3, 	   	--- 0 NSSS; 1 SNSS, 2 SSNS, 3 SSSN
				    @Seperated int =0, 
				    @Seperator char(1) ='-'  AS

Declare @KeyString varchar(20),
	@LastKey int,
	@LastKeyChar varchar(20),
	@LastKeyLen int,
	@SeperatorCount int,
	@KeyStringLen int,
	@StringNumber varchar(20),
	@Seperator1 varchar (1),
	@Seperator2 varchar (1),
	@Seperator3 varchar (1)


SET NOCOUNT ON

select @KeyString = @StringKey1 + @StringKey2 + @StringKey3

if exists (select  LastKey  from LASTKEY where TableName = @TableName and KeyString = @KeyString)

	begin
		select @LastKey  =LastKey + 1 
		from  LASTKEY 
		where TableName = @TableName and KeyString = @KeyString	
		update  LASTKEY set LastKey = @LastKey where TableName = @TableName and KeyString = @KeyString	
		
	end

else

	begin
		insert into  LASTKEY (TableName, KeyString, LastKey) VALUES (@TableName, @KeyString, 1)
		select @LastKey = 1	

	end
select @LastKeyChar = LTRIM(STR(@LastKey))
select @LastKeyLen  = LEN(@LastKeyChar)

if @Seperated = 0

begin
	select @SeperatorCount = 0
	select @Seperator =SPACE(0)
end

else

begin

	select @SeperatorCount = 0

	if LEN(@StringKey1) > 0 
		begin
			select @SeperatorCount = 1
			select @Seperator1 = @Seperator
		end
	else
		begin
			select @Seperator1 = SPACE(0)
		end

	if LEN(@StringKey2) > 0 
		begin
			select @SeperatorCount = @SeperatorCount + 1
			select @Seperator2 = @Seperator
	             end
	else
		begin
			select @Seperator2 = SPACE(0)
		end


	if LEN(@StringKey3) > 0 
		begin
			select @SeperatorCount = @SeperatorCount + 1
			select @Seperator3 = @Seperator
		end

	else
		begin
			select @Seperator3 = SPACE(0)
		end
end

select @StringNumber =   REPLICATE('0', @OutputLen - @LastKeyLen - @SeperatorCount  - LEN(@KeyString))  + @LastKeyChar
select @StringKey1 = LTRIM(UPPER(@StringKey1))
select @StringKey2 = LTRIM(UPPER(@StringKey2))
select @StringKey3 = LTRIM(UPPER(@StringKey3))

	Set 	@NewKey  = 
		(CASE @OutputOrder
			WHEN 3 THEN isnull(@StringKey1,'') + isnull(@Seperator1,'') + isnull(@StringKey2,'') + isnull(@Seperator2,'') + isnull(@StringKey3,'') + isnull(@Seperator3,'') + @StringNumber
			WHEN 1 THEN @StringKey1 +  isnull(@Seperator1,'') + @StringNumber +  isnull(@Seperator2,'') + @StringKey2 +isnull(@Seperator3 ,'')+ @StringKey3 
			WHEN 2 THEN @StringKey1 + isnull(@Seperator1,'') +  @StringKey2 + isnull(@Seperator2,'') + @StringNumber  + isnull(@Seperator3,'') + @StringKey3 
			WHEN 0 THEN @StringNumber + isnull(@Seperator1,'') + @StringKey1 +  isnull(@Seperator2 ,'')+  @StringKey2 + isnull( @Seperator3,'') + @StringKey3 
		 END)
--Select @NewKey  as NewKey

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_User]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_User]
(
	@UserName NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM [User] WHERE UserName = @UserName

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Unit]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Unit]
(
	@UnitID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Unit WHERE UnitID = @UnitID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Trans]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Trans]
(
	@Vpc_Tran_ID BIGINT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Trans WHERE Vpc_Tran_ID = @Vpc_Tran_ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Support]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Support]
(
	@ID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Support WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Slider]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Slider]
(
		@SliderID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Slider WHERE SliderID = @SliderID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Size]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Size]
(
	@SizeID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Size WHERE SizeID = @SizeID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Role]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Role]
(
	@RoleID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Role WHERE RoleID = @RoleID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_NewsPro]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NewsPro] 
(
	@Keyword NVARCHAR(350)	
)
AS
SELECT * FROM News n WHERE LOWER(n.Title) LIKE '%'+@Keyword+'%' OR LOWER(dbo.ufn_catdau(n.Title)) LIKE '%'+@Keyword+'%' OR n.Detail  LIKE '%'+@Keyword+'%' ORDER BY n.NewsID DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_User]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_User]
(
	@UserName NVARCHAR(250) /*Must check to convert type*/,
	@Password NVARCHAR(250) /*Must check to convert type*/,
	@FullName NVARCHAR(250) /*Must check to convert type*/,
	@Email NVARCHAR(250) /*Must check to convert type*/,
	@Mobile NVARCHAR(250) /*Must check to convert type*/,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@LastLogin DATETIME /*Must check to convert type*/,
	@CreatedDate DATETIME /*Must check to convert type*/,
	@CreatedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Adresss NVARCHAR(250) /*Must check to convert type*/,
	@Others NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO [User](UserName, Password, FullName, Email, Mobile, Title, LastLogin, CreatedDate, CreatedBy, Status, Adresss, Others) VALUES (@UserName, @Password, @FullName, @Email, @Mobile, @Title, @LastLogin, @CreatedDate, @CreatedBy, @Status, @Adresss, @Others)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Unit]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Unit]
(
	@Unitname NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
BEGIN
	INSERT INTO Unit(Unitname, IconPath, ShortDescription, LongDescription, CreateOn, CreateBy, ModifiedOn, ModifiedBy, Status, Position) VALUES (@Unitname, @IconPath, @ShortDescription, @LongDescription, @CreateOn, @CreateBy, @ModifiedOn, @ModifiedBy, @Status, @Position)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Trans]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Trans]
(
	@Vpc_MerchTxnRef NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_Merchant NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_OrderInfo NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_Amount DECIMAL(18,0) /*Must check to convert type*/,
	@Vpc_TicketNo NVARCHAR(250) /*Must check to convert type*/,
	@Vpc_TxnResponseCode INT,
	@Vpc_BankType NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO Trans(Vpc_MerchTxnRef, Vpc_Merchant, Vpc_OrderInfo, Vpc_Amount, Vpc_TicketNo, Vpc_Date,  Vpc_TxnResponseCode, Vpc_BankType) VALUES (@Vpc_MerchTxnRef, @Vpc_Merchant, @Vpc_OrderInfo, @Vpc_Amount, @Vpc_TicketNo, GETDATE(), @Vpc_TxnResponseCode, @Vpc_BankType)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Support]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Support]
(
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@Yahoo NVARCHAR(250) /*Must check to convert type*/,
	@Phone NVARCHAR(250) /*Must check to convert type*/,
	@Type INT
)AS
BEGIN
	INSERT INTO Support(Title, Yahoo, Phone, Type) VALUES (@Title, @Yahoo, @Phone, @Type)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Slider]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Slider]
(
	@SliderName NVARCHAR(150) /*Must check to convert type*/,
	@SliderContent NTEXT /*Must check to convert type*/,
	@SliderImage NVARCHAR(250) /*Must check to convert type*/,
	@SliderLink NVARCHAR(250) /*Must check to convert type*/,
	@SliderClass NVARCHAR(50)
	)AS
BEGIN
	INSERT INTO Slider(SliderName, SliderContent, SliderImage, SliderLink,SliderClass ) VALUES (@SliderName , @SliderContent, @SliderImage, @SliderLink,@SliderClass)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Size]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Size]
(
	@Sizename NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ShortDescription NVARCHAR(250) /*Must check to convert type*/,
	@LongDescription NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status INT,
	@Position INT
)AS
BEGIN
	INSERT INTO Size(Sizename, IconPath, ShortDescription, LongDescription, CreateOn, CreateBy, ModifiedOn, ModifiedBy, Status, Position) VALUES (@Sizename, @IconPath, @ShortDescription, @LongDescription, @CreateOn, @CreateBy, @ModifiedOn, @ModifiedBy, @Status, @Position)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Setting]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Setting]
(
	@CodeSetting NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@ValueSetting NVARCHAR(250) /*Must check to convert type*/,
	@Status BIT
)AS
BEGIN
	INSERT INTO Setting(CodeSetting, Description, ValueSetting, Status) VALUES (@CodeSetting, @Description, @ValueSetting, @Status)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Role]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Role]
(
	@Module NVARCHAR(250) /*Must check to convert type*/,
	@RoleName NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO Role(Module, RoleName, Description) VALUES (@Module, @RoleName, @Description)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_PostByNews]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_PostByNews]
(
	@NewsID INT,
	@PostContent NVARCHAR(250) /*Must check to convert type*/,
	@PostBy NVARCHAR(250) /*Must check to convert type*/,
	@CreatedDate DATETIME /*Must check to convert type*/,
	@ModifiedDate DATETIME /*Must check to convert type*/,
	@Status INT,
	@IsLock INT
)AS
BEGIN
	INSERT INTO PostByNews(NewsID, PostContent, PostBy, CreatedDate, ModifiedDate, Status, IsLock) VALUES (@NewsID, @PostContent, @PostBy, @CreatedDate, @ModifiedDate, @Status, @IsLock)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_OrderItem]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_OrderItem]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/,
	@ProductID INT,
	@Price DECIMAL(18,0) /*Must check to convert type*/,
	@Quanity INT
)AS
BEGIN
	INSERT INTO OrderItem(OrderNo, ProductID, Price, Quanity, CreateBy, CreateDate, [Status],  DeliveryOk) VALUES (@OrderNo, @ProductID, @Price, @Quanity, 'guest', GETDATE(), 0, 0)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Order]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Order]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/,
	@Name NVARCHAR(250) /*Must check to convert type*/,
	@Address NVARCHAR(250) /*Must check to convert type*/,
	@Sdt NVARCHAR(250) /*Must check to convert type*/,
	@Email NVARCHAR(250) /*Must check to convert type*/,
	@DiscountAmount DECIMAL(18,0) /*Must check to convert type*/,
	@DiscountReason NVARCHAR(250) /*Must check to convert type*/,
	@AddedAmount DECIMAL(18,0) /*Must check to convert type*/,
	@AddedReason NVARCHAR(250) /*Must check to convert type*/,
	@OrderDate DATETIME /*Must check to convert type*/,
	@Notes NVARCHAR(250) /*Must check to convert type*/,
	@Total DECIMAL(18,0) /*Must check to convert type*/,
	@ModifiedDate DATETIME /*Must check to convert type*/,
	@FinishedDate DATETIME /*Must check to convert type*/,
	@TransactionCosts DECIMAL(18,0) /*Must check to convert type*/,
	@BankID NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@CouponText NVARCHAR(250) /*Must check to convert type*/,
	@CouponValue DECIMAL(18,0) /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO [Order](OrderNo, Name, Address, Sdt, Email, DiscountAmount, DiscountReason, AddedAmount, AddedReason, OrderDate, Notes, Total, ModifiedDate, FinishedDate, TransactionCosts, BankID, Status, CouponText, CouponValue) VALUES (@OrderNo, @Name, @Address, @Sdt, @Email, @DiscountAmount, @DiscountReason, @AddedAmount, @AddedReason, @OrderDate, @Notes, @Total, @ModifiedDate, @FinishedDate, @TransactionCosts, @BankID, @Status, @CouponText, @CouponValue)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_News]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_News]
(
	@CategoryID INT,
	@Title NVARCHAR(250) /*Must check to convert type*/,
	@SubTitle NVARCHAR(250) /*Must check to convert type*/,
	@ShowSubTitle BIT,
	@Summary NVARCHAR(250) /*Must check to convert type*/,
	@Detail NTEXT /*Must check to convert type*/,
	@Author NVARCHAR(250) /*Must check to convert type*/,
	@Source NVARCHAR(250) /*Must check to convert type*/,
	@IconPath NVARCHAR(250) /*Must check to convert type*/,
	@ImagePath NVARCHAR(250) /*Must check to convert type*/,
	@Hit INT,
	@ExpireDate DATETIME /*Must check to convert type*/,
	@Approved TINYINT,
	@ApprovedOn DATETIME /*Must check to convert type*/,
	@ApprovedBy NVARCHAR(250) /*Must check to convert type*/,
	@CreatedOn DATETIME /*Must check to convert type*/,
	@CreatedBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@Status TINYINT,
	@DisplayAt NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	INSERT INTO News(CategoryID, Title, SubTitle, ShowSubTitle, Summary, Detail, Author, Source, IconPath, ImagePath, Hit, ExpireDate, Approved, ApprovedOn, ApprovedBy, CreatedOn, CreatedBy, ModifiedOn, ModifiedBy, Status, DisplayAt) VALUES (@CategoryID, @Title, @SubTitle, @ShowSubTitle, @Summary, @Detail, @Author, @Source, @IconPath, @ImagePath, @Hit, @ExpireDate, @Approved, @ApprovedOn, @ApprovedBy, GETDATE(), @CreatedBy, @ModifiedOn, @ModifiedBy, @Status, @DisplayAt)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Nationals]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Nationals]
(
	@NationalName NVARCHAR(250) /*Must check to convert type*/,
	@NationalAdd NVARCHAR(250) /*Must check to convert type*/,
	@NationalPhone NVARCHAR(250) /*Must check to convert type*/,
	@NationalLogo NVARCHAR(250) /*Must check to convert type*/,
	@Status INT
)AS
BEGIN
	INSERT INTO Nationals(NationalName, NationalAdd, NationalPhone, NationalLogo, Status) VALUES (@NationalName, @NationalAdd, @NationalPhone, @NationalLogo, @Status)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_PostByNews]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_PostByNews]
(
	@ID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM PostByNews WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_OrderItem]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_OrderItem]
(
	@OrderItemID DECIMAL(18,0) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM OrderItem WHERE OrderItemID = @OrderItemID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Order]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Order]
(
	@OrderNo NVARCHAR(250) /*Must check to convert type*/
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM [Order] WHERE OrderNo = @OrderNo

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_News]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_News]
(
	@NewsID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM News WHERE NewsID = @NewsID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Nationals]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Nationals]
(
	@NationalID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Nationals WHERE NationalID = @NationalID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Module]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Module]
(
	@ID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Module WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Made]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Made]
(
	@MadeID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Made WHERE MadeID = @MadeID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Link]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Link]
(
	@HtmlBoxID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM dbo.HtmlBox WHERE HtmlBoxID = @HtmlBoxID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_HeadFooter]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_HeadFooter]
(
	@ID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM HeadFooter WHERE ID = @ID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Color]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Color]
(
	@ColorID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Color WHERE ColorID = @ColorID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Category]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Category]
(
	@CategoryID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Category WHERE CategoryID = @CategoryID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_BankList]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_BankList]
(
	@BankID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM BankList WHERE BankID = @BankID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Abount]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Abount]
(
	@AbountID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM dbo.Abount WHERE AbountID = @AbountID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CateByParent]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CateByParent]
(
	@ParentId INT	
)
AS  
SELECT * FROM Category c WHERE c.ParentID=@ParentId
GO
/****** Object:  StoredProcedure [dbo].[CA_Select_Category]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CA_Select_Category]
(
	@PAR INT
)AS
BEGIN
	SELECT TOP 4 * FROM Category WHERE ParentID = @PAR
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/14/2019 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[ProductName] [nvarchar](250) NULL,
	[SubProductName] [nvarchar](250) NULL,
	[ProductImage] [nvarchar](250) NULL,
	[ProductCode] [nvarchar](50) NULL,
	[ProductMaterial] [nvarchar](250) NULL,
	[MadeID] [int] NULL,
	[ColorID] [int] NULL,
	[SizeID] [int] NULL,
	[UnitID] [int] NULL,
	[NationalID] [int] NULL,
	[ProductPrice] [money] NULL,
	[Discount] [money] NULL,
	[Warranty] [nvarchar](250) NULL,
	[ProductStatus] [nvarchar](150) NULL,
	[Vat] [nvarchar](150) NULL,
	[Description] [ntext] NULL,
	[ProductImageList] [nvarchar](500) NULL,
	[CreateOn] [datetime] NULL,
	[CreateBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
	[QuantityBy] [smallint] NULL,
	[HaveOk] [int] NULL,
	[Status] [int] NULL,
	[ShowOk] [int] NULL,
	[TopOk] [int] NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (61, 124, N'GÔM PENTEL H.03', N'GÔM PENTEL H.03', N'20190901/gom-pentel-H03.jpg', N'0112', N'nhat', 2, 2, 1, 5, 1, 12000.0000, 1000.0000, N'1', N'còn hàng', NULL, N'<h4 class="product-name" style="box-sizing: border-box; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin: 0px; font-size: 18px; padding: 0px; outline: 0px; text-align: center; height: 40px;"><a href=', N'20190901/gom-pentel-H03.jpg|', NULL, NULL, CAST(0x0000AABB0092056E AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 5)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (62, 124, N'XÓA KÉO MINI PLUS', N'XÓA KÉO MINI PLUS', N'20190901/xoa-keo-mini-plus.jpg', N'0112', N'nhat', 1, 1, 1, 4, 4, 15000.0000, 1500.0000, N'1', N'còn hàng', NULL, N'<h4 class="product-name" style="box-sizing: border-box; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin: 0px; font-size: 18px; padding: 0px; outline: 0px; text-align: center; height: 40px;"><a href=', N'20190901/xoa-keo-mini-plus.jpg|', NULL, NULL, CAST(0x0000AABB0092B1D9 AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 2)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (63, 124, N'BÚT XÓA NƯỚC THIÊN LONG CP-01', N'BÚT XÓA NƯỚC THIÊN LONG CP-01', N'20190901/but-xoa-nuoc-thien-long-cp-02.jpg', N'0112', N'nhat', 4, 2, 2, 5, 3, 20000.0000, 1000.0000, N'1', N'còn hàn', NULL, N'<h4 class="product-name" style="box-sizing: border-box; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin: 0px; font-size: 18px; padding: 0px; outline: 0px; text-align: center; height: 40px;"><a href=', N'20190901/but-xoa-nuoc-thien-long-cp-02.jpg|', NULL, NULL, CAST(0x0000AABB00914951 AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 3)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (77, 71, N'Card case A4', N'Card case A4', N'20190831/card-case-a4.jpg', N'0112', N'nhat', 5, 2, 2, 5, 3, 15000.0000, 1000.0000, N'1', N'còn hàn', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a title="Card case A4" href="http://phuongvucorp.com/card-case-a4.html">Card case A4</a></h4>', N'20190831/card-case-a4.jpg|', NULL, NULL, CAST(0x0000AABA017D051C AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 4)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (78, 71, N'Bảng tên dẻo 9,5x13,5 - bảng tên hội nghị', N'Bảng tên dẻo 9,5x13,5 - bảng tên hội nghị', N'20190831/bang-ten-hoi-nghi-13.5x9.5.jpg', N'0112', N'nhat', 2, 4, 2, 5, 1, 15000.0000, 1500.0000, N'1', N'còn hàn', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a title="Bảng t&ecirc;n dẻo 9,5x13,5 - bảng t&ecirc;n hội nghị" href="http://phuongvucorp.com/bang-ten-deo-95x135-bang-ten-hoi-nghi.html">Bảng t&ecirc;n dẻo 9,5x13,5 - bảng t&ecirc;n hội nghị</a></h4>', N'20190831/bang-ten-hoi-nghi-13.5x9.5.jpg|', NULL, NULL, CAST(0x0000AABA017C1432 AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 5)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (79, 71, N'Bìa hồ sơ xin việc màu A4', N'Bìa hồ sơ xin việc màu A4', N'20190831/bia-ho-so-xin-viec-mau.jpg', N'0112', N'nhat', 2, 1, 2, 5, 3, 24000.0000, 1000.0000, N'1', N'còn hàn', NULL, NULL, N'20190831/bia-ho-so-xin-viec-mau.jpg|', NULL, NULL, CAST(0x0000AABA017AF1C8 AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 6)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (120, 70, N'Giấy A4 IK Plus 80 Gsm', NULL, N'20190831/giay-a4-ik-plus-80.jpg', N'0112', N'nhat', 1, 1, 1, 5, 3, 100000.0000, 50000.0000, N'1', N'còn hàn', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a title="Giấy A4 IK Plus 80 Gsm" href="http://phuongvucorp.com/giay-a4-ik-plus-80-gsm.html">Giấy A4 IK Plus 80 Gsm</a></h4>', N'20150916/201422822595085011537.jpg|20150916/201594927183511537.jpg|20150916/20159108515644011537.jpg|20190831/giay-a4-ik-plus-80.jpg|', NULL, NULL, CAST(0x0000AABA016E18C4 AS DateTime), NULL, NULL, NULL, NULL, 1, 1, 4)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (121, 70, N'Giấy Tommy mũi tên (10 miếng/xấp)', N'Giấy Tommy mũi tên (10 miếng/xấp)', N'20190831/giay-tommy-mui-ten.jpg', N'01', N'nhat', 1, 2, 1, 6, 3, 100000.0000, 10000.0000, N'1', N'còn hàng', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a href="http://phuongvucorp.com/giay-tommy-mui-ten-10-mieng-xap-.html" title="Giấy Tommy mũi t&ecirc;n (10 miếng/xấp)">Giấy Tommy mũi t&ecirc;n (10 miếng/xấp)</a></h4>', N'20150916/201422822595085011537.jpg|20150916/201594927183511537.jpg|20150916/20159108515644011537.jpg|20190831/giay-tommy-mui-ten.jpg|', NULL, NULL, CAST(0x0000AABA016E8DC6 AS DateTime), NULL, NULL, NULL, NULL, 1, 1, 56)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (122, 70, N'Giấy bấm giá màu Saiko', N'Giấy bấm giá màu Saiko', N'20190831/giay-bam-gia-mau-saiko.jpg', N'0112', N'nhat', 1, 1, 1, 4, 3, 120000.0000, 10000.0000, N'1', N'còn hàn', NULL, N'<h4 class="product-name"><a href="http://phuongvucorp.com/giay-bam-gia-mau-saiko.html" title="Giấy bấm gi&aacute; m&agrave;u Saiko">Giấy bấm gi&aacute; m&agrave;u Saiko</a></h4>', N'20150916/201422822595085011537.jpg|20150916/201594927183511537.jpg|20150916/20159108515644011537.jpg|20190831/giay-bam-gia-mau-saiko.jpg|', NULL, NULL, CAST(0x0000AABA016EE81D AS DateTime), NULL, NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (123, 70, N'Giấy bấm giá trắng Saiko', NULL, N'20190831/Giay-bam-gia-trang.jpg', N'0112', N'Trung quốc', 1, 1, 1, 5, 3, 100000.0000, 10000.0000, N'1', N'còn hàn', NULL, N'<h1 itemprop="name">Giấy bấm gi&aacute; trắng Saiko</h1>', N'20150916/201422822595085011537.jpg|20150916/201594927183511537.jpg|20150916/20159108515644011537.jpg|20190831/Giay-bam-gia-trang.jpg|', NULL, NULL, CAST(0x0000AABA016F3A6B AS DateTime), NULL, NULL, NULL, NULL, 1, 1, 4)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (129, 70, N'Giấy note vàng 3x5 Pronoti 7,6cmx12,7cm', N'Giấy note vàng 3x5 Pronoti 7,6cmx12,7cm', N'20190831/12365.jpg', N'1234', N'gõ', 1, 1, 2, 5, 3, 100000.0000, 10000.0000, N'12', N'con', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a href="http://phuongvucorp.com/giay-note-vang-3x5-pronoti-76cmx127cm.html" title="Giấy note v&agrave;ng 3x5 Pronoti 7,6cmx12,7cm">Giấy note v&agrave;ng 3x5 Pronoti 7,6cmx12,7cm</a></h4>', N'20190831/12365.jpg|', CAST(0x0000AABA01710361 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (130, 79, N'Khắc dấu theo yêu cầu', N'Khắc dấu theo yêu cầu', N'20190831/khac-dau-theo-yeu-cau.jpg', N'dc123', N'gõ', 1, 1, 2, 5, 3, 1200000.0000, 120000.0000, N'12', N'con', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a href="http://phuongvucorp.com/khac-dau-theo-yeu-cau.html" title="Khắc dấu theo y&ecirc;u cầu">Khắc dấu theo y&ecirc;u cầu</a></h4>', N'20190831/khac-dau-theo-yeu-cau.jpg|', CAST(0x0000AABA0171D10E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (131, 81, N'Cắt băng keo cầm tay 5P nhựa', N'Cắt băng keo cầm tay 5P nhựa', N'20190831/cat-keo-cam-tay-6p.jpg', N'abc1', N'nhựa', 1, 1, 2, 5, 3, 13800.0000, 1000.0000, N'1', N'còn', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a href="http://phuongvucorp.com/cat-bang-keo-cam-tay-5p-nhua.html" title="Cắt băng keo cầm tay 5P nhựa">Cắt băng keo cầm tay 5P nhựa</a></h4>', N'20190831/cat-keo-cam-tay-6p.jpg|', CAST(0x0000AABA01773F7D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (132, 71, N'BÌA NHỰA 2 KẸP A4 XIFU', N'BÌA NHỰA 2 KẸP A4 XIFU', N'20190831/BIA_NHUA_2_KEP_A4_XIFU.jpg', N'a12', N'nhựa', 2, 2, 2, 5, 3, 13200.0000, 1320.0000, N'1', N'còn', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a href="http://phuongvucorp.com/bia-nhua-2-kep-a4-xifu-1.html" title="B&Igrave;A NHỰA 2 KẸP A4 XIFU">B&Igrave;A NHỰA 2 KẸP A4 XIFU</a></h4>', N'20190831/BIA_NHUA_2_KEP_A4_XIFU.jpg|', CAST(0x0000AABA0178E6BD AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 7)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (133, 71, N'Chặn sách trung M&T loại 1', N'Chặn sách trung M&T loại 1', N'20190831/chan-sach-mt.jpg', N'15', N'nhựa', 2, 1, 2, 5, 4, 58800.0000, 5800.0000, N'1', N'còn', NULL, N'<p>&nbsp;</p>
<h4 class="product-name"><a href="http://phuongvucorp.com/chan-sach-trung-m-t-loai-1.html" title="Chặn s&aacute;ch trung M&amp;T loại 1">Chặn s&aacute;ch trung M&amp;T loại 1</a></h4>', N'20190831/chan-sach-mt.jpg|', CAST(0x0000AABA01798111 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 8)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (134, 81, N'SÚNG BẮN KEO NHỎ', N'SÚNG BẮN KEO NHỎ', N'20190904/sung-ban-keo-nho.jpg', N'123', N'nhựa', 2, 1, 2, 1, 3, 32400.0000, 1000.0000, N'1', N'còn hàng', NULL, N'<p style="text-align: center;">&nbsp;<img src="/userfiles/image/12qas.jpg" width="267" height="189" alt="" /></p>', N'20190904/sung-ban-keo-nho.jpg|', NULL, NULL, CAST(0x0000AAC200B849A5 AS DateTime), NULL, NULL, NULL, NULL, 1, 0, 9)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (135, 81, N'băng keo', N'băng keo', N'20191010/giay-cuon-fo-k75.jpg', N'111', N'nhựa', 1, 2, 2, 5, 1, 20000.0000, 10000.0000, N'1', N'còn hàng', NULL, N'<p>&nbsp;băng keo</p>', N'20191010/giay-cuon-fo-k75.jpg|', CAST(0x0000AAE200F85E63 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [SubProductName], [ProductImage], [ProductCode], [ProductMaterial], [MadeID], [ColorID], [SizeID], [UnitID], [NationalID], [ProductPrice], [Discount], [Warranty], [ProductStatus], [Vat], [Description], [ProductImageList], [CreateOn], [CreateBy], [ModifiedOn], [ModifiedBy], [QuantityBy], [HaveOk], [Status], [ShowOk], [TopOk], [Count]) VALUES (136, 81, N'Thước kẻ mica Kewen 20cm', N'Thước kẻ mica Kewen 20cm', N'20191010/thuoc-ke-mica-kewen-20cm.jpg', N'222', N'nhựa', 2, 2, 2, 5, 1, 22200.0000, 1000.0000, N'12', N'còn hàng', NULL, N'<p>&nbsp;</p>
<h4 class="product-name" style="box-sizing: border-box; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin: 0px; font-size: 18px; padding: 0px; outline: 0px; text-align: center; height: ', N'20191010/thuoc-ke-mica-kewen-20cm.jpg|', CAST(0x0000AAE20131F970 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 100)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  UserDefinedFunction [dbo].[Category_GetParents]    Script Date: 10/14/2019 15:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Category_GetParents]
(
	@CategoryId INT	
)
RETURNS @Parent TABLE 
(
	internalId int IDENTITY(1,1) NOT NULL,
	categoryId INT NOT NULL
)
AS
BEGIN
	DECLARE @ParentId INT
	SET @ParentId = @CategoryId

	WHILE (@ParentId IS NOT NULL)
	BEGIN
		SELECT	@ParentId = parentId
		FROM	Category
		WHERE	categoryId = @ParentId

		IF (@@ROWCOUNT = 0)
			BREAK

		IF (@ParentId IS NOT NULL)
			INSERT INTO @Parent
			SELECT @ParentId
	END

	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[Category_GetParentFullPath]    Script Date: 10/14/2019 15:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[Category_GetParentFullPath]
(
	@CategoryId INT
)
RETURNS NVARCHAR(256)
AS
BEGIN
	DECLARE @ParentFullPath NVARCHAR(256)
	SET @ParentFullPath = N''

	SELECT	@ParentFullPath = @ParentFullPath + c.Categoryname + N'>'
	FROM	Category_GetParents(@CategoryId) p
	JOIN	Category c
			ON c.categoryId = p.categoryId
	ORDER BY p.internalId DESC
	
	-- remove tailing /
	IF (LEN(@ParentFullPath) > 0)
		SET @ParentFullPath = LEFT(@ParentFullPath, LEN(@ParentFullPath))
	RETURN @ParentFullPath
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Products]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Products]
(
	@CategoryID INT,
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@SubProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeID INT,
	@ColorID INT,
	@SizeID INT,
	@UnitID INT,
	@NationalID INT,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Discount DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus NVARCHAR(250) /*Must check to convert type*/,
	@Vat NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@ProductImageList NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@QuantityBy SMALLINT,
	@HaveOk INT,
	@Status INT,
	@ShowOk INT,
	@TopOk INT,
	@Count INT
)AS
BEGIN
	INSERT INTO Products(CategoryID, ProductName, SubProductName, ProductImage, ProductCode, ProductMaterial, MadeID, ColorID, SizeID, UnitID, NationalID, ProductPrice, Discount, Warranty, ProductStatus, Vat, Description, ProductImageList, CreateOn, CreateBy, ModifiedOn, ModifiedBy, QuantityBy, HaveOk, Status, ShowOk, TopOk, Count) VALUES (@CategoryID, @ProductName, @SubProductName, @ProductImage, @ProductCode, @ProductMaterial, @MadeID, @ColorID, @SizeID, @UnitID, @NationalID, @ProductPrice, @Discount, @Warranty, @ProductStatus, @Vat, @Description, @ProductImageList, GETDATE(), @CreateBy, @ModifiedOn, @ModifiedBy, @QuantityBy, @HaveOk, @Status, @ShowOk, @TopOk, @Count)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Products]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Products]
(
	@ProductID INT
)AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Products WHERE ProductID = @ProductID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Module]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Read again all script and modified them to complete SP you like!

CREATE PROCEDURE [dbo].[SP_Insert_Module] 
(
	@NameModule NVARCHAR(250) /*Must check to convert type*/,
	@Type INT
	)AS
BEGIN
	DECLARE @Category INT, @status INT
	DECLARE @typex NVARCHAR(30),@Url VARCHAR(30)
	IF @Type=1
	BEGIN
		SET @typex=N'Sản phẩm'
		set @status=0
	END
	ELSE
		BEGIN
			SET @typex=N'Tin tức'
			SET @status=1
		END
		EXECUTE dbo.SP_Insert_Category @NameModule,0,NULL,0,@typex,NULL,NULL,'admin',NULL,NULL,2,NULL,1
	SET @Category=(SELECT TOP 1 c.CategoryID FROM Category c ORDER BY c.CategoryID DESC)
	INSERT INTO Module(Category, NameModule, [Type], [Target]) VALUES (@Category, @NameModule, @Type, 1)
	RETURN SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchPro_Ma]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_SearchPro_Ma] 
(
	@Keyword NVARCHAR(350)	
)
AS
SELECT * FROM Products p WHERE LOWER(p.ProductCode) LIKE '%'+@Keyword+'%' OR LOWER(dbo.ufn_catdau(p.ProductCode)) LIKE '%'+@Keyword+'%' ORDER BY p.ProductId DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchPro]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SearchPro] 
(
	@Keyword NVARCHAR(350)	
)
AS
SELECT * FROM Products p WHERE LOWER(p.ProductName) LIKE '%'+@Keyword+'%' OR LOWER(dbo.ufn_catdau(p.ProductName)) LIKE '%'+@Keyword+'%' ORDER BY p.ProductId DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Products]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_Products]
(
	@ProductID INT
)AS
BEGIN
	SELECT * FROM Products WHERE ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectProductOther]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectProductOther]
(
	@ProID INT 
)
AS
DECLARE @cate INT 
SET @cate=(SELECT n.CategoryID FROM Products n WHERE n.ProductId=@ProID)
SELECT TOP 4 * FROM Products WHERE ProductId!=@ProID AND CategoryID=@cate ORDER BY NEWID()
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectProByCateDaotv]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectProByCateDaotv] 
(
	@CateID INT	
)
AS
BEGIN
DECLARE @Part INT 
SET @Part = (SELECT ParentID FROM Category WHERE CategoryID = @CateID )
if(@Part=0)
     Select  *
		FROM Products n, Category c where 
		c.CategoryID in 
		(Select v.CategoryID FROM Category as v where v.ParentID in (Select u.CategoryID from Category as u where u.CategoryID = @CateID  OR u.parentID =@CateID)OR v.CategoryID =@CateID)
		and n.CategoryID = c.CategoryID  Order by n.CreateOn DESC
    else
     Select  * FROM Products where CategoryID = @CateID 	
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectProByCate]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectProByCate] 
(
	@CateID INT	
)
AS
BEGIN
    Declare @ParentID1 int
    SET @ParentID1=(Select  ParentID from Category where CategoryID = @CateID)
	if(@ParentID1=0)
     Select Top 5 *
		FROM Products n, Category c where 
		c.CategoryID in 
		(Select v.CategoryID FROM Category as v where v.ParentID in (Select u.CategoryID from Category as u where u.CategoryID = @CateID  OR u.parentID =@CateID)OR v.CategoryID =@CateID)
		and n.CategoryID = c.CategoryID and n.ShowOk =1 Order by n.CreateOn DESC
    else
     Select top 5 * FROM Products where CategoryID = @CateID and ShowOk =1		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAllByTop_Products]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAllByTop_Products]
AS
BEGIN
	SELECT TOP 5 * FROM Products  Where  TopOk = 1 ORDER BY CreateOn DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Products_Count]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Products_Count]
(
	@ProductID INT,
	@CategoryID INT,
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@SubProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeID INT,
	@ColorID INT,
	@SizeID INT,
	@UnitID INT,
	@NationalID INT,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Discount DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus NVARCHAR(250) /*Must check to convert type*/,
	@Vat NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@ProductImageList NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@QuantityBy SMALLINT,
	@HaveOk INT,
	@Status INT,
	@ShowOk INT,
	@TopOk INT,
	@Count INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Products SET Count = @Count WHERE ProductID = @ProductID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Products]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Products]
(
	@ProductID INT,
	@CategoryID INT,
	@ProductName NVARCHAR(250) /*Must check to convert type*/,
	@SubProductName NVARCHAR(250) /*Must check to convert type*/,
	@ProductImage NVARCHAR(250) /*Must check to convert type*/,
	@ProductCode NVARCHAR(250) /*Must check to convert type*/,
	@ProductMaterial NVARCHAR(250) /*Must check to convert type*/,
	@MadeID INT,
	@ColorID INT,
	@SizeID INT,
	@UnitID INT,
	@NationalID INT,
	@ProductPrice DECIMAL(18,0) /*Must check to convert type*/,
	@Discount DECIMAL(18,0) /*Must check to convert type*/,
	@Warranty NVARCHAR(250) /*Must check to convert type*/,
	@ProductStatus NVARCHAR(250) /*Must check to convert type*/,
	@Vat NVARCHAR(250) /*Must check to convert type*/,
	@Description NVARCHAR(250) /*Must check to convert type*/,
	@ProductImageList NVARCHAR(250) /*Must check to convert type*/,
	@CreateOn DATETIME /*Must check to convert type*/,
	@CreateBy NVARCHAR(250) /*Must check to convert type*/,
	@ModifiedOn DATETIME /*Must check to convert type*/,
	@ModifiedBy NVARCHAR(250) /*Must check to convert type*/,
	@QuantityBy SMALLINT,
	@HaveOk INT,
	@Status INT,
	@ShowOk INT,
	@TopOk INT,
	@Count INT
)AS
BEGIN
	BEGIN TRANSACTION
	UPDATE Products SET CategoryID = @CategoryID, ProductName = @ProductName, SubProductName = @SubProductName, ProductImage = @ProductImage, ProductCode = @ProductCode, ProductMaterial = @ProductMaterial, MadeID = @MadeID, ColorID = @ColorID, SizeID = @SizeID, UnitID = @UnitID, NationalID = @NationalID, ProductPrice = @ProductPrice, Discount = @Discount, Warranty = @Warranty, ProductStatus = @ProductStatus, Vat = @Vat, Description = @Description, ProductImageList = @ProductImageList, CreateOn = @CreateOn, CreateBy = @CreateBy, ModifiedOn = GETDATE(), ModifiedBy = @ModifiedBy, QuantityBy = @QuantityBy, HaveOk = @HaveOk, Status = @Status, ShowOk = @ShowOk, TopOk = @TopOk, Count = @Count WHERE ProductID = @ProductID

	IF (@@ERROR <> '')
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAllByTypeAndParent_Category]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAllByTypeAndParent_Category] --0
(
	@ParentID INT,
	@Status INT 
)
AS
BEGIN
	SELECT *,(dbo.Category_GetParentFullPath(CategoryID) + CategoryName) AS FullPath 
	FROM Category WHERE ParentID = @ParentID AND [Status]=@Status ORDER BY OrderNo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAllCateByStatus]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAllCateByStatus] 
(
	@Status INT 
)
AS
SELECT *,(dbo.Category_GetParentFullPath(CategoryID) + CategoryName) AS FullPath FROM Category c WHERE c.[Status]=@Status and c.ParentID<>c.CategoryID ORDER BY FullPath
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_Products]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_Products]
AS
BEGIN
	SELECT * ,(SELECT NationalName FROM Nationals AS n WHERE N.NationalID = P.NationalID)as NationalName ,(SELECT MadeName FROM Made AS M WHERE M.MadeID = P.MadeID)as MadeName,(Select (dbo.Category_GetParentFullPath(CategoryID) + CategoryName) From Category AS C Where C.CategoryID = P.CategoryID)AS CategoryName FROM Products as P ORDER BY P.CreateOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_News_Other]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_News_Other]
AS
BEGIN
		SELECT *, 'CategoryName' = (Select (dbo.Category_GetParentFullPath(CategoryID) + CategoryName) 
	From Category AS B Where A.CategoryID = B.CategoryID and Status = 2) FROM News AS A WHERE A.Status =2
	order by CreatedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_News_Noi]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_News_Noi]
AS
BEGIN
		SELECT *, 'CategoryName' = (Select (dbo.Category_GetParentFullPath(CategoryID) + CategoryName) 
	From Category AS B Where A.CategoryID = B.CategoryID and Status = 0) FROM News AS A WHERE A.Status =0
	order by CreatedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_News_News]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_News_News]
AS
BEGIN
		SELECT *, 'CategoryName' = (Select (dbo.Category_GetParentFullPath(CategoryID) + CategoryName) 
	From Category AS B Where A.CategoryID = B.CategoryID and Status = 0) FROM News AS A WHERE A.Status =0
	order by CreatedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_News_Cus]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_News_Cus]
AS
BEGIN
		SELECT *, 'CategoryName' = (Select (dbo.Category_GetParentFullPath(CategoryID) + CategoryName) 
	From Category AS B Where A.CategoryID = B.CategoryID and Status = 3) FROM News AS A WHERE A.Status =3
	order by CreatedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAll_News]    Script Date: 10/14/2019 15:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectAll_News]
AS
BEGIN
		SELECT *, 'CategoryName' = (Select (dbo.Category_GetParentFullPath(CategoryID) + CategoryName) 
	From Category AS B Where A.CategoryID = B.CategoryID and Status = 0) FROM News AS A
	order by CreatedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Pro]    Script Date: 10/14/2019 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Pro]
AS
SELECT *,(dbo.Category_GetParentFullPath(CategoryID) + CategoryName) AS FullPath FROM Category c WHERE c.[Status]<>0 AND  c.ParentID<>c.CategoryID ORDER BY FullPath
GO
/****** Object:  Default [DF_BankList_OrderNo]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[BankList] ADD  CONSTRAINT [DF_BankList_OrderNo]  DEFAULT ((0)) FOR [OrderNo]
GO
/****** Object:  Default [DF_Category_DisplayType]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayType]  DEFAULT ((0)) FOR [DisplayType]
GO
/****** Object:  Default [DF_eShopCategory_CreateOn]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_eShopCategory_CreateOn]  DEFAULT (getdate()) FOR [CreateOn]
GO
/****** Object:  Default [DF_eShopCategory_ModifiedOn]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_eShopCategory_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  Default [DF_Category_Status]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Category_OrderNo]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_OrderNo]  DEFAULT ((0)) FOR [OrderNo]
GO
/****** Object:  Default [DF_News_ShowSubTitle]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_ShowSubTitle]  DEFAULT ((1)) FOR [ShowSubTitle]
GO
/****** Object:  Default [DF_News_Hit]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Hit]  DEFAULT ((0)) FOR [Hit]
GO
/****** Object:  Default [DF_News_Approved]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Approved]  DEFAULT ((0)) FOR [Approved]
GO
/****** Object:  Default [DF_eShopContent_CreateOn]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_eShopContent_CreateOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_eShopContent_ModifiedOn]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_eShopContent_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  Default [DF_News_Status]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Order_OrderDate]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
/****** Object:  Default [DF_Order_ModifiedDate]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Order_FinishedDate]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_FinishedDate]  DEFAULT (getdate()) FOR [FinishedDate]
GO
/****** Object:  Default [DF_Product_ProductPrice]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_ProductPrice]  DEFAULT ((0)) FOR [ProductPrice]
GO
/****** Object:  Default [DF_Product_ShowOk]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_ShowOk]  DEFAULT ((0)) FOR [ShowOk]
GO
/****** Object:  Default [DF_Product_TopOk]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_TopOk]  DEFAULT ((0)) FOR [TopOk]
GO
/****** Object:  Default [DF_User_Status]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((0)) FOR [Title]
GO
/****** Object:  Default [DF_eShopUsers_LastLoginDate]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_eShopUsers_LastLoginDate]  DEFAULT (getdate()) FOR [LastLogin]
GO
/****** Object:  Default [DF_eShopUsers_CreateDate]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_eShopUsers_CreateDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_UserGroupRole_Permited]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserGroupRole_Permited]  DEFAULT ((1)) FOR [Permited]
GO
/****** Object:  ForeignKey [FK_Products_Category]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
/****** Object:  ForeignKey [FK_Products_Color]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Color]
GO
/****** Object:  ForeignKey [FK_Products_Size]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Size]
GO
/****** Object:  ForeignKey [FK_Products_Unit]    Script Date: 10/14/2019 15:05:01 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Unit]
GO
