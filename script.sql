USE [master] 
GO
IF EXISTS (SELECT 1 FROM SYS.databases WHERE name = N'VapeStore') 
DROP DATABASE [VapeStore]
GO 
CREATE DATABASE [VapeStore]
GO 
USE [VapeStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/8/2020 2:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](70) NOT NULL,
	[phonenumber] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK__Account__F3DBC573146EE33D] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2020 2:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/8/2020 2:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](70) NOT NULL,
	[subject] [nvarchar](100) NOT NULL,
	[message] [nvarchar](800) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/8/2020 2:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imgsrc] [nvarchar](500) NULL,
	[productID] [int] NOT NULL,
 CONSTRAINT [PK__Image__3213E83F15A3249C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/8/2020 2:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[phonenumber] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[country] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[postcode] [nvarchar](50) NULL,
	[message] [nvarchar](500) NULL,
	[order] [nvarchar](max) NOT NULL,
	[total] [int] NULL,
 CONSTRAINT [PK__Orders__3213E83FC6B28546] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/8/2020 2:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] NOT NULL,
	[productName] [nvarchar](100) NOT NULL,
	[price] [int] NULL,
	[categoryID] [int] NOT NULL,
	[detail] [nvarchar](2000) NULL,
	[stock] [nvarchar](50) NULL,
	[img] [nvarchar](500) NULL,
 CONSTRAINT [PK__Products__2D10D14ADD38D3AD] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([username], [fullname], [password], [email], [phonenumber], [address]) VALUES (N'admin', N'Administrator', N'123', N'admin@gmail.com', N'0397574822', N'Ha Noi')
