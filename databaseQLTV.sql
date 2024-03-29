create database Projectdatabase
go

use Projectdatabase
go

create table TaiKhoan(
ID nvarchar(50) primary key not null,
Pass nvarchar (50) not null )
go
-- tk

insert into TaiKhoan(ID , Pass) values 
('admin','admin123'),
('nv1','nhanvien01'),
('nv2','nhanvien02'),
('nv3','nhanvien03'),
('nv4','nhanvien04'),
('nv5','nhanvien05'),
('nv6','nhanvien06'),
('nv7','nhanvien07'),
('nv8','nhanvien08'),
('nv9','nhanvien09'),
('nv10','nhanvien10')
go

create table NhanVien(
ID nvarchar(10) primary key not null,
Ho nvarchar(100) not null,
Ten nvarchar(100) not null,
GioiTinh nvarchar(10) not null,
SDT nvarchar(15) not null,
NgaySinh date not null,
NgayNhanViec date not null
)
go


insert into NhanVien(ID , Ho,Ten,GioiTinh,SDT,NgaySinh,NgayNhanViec) values
('1','Hồ Ngọc Đình','Châu','Nam','0964183512','08-23-1999','10-30-2018'),
('2','Nguyễn Thị Bích','Nhàn','Nữ','0387094975','10-30-1999','08-23-2018'),
('3','Nguyễn Thị','Cam','Nữ','0387094975','12-24-1997','09-23-2018'),
('4','Trần Văn','Quýt','Nam','0387094975','09-30-1997','09-23-2018'),
('5','Trần Hoàng','Chuối','Nam','0387094975','10-30-1996','09-23-2018')
go


create table ProductTypes(
ProductTypeID nvarchar(10) primary key not null,
Name nvarchar(50) not null
)
go

insert into ProductTypes(ProductTypeID , Name) values
('N','Nhẫn'),
('DC','Dây Chuyền'),
('BT','Bông Tai'),
('V','Vòng'),
('LT','Lắc Tay'),
('LC','Lắc Chân'),
('DH','Dong Ho')
go



create table ChatLieu(
ChatLieuID nvarchar(10) primary key not null,
Name nvarchar (50) not null
)
go


insert into ChatLieu(ChatLieuID , Name) values
('V10','Vàng10K'),
('V12','Vàng 12K'),
('V14','Vàng 14K'),
('V18','Vàng 18K'),
('V22','Vàng 22K'),
('V24','Vàng 24K'),
('VK','Vàng Khối'),
('BK','Bạch Kim'),
('KC','Kim Cương'),
('RB','Đá Quí')
go

create table Product(
ID nvarchar(10) primary key not null,
Name nvarchar (100) not null,
ProductTypeID nvarchar(10) not null,
ChatLieuID nvarchar(10) not null ,
SoLuong int not null,
TrangThai nvarchar(50) not null default N'Còn Hàng',
GiaNhap nvarchar(100) not null,
GiaBan nvarchar(100) not null,
FOREIGN KEY (ProductTypeID) REFERENCES ProductTypes(ProductTypeID),
FOREIGN KEY (ChatLieuID) REFERENCES ChatLieu(ChatLieuID)
)
go

insert into Product( ID, Name,ProductTypeID,ChatLieuID,SoLuong,GiaNhap,GiaBan) values
('1','Nhẫn Vàng Snow White','N','V10','10','2171000','2420000'),
('2','Nhẫn Vàng Cinderella','N','V10','10','3048000','3200000'),
('3','Bông Tai Vàng Đá ECZ Swarovski','BT','V10','10','4339000','4500000'),
('4','Dây Chuyền Vàng Đá Suncut','DC','V10','10','3820000','4200000'),
('5','Vòng Vàng đá Liquid','V','V10','10','3171000','2420000'),
('6','Nhẫn Vàng Trắng Đá Topaz','N','V18','10','3148000','3402000'),
('7','Nhẫn Vàng Trắng True Love','N','V18','10','3348000','3540000'),
('8','Dây Chuyền Vàng Freshwater','DC','V18','10','13048000','13200000'),
('9','Dây Chuyền Vàng Akoya','DC','V18','10','13248000','13500000'),
('10','Bông Tai Vàng 4D','DC','V18','10','13048000','13200000')
go



