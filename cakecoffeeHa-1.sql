
--CREATE DATABASE Website B�n B�nh & Coffee
CREATE DATABASE BanBanh 
GO

--T?o b?ng Lo?i s?n ph?m
go
CREATE TABLE LOAISP
(
	MALOAISP varchar(10) NOT NULL PRIMARY KEY,
	TENLOAISP nvarchar(100) UNIQUE
)
---------------------------------------------
--T?o b?ng s?n ph?m
go
CREATE TABLE SANPHAM
(
	MASP	varchar(10) NOT NULL,
	TENSP	nvarchar(50),
	DVT	nvarchar(20),
	NOISX	varchar(50),
	GIA	int,
	MOTA ntext,
	NGAYCAPNHAT date NULL,
	MALOAISP varchar(10) references LOAISP(MALOAISP),
	HINH varchar(50),
	constraint pk_sp PRIMARY KEY (MASP)	
)
----------------------------------------------
--T?o b?ng User
go
CREATE TABLE USERS
(
	USER_ID varchar(10) PRIMARY KEY, --C?ng l� m� kh�ch h�ng
	USER_NAME nvarchar(50),
	[PASSWORD] nvarchar(30),
	EMAIL nvarchar(50) UNIQUE,
	SODT varchar(10) UNIQUE,
	DCHI nvarchar(100) UNIQUE,
	Allowed int DEFAULT(1)
)
---------------------------------------------
-- T?o b?ng ??n h�ng
go
CREATE TABLE DONHANG
(
	SODH varchar(10) NOT NULL,
	USER_ID varchar(10),
	NGAYDAT smalldatetime,
	NGAYGIAO smalldatetime,
	TONGGIATIEN int,
	constraint pk_hd primary key(SODH),
	foreign key (USER_ID) references USERS(USER_ID)
)
---------------------------------------------
-- T?o b?ng chi ti?t ??n h�ng

CREATE TABLE CTDH
(
	SODH varchar(10) NOT NULL,
	MASP varchar(10) NOT NULL,
	SL int,
	THANHTIEN int,
	primary key(SODH, MASP),
	foreign key (SODH) references DONHANG(SODH),
	foreign key (MASP) references SANPHAM(MASP)
)
----------------------------------------------------------
----------------------------------------------------------

--Code t?o d? li?u
go
INSERT INTO LOAISP (MALOAISP, TENLOAISP)
VALUES
	('LSP1', 'DIET'),
	('LSP2', 'BIRTHDAY'),
	('LSP3', 'CUPCAKE'),
	('LSP4', 'DRINK'),
	('LSP5', 'COMBO');
go
	
