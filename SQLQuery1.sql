﻿CREATE DATABASE petstore
GO
USE petstore
GO

CREATE TABLE DanhMuc
(
	idDanhmuc INT IDENTITY PRIMARY KEY,
	tendanhmuc NVARCHAR(30),
	ParentID NVARCHAR(100) DEFAULT NULL
)
go

CREATE TABLE ThuVienAnh
(
	idthuvien int identity primary key,
	img1 nvarchar(255),
	img2 nvarchar(255),
	img3 nvarchar(255)
)
go

INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/dochocho2.jpg',N'/Content/uploads/dochocho3.jpg',N'/Content/uploads/dochocho4.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/camcho2.jpg',N'/Content/uploads/camcho3.jpg',N'/Content/uploads/camcho4.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/thucan2.jpg',N'/Content/uploads/thucan3.jpg',N'/Content/uploads/thucan4.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go
INSERT INTO ThuVienAnh (img1, img2, img3)
VALUES (N'/Content/uploads/banchailong.jpg',N'/Content/uploads/taymeo.jpg',N'/Content/uploads/tuingumeo.jpg');
go

CREATE TABLE SanPham
(
	masp int identity(1,1) primary key,
	idDanhmuc int references
	DanhMuc(idDanhmuc),
	idthuvien int references
	ThuVienAnh(idthuvien),
	tensp nvarchar(100) not null,
	hinh nvarchar(255),
	giaban decimal(18,0),
	ngaycapnhat date,
	soluongton int,
	mota nvarchar(MAX),
	giamgia int,
	giakhuyenmai decimal(18,0)
)
go

CREATE TABLE KhachHangRoles(
	RoleID int,
	RoleName varchar(30)
	primary key(RoleID)
)
go

CREATE TABLE KhachHang(
	makh int identity(1,1) primary key,
	hoten nvarchar(50),
	tendangnhap varchar(20),
	matkhau nvarchar(255),
	email varchar(50),
	diachi nvarchar(100),
	dienthoai varchar(15),
	ngaysinh date,
	RoleID int references KhachHangRoles(RoleID),
	status int,
	resetpasswordcode nvarchar(255)
)
go


CREATE TABLE DichVu(
	iddichvu int identity(1,1) primary key,
	hoten nvarchar(30),
	email nvarchar(30),
	sdt nvarchar(30),
	diachi nvarchar(30),
	trangthai nvarchar(30) NULL,
	tendichvu nvarchar(30),
	ngaydat date,
	makh int references
	KhachHang(makh)
)
go

CREATE TABLE DonHang(
	madon int identity(1,1) primary key,
	thanhtoan nvarchar(50),
	giaohang nvarchar(255),
	ngaydat date,
	ngaygiao date,
	makh int references KhachHang(makh)
)
go

CREATE TABLE ChiTietDonHang(
	madon int references DonHang(madon),
	masp int references SanPham(masp),
	soluong int,
	gia decimal(18,0),
	tongsoluong int,
	tonggia decimal(18,0),
	status int,
	primary key(madon,masp)
)
go

CREATE TABLE DanhGia(
	Id int identity(1,1) primary key,
	[Content] nvarchar(MAX),
	Rating float,
	Ngaycapnhap date,
	trangthai int default 0,
	id_sp int references SanPham(masp),
	id_kh int references KhachHang(makh)
)
go

CREATE TABLE LiveStream
(
	idLiveStream int identity primary key,
	noidunglive nvarchar(255),
	hinh nvarchar(255),
	link nvarchar(255)
)
go


INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Sản phẩm cho chó', NULL);

INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Sản phẩm cho mèo', NULL);

INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Thức ăn cho chó con', N'Sản phẩm cho chó');
INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Thức ăn cho chó trưởng thành', N'Sản phẩm cho chó');
INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Phụ kiện cho cún cưng', N'Sản phẩm cho chó');


INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Thức ăn mèo con', N'Sản phẩm cho mèo');
INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Phụ kiện mèo cưng', N'Sản phẩm cho mèo');
INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Phụ kiện mèo cưng', N'Sản phẩm cho mèo');

INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Con giống', NULL);

INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Chó', N'Con giống');

INSERT INTO DanhMuc (tendanhmuc, ParentID)
VALUES (N'Mèo', N'Con giống');

go


INSERT INTO KhachHangRoles(RoleID, RoleName)
VALUES (1, 'Admin');
go
INSERT INTO KhachHangRoles(RoleID, RoleName)
VALUES (2, 'User');
go
INSERT INTO KhachHangRoles(RoleID, RoleName)
VALUES (3, 'Staff');
go

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
		   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
		   ,[giamgia]
		   ,[giakhuyenmai])
     VALUES
           (3,
		1,
		   N'10 CÂY XÚC XÍCH DINH DƯỠNG CHO CHÓ MÈO',
		   N'/Content/uploads/dochocho.jpg',
		   100000,
		   null,
		   3,
		   N'đây là sản phẩm dành cho chó loại 1',
		   0,
		   100000)