--exec UpdateTrangThai @ID = '1'

create table KhachHang(
ID nvarchar(10) primary key not null,
Ten nvarchar(100) not null
)
go

create table HoaDon(
MaHD nvarchar(10) primary key not null,
NhanVienID nvarchar(10) not null,
KhachHangID nvarchar(10) not null,
KhachHangName nvarchar(100) not null,
ProductID nvarchar(10)  not null,
ProductName nvarchar(100) not null,
ProductTypeID nvarchar(10) not null,
ChatLieuID nvarchar(10) not null,
SoLuong nvarchar(10) not null,
NgayLapHoaDon date not null,
ThanhTien nvarchar(100) not null,
FOREIGN KEY (NhanVienID) REFERENCES NhanVien(ID),
FOREIGN KEY (ProductID) REFERENCES Product(ID),
FOREIGN KEY (ProductTypeID) REFERENCES ProductTypes(ProductTypeID),
FOREIGN KEY (ChatLieuID) REFERENCES ChatLieu(ChatLieuID)
)
go
insert into HoaDon(MaHD,NhanVienID,KhachHangID,KhachHangName,ProductID,ProductName,ProductTypeID,ChatLieuID,SoLuong,NgayLapHoaDon,ThanhTien) values
('HD1','1','1','C','4','A','N','V10','2','01-01-2011','70'),
('HD2','2','2','C','5','A','N','V10','2','01-01-2011','70')
go


create table ThongKe(
ID int identity(1,1) primary key,
NgayThongKe date default null,
TongLuongNV nvarchar(100) default null,
TongTienMuaHang nvarchar(100) default null,
TienLoiVon nvarchar(100) default null,
)
go

create table LuongNV(
NhanVienID nvarchar(10) primary key not null,
SoLuongHD nvarchar(100) not null,
SoLuongSP nvarchar(100) not null,
SoTienBanDuoc nvarchar(100) not null,
NgayThongKe date not null,
TienThuong nvarchar(100) default null,
LuongCoBan nvarchar(100) default null,
TongLuong nvarchar(100) default null
FOREIGN KEY (NhanVienID) REFERENCES NhanVien(ID)
)
go

create table CamDo(
ID int identity(1,1) primary key not null,
TenKhachHang nvarchar(100) not null,
CMND nvarchar(100) not null,
SDT nvarchar(100) not null,
DiaChi nvarchar(100) not null,
MonDoCam nvarchar(100) not null,
SoTienCam nvarchar(100) not null,
NgayCam date not null,
NgayTra date not null,
LaiSuat nvarchar(100) not null,
SoTienPhaiTra nvarchar(100) not null,
)
go



create table VayTien(
ID int identity(1,1) primary key not null,
TenKhachHang nvarchar(100) not null,
CMND nvarchar(100) not null,
SDT nvarchar(100) not null,
DiaChi nvarchar(100) not null,
SoTienVay nvarchar(100) not null,
NgayVay date not null,
NgayTra date not null,
LaiSuat nvarchar(100) not null,
SoTienPhaiTra nvarchar(100) not null
)
go

create table ThongKeCDVT(
ID int identity(1,1) primary key not null,
NgayThongKe date not null,
TienLoiCD nvarchar(100),
TienLoiVT nvarchar(100),
TongLoi nvarchar(100)
)
go



-- procedure
--tai khoan
create procedure ThemTaiKhoan @ID nvarchar(10) , @Pass nvarchar(100)
as
begin
	insert into TaiKhoan(ID,Pass) values (@ID , @Pass)
end
go

create procedure ThayDoiMK  @ID nvarchar(10) , @Pass nvarchar(100)
as
begin
	update TaiKhoan set Pass = @Pass where TaiKhoan.ID = @ID
end
go

--nhan vien
create  procedure ShowNhanVien
as
begin
	select*
	from NhanVien
end
go

create procedure ThemNhanVien @ID nvarchar(10) , @Ho nvarchar(100) , @Ten nvarchar(100) ,@GioiTinh nvarchar(10) ,@SDT nvarchar(15),@NgaySinh date ,@NgayNhanViec date as
begin
	insert into NhanVien(ID,Ho,Ten,GioiTinh,SDT,NgaySinh,NgayNhanViec) values(
	@ID,@Ho,@Ten,@GioiTinh,@SDT,@NgaySinh,@NgayNhanViec)