INSERT INTO SANPHAM (MASP, TENSP, DVT, NOISX, GIA, MOTA, NGAYCAPNHAT, MALOAISP, HINH)
VALUES
	('SP1', 'High Fiber Bread', N'?', 'Lappetit', 75000, N'High Fiber ???c l�m t? b?t m� th� gi�u 
	ch?t x? c?a ??c v?i h�m l??ng ch?t x? cao, nhi?u h?t dinh d??ng', '2019-10-22', 'LSP1', 'm1.jpg'),

	('SP2', 'Rye Caraway Bagels', N't�i', 'Lappetit', 160000, N'Rye Bagel ???c l�m t? b?t m� ?en, 
	th�m b?t m� protein cao v� h?t th� l� ba t? n?i ti?ng', '2019-10-23', 'LSP1', 'm2.jpg'),
	
	('SP3', 'Mocha Hazelnut Chiffon Cake ', N'c�i', 'Lappetit', 250000, N'???c l�m t? b?t b�nh Chiffon th??ng h?ng
	k?t h?p c�ng v? th?m b�o c?a h?t d?', '2019-10-28', 'LSP2', 'm3.jpg'),
	
	('SP4', 'Crown Birthday Cake ', N'c�i', 'Lappetit', 690000, N'B�nh Sinh Nh?t Cao T?ng V??ng Mi?n
	 sang ch?nh v?i b�nh b�ng lan m?n x?p c�ng l?p kem m?m m?n', '2019-10-22', 'LSP2', 'm4.jpg'),
	
	('SP5', 'American Apple Pie ', N'c�i', 'Lappetit', 398000, N'Chi?c b�nh th?m ngon v?i l?p v? ngo�i gi�n r?m
	 k?t h?p v?i nh�n b�nh t�o m?m m?m ??c tr?ng c?a t�o M?.', '2019-10-22', 'LSP2', 'm2.jpg'),
	
	('SP6', 'BlueBerry Coffee Cake', N'c�i', 'Lappetit', 400000, N'Chi?c b�nh v? ngo�i gi�n r?m k?t h?p v?i
	 nh?ng tr�i vi?t qu?t c?ng m?ng ??c tr?ng khi?n th?c kh�ch nh? m�i.', '2019-11-5', 'LSP2', 's2.jpg'),
	
	('SP7', 'Orange Cranbery Tart', N'c�i', 'Lappetit', 355000, N'B�nh Tart Cam l�m m�n ??c tr?ng c?a Lappetit. 
	V?i h??ng v? th?m m�t c?a cam k?t h?p v?i v?n b�nh Cookie tr?i ??u tr�n b? m?t ??p m?t', '2019-10-25', 'LSP2', 's7.jpg'),
	
	('SP8', 'Red Velvet Cupcake', N'cup', 'Lappetit', 38000, N'Red Velvet Cupcake v?i ch?t b�nh m?m m?i ???c l�m t?
	tinh ch?t D�u ng�m nhi?u th�ng, cho ra n??c D�u th?m l?ng v� an to�n cho th?c kh�ch', '2019-10-24', 'LSP3', 's3.jpg'),
	
	('SP9', 'Vanilla Cupcake', N'cup', 'Lappetit', 38000, N'Vanila Cupcake v?i ch?t b�nh m?m m?i ???c l�m t? tinh ch?t 
	tr�i Vani ng�m nhi?u th�ng, cho ra n??c Vani th?m v� an to�n cho th?c kh�ch', '2019-10-25', 'LSP3', 's4.jpg'),
	
	('SP10', 'Latte', N'ly', 'Lappetit', 45000, N'Mang h??ng v? th?m ngon t? c� ph� �
	 v� v? th?m b�o t? s?a t?o n�n th?c u?ng tuy?t v?i n�y', '2019-10-22', 'LSP4', 's8.jpg'),
	 
	('SP11', 'Mango Sorbet', N'ly', 'Lappetit', 40000, N'V? chua ng?t thanh m�t c?a tr�i xo�i ch�n m?ng k?t h?p v?i 
	 v? m�t l?nh c?a ?� xay l� s? l?a ch?n ho�n h?o cho m�a h� n�ng b?c', '2019-10-22', 'LSP4', 's9.jpg'),
	 
	('SP12', 'WaterMelon Sorbet', N'ly', 'Lappetit', 35000, N'S? thanh m�t c?a d?a h?u k?t h?p v?i 
	 v? m�t l?nh c?a ?� xay l� s? l?a ch?n ho�n h?o cho m�a h� n�ng b?c', '2019-11-17', 'LSP4', 's10.jpg'),
	 
	('SP13', 'Green Sorbet', N'ly', 'Lappetit', 45000, N'H??ng v? m�t l?nh c?a T�o xanh c?ng v?i ?� xay 
	 qu? l� s? l?a ch?n kh�ng th? tuy?t v?i h?n ', '2019-11-18', 'LSP4', 's11.jpg'),

	('SP14', 'Combo Diet Detox', N'h?p', 'Lappetit', 45000, N'Bao g?m c�c m�n b�nh ?n ki�ng', '2019-10-22', 'LSP5', 's5.jpg'),

	('SP15', 'Combo Frozen & Donut', N'ly', 'Lappetit', 45000, N'Bao g?m: 1 ly Oreo Ice-blended kem cheese
	 v� 2 b�nh Donut Socola', '2019-11-20', 'LSP5', 's6.jpg');
go

INSERT INTO USERS (USER_ID, USER_NAME, PASSWORD,  EMAIL, SODT, DCHI)
VALUES
	('AD', 'admin', '1234', 'admin@gmail.com', '0123456789', N'1 V� V?n Ng�n'),
	('US1', 'qui2410', '2410', 'qui2410@gmail.com', '0917288663', N'G� V?p'),
	('US2', 'xunha1007', '1007', 'xunha1007@gmail.com', '0815962742', N'Th? ??c'),
	('US3', 'thanhld1511', '1511', 'thanhld1511@gmail.com', '0843827477', N'Qu?n 12'),
	('US4', 'nd01', '4321', 'nd01@gmail.com', '0987654321', N'Qu?n 9');
go

INSERT INTO DONHANG (SODH, USER_ID, NGAYDAT, NGAYGIAO)
VALUES 
	('DH1', 'US1', '2019-10-25', '2019-10-26'),
	('DH2', 'US2', '2019-10-30', '2019-11-1'),
	('DH3', 'US4', '2019-11-7', '2019-11-1'),
	('DH4', 'US1', '2019-11-10', '2019-11-12'),
	('DH5', 'US3', '2019-11-14', '2019-11-15'),
	('DH6', 'US2', '2019-11-20', '2019-11-21');
	delete from CTDH
go


INSERT INTO CTDH (SODH, MASP)
VALUES
	('DH1', 'SP2'),
	('DH1', 'SP9'),
	('DH1', 'SP4'),
	('DH2', 'SP4'),
	('DH3', 'SP9'),
	('DH3', 'SP4'),
	('DH4', 'SP15'),
	('DH4', 'SP4'),
	('DH4', 'SP9'),
	('DH5', 'SP11'),
	('DH5', 'SP4'),
	('DH5', 'SP9'),
	('DH6', 'SP4'),
	('DH6', 'SP9');
	
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