GO
INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
		   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
		   ,[giamgia]
		   ,[giakhuyenmai])
     VALUES
           (3,
		1,
		   N'Đồ ăn cho chó loại 1',
		   N'/Content/uploads/dochocho.jpg',
		   100000,
		   null,
		   3,
		   N'đây là sản phẩm dành cho chó loại 1',
		   0,
		   100000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (3,
		2,
		   N'Đồ ăn cho chó loại 2',
		   N'/Content/uploads/camcho.jpg',
		   95000,
		   null,
		   3,
		   N'đây là đồ ăn dành cho chó loại 2',
		   0,
		   95000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (3,
		3,
		   N'Đồ ăn cho chó loại 3',
		   N'/Content/uploads/thucan.jpg',
		   75000,
		   null,
		   5,
		   N'đây là đồ ăn dành cho chó loại 3',
		   0,
		   75000)
GO


INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (3,
		4,
		   N'Đồ ăn cho chó loại 4',
		   N'/Content/uploads/keocho.jpg',
		   105000,
		   null,
		   10,
		   N'đây là đồ ăn dành cho chó loại 4',
		   0,
		   105000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (4,
		5,
		   N'Phụ kiện cho chó loại 1',
		   N'/Content/uploads/gangtaycho.jpg',
		   45000,
		   null,
		   17,
		   N'đây là Phụ kiện cho chó loại 1',
		   0,
		   45000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (4,
		6,
		   N'Phụ kiện cho chó loại 2',
		   N'/Content/uploads/vongdeo.jpg',
		   55000,
		   null,
		   7,
		   N'đây là Phụ kiện cho chó loại 2',
		   0,
		   55000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (5,
		7,
		   N'Vật dụng cho chó loại 1',
		   N'/Content/uploads/batan.jpg',
		   65000,
		   null,
		   4,
		   N'đây là Vật dụng cho chó loại 1',
		   0,
		   65000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (6,
		8,
		   N'Đồ hộp ăn cho mèo loại 1',
		   N'/Content/uploads/dohop.jpg',
		   20000,
		   null,
		   20,
		   N'đây là sản phẩm dành cho mèo 1',
		   0,
		   20000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (6,
		9,
		   N'Đồ hộp ăn cho mèo loại 2',
		   N'/Content/uploads/dohop2.jpg',
		   23000,
		   null,
		   22,
		   N'đây là sản phẩm dành cho mèo 2',
		   0,
		   23000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (7,
		10,
		   N'Phụ kiện cho mèo loại 1',
		   N'/Content/uploads/tuingumeo.jpg',
		   67000,
		   null,
		   32,
		   N'đây là Phụ kiện cho mèo loại 1',
		   0,
		   67000)
GO

INSERT INTO [dbo].[SanPham]
           ([idDanhmuc]
	   ,[idthuvien]
           ,[tensp]
           ,[hinh]
           ,[giaban]
           ,[ngaycapnhat]
           ,[soluongton]
           ,[mota]
	   ,[giamgia]
	   ,[giakhuyenmai])
     VALUES
           (8,
		11,
		   N'Vật dụng cho mèo loại 1',
		   N'/Content/uploads/vatdungmeo.jpg',
		   50000,
		   null,
		   5,
		   N'đây là Vật dụng cho mèo loại 1',
		   0,
		   50000)
GO

INSERT INTO [dbo].[KhachHang]
           ([hoten]
           ,[tendangnhap]
           ,[matkhau]
           ,[email]
           ,[diachi]
           ,[dienthoai]
           ,[ngaysinh]
           ,[RoleID]
		   ,[status])
     VALUES
           ('Nguyen Ha'
           ,'ha'
           ,'202cb962ac59075b964b07152d234b70'
           ,'habeu2k@gmail.com'
           ,'Thai Binh'
           ,0377037494
           ,'04/01/2000'
           ,2,
		   1)
GO
INSERT INTO [dbo].[KhachHang]
           ([hoten]
           ,[tendangnhap]
           ,[matkhau]
           ,[email]
           ,[diachi]
           ,[dienthoai]
           ,[ngaysinh]
           ,[RoleID],
		   [status])
     VALUES
           ('Admin'
           ,'admin'
           ,'202cb962ac59075b964b07152d234b70'
           ,null
           ,''
           ,null
           ,null
           ,1,
		   1)
GO
INSERT INTO [dbo].[KhachHang]
           ([hoten]
           ,[tendangnhap]
           ,[matkhau]
           ,[email]
           ,[diachi]
           ,[dienthoai]
           ,[ngaysinh]
           ,[RoleID],
		   [status])
     VALUES
           ('Staff'
           ,'Staff'
           ,'202cb962ac59075b964b07152d234b70'
           ,null
           ,null
           ,null
           ,null
           ,3,
		   1)
GO

INSERT INTO [dbo].[DonHang]
           ([thanhtoan]
           ,[giaohang]
           ,[ngaydat]
           ,[ngaygiao]
           ,[makh])
     VALUES
           ('COD',
		   'giao thành công',
		   '6/14/2022',
		   '6/14/2022',
		   1)
GO

INSERT INTO [dbo].[ChiTietDonHang]
           ([madon]
           ,[masp]
           ,[soluong]
           ,[gia]
           ,[tongsoluong]
           ,[tonggia]
           ,[status])
     VALUES
           (1,
		   1,
		   1,
		   100000,
		   1,
		   100000,
		   1)
GO

create TRIGGER trg_HuyDatHang ON ChiTietDonHang FOR DELETE AS 
BEGIN
	UPDATE SanPham
	SET SoLuongTon = SoLuongTon + (SELECT soluong FROM deleted WHERE masp = SanPham.masp)
	FROM SanPham 
	JOIN deleted ON SanPham.masp = deleted.masp
	
END