end
go

create procedure CapNhatNhanVien @ID nvarchar(10) , @Ho nvarchar(100) , @Ten nvarchar(100) ,@GioiTinh nvarchar(10) ,@SDT nvarchar(15),@NgaySinh date ,@NgayNhanViec date as
begin
	update NhanVien
	set
	 ID = @ID , Ho = @Ho , Ten = @Ten , GioiTinh = @GioiTinh ,SDT = @SDT,
	 NgaySinh = @NgaySinh , NgayNhanViec = @NgayNhanViec
	 where id = @ID
end
go

create procedure XoaNhanVien @ID nvarchar(10)
as
begin 
	delete from NhanVien
	where ID = @ID
end
go

-- khachhang

create  procedure ShowKhachHang
as
begin
	select*
	from KhachHang
end
go

create procedure ThemKhachHang @ID nvarchar(10) , @Ten nvarchar(100)
as
begin
	insert into KhachHang(ID,Ten) values ( @ID , @Ten)
end
go
create procedure CapNhatKhachHang @ID nvarchar(10) , @Ten nvarchar(100)
as
begin
	update KhachHang set ID = @ID , Ten = @Ten
end
go

create procedure XoaKhachHang @ID nvarchar(10)
as
begin 
	delete from KhachHang
	where ID = @ID
end
go

--San Pham
create procedure ShowProduct 
as
begin
	select ID,Name,ProductTypeID,ChatLieuID,TrangThai,SoLuong,GiaBan
	from Product 
	end
go

create procedure ThemSanPham @ID nvarchar(10) , @Name nvarchar(100) , @ProductTypeID nvarchar(10) ,@ChatLieuID nvarchar(10) ,@SoLuong nvarchar(10),@GiaNhap nvarchar(100),@GiaBan nvarchar(100)  
as
begin
	insert into Product(ID,Name,ProductTypeID,ChatLieuID,SoLuong,GiaNhap,GiaBan) values(
	@ID,@Name,@ProductTypeID,@ChatLieuID,@SoLuong,@GiaNhap,@GiaBan)

end
go

create procedure CapNhatSanPham  @ID nvarchar(10) , @Name nvarchar(100) , @ProductTypeID nvarchar(10) ,@ChatLieuID nvarchar(10) ,@SoLuong nvarchar(10),@TrangThai nvarchar(50) ,@GiaNhap nvarchar(100),@GiaBan nvarchar(100)   
as
begin
	update Product
	set
	 ID = @ID , Name = @Name , ProductTypeID = @ProductTypeID , ChatLieuID = @ChatLieuID ,SoLuong = @SoLuong,
	 TrangThai = @TrangThai , GiaNhap = @GiaNhap , GiaBan = @GiaBan
	 where ID = @ID
end
go


create procedure XoaSanPham @ID nvarchar(10)
as
begin 
	delete from Product
	where ID = @ID
end
go

--trangthai 
create procedure ThongBaoHetHang @ID nvarchar(10)
as
begin
	
	update Product set TrangThai = 'Clear' where Product.ID = @ID
end
go

create procedure UpdateTrangThai @ID nvarchar(10)
as
begin
update Product set TrangThai = 'Còn Hàng' where Product.ID = @ID
end
go
--drop procedure ShowProduct
--exec ShowProduct

create procedure ShowKho
as
begin
	select *
	from Product 
	end
go
--hoadon
create procedure ShowHoaDon
as
begin
	select *
	from HoaDon
	end
go

