USE [ProductManagement]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[logo] [varchar](50) NULL DEFAULT ('brand.png'),
	[manufacturer] [nvarchar](50) NULL,
	[description] [ntext] NULL,
	[disable] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [ntext] NULL,
	[disable] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_time] [datetime] NULL DEFAULT (getdate()),
	[payment_time] [datetime] NULL DEFAULT ('01/01/1970 00:00:00'),
	[amount] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[purchased_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [ntext] NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[image] [varchar](50) NULL DEFAULT ('product.png'),
	[date_added] [datetime] NULL DEFAULT (getdate()),
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
	[disable] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: Tue 01 19 21 10:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'admin', N'123')
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'admin2', N'123')
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (1, N'brand 1', N'tesla.png', N'made in china', N'description', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (2, N'brand 2', N'tesla.png', N'made in vietnam', N'description', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (3, N'brand 3', N'brand 3.png', N'made in vietnam', N'perfect quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (4, N'brand 6', N'brand 6.png', N'made in china', N'very bad quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (6, N'brand 25', N'a.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (7, N'brand 8', N'brand.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (8, N'brand 9', N'brand.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (9, N'brand 10', N'brand.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (10, N'brand 11', N'brand.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (11, N'brand 12', N'brand.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (13, N'brand 14', N'brand.png', N'made in usa', N'perfect quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (14, N'brand 15', N'brand.png', N'made in vietnam', N'perfect quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (15, N'brand 16', N'brand.png', N'made in china', N'bad quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (16, N'brand 17', N'brand.png', N'made in vietnam', N'mô tả', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (17, N'brand 18', N'brand.png', N'made in vietnam', N'perfect quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (18, N'brand 19', N'brand.png', N'made in vietnam', N'perfect quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (19, N'brand 20', N'brand 20.jpg', N'made in vietnam', N'perfect quality', 0)
INSERT [dbo].[Brand] ([id], [name], [logo], [manufacturer], [description], [disable]) VALUES (22, N'brand 23', N'brand.png', N'made in vietnam', N'mô tả', 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [description], [disable]) VALUES (1, N'category 1', N'description', 0)
INSERT [dbo].[Category] ([id], [name], [description], [disable]) VALUES (2, N'category 2', N'description', 0)
INSERT [dbo].[Category] ([id], [name], [description], [disable]) VALUES (5, N'category 3', N'good', 0)
INSERT [dbo].[Category] ([id], [name], [description], [disable]) VALUES (6, N'category 4', N'mô tả', 0)
INSERT [dbo].[Category] ([id], [name], [description], [disable]) VALUES (7, N'category 5', N'mô tả', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (1, CAST(N'2020-12-26 15:00:00.000' AS DateTime), CAST(N'2021-01-08 17:03:37.000' AS DateTime), 2260000, 1)
INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (2, CAST(N'2021-01-01 17:00:00.000' AS DateTime), CAST(N'2021-01-09 15:34:07.000' AS DateTime), 1260000, 1)
INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (3, CAST(N'2021-01-01 15:00:00.000' AS DateTime), CAST(N'2021-01-08 23:54:08.000' AS DateTime), 2240000, 2)
INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (4, CAST(N'2021-01-01 15:00:00.000' AS DateTime), CAST(N'2021-01-04 05:32:43.000' AS DateTime), 2100000, 2)
INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (5, CAST(N'2021-01-19 21:58:14.000' AS DateTime), CAST(N'1970-01-01 00:00:00.000' AS DateTime), 462000, 1)
INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (6, CAST(N'2021-01-19 22:06:48.000' AS DateTime), CAST(N'1970-01-01 00:00:00.000' AS DateTime), 121000, 17)
INSERT [dbo].[Order] ([id], [created_time], [payment_time], [amount], [user_id]) VALUES (7, CAST(N'2021-01-19 22:10:29.000' AS DateTime), CAST(N'1970-01-01 00:00:00.000' AS DateTime), 462000, 18)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (1, N'Shipping', 2, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (2, N'Canceled', 1, 1, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (3, N'Pending', 1, 2, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (4, N'Shipping', 1, 3, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (5, N'Shipping', 2, 3, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (6, N'Success', 2, 4, 8)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (7, N'Canceled', 1, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (8, N'Shipping', 1, 1, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (9, N'Shipping', 3, 1, 5)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (10, N'Shipping', 4, 1, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (11, N'Canceled', 5, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (12, N'Canceled', 3, 1, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (13, N'Shipping', 4, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (14, N'Shipping', 5, 1, 5)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (15, N'Shipping', 2, 1, 5)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (16, N'Pending', 1, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (17, N'Pending', 2, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (18, N'Pending', 3, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (19, N'Pending', 5, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (20, N'Pending', 4, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (21, N'Shipping', 4, 3, 10)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (22, N'Shipping', 3, 3, 11)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (23, N'Pending', 1, 2, 4)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (24, N'Pending', 1, 4, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (25, N'Pending', 3, 4, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (26, N'Shipping', 5, 3, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (27, N'Shipping', 5, 4, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (28, N'Pending', 5, 4, 1)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (29, N'Success', 4, 4, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (30, N'Pending', 1, 5, 1)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (31, N'Pending', 2, 5, 2)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (32, N'Pending', 1, 6, 3)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (33, N'Pending', 3, 6, 1)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (34, N'Pending', 1, 7, 1)
INSERT [dbo].[OrderDetail] ([id], [status], [product_id], [order_id], [purchased_quantity]) VALUES (35, N'Pending', 2, 7, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [description], [price], [quantity], [image], [date_added], [category_id], [brand_id], [disable]) VALUES (1, N'product 1', N'good quality', 20000, 48, N'product.png', CAST(N'2021-01-12 00:00:00.000' AS DateTime), 2, 2, 0)
INSERT [dbo].[Product] ([id], [name], [description], [price], [quantity], [image], [date_added], [category_id], [brand_id], [disable]) VALUES (2, N'product 2', N'description', 200000, 13, N'product 2.jpg', CAST(N'2021-01-06 00:00:00.000' AS DateTime), 1, 2, 0)
INSERT [dbo].[Product] ([id], [name], [description], [price], [quantity], [image], [date_added], [category_id], [brand_id], [disable]) VALUES (3, N'product 3', N'perfect quality', 50000, -9, N'product.png', CAST(N'2021-01-06 00:00:00.000' AS DateTime), 1, 2, 0)
INSERT [dbo].[Product] ([id], [name], [description], [price], [quantity], [image], [date_added], [category_id], [brand_id], [disable]) VALUES (4, N'product 6', N'perfect quality', 100000, 18, N'product.png', CAST(N'2021-01-13 00:00:00.000' AS DateTime), 2, 1, 0)
INSERT [dbo].[Product] ([id], [name], [description], [price], [quantity], [image], [date_added], [category_id], [brand_id], [disable]) VALUES (5, N'product 5', N'mô tả', 10000, 99, N'product.png', CAST(N'2020-12-30 00:00:00.000' AS DateTime), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (1, N'customer', N'123', N'John Doe', 1, N'098 765 4321', N'johndoe@customer.com', N'Ha Noi')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (2, N'customer1', N'123', N'Anonymous', 0, N'012 345 6789', N'anonymous@customer.com', N'New Delhi')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (3, N'customer2', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (4, N'customer5', N'123', N'hung', 0, N'0987654321', N'abc@gmail.com', N'ha noi')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (5, N'customer6', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (6, N'customer7', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (7, N'customer8', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (8, N'customer9', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (9, N'customer 10', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (10, N'customer11', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (11, N'customer123', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (12, N'customer1234', N'abcdatdedi12A', N'Hùng Phi Vũ', 1, N'0329905386', N'proandvip06@gmail.com', N'64i, khu 4 tổ 7, phường La Khê, quận Hà Đông')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (13, N'customer30', N'123', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (14, N'customer29', N'abcdatdedihco12A', N'Hùng Phi Vũ', 1, N'0329905386', N'proandvip06@gmail.com', N'64i, khu 4 tổ 7, phường La Khê, quận Hà Đông')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (15, N'customer28', N'abcdatdedihoc12A', N'', 1, N'', N'', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (16, N'customer27', N'abcdatdedihoc12A', N'Hùng Phi Vũ', 1, N'0329905386', N'proandvip06@gmail.com', N'64i, khu 4 tổ 7, phường La Khê, quận Hà Đông')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (17, N'Anonymous1611068808127', N'', N'Hùng', 1, N'0329905386', N'proandvip06@gmail.com', N'')
INSERT [dbo].[User] ([id], [username], [password], [name], [gender], [phone], [email], [address]) VALUES (18, N'Anonymous1611069029566', N'', N'Hùng', 1, N'0329905386', N'proandvip06@gmail.com', N'')
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Brand__72E12F1B07FC5A90]    Script Date: Tue 01 19 21 10:23:41 PM ******/
ALTER TABLE [dbo].[Brand] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Category__72E12F1B4F0A2875]    Script Date: Tue 01 19 21 10:23:41 PM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Product__72E12F1B9092EB67]    Script Date: Tue 01 19 21 10:23:41 PM ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__F3DBC5723977398F]    Script Date: Tue 01 19 21 10:23:41 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