INSERT [dbo].[Account] ([username], [fullname], [password], [email], [phonenumber], [address]) VALUES (N'evape', N'Alkalin', N'12345', N'prj321@admin.com', N'7492384792874', N'Bac Giang')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'Freebase Juice')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Salt-Nicotine Juice')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'Device')
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (1, N'https://product.hstatic.net/200000019872/product/licorne-by-curieux-_60ml_-_dau-tay-thanh-long__9e01d55817324ad792e9168885c3868d_master.jpg', 1)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (2, N'https://file.hstatic.net/200000019872/file/licorne_by_curieux__60ml___dau_tay_thanh_long__1_1a91640dd9f1475090481dee6b205d53.jpg', 1)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (3, N'https://product.hstatic.net/200000019872/product/better-days-ice-by-secret-menu-60ml-nuoc-tao-ep-lanh_d41037142f5a4f1cbabf0064719f0e1b_master.jpg', 5)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (4, N'https://product.hstatic.net/200000019872/product/dinner-lady-disposable-pod-blue-menthol-15ml-kccwt_f136de6053b34efca6f081dc11c96a2c_master.jpg', 9)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (5, N'https://product.hstatic.net/200000019872/product/-cappuccino-seattle-north-america-by-brwd-_100ml_-_cappuccino-caramel__f8596e822bbf4c2694c8d3b11b4c1629_master.jpg', 2)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (6, N'https://instagram.fhan5-7.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p640x640/65313141_2796056397085572_3003142145390394476_n.jpg?_nc_ht=instagram.fhan5-7.fna.fbcdn.net&_nc_cat=100&_nc_ohc=mjTyxuTY0BQAX8U69ek&_nc_tp=24&oh=d2c09d1e4ac0fd50e6bf28493b3a2056&oe=5FD0C912', 2)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (7, N'https://product.hstatic.net/200000019872/product/lemon-tart-by-dinner-lady-60ml-banh-tart-chanh-3wjfb_d32ed0185a8d4e6c9277312399b7368d_master.jpg', 3)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (8, N'https://vapourcentral.co.uk/658-large_default/dinner-lady-lemon-tart-60ml.jpg', 3)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (9, N'https://product.hstatic.net/200000019872/product/boysenberry-waffle-by-jam-it-100ml-waffle-mam-xoi-lai__1__4bf8d10175a64e079df698919af440bf_master.jpg', 4)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (13, N'https://product.hstatic.net/200000019872/product/romio-v7-king-strawberry-by-romio-60ml-3mg-dau-lanh_f8b2cc22655544efa518acc7aa2f8692_master.jpg', 6)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (14, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/386/204/products/tinh-dau-vape-my-salt-nicotine-king-strawberry-romio-30ml-1.jpg?v=1589614415177', 6)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (15, N'https://product.hstatic.net/200000019872/product/blue_razz_by_steam_works__60ml__mam_xoi_xanh__711ea5a1a2844f8293248d14be90f0b8_master.jpg', 7)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (16, N'https://file.hstatic.net/200000019872/file/blue-razz-salt-nic-by-steam-works-30ml-mam-xoi-lanh-1_841a7a2ec0d240c5a760a7de4190ea20.jpg', 7)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (17, N'https://product.hstatic.net/200000019872/product/dot-aio-starter-kit-by-dotmod_f2e0e92f3b91455091c731076b69472b_master.jpg', 8)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (18, N'https://product.hstatic.net/200000019872/product/dot-aio-starter-kit-by-dotmod-red_e9130db59ba5409a92ac98bba41bc4c1_master.jpg', 8)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (19, N'https://product.hstatic.net/200000019872/product/origin-x-aio-kit-by-oxva-black-red-trim_0695c36e1d4346458a97a50bfafe3697_master.jpg', 10)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (20, N'https://product.hstatic.net/200000019872/product/origin-x-aio-kit-by-oxva-pine-green_f4a58d85b1a7432480c68851d00c434f_master.jpg', 10)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (21, N'https://product.hstatic.net/200000019872/product/origin-x-aio-kit-by-oxva-marble-gray_029194965d57447d8c767d8987550903_master.jpg', 10)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (22, N'https://product.hstatic.net/200000019872/product/origin-x-aio-kit-by-oxva-black-carbon_fc78bf66e5ba4a17a7a217ce6946d8f0_master.jpg', 10)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (23, N'https://product.hstatic.net/200000019872/product/dot-aio-starter-kit-by-dotmod-blue_381482db1c12457a91681af7da861bd9_master.jpg', 8)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (24, N'https://product.hstatic.net/200000019872/product/dot-aio-starter-kit-by-dotmod-gold_c3cc96bfc70f453ab6965b27f905a4a8_master.jpg', 8)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (25, N'https://file.hstatic.net/200000019872/file/romio-v7-king-strawberry-by-romio-60ml-3mg-dau-lanh-1_c7cf8878085e4484a1f9ca570145bcd1.jpg', 6)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (26, N'https://product.hstatic.net/200000019872/product/cucumber-salt-nic-by-blvk-30ml-dua-chuot_1c9e51b6d8b64ca48e452b0ffd963e7a_master.jpg', 11)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (27, N'https://product.hstatic.net/200000019872/product/watermelon-salt-nic-by-pop-clouds-30ml-ko-da-hu-32ph0_f7f2b4b573ad47a590970275c865f628_master.jpg', 12)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (28, N'https://product.hstatic.net/200000019872/product/eydew-melon-chew-salt-nic-by-twsit-e-liquid-30-ml-nc-chanh-da-mt-no84k_7db8c8e8f00548c9ae04a1bba6841b04_master.jpg', 13)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (29, N'https://product.hstatic.net/200000019872/product/aqua-sour-melon-salt-nic-by-marina-vape-_30ml__keo-dua-hau-chua__24c1e7bc75264c4099fbbf1499ffcb49_master.jpg', 14)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (30, N'https://product.hstatic.net/200000019872/product/applemelon-x-salt-nic-by-superb-30ml-da-hu-tao-05skx_4038361ccf424530873b8685624817b7_master.jpg', 15)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (31, N'https://product.hstatic.net/200000019872/product/wake-up-salt-nic-secret-menu-by-milkshake-30ml-banh-donut-ca-phe-2rihj_f4a373a817b0463fa61a392dcd5d6c9c_master.jpg', 16)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (32, N'https://product.hstatic.net/200000019872/product/hannya-230w-box-mod-by-vapelustion_1db85c802acc4007b8c60c3ac18e5c34_master.jpg', 17)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (33, N'https://product.hstatic.net/200000019872/product/cold-steel-ak47-pod-kit-limited-edition-by-artery_026514c9e38945778d081982ba094910_master.jpg', 18)
INSERT [dbo].[Image] ([id], [imgsrc], [productID]) VALUES (34, N'https://file.hstatic.net/200000019872/file/cold-steel-ak47-pod-kit-limited-edition-by-artery-1_bf956f4254804284b6ee08238e3db991.jpg', 18)
SET IDENTITY_INSERT [dbo].[Image] OFF
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (1, N'LICORNE BY CURIEUX (60ML)', 490000, 1, N'Licorne is a unique and surprising combination of strawberry and dragon fruit flavors', N'Available', N'https://product.hstatic.net/200000019872/product/licorne-by-curieux-_60ml_-_dau-tay-thanh-long__9e01d55817324ad792e9168885c3868d_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (2, N'CARAMEL CAPPUCCINO SEATTLE NORTH AMERICA BY BRWD (100ML)', 200000, 1, N'BRWD Seattle is the flavor of a fragrant caramel-covered cappuccino', N'Out of Stock', N'https://product.hstatic.net/200000019872/product/-cappuccino-seattle-north-america-by-brwd-_100ml_-_cappuccino-caramel__f8596e822bbf4c2694c8d3b11b4c1629_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (3, N'LEMON TART BY DINNER LADY (60ML) ', 380000, 1, N'Lemon Tart is a lemon cake with a thin buttery crust, creamy lemon sauce, and delicious meringue cream', N'Available', N'https://product.hstatic.net/200000019872/product/lemon-tart-by-dinner-lady-60ml-banh-tart-chanh-3wjfb_d32ed0185a8d4e6c9277312399b7368d_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (4, N'BOYSENBERRY WAFFLE BY JAM IT (100ML)', 330000, 1, N'Enjoy a unique flavor of raspberry jam mixed with waffle in Boysenberry Waffle.', N'Available', N'https://product.hstatic.net/200000019872/product/boysenberry-waffle-by-jam-it-100ml-waffle-mam-xoi-lai__1__4bf8d10175a64e079df698919af440bf_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (5, N'BETTER DAYS ICE BY SECRET MENU (60ML)', 350000, 1, N'Better Days Ice is a chilled version of Better Days. The signature apple flavor is combined with mint to create a cooler and more relaxing version of apple juice for the taste buds', N'Available', N'https://product.hstatic.net/200000019872/product/better-days-ice-by-secret-menu-60ml-nuoc-tao-ep-lanh_d41037142f5a4f1cbabf0064719f0e1b_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (6, N'ROMIO V7 KING STRAWBERRY BY ROMIO (60ML)', 350000, 1, N'Enjoy the taste of cool, fresh strawberries in King Strawberry', N'Contact for Information', N'https://product.hstatic.net/200000019872/product/romio-v7-king-strawberry-by-romio-60ml-3mg-dau-lanh_f8b2cc22655544efa518acc7aa2f8692_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (7, N'BLUE RAZZ BY STEAM WORKS (60ML)', 350000, 1, N'Enjoy a taste of cold raspberry candies in Steam Works Blue Razz vape essential oil', N'Out of Stock', N'https://product.hstatic.net/200000019872/product/blue_razz_by_steam_works__60ml__mam_xoi_xanh__711ea5a1a2844f8293248d14be90f0b8_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (8, N'DOTAIO ALL-IN-ONE KIT BY DOTMOD', 2300000, 3, N'dotAIO is the new definition of all-in-one, its versatility surpasses most pod mods on the market today. Salt nic, freebase, smoke or this pod mod can all weigh.', N'Available', N'https://product.hstatic.net/200000019872/product/dot-aio-starter-kit-by-dotmod_f2e0e92f3b91455091c731076b69472b_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (9, N'DINNER LADY DISPOSABLE POD - BLUE MENTHOL (1.5ML)', 100000, 3, N'Dinner Lady Dispoable Pod is a super convenient disposable pod mod for all vapers. Elegant compact shape with a pre-loaded superb essential oil pod header.', N'Available', N'https://product.hstatic.net/200000019872/product/dinner-lady-disposable-pod-blue-menthol-15ml-kccwt_f136de6053b34efca6f081dc11c96a2c_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (10, N'ORIGIN X AIO KIT BY OXVA', 950000, 3, N'The OXVA Origin X is a compact, neat pod mod made of zinc alloy. This lovely pod mod has a capacity of up to 60W and runs on 1 18650 battery.', N'Out of Stock', N'https://product.hstatic.net/200000019872/product/origin-x-aio-kit-by-oxva-black-red-trim_0695c36e1d4346458a97a50bfafe3697_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (11, N'CUCUMBER SALT NIC BY BLVK (30ML)', 350000, 2, N'In the summer, if you need a quick taste for heat, what to choose? Of course Cucumbers cucumber flavor.', N'Available', N'https://product.hstatic.net/200000019872/product/cucumber-salt-nic-by-blvk-30ml-dua-chuot_1c9e51b6d8b64ca48e452b0ffd963e7a_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (12, N'WATERMELON SALT NIC BY POP CLOUDS (30ML)', 350000, 2, N'Fascinating and nostalgic, re-indulge the flavors of watermelon flavor burst candy packs right in the Watermelon of Pop Clouds.', N'Available', N'https://product.hstatic.net/200000019872/product/watermelon-salt-nic-by-pop-clouds-30ml-ko-da-hu-32ph0_f7f2b4b573ad47a590970275c865f628_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (13, N'HONEYDEW MELON CHEW SALT NIC BY TWIST E-LIQUID (30 ML)', 350000, 2, N'Honeydew Melon Chew from Twist brought the scent of ripe melon with lemon juice.', N'Available', N'https://product.hstatic.net/200000019872/product/eydew-melon-chew-salt-nic-by-twsit-e-liquid-30-ml-nc-chanh-da-mt-no84k_7db8c8e8f00548c9ae04a1bba6841b04_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (14, N'AQUA SOUR MELON SALT NIC BY MARINA VAPE (30ML)', 350000, 2, N'Aqua Sour Melon delivers a super delicious sour taste that can satisfy you all day.', N'Contact for Information', N'https://product.hstatic.net/200000019872/product/aqua-sour-melon-salt-nic-by-marina-vape-_30ml__keo-dua-hau-chua__24c1e7bc75264c4099fbbf1499ffcb49_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (15, N'APPLEMELON X SALT NIC BY SUPER B (30ML)', 350000, 2, N'Applemelon X is a mix of crunchy apple and cool, cool watermelon.', N'Available', N'https://product.hstatic.net/200000019872/product/applemelon-x-salt-nic-by-superb-30ml-da-hu-tao-05skx_4038361ccf424530873b8685624817b7_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (16, N'WAKE UP SALT NIC - SECRET MENU BY MILKSHAKE (30ML) ', 310000, 2, N'Start breakfast with a donut and a black coffee from Milkshake Wake Up.', N'Out of Stock', N'https://product.hstatic.net/200000019872/product/wake-up-salt-nic-secret-menu-by-milkshake-30ml-banh-donut-ca-phe-2rihj_f4a373a817b0463fa61a392dcd5d6c9c_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (17, N'HANNYA 230W BOX MOD BY VAPELUSTION', 1300000, 3, N'From the moment it was released, Hannya 230W had collected every vaper thanks to its unique appearance and extremely high capacity.', N'Available', N'https://product.hstatic.net/200000019872/product/hannya-230w-box-mod-by-vapelustion_1db85c802acc4007b8c60c3ac18e5c34_master.jpg')
INSERT [dbo].[Products] ([productID], [productName], [price], [categoryID], [detail], [stock], [img]) VALUES (18, N'COLD STEEL AK47 POD KIT LIMITED EDITION BY ARTERY', 1350000, 3, N'Cold Steel AK47 from Artery, the pod kit is designed in a military style with ideas from the essential parts of the famous AK47 gun. You only need a look to know which parts the AK47 is made of.', N'Available', N'https://product.hstatic.net/200000019872/product/cold-steel-ak47-pod-kit-limited-edition-by-artery_026514c9e38945778d081982ba094910_master.jpg')

ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK__Image__productID__5165187F] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK__Image__productID__5165187F]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__catego__398D8EEE] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__catego__398D8EEE]
GO