create procedure ThemHoaDon @MaHD nvarchar(10), @NhanVienID nvarchar(10),@KhachHangID nvarchar(10),@KhachHangName nvarchar(100),@ProductID nvarchar(10),@ProductName nvarchar(100),
 @ProductTypeID nvarchar(10) ,@ChatLieuID nvarchar(10),@SoLuong nvarchar(10) ,@NgayLapHoaDon date ,@ThanhTien nvarchar(100) 
 as
 begin
	insert into HoaDon(MaHD,NhanVienID,KhachHangID,KhachHangName,ProductID,ProductName,ProductTypeID,ChatLieuID,SoLuong,NgayLapHoaDon,ThanhTien) values
	(@MaHD,@NhanVienID,@KhachHangID,@KhachHangName,@ProductID,@ProductName,@ProductTypeID,@ChatLieuID,@SoLuong,@NgayLapHoaDon,@ThanhTien)
 end
 go

 create procedure CapNhatHoaDon @MaHD nvarchar(10), @NhanVienID nvarchar(10),@KhachHangID nvarchar(10),@KhachHangName nvarchar(100),@ProductID nvarchar(10),@ProductName nvarchar(100),
 @ProductTypeID nvarchar(10) ,@ChatLieuID nvarchar(10),@SoLuong nvarchar(10) ,@NgayLapHoaDon date ,@ThanhTien nvarchar(100) 
 as
 begin
	update HoaDon set MaHD = @MaHD , NhanVienID = @NhanVienID , KhachHangID = @KhachHangID ,KhachHangName = @KhachHangName , ProductID = @ProductID ,ProductName=@ProductName ,
	ProductTypeID = @ProductTypeID ,ChatLieuID =@ChatLieuID , SoLuong = @SoLuong , NgayLapHoaDon = @NgayLapHoaDon ,ThanhTien =@ThanhTien
 end
 go

 create procedure XoaHoaDon @ID int
as
begin 
	delete from HoaDon
	where MaHD = @ID
end
go

--thongkeluong
create procedure ShowThongKeLuong 
as
begin
		select *
		from LuongNV
end
go


create procedure ThongKeLuong @NhanVienID nvarchar(10) ,@SoLuongHD nvarchar(100),@SoLuongSP nvarchar(100),@SoTienBanDuoc nvarchar(100),@NgayThongKe date
as
begin
	insert into LuongNV(NhanVienID,SoLuongHD,SoLuongSP,SoTienBanDuoc,NgayThongKe) values
	(@NhanVienID,@SoLuongHD,@SoLuongSP,@SoTienBanDuoc,@NgayThongKe)
end
go

create procedure CapNhatLuong  @NhanVienID nvarchar(10), @TienThuong nvarchar(100) ,@LuongCoBan nvarchar(100) , @TongLuong nvarchar(100)
as
begin
	update LuongNV set TienThuong = @TienThuong , LuongCoBan =@LuongCoBan ,TongLuong = @TongLuong where NhanVienID = @NhanVienID
end
go

drop procedure ThongKeLuong
go

create procedure CapNhatThongKeLuong @ID int,@TienLoiVon nvarchar(100) 
as
begin
	 update ThongKe set  TienLoiVon = @TienLoiVon where ID = @ID
end
go

--drop procedure CapNhatThongKeLuong
--Thong Ke
create procedure ShowThongKe 
as
begin
		select *
		from ThongKe
end
go

create procedure ThemThongKe @NgayThongKe date , @TongLuongNV nvarchar(100),@TongTienMuaHang nvarchar(100), @TienLoi nvarchar(100)
as
begin
	insert into ThongKe(NgayThongKe,TongLuongNV,TongTienMuaHang,TienLoiVon) values (@NgayThongKe,@TongLuongNV,@TongTienMuaHang,@TienLoi)
end
go

drop procedure ThemThongKe

create procedure XoaThongKe @ID int
as
begin 
	delete from ThongKe
	where ID = @ID
end
go



-- Cam Do
create procedure ShowCamDo
as
begin
	select* from CamDo
end
go

create procedure ThemCamDo @TenKhachHang nvarchar(100), @CMND nvarchar(100) ,@SDT nvarchar(100),@DiaChi nvarchar(100),@MonDoCam nvarchar(100),@SoTienCam nvarchar(100),@NgayCam date,@NgayTra date,@LaiSuat nvarchar(100),@SoTienPhaiTra nvarchar(100)
as
begin
	insert into CamDo(TenKhachHang,CMND,SDT,DiaChi,MonDoCam,SoTienCam,NgayCam,NgayTra,LaiSuat,SoTienPhaiTra) values (@TenKhachHang,@CMND,@SDT,@DiaChi,@MonDoCam,@SoTienCam,@NgayCam,@NgayTra,@LaiSuat,@SoTienPhaiTra)
end
go

