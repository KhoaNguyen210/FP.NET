create database FashionStore;
USE FashionStore;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[CTMaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaDon] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[PhuongThucThanhToan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTMaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[Madon] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrang] [int] NULL,
	[ThanhToan] [int] NULL,
	[DiaChiNhanHang] [nvarchar](100) NULL,
	[MaNguoiDung] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Madon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[Soluong] [int] NULL,
	[MoTa] [ntext] NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[AnhSP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](50) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



SET IDENTITY_INSERT [dbo].[LoaiHang] ON 
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (1, N'Áo')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (2, N'Quần')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (3, N'Váy & Đầm')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (4, N'Giày & Dép')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (5, N'Túi Xách & Balo')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (6, N'Phụ Kiện')
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
GO


SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (1, N'Lovito')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (2, N'Chanel')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (3, N'Gucci')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (4, N'Dior')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (5, N'Burberry')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (6, N'Louis Vuitton')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (7, N'Prada')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (8, N'H&M')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (9, N'Zara')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (10, N'Uniqlo')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (11, N'Nike')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (12, N'Adidas')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (13, N'Puma')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (14, N'Under Armour')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (15, N'New Balance')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (16, N'Fila')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (17, N'Levis')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (18, N'GAP')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (19, N'Bershka')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (20, N'Mango')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (21, N'Supreme')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (22, N'Converse')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (23, N'Reebok')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (24, N'Vans')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (25, N'Calvin Klein')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (26, N'Armani')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (27, N'Guess')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (28, N'Tommy Hilfiger')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (29, N'Ralph Lauren')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (30, N'DKNY')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO


SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Adminstrator')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO

SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 
INSERT [dbo].[ChiTietDonHang] ([CTMaDon], [MaDon], [MaSP], [SoLuong], [DonGia], [ThanhTien], [PhuongThucThanhToan]) VALUES 
(1, 1, 1, 2, CAST(190000 AS Decimal(18, 0)), CAST(380000 AS Decimal(18, 0)), 1),
(2, 2, 3, 1, CAST(350000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), 1),
(3, 3, 2, 3, CAST(290000 AS Decimal(18, 0)), CAST(870000 AS Decimal(18, 0)), 1),
(4, 4, 2, 3, CAST(290000 AS Decimal(18, 0)), CAST(870000 AS Decimal(18, 0)), 1),
(5, 5, 1, 1, CAST(190000 AS Decimal(18, 0)), CAST(190000 AS Decimal(18, 0)), 1),
(6, 6, 1, 1, CAST(190000 AS Decimal(18, 0)), CAST(190000 AS Decimal(18, 0)), 1),
(7, 10, 2, 1, CAST(290000 AS Decimal(18, 0)), CAST(290000 AS Decimal(18, 0)), 1),
(8, 10, 1, 1, CAST(190000 AS Decimal(18, 0)), CAST(190000 AS Decimal(18, 0)), 1),
(9, 7, 4, 1, CAST(450000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), 1),
(10, 7, 1, 2, CAST(190000 AS Decimal(18, 0)), CAST(380000 AS Decimal(18, 0)), 1),
(11, 8, 5, 1, CAST(500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), 1),
(12, 8, 6, 2, CAST(200000 AS Decimal(18, 0)), CAST(400000 AS Decimal(18, 0)), 1),
(13, 9, 8, 1, CAST(600000 AS Decimal(18, 0)), CAST(600000 AS Decimal(18, 0)), 2),
(14, 11, 4, 1, CAST(450000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), 1),
(15, 12, 9, 1, CAST(700000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), 1),
(16, 12, 1, 1, CAST(190000 AS Decimal(18, 0)), CAST(190000 AS Decimal(18, 0)), 1),
(17, 13, 3, 2, CAST(350000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), 1),
(18, 13, 6, 1, CAST(200000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), 1),
(19, 14, 8, 1, CAST(600000 AS Decimal(18, 0)), CAST(600000 AS Decimal(18, 0)), 2),
(20, 14, 7, 2, CAST(280000 AS Decimal(18, 0)), CAST(560000 AS Decimal(18, 0)), 2),
(21, 15, 5, 1, CAST(500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), 1),
(22, 16, 9, 1, CAST(700000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), 1),
(23, 16, 6, 1, CAST(200000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), 1),
(24, 17, 4, 1, CAST(450000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), 2),
(25, 17, 1, 2, CAST(190000 AS Decimal(18, 0)), CAST(380000 AS Decimal(18, 0)), 2),
(26, 18, 8, 1, CAST(600000 AS Decimal(18, 0)), CAST(600000 AS Decimal(18, 0)), 1),
(27, 18, 3, 1, CAST(350000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), 1),
(28, 19, 2, 1, CAST(290000 AS Decimal(18, 0)), CAST(290000 AS Decimal(18, 0)), 1),
(29, 19, 6, 1, CAST(200000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), 1),
(30, 20, 9, 1, CAST(700000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), 2),
(31, 21, 5, 1, CAST(500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), 1),
(32, 21, 7, 1, CAST(280000 AS Decimal(18, 0)), CAST(280000 AS Decimal(18, 0)), 1),
(33, 22, 8, 1, CAST(600000 AS Decimal(18, 0)), CAST(600000 AS Decimal(18, 0)), 1),
(34, 22, 4, 1, CAST(450000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO

SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([Madon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [TongTien]) VALUES 
(1, CAST(N'2024-06-02T00:00:00.000' AS DateTime), 1, 1, N'Nha Trang', 2, CAST(380000 AS Decimal(18, 0))),
(2, CAST(N'2024-06-02T00:00:00.000' AS DateTime), 1, 1, N'Hà Nội', 2, CAST(350000 AS Decimal(18, 0))),
(3, CAST(N'2024-06-02T00:00:00.000' AS DateTime), 1, 2, N'Hà Nội', 5, CAST(870000 AS Decimal(18, 0))),
(4, CAST(N'2024-06-02T00:00:00.000' AS DateTime), 1, 1, N'Hà Nội', 5, CAST(870000 AS Decimal(18, 0))),
(5, CAST(N'2024-06-02T00:00:00.000' AS DateTime), NULL, 1, N'Cần Thơ', 6, CAST(190000 AS Decimal(18, 0))),
(6, CAST(N'2024-06-02T00:00:00.000' AS DateTime), 1, 1, N'Cần Thơ', 8, CAST(190000 AS Decimal(18, 0))),
(7, CAST(N'2024-10-15T10:30:00.000' AS DateTime), 1, 1, N'Hà Nội', 3, CAST(830000 AS Decimal(18, 0))),
(8, CAST(N'2024-10-15T14:45:00.000' AS DateTime), 1, 1, N'Đà Nẵng', 4, CAST(900000 AS Decimal(18, 0))),
(9, CAST(N'2024-10-16T09:15:00.000' AS DateTime), 1, 2, N'Hồ Chí Minh', 7, CAST(600000 AS Decimal(18, 0))),
(10, CAST(N'2024-10-17T15:30:53.140' AS DateTime), NULL, 1, N'Hải Phòng', 1, CAST(480000 AS Decimal(18, 0))),
(11, CAST(N'2024-10-16T16:20:00.000' AS DateTime), 0, 1, N'Cần Thơ', 9, CAST(450000 AS Decimal(18, 0))),
(12, CAST(N'2024-10-17T11:30:00.000' AS DateTime), 1, 1, N'Nha Trang', 11, CAST(890000 AS Decimal(18, 0))),
(13, CAST(N'2024-10-18T09:00:00.000' AS DateTime), 1, 1, N'Đà Lạt', 12, CAST(750000 AS Decimal(18, 0))),
(14, CAST(N'2024-10-18T10:15:00.000' AS DateTime), 0, 2, N'Vũng Tàu', 13, CAST(980000 AS Decimal(18, 0))),
(15, CAST(N'2024-10-18T11:30:00.000' AS DateTime), 1, 1, N'Huế', 14, CAST(560000 AS Decimal(18, 0))),
(16, CAST(N'2024-10-18T13:45:00.000' AS DateTime), 1, 1, N'Quảng Ninh', 15, CAST(840000 AS Decimal(18, 0))),
(17, CAST(N'2024-10-18T15:00:00.000' AS DateTime), 0, 2, N'Bình Dương', 16, CAST(670000 AS Decimal(18, 0))),
(18, CAST(N'2024-10-19T09:30:00.000' AS DateTime), 1, 1, N'Đồng Nai', 17, CAST(920000 AS Decimal(18, 0))),
(19, CAST(N'2024-10-19T10:45:00.000' AS DateTime), 1, 1, N'Long An', 18, CAST(430000 AS Decimal(18, 0))),
(20, CAST(N'2024-10-19T14:00:00.000' AS DateTime), 0, 2, N'Tiền Giang', 19, CAST(780000 AS Decimal(18, 0))),
(21, CAST(N'2024-10-19T16:15:00.000' AS DateTime), 1, 1, N'Bến Tre', 20, CAST(650000 AS Decimal(18, 0))),
(22, CAST(N'2024-10-19T17:30:00.000' AS DateTime), 1, 1, N'Vĩnh Long', 21, CAST(890000 AS Decimal(18, 0)))


SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO


SET IDENTITY_INSERT [dbo].[SanPham] ON 
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [Soluong], [MoTa], [MaLoai], [MaNCC], [AnhSP]) VALUES 
-- Áo (MaLoai = 1)
(1, N'Áo Polo Thêu Unisex Nam Nữ Oversize', CAST(290000 AS Decimal(18, 0)), 70, N'Được chăm chút từ chất liệu, form dáng, đường may, hình in cho đến khâu đóng gói và hậu mãi', 1, 4, N'product2.jpg'),
(2, N'Áo Thun Cổ Tròn Nam', CAST(200000 AS Decimal(18, 0)), 40, N'Áo thun cổ tròn với chất liệu cotton mềm mại, thấm hút mồ hôi tốt', 1, 8, N'product6.jpg'),
(3, N'Áo Sơ Mi Dài Tay Nam', CAST(400000 AS Decimal(18, 0)), 28, N'Áo sơ mi dài tay với chất liệu vải thoáng mát, thiết kế lịch sự', 1, 3, N'product12.jpg'),
(4, N'Áo Hoodie Nỉ Nam Nữ', CAST(380000 AS Decimal(18, 0)), 45, N'Áo hoodie nỉ dày dặn, giữ ấm tốt, thiết kế unisex năng động', 1, 21, N'product17.jpg'),
(5, N'Áo Khoác Bomber Nam', CAST(700000 AS Decimal(18, 0)), 18, N'Áo khoác bomber với chất liệu dù, thiết kế năng động', 1, 9, N'product9.jpg'),

-- Quần (MaLoai = 2)
(6, N'Quần Jean Skinny Nữ', CAST(350000 AS Decimal(18, 0)), 30, N'Quần jean skinny với chất vải co giãn tốt, form dáng ôm sát', 2, 7, N'product3.jpg'),
(7, N'Quần Short Jeans Nữ', CAST(280000 AS Decimal(18, 0)), 25, N'Quần short jeans trẻ trung, năng động', 2, 5, N'product7.jpg'),
(8, N'Quần Tây Nam Công Sở', CAST(450000 AS Decimal(18, 0)), 40, N'Quần tây nam với chất liệu vải thoáng mát, form dáng thanh lịch', 2, 25, N'product14.jpg'),
(9, N'Quần Legging Tập Yoga', CAST(250000 AS Decimal(18, 0)), 30, N'Quần legging co giãn 4 chiều, thoáng khí', 2, 14, N'product18.jpg'),

-- Váy & Đầm (MaLoai = 3)
(10, N'Váy 2 Dây Nữ Dáng Xòe', CAST(190000 AS Decimal(18, 0)), 10, N'Váy 2 dây được may với chất vải thun tăm gân', 3, 1, N'product1.jpg'),
(11, N'Đầm Maxi Dài Nữ', CAST(600000 AS Decimal(18, 0)), 15, N'Đầm maxi dài với thiết kế thanh lịch, tôn dáng', 3, 6, N'product8.jpg'),
(12, N'Váy Ngắn Xếp Li', CAST(320000 AS Decimal(18, 0)), 25, N'Váy ngắn xếp li thời trang, chất liệu vải mềm mại', 3, 9, N'product15.jpg'),
(13, N'Váy Midi Hoa Nhí', CAST(480000 AS Decimal(18, 0)), 20, N'Váy midi họa tiết hoa nhí nhẹ nhàng, nữ tính', 3, 8, N'product22.jpg'),

-- Giày & Dép (MaLoai = 4)
(14, N'Giày Thể Thao Nữ', CAST(500000 AS Decimal(18, 0)), 50, N'Giày thể thao với chất liệu vải thoáng khí, đế cao su chống trượt', 4, 2, N'product5.jpg'),
(15, N'Giày Cao Gót Nữ', CAST(600000 AS Decimal(18, 0)), 10, N'Giày cao gót với thiết kế sang trọng, chất liệu da mềm mại', 4, 12, N'product13.jpg'),
(16, N'Giày Da Nam Công Sở', CAST(850000 AS Decimal(18, 0)), 25, N'Giày da nam công sở cao cấp, đế cao su chống trượt', 4, 26, N'product21.jpg'),
(17, N'Giày Sneaker Thời Trang', CAST(680000 AS Decimal(18, 0)), 30, N'Giày sneaker thiết kế hiện đại, đế êm', 4, 11, N'product29.jpg'),

-- Túi & Balo (MaLoai = 5)
(18, N'Túi Xách Da Đeo Chéo', CAST(450000 AS Decimal(18, 0)), 20, N'Túi xách da thời trang, phù hợp cho cả nam và nữ', 5, 3, N'product4.jpg'),
(19, N'Balo Laptop Chống Thấm', CAST(350000 AS Decimal(18, 0)), 22, N'Balo laptop chống thấm nước, thiết kế nhiều ngăn tiện lợi', 5, 4, N'product10.jpg'),

-- Phụ kiện (MaLoai = 6)
(20, N'Mũ Lưỡi Trai Nữ', CAST(150000 AS Decimal(18, 0)), 35, N'Mũ lưỡi trai với thiết kế thời trang, chất liệu vải thoáng mát', 6, 11, N'product11.jpg'),
(21, N'Tất Vớ Cotton Unisex', CAST(50000 AS Decimal(18, 0)), 100, N'Tất vớ cotton thoáng khí, thấm hút mồ hôi tốt', 6, 10, N'product16.jpg'),
(22, N'Kính Mát Thời Trang', CAST(280000 AS Decimal(18, 0)), 20, N'Kính mát chống tia UV, thiết kế thời trang', 6, 27, N'product19.jpg'),
(23, N'Khăn Choàng Cổ Len', CAST(180000 AS Decimal(18, 0)), 50, N'Khăn choàng len mềm mại, giữ ấm tốt', 6, 5, N'product25.jpg')

SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO


SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (1, N'Admin', N'admin@gmail.com', N'0902233445', N'123456', 1, N'Hải Phòng')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (2, N'Trần Thị Lụa', N'tranthilua@gmail.com', N'0987654321', N'123456', 2, N'Hồ Chí Minh')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (3, N'Hồ Thị Thanh Trang', N'trang.htt.63ttql@ntu.edu.vn', N'0901122334', N'123456', 2, N'Hà Nội')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (4, N'Hồ Thị Thanh Trang', N'trangho254@gmail.com', N'0123456789', N'123456', 2, N'Khánh Hòa')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (5, N'Lê Văn C', N'levanc@gmail.com', N'0903344556', N'123456', 2, N'Đà Nẵng')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (6, N'Nguyễn Thị D', N'nguyenthid@gmail.com', N'0904455667', N'123456', 2, N'Bình Dương')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (7, N'Trần Văn E', N'tranvane@gmail.com', N'0905566778', N'123456', 2, N'Đồng Nai')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (8, N'Hoàng Thị F', N'hoangthif@gmail.com', N'0906677889', N'123456', 2, N'Cần Thơ')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (9, N'Phạm Văn G', N'phamvang@gmail.com', N'0907788990', N'123456', 2, N'Quảng Ninh')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (10, N'Nguyễn Thị H', N'nguyenthih@gmail.com', N'0908899001', N'123456', 2, N'An Giang')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (11, N'Bùi Văn I', N'buivani@gmail.com', N'0909900012', N'123456', 2, N'Kiên Giang')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (12, N'Vũ Thị J', N'vuthij@gmail.com', N'0910012345', N'123456', 2, N'Lâm Đồng')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (13, N'Trần Văn K', N'tranvank@gmail.com', N'0911123456', N'123456', 2, N'Tây Ninh')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (14, N'Nguyễn Thị L', N'nguyenthil@gmail.com', N'0912234567', N'123456', 2, N'Bắc Ninh')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (15, N'Lê Văn M', N'levanm@gmail.com', N'0913345678', N'123456', 2, N'Vĩnh Phúc')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (16, N'Phạm Thị N', N'phamthin@gmail.com', N'0914456789', N'123456', 2, N'Hậu Giang')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (17, N'Trần Văn O', N'tranvano@gmail.com', N'0915567890', N'123456', 2, N'Nghệ An')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (18, N'Nguyễn Thị P', N'nguyenthilp@gmail.com', N'0916678901', N'123456', 2, N'Thừa Thiên Huế')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (19, N'Bùi Văn Q', N'buivanq@gmail.com', N'0917789012', N'123456', 2, N'Bình Phước')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (20, N'Vũ Thị R', N'vuthir@gmail.com', N'0918890123', N'123456', 2, N'Nam Định')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (21, N'Trần Văn S', N'tranvans@gmail.com', N'0919901234', N'123456', 2, N'Quảng Bình')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (22, N'Nguyễn Thị T', N'nguyenthit@gmail.com', N'0920012345', N'123456', 2, N'Tuyên Quang')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (23, N'Lê Văn U', N'levanu@gmail.com', N'0921123456', N'123456', 2, N'Lào Cai')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (24, N'Phạm Thị V', N'phamthiv@gmail.com', N'0922234567', N'123456', 2, N'Điện Biên')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (25, N'Trần Văn W', N'tranvanw@gmail.com', N'0923345678', N'123456', 2, N'Sơn La')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (26, N'Nguyễn Thị X', N'nguyenthix@gmail.com', N'0924456789', N'123456', 2, N'Lạng Sơn')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (27, N'Bùi Văn Y', N'buivany@gmail.com', N'0925567890', N'123456', 2, N'Bắc Giang')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (28, N'Vũ Thị Z', N'vuthiz@gmail.com', N'0926678901', N'123456', 2, N'Hòa Bình')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (29, N'Trần Văn AA', N'tranvanaa@gmail.com', N'0927789012', N'123456', 2, N'Kon Tum')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (30, N'Nguyễn Thị BB', N'nguyenthibb@gmail.com', N'0928890123', N'123456', 2, N'Ninh Bình')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO


ALTER TABLE [dbo].[LoaiHang] ADD  DEFAULT (NULL) FOR [TenLoai]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_cthd_hd] FOREIGN KEY([MaDon])
REFERENCES [dbo].[DonHang] ([Madon])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_cthd_hd]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_cthd_sp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_cthd_sp]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_hd_tk] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[TaiKhoan] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_hd_tk]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_sp_loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHang] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_sp_loai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_sp_ncc] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_sp_ncc]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_tk_pq] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_tk_pq]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SanPham_TimKiem]
	@TenSP nvarchar(100) = NULL,
	@TenLoai nvarchar(100) = NULL,
	@TenNCC nvarchar(100) = NULL
