
--CREATE DATABASE Website Bán Bánh & Coffee
CREATE DATABASE BanBanh 
GO

--Tạo bảng Loại sản phẩm
go
CREATE TABLE LOAISP
(
	MALOAISP varchar(10) NOT NULL PRIMARY KEY,
	TENLOAISP nvarchar(100) UNIQUE
)
---------------------------------------------
--Tạo bảng sản phẩm
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
--Tạo bảng User
go
CREATE TABLE USERS
(
	USER_ID varchar(10) PRIMARY KEY, --Cũng là mã khách hàng
	USER_NAME nvarchar(50),
	[PASSWORD] nvarchar(30),
	EMAIL nvarchar(50) UNIQUE,
	SODT varchar(10) UNIQUE,
	DCHI nvarchar(100) UNIQUE,
	Allowed int DEFAULT(1)
)
---------------------------------------------
-- Tạo bảng đơn hàng
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
-- Tạo bảng chi tiết đơn hàng

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

--Code tạo dữ liệu
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
	('SP1', 'High Fiber Bread', N'ổ', 'Lappetit', 75000, N'High Fiber được làm từ bột mì thô giàu 
	chất xơ của Đức với hàm lượng chất xơ cao, nhiều hạt dinh dưỡng', '2019-10-22', 'LSP1', 'm1.jpg'),

	('SP2', 'Rye Caraway Bagels', N'túi', 'Lappetit', 160000, N'Rye Bagel được làm từ bột mì đen, 
	thêm bột mì protein cao và hạt thì là ba tư nổi tiếng', '2019-10-23', 'LSP1', 'm2.jpg'),
	
	('SP3', 'Mocha Hazelnut Chiffon Cake ', N'cái', 'Lappetit', 250000, N'Được làm từ bột bánh Chiffon thượng hạng
	kết hợp cùng vị thơm béo của hạt dẻ', '2019-10-28', 'LSP2', 'm3.jpg'),
	
	('SP4', 'Crown Birthday Cake ', N'cái', 'Lappetit', 690000, N'Bánh Sinh Nhật Cao Tầng Vương Miện
	 sang chảnh với bánh bông lan mịn xốp cùng lớp kem mềm mịn', '2019-10-22', 'LSP2', 'm4.jpg'),
	
	('SP5', 'American Apple Pie ', N'cái', 'Lappetit', 398000, N'Chiếc bánh thơm ngon với lớp vỏ ngoài giòn rụm
	 kết hơp với nhân bánh táo mềm mềm đặc trưng của táo Mỹ.', '2019-10-22', 'LSP2', 'm2.jpg'),
	
	('SP6', 'BlueBerry Coffee Cake', N'cái', 'Lappetit', 400000, N'Chiếc bánh vỏ ngoài giòn rụm kết hợp với
	 những trái việt quất căng mọng đặc trưng khiến thực khách nhớ mãi.', '2019-11-5', 'LSP2', 's2.jpg'),
	
	('SP7', 'Orange Cranbery Tart', N'cái', 'Lappetit', 355000, N'Bánh Tart Cam làm món đặc trưng của Lappetit. 
	Với hương vị thơm mát của cam kết hợp với vụn bánh Cookie trải đều trên bề mặt đẹp mắt', '2019-10-25', 'LSP2', 's7.jpg'),
	
	('SP8', 'Red Velvet Cupcake', N'cup', 'Lappetit', 38000, N'Red Velvet Cupcake với chất bánh mềm mại được làm từ
	tinh chất Dâu ngâm nhiều tháng, cho ra nước Dâu thơm lừng và an toàn cho thực khách', '2019-10-24', 'LSP3', 's3.jpg'),
	
	('SP9', 'Vanilla Cupcake', N'cup', 'Lappetit', 38000, N'Vanila Cupcake với chất bánh mềm mại được làm từ tinh chất 
	trái Vani ngâm nhiều tháng, cho ra nước Vani thơm và an toàn cho thực khách', '2019-10-25', 'LSP3', 's4.jpg'),
	
	('SP10', 'Latte', N'ly', 'Lappetit', 45000, N'Mang hương vị thơm ngon từ cà phê Ý
	 và vị thơm béo từ sữa tạo nên thức uống tuyệt vời này', '2019-10-22', 'LSP4', 's8.jpg'),
	 
	('SP11', 'Mango Sorbet', N'ly', 'Lappetit', 40000, N'Vị chua ngọt thanh mát của trái xoài chín mọng kết hợp với 
	 vị mát lạnh của đá xay là sự lựa chọn hoàn hảo cho mùa hè nóng bức', '2019-10-22', 'LSP4', 's9.jpg'),
	 
	('SP12', 'WaterMelon Sorbet', N'ly', 'Lappetit', 35000, N'Sự thanh mát của dưa hấu kết hợp với 
	 vị mát lạnh của đá xay là sự lựa chọn hoàn hảo cho mùa hè nóng bức', '2019-11-17', 'LSP4', 's10.jpg'),
	 
	('SP13', 'Green Sorbet', N'ly', 'Lappetit', 45000, N'Hương vị mát lạnh của Táo xanh cũng với đá xay 
	 quả là sự lựa chọn không thể tuyệt vời hơn ', '2019-11-18', 'LSP4', 's11.jpg'),

	('SP14', 'Combo Diet Detox', N'hộp', 'Lappetit', 45000, N'Bao gồm các món bánh ăn kiêng', '2019-10-22', 'LSP5', 's5.jpg'),

	('SP15', 'Combo Frozen & Donut', N'ly', 'Lappetit', 45000, N'Bao gồm: 1 ly Oreo Ice-blended kem cheese
	 và 2 bánh Donut Socola', '2019-11-20', 'LSP5', 's6.jpg');
go

INSERT INTO USERS (USER_ID, USER_NAME, PASSWORD,  EMAIL, SODT, DCHI)
VALUES
	('AD', 'admin', '1234', 'admin@gmail.com', '0123456789', N'1 Võ Văn Ngân'),
	('US1', 'qui2410', '2410', 'qui2410@gmail.com', '0917288663', N'Gò Vấp'),
	('US2', 'xunha1007', '1007', 'xunha1007@gmail.com', '0815962742', N'Thủ Đức'),
	('US3', 'thanhld1511', '1511', 'thanhld1511@gmail.com', '0843827477', N'Quận 12'),
	('US4', 'nd01', '4321', 'nd01@gmail.com', '0987654321', N'Quận 9');
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

--TRIGGER

--Trigger 1: Kiểm tra Mã Sản phẩm có được nhập đúng định dạng không
CREATE TRIGGER tg_KiemTraMaSP ON SANPHAM
FOR insert, update
AS
DECLARE @MASP varchar(10)
SELECT @MASP = ne.MASP
FROM inserted ne
IF (@MASP not like '%SP%')
BEGIN
	PRINT (N'Nhập sai định dạng mã sản phẩm.
			Vui lòng nhập lại theo dạng SPxxxx')
	ROLLBACK
END
--DROP TRIGGER tg_KiemTraMaSP

--Trigger 2: Kiểm tra Tên Sản phẩm khi nhập vào có bị trùng nhau hay không
CREATE TRIGGER tg_KiemTraTenSP ON SANPHAM
FOR insert, update
AS
DECLARE @TENSP nvarchar(50)
SET @TENSP = (SELECT ne.TENSP FROM inserted ne)
DECLARE @d int 
SET @d = (SELECT count(TENSP) FROM SANPHAM WHERE TENSP = @TENSP)
IF (@d > 1)
BEGIN 
	print(N'Sản phẩm đã tồn tại. Vui lòng nhập lại')
	ROLLBACK
END
--DROP TRIGGER tg_KiemTraTenSP

--Trigger 3: Cập nhật tổng giá tiền trong Đơn hàng khi thêm, sửa sản phẩm, sửa số lượng

go
CREATE TRIGGER tg_CapNhatDH_Them ON CTDH 
FOR insert, update
AS
DECLARE @SODH varchar(10), @MASP varchar(10), @SL int, @GIA int, @TONGGIATIEN int
SELECT @SODH = ne.SODH, @MASP = ne.MASP, @SL = ne.SL, @GIA = sp.GIA
FROM inserted ne inner join SANPHAM sp ON ne.MASP = sp.MASP
	update CTDH
	set THANHTIEN = @GIA * @SL
	where SODH = @SODH and MASP = @MASP
SELECT @TONGGIATIEN = sum(THANHTIEN)
FROM CTDH
WHERE SODH = @SODH
	update DONHANG
    set TONGGIATIEN = @TONGGIATIEN
	where SODH = @SODH
GO
--DROP TRIGGER tg_CapNhatDH_Them

--Trigger 4: Cập nhật lại tổng giá tiền trong Đơn hàng khi xóa sản phẩm
CREATE TRIGGER tg_CapNhat_Xoa ON CTDH 
FOR delete
AS
DECLARE @SODH varchar(10), @TONGGIATIEN int 
SELECT @SODH = SODH
FROM deleted
SELECT @TONGGIATIEN = sum(THANHTIEN)
FROM CTDH
WHERE SODH = @SODH
	UPDATE DONHANG 
	SET TONGGIATIEN = @TONGGIATIEN 
	WHERE SODH = @SODH
GO
--DROP TRIGGER tg_CapNhat_Xoa 

--Trigger 5: Kiểm tra định dạng gmail
CREATE TRIGGER tg_KiemTraEmail ON USERS
FOR insert, update
AS
DECLARE @EMAIL nvarchar(50)
SELECT @EMAIL = ne.EMAIL
FROM inserted ne
IF (@EMAIL not like '%@gmail.com%')
BEGIN
	PRINT (N'Nhập sai định dạng Email.
		Vui lòng nhập lại theo dạng @gmail.com')
	ROLLBACK
END
--DROP TRIGGER tg_KiemTraEmail


---------------------------------------------------
---------------------------------------------------

--STORED-PROCEDUCE

-- Get data User
CREATE PROC sp_LayUser
AS
SELECT * FROM USERS
--DROP PROC sp_LayUser

-- Get data User
CREATE PROC sp_LaySP
AS
SELECT * FROM SANPHAM
--DROP PROC sp_LaySP

-- Get data User
CREATE PROC sp_LayLSP
AS
SELECT * FROM LOAISP
--DROP PROC sp_LayLSP

-- Lấy data User
CREATE PROC sp_LayDH
AS
SELECT * FROM DONHANG
--DROP PROC sp_LayDH

-- Lấy data User
CREATE PROC sp_LayCTDH
AS
SELECT * FROM CTDH
--DROP PROC sp_LayCTDH

--Get User By id
CREATE PROC sp_LayidCTHD @id varchar(10)
AS
SELECT * FROM CTDH WHERE SODH = @id
--DROP PROC sp_LayidCTHD

--Get User By id
CREATE PROC sp_LayidDH @id varchar(10)
AS
SELECT * FROM DONHANG WHERE SODH = @id
--DROP PROC sp_LayidDH

--Get User By id
CREATE PROC sp_LayidLSP @id varchar(10)
AS
SELECT * FROM LOAISP WHERE MALOAISP = @id
--DROP PROC sp_LayidLSP

--Get User By id
CREATE PROC sp_LayidSP @id varchar(10)
AS
SELECT * FROM SANPHAM WHERE MASP = @id
--DROP PROC sp_LayidSP

--Get User By id
CREATE PROC sp_LayidUser @id varchar(10)
AS
SELECT * FROM USERS WHERE USER_ID = @id
--DROP PROC sp_LayidUser

 --Insert
GO 
CREATE PROC sp_ThemUser 
	  @USER_NAME nvarchar(50), @PASSWORD nvarchar(30),
	  @EMAIL nvarchar(50), @SODT varchar(10), @DCHI nvarchar(100)
AS
BEGIN

	DECLARE @USER_ID VARCHAR(10), @num int
	SELECT @num = max(convert(int, substring(U.USER_ID, 3, 8))) FROM USERS U
	SELECT @USER_ID = concat('US', convert(varchar(10), @num + 1))

	INSERT INTO USERS (USER_ID, USER_NAME, PASSWORD, EMAIL, SODT, DCHI) 
	VALUES (@USER_ID, @USER_NAME, @PASSWORD, @EMAIL, @SODT, @DCHI)
END
EXECUTE sp_ThemUser 'nd2', '1111', 'nd2@gmail.com', '0902453782', N'Bình Chánh'
--DROP PROC sp_ThemUser

GO
CREATE PROC sp_ThemSP 
	  @TENSP nvarchar(50), @DVT nvarchar(20),
	  @NOISX nvarchar(50), @GIA int, @MOTA ntext, @MALOAISP varchar(10), @HINH varchar(50)
AS
BEGIN
	DECLARE @MASP VARCHAR(10), @num int
	SELECT @num = max(convert(int, substring(S.MASP, 3, 8))) FROM SANPHAM S
	SELECT @MASP =  concat('SP', convert(varchar(10), @num + 1))

	INSERT INTO SANPHAM(MASP, TENSP, DVT, NOISX, GIA, MOTA, MALOAISP, HINH)
	VALUES (@MASP, @TENSP, @DVT, @NOISX, @GIA, @MOTA, @MALOAISP, @HINH)
END
EXECUTE sp_ThemSP 'Capuchino', 'ly', 'Lappetit', '50000', 
	N'Thức uống có vị béo thơm của sữa và hương vị đậm đà của cà phê 
	cùng với hình vẽ đẹp mắt nổi bên trên ly Capuchino', 'LSP4'
--DROP PROC sp_ThemSP

GO
CREATE PROC sp_ThemLSP 
	@MALOAISP varchar(10), @TENLOAISP nvarchar(50)
AS 
BEGIN
	INSERT INTO LOAISP (MALOAISP, TENLOAISP)
	VALUES (@MALOAISP, @TENLOAISP)
END
EXECUTE sp_ThemLSP 'LSP6', N'Đồ trang trí bánh'
--DROP PROC sp_ThemLSP

--Thêm Đơn hàng rỗng
GO
CREATE PROC sp_ThemDH 
	 @USER_ID varchar(10)
AS 
BEGIN
	DECLARE @SODH VARCHAR(10), @num int
	SELECT @num = max(convert(int, substring(D.SODH, 3, 8))) FROM DONHANG D
	SELECT @SODH =  concat('DH', convert(varchar(10), @num + 1))

	INSERT INTO DONHANG (SODH, USER_ID)
	VALUES (@SODH, @USER_ID)
END
EXECUTE sp_ThemDH N'US2'
--DROP PROC sp_ThemDH

--Theem CTDH
GO
CREATE PROC sp_ThemCTDH 
	@USER_ID varchar(10), @MASP varchar(10), @SL int
AS 
BEGIN
	DECLARE @SODH VARCHAR(10)
	SELECT @SODH = D.SODH FROM DONHANG D WHERE D.NGAYDAT IS NULL AND D.USER_ID = @USER_ID
	IF(@SODH IS NULL)
	BEGIN
		EXECUTE sp_ThemDH @USER_ID
		SELECT @SODH = D.SODH FROM DONHANG D WHERE D.NGAYDAT IS NULL
	END

	INSERT INTO CTDH (SODH, MASP, SL)
	VALUES (@SODH, @MASP, @SL)
END
EXECUTE sp_ThemCTDH 'US6', 'SP14', 2
--DROP PROC sp_ThemCTDH


--Update
GO
CREATE PROC sp_CapNhatSP
	@MASP varchar(10), @TENSP nvarchar(50), @DVT nvarchar(20), @NOISX nvarchar(50),
	@GIA int, @MOTA ntext, @NGAYCAPNHAT date, @MALOAISP varchar(10)
AS
BEGIN
	UPDATE SANPHAM SET TENSP = @TENSP WHERE MASP = @MASP
	UPDATE SANPHAM SET DVT = @DVT WHERE MASP = @MASP
	UPDATE SANPHAM SET NOISX = @NOISX WHERE MASP = @MASP
	UPDATE SANPHAM SET GIA = @GIA WHERE MASP = @MASP
	UPDATE SANPHAM SET MOTA = @MOTA WHERE MASP = @MASP
	UPDATE SANPHAM SET NGAYCAPNHAT = @NGAYCAPNHAT WHERE MASP = @MASP
	UPDATE SANPHAM SET MALOAISP = @MALOAISP WHERE MASP = @MASP
END
EXECUTE sp_CapNhatSP 'SP16', N'Bánh Tart trứng', 'cái', 'Lappetit', '20000', 
'Bánh tart nghìn lớp vỏ mỏng giòn rụm và nhân kem trứng thơm ngon', '2019-11-9', 'LSP1'
--DROP PROC sp_CapNhatSP

GO
CREATE PROC sp_CapNhatLSP
	@MALOAISP varchar(10), @TENLOAISP nvarchar(50)
AS
BEGIN
	UPDATE LOAISP SET TENLOAISP = @TENLOAISP WHERE MALOAISP = @MALOAISP
END
EXECUTE sp_CapNhatLSP 'LSP6', N'Trang trí bánh'
--DROP PROC sp_CapNhatLSP

GO
CREATE PROC sp_CapNhatUser
	@USER_ID varchar(10), @USER_NAME nvarchar(50), @PASSWORD nvarchar(30),
	@EMAIL nvarchar(50), @SODT varchar(10), @DCHI nvarchar(100)
AS
BEGIN
	UPDATE USERS SET USER_NAME = @USER_NAME WHERE USER_ID = @USER_ID
	UPDATE USERS SET PASSWORD = @PASSWORD WHERE USER_ID = @USER_ID
	UPDATE USERS SET EMAIL = @EMAIL WHERE USER_ID = @USER_ID
	UPDATE USERS SET SODT = @SODT WHERE USER_ID = @USER_ID
	UPDATE USERS SET DCHI = @DCHI WHERE USER_ID = @USER_ID
END
EXECUTE sp_CapNhatUser 'US5', 'us', '2222', 'us@gmail.com', '0222222222', N'Quận 3'

GO
CREATE PROC sp_CapNhatDH
	@SODH varchar(10), @USER_ID varchar(10), 
	@NGAYDAT smalldatetime, @NGAYGIAO smalldatetime
AS
BEGIN
	UPDATE DONHANG SET USER_ID = @USER_ID WHERE SODH = @SODH
	UPDATE DONHANG SET NGAYDAT = @NGAYDAT WHERE SODH = @SODH
	UPDATE DONHANG SET NGAYGIAO = @NGAYGIAO WHERE SODH = @SODH
END
EXECUTE sp_CapNhatDH 'DH7', 'US3', '2019-11-23', '2019-11-24'

GO
CREATE PROC sp_CapNhatCTDH
	@SODH varchar(10), @MASP varchar(10), @SL int
AS
BEGIN
	UPDATE CTDH SET MASP = @MASP WHERE SODH = @SODH
	UPDATE CTDH SET SL = @SL WHERE SODH = @SODH
END
EXECUTE sp_CapNhatCTDH 'DH7', 'SP12', 3 

--Delete
GO
CREATE PROC sp_XoaUser (@USER_ID varchar(10))
AS
BEGIN
	DELETE FROM USERS WHERE USER_ID = @USER_ID
END
EXECUTE sp_XoaUser 'US5'

GO
CREATE PROC sp_XoaSP (@MASP varchar(10))
AS
BEGIN
	DELETE FROM SANPHAM WHERE MASP = @MASP
END
EXECUTE sp_XoaSP 'SP16'
--DROP PROC sp_XoaSP

GO
CREATE PROC sp_XoaLSP (@MALOAISP varchar(10))
AS
BEGIN
	DELETE FROM LOAISP WHERE MALOAISP = @MALOAISP
END
EXECUTE sp_XoaLSP 'LSP6'
--DROP PROC sp_XoaLSP 

GO
CREATE PROC sp_XoaDH (@SODH varchar(10))
AS
BEGIN
	DELETE FROM DONHANG WHERE SODH = @SODH
END
EXECUTE sp_XoaDH 'DH7'

GO
CREATE PROC sp_XoaCTDH (@SODH varchar(10))
AS
BEGIN
	DELETE FROM CTDH WHERE SODH = @SODH
END
EXECUTE sp_XoaUser 'DH7'



--Thông tin sản phẩm có giá tiền cao nhất
GO
CREATE PROC sp_maxGia
AS
BEGIN
	DECLARE @GIA int
	SET @GIA = (select max(GIA) as GiaTienCaoNhat
			   from SANPHAM)
	SELECT * FROM SANPHAM WHERE SANPHAM.GIA = @GIA
END
EXECUTE sp_maxGia
--DROP PROC sp_maxGia

--Sản phẩm có giá tiền thấp nhất
GO
CREATE PROC sp_minGia 
AS 
BEGIN
	DECLARE @GIA int
	SET @GIA = (select min(GIA) as GiaTienThapNhat
			    from SANPHAM)
	SELECT * FROM SANPHAM WHERE SANPHAM.GIA = @GIA
END
--DROP PROC sp_minGia

-------------------------------------------------------
-------------------------------------------------------

--FUNCTION

--Function 1: Tự động trả về 1 ID User tăng
GO
CREATE FUNCTION f_autoID_User() 
RETURNS varchar(10)
AS
BEGIN
	DECLARE @num int
	SELECT @num = max(convert(int, substring(U.USER_ID, 3, 8))) FROM USERS U
	return concat('US', convert(varchar(10), @num + 1))
END
SELECT dbo.f_autoID_User()
--DROP FUNCTION f_autoID_User

-- Proceduce đăng ký
go
CREATE PROC PSignIn (@name nvarchar, @pass nvarchar, @mail nvarchar, @phone nvarchar, @add nvarchar)
AS
BEGIN
	DECLARE @id VARCHAR
	SELECT @id = dbo.f_autoID_User((select max(USER_ID) from USERS))
	INSERT INTO USERS (USER_ID, USER_NAME, PASSWORD, SODT, EMAIL, DCHI)
	VALUES (@id, @name, @pass, @phone, @mail, @add)
END

EXECUTE PSignIn 'hoang', 'zxc', 'hoan@gmail.com', '0123456543', 'SG'
--DROP PROC PSignIn

--Function 2: Hàm trả về Sản phẩm theo Loại sản phẩm
GO
CREATE FUNCTION f_Sptheo_Loai (@MALOAISP varchar(10))  
RETURNS TABLE
AS
RETURN (SELECT MASP, TENSP, DVT, NOISX, GIA, MOTA, NGAYCAPNHAT,
			   SANPHAM.MALOAISP, LOAISP.TENLOAISP
		FROM SANPHAM, LOAISP
		WHERE SANPHAM.MALOAISP = LOAISP.MALOAISP and LOAISP.MALOAISP = @MALOAISP)

SELECT * FROM f_Sptheo_Loai('LSP2')
--DROP FUNCTION f_Sptheo_Loai

--Function 3: Hàm trả về Tổng giá tiền các Đơn hàng đã hoàn thành theo ngày
GO
CREATE FUNCTION f_tongTien_ngay(@NGAYGIAO smalldatetime) 
RETURNS int
AS
BEGIN 
	RETURN ( SELECT sum(TONGGIATIEN) 
				  FROM DONHANG
				  WHERE NGAYGIAO = @NGAYGIAO 
		   )
END

SELECT dbo.f_tongTien_ngay('2019-11-15') TongTien_Ngay
--DROP FUNCTION f_tongTien_ngay

--Function 4: Hàm trả về bảng thông tin người dùng qua số điện thoại
GO
CREATE FUNCTION f_timUser_SDT (@SDT int) 
RETURNS TABLE
AS
	RETURN ( SELECT *FROM USERS
			 WHERE SODT = @SDT )

SELECT * FROM f_timUser_SDT ('0815962742')
--DROP FUNCTION f_timUser_SDT

--Function 5: Hàm trả về Tổng số lượng các đơn hàng 
GO 
CREATE FUNCTION f_slDonHang ()
RETURNS int
AS
BEGIN
	DECLARE @SL int
	SET @SL = ( SELECT count(SODH) FROM DONHANG )
	RETURN @SL
END

SELECT dbo.f_slDonHang() as SLDon
--DROP FUNCTION f_slDonHang

--Function 6: Hàm trả về Số lượng Sản phẩm bán được và lấy Sản phẩm BestSeller bằng việc sắp xếp giảm dần
GO 
CREATE FUNCTION f_slBan ()
RETURNS TABLE
AS
RETURN ( SELECT CTDH.MASP, SANPHAM.TENSP, sum(SL) AS SLBan , SANPHAM.GIA, SANPHAM.HINH
		 FROM SANPHAM, CTDH, DONHANG
		 WHERE SANPHAM.MASP = CTDH.MASP and CTDH.SODH = DONHANG.SODH and NGAYGIAO is not null
		 GROUP BY CTDH.MASP, SANPHAM.TENSP , SANPHAM.GIA, SANPHAM.HINH) 
		 
SELECT * FROM dbo.f_slBan() ORDER BY SLBan DESC 
--DROP FUNCTION f_slBan

go
create function f_CartUs (@Userid varchar(10))
returns table
AS 
return (SELECT DONHANG.SODH, DONHANG.NGAYDAT,DONHANG.NGAYGIAO,DONHANG.TONGGIATIEN, SANPHAM.TENSP,SANPHAM.GIA,CTDH.SL,CTDH.THANHTIEN
	FROM DONHANG , SANPHAM , CTDH
	WHERE DONHANG.SODH = CTDH.SODH and CTDH.MASP = SANPHAM.MASP and DONHANG.USER_ID = @Userid)
--drop function f_CartUs
select * from f_CartUs('US1') 


SELECT *FROM DONHANG , SANPHAM , CTDH
WHERE DONHANG.USER_ID = 'US1' and DONHANG.SODH = CTDH.SODH and CTDH.MASP = SANPHAM.MASP
---------------------------------------------------------
---------------------------------------------------------

--VIEW

--View 1: Hiển thị Tên Sản phẩm và Tên Loại Sản phẩm theo Mã Loai sản phẩm
GO
CREATE VIEW v_TenSP
AS
	SELECT LOAISP.MALOAISP,SANPHAM.TENSP, LOAISP.TENLOAISP
	FROM SANPHAM, LOAISP
	WHERE SANPHAM.MALOAISP = LOAISP.MALOAISP

SELECT * FROM v_TenSP ORDER BY MALOAISP 
--DROP VIEW v_TenSP

--View 3: Hiển thị thông tin các sản phẩm đã bán được
GO 
CREATE VIEW v_SpBanDuoc
AS
	SELECT s.MASP, TENSP, GIA
	FROM CTDH, SANPHAM s, DONHANG d
	WHERE CTDH.MASP = s.MASP and CTDH.SODH = d.SODH 
		and NGAYGIAO is not NULL WITH CHECK OPTION

SELECT DISTINCT MASP, TENSP, GIA FROM v_SpBanDuoc
--DROP VIEW v_SpBanDuoc

--View 4: Hiển thị thông tin khách hàng theo Đơn hàng họ đã đặt
GO
CREATE VIEW v_InfKH_DonHang 
AS
	SELECT c.SODH, u.USER_ID, u.USER_NAME, u.EMAIL, u.SODT, u.DCHI, d.TONGGIATIEN
	FROM USERS u, DONHANG d, CTDH c
	WHERE u.USER_ID = d.USER_ID and d.SODH = c.SODH

SELECT DISTINCT * FROM v_InfKH_DonHang
--DROP VIEW v_InfKH_DonHang

--View 5: Hiển thị thông tin các sản phẩm có mặt trong từ 5 Đơn hàng trở lên
GO
CREATE VIEW v_sp_5Don
AS
	SELECT s.MASP, TENSP, GIA, count(c.MASP) as SL_Don
	FROM SANPHAM s, CTDH c
	WHERE s.MASP = c.MASP
	GROUP BY s.MASP, TENSP, GIA
	HAVING count(c.MASP) >= 5

SELECT * FROM v_sp_5Don
--DROP VIEW v_sp_5Don

--View 6: Hiển thị thông tin Loại Sản phẩm
GO
CREATE VIEW v_InfLoaiSP
AS 
	    SELECT * FROM LOAISP

SELECT * FROM v_InfLoaiSP ORDER BY MALOAISP
--DROP VIEW v_InfLoaiSP
	
--View 7: Hiển thị thông tin Đơn hàng theo giá giảm dần
GO
CREATE VIEW v_InfDon
AS
	SELECT *
	FROM DONHANG

SELECT * FROM v_InfDon ORDER BY TONGGIATIEN DESC

--View 8: Hiển thị thông tin Chi tiết đơn hàng 
GO
CREATE VIEW v_InfCTDH
AS
	SELECT *
	FROM CTDH

SELECT * FROM v_InfCTDH ORDER BY SODH