create procedure CapNhatCamDo @ID int ,@TenKhachHang nvarchar(100), @CMND nvarchar(100) ,@SDT nvarchar(100),@DiaChi nvarchar(100),@MonDoCam nvarchar(100),@SoTienCam nvarchar(100),@NgayCam date,@NgayTra date,@LaiSuat nvarchar(100),@SoTienPhaiTra nvarchar(100)
as
begin
	update CamDo set TenKhachHang = @TenKhachHang , CMND = @CMND , SDT = @SDT , DiaChi = @DiaChi,MonDoCam = @MonDoCam,SoTienCam = @SoTienCam ,NgayCam=@NgayCam ,NgayTra =@NgayTra ,LaiSuat = @LaiSuat , SoTienPhaiTra = @SoTienPhaiTra where ID = @ID
end
go

create procedure XoaCamDo @ID int
as
begin 
	delete from CamDo
	where ID = @ID
end
go

-- VayTien
create procedure ShowVayTien
as
begin
	select* from VayTien
end
go

create procedure ThemVayTien @TenKhachHang nvarchar(100), @CMND nvarchar(100) ,@SDT nvarchar(100),@DiaChi nvarchar(100),@SoTienVay nvarchar(100),@NgayCam date,@NgayTra date,@LaiSuat nvarchar(100),@SoTienPhaiTra nvarchar(100)
as
begin
	insert into VayTien(TenKhachHang,CMND,SDT,DiaChi,SoTienVay,NgayVay,NgayTra,LaiSuat,SoTienPhaiTra) values (@TenKhachHang,@CMND,@SDT,@DiaChi,@SoTienVay,@NgayCam,@NgayTra,@LaiSuat,@SoTienPhaiTra)
end
go

create procedure CapNhatVayTien @ID int ,@TenKhachHang nvarchar(100), @CMND nvarchar(100) ,@SDT nvarchar(100),@DiaChi nvarchar(100),@SoTienVay nvarchar(100),@Ngayvay date,@NgayTra date,@LaiSuat nvarchar(100),@SoTienPhaiTra nvarchar(100)
as
begin
	update VayTien set TenKhachHang = @TenKhachHang , CMND = @CMND , SDT = @SDT , DiaChi = @DiaChi,SoTienVay = @SoTienVay ,NgayVay=@Ngayvay ,NgayTra =@NgayTra ,LaiSuat = @LaiSuat , SoTienPhaiTra = @SoTienPhaiTra where ID = @ID
end
go

create procedure XoaVayTien @ID int
as
begin 
	delete from VayTien
	where ID = @ID
end
go

-- trigger
create trigger UpdateSoLuongSanPham on HoaDon after insert as
begin
	update Product
	set SoLuong = Product.SoLuong -
	(select SoLuong
	from inserted 
	where ProductID = Product.ID)
	from Product
	join inserted on Product.ID = inserted.ProductID
	 
end
go



--fuction

create function TimKiemSanPham(@Name nvarchar(100))
returns table as return
(
	select ID,Name,ProductTypeID,ChatLieuID,SoLuong,GiaBan
	from Product
	Where ProductTypeID = @Name
);
go

create function TimKiemNhanVien(@ID nvarchar(100))
returns table as return
(
	select *
	from NhanVien
	where  ID = @ID
);
go

create function TimKiemKhachHang(@ID nvarchar(100))
returns table as return
(
	select *
	from KhachHang
	where  ID = @ID
);
go

create function TimKiemHoaDon(@ID nvarchar(100))
returns table as return
(
	select *
	from HoaDon
	where  MaHD = @ID
);
go

create function TimKiemNVHD(@ID nvarchar(100))
returns table as return
(
	select *
	from HoaDon
	where  NhanVienID = @ID
);
go

create function TimKiemNVLuong(@ID nvarchar(100))
returns table as return
(
	select *
	from LuongNV
	where  NhanVienID = @ID
);
go

create function TimKiemCamDo(@ID nvarchar(100))
returns table as return
(
	select *
	from CamDo
	where  ID = @ID
);
go

create function TimKiemVayDo(@ID nvarchar(100))
returns table as return
(
	select *
	from VayTien
	where  ID = @ID
);
go



--test
--select * from dbo.TimKiemSanPham('N')
--drop function TimKiemSanPham