AS
BEGIN
	DECLARE @SqlStr NVARCHAR(4000),
			@ParamList NVARCHAR(2000)

	SET @SqlStr = '
       SELECT SP.*, LH.TenLoai, NCC.TenNCC
       FROM SanPham SP
			JOIN LoaiHang LH ON SP.MaLoai = LH.MaLoai
			JOIN NhaCungCap NCC ON SP.MaNCC = NCC.MaNCC
       WHERE 1 = 1
       '

	IF @TenSP IS NOT NULL
		SET @SqlStr = @SqlStr + ' AND SP.TenSP LIKE @TenSP'

	IF @TenLoai IS NOT NULL
		SET @SqlStr = @SqlStr + ' AND LH.TenLoai LIKE @TenLoai'

	IF @TenNCC IS NOT NULL
		SET @SqlStr = @SqlStr + ' AND NCC.TenNCC LIKE @TenNCC'


	SET @ParamList = N'@TenSP NVARCHAR(100), @TenLoai NVARCHAR(100), @TenNCC NVARCHAR(100)'

	
	SET @TenSP = ISNULL('%' + @TenSP + '%', '%')
	SET @TenLoai = ISNULL('%' + @TenLoai + '%', '%')
	SET @TenNCC = ISNULL('%' + @TenNCC + '%', '%')

	EXEC sp_executesql @SqlStr, @ParamList, @TenSP, @TenLoai, @TenNCC
END
GO

