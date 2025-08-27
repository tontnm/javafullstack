-- 1. Tạo database và chọn database1. Tạo database và chọn database
CREATE DATABASE QuanLyKhachHang;
GO

USE QuanLyKhachHang;
GO

-- 2. Tạo bảng
-- Bảng Khách hàng
CREATE TABLE KhachHang (
    MaKH INT IDENTITY(1,1) PRIMARY KEY,  -- Tự tăng
    Ten NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    Email NVARCHAR(100) UNIQUE
);

-- Bảng Số điện thoại khách hàng
CREATE TABLE DienThoaiKH (
    MaKH INT NOT NULL,
    SDT NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_DienThoaiKH PRIMARY KEY (MaKH, SDT),
    CONSTRAINT FK_DienThoaiKH_KhachHang FOREIGN KEY (MaKH)
        REFERENCES KhachHang(MaKH)
        ON DELETE CASCADE -- Xóa khách thì số điện thoại cũng xóa
);

-- 3. Thêm dữ liệu (INSERT)
-- Thêm khách hàng
INSERT INTO KhachHang (Ten, DiaChi, Email)
VALUES 
(N'Nguyễn Văn A', N'Hà Nội', 'a@example.com'),
(N'Trần Thị B', N'Hồ Chí Minh', 'b@example.com'),
(N'Lê Văn C', N'Đà Nẵng', 'c@example.com');

-- Thêm số điện thoại
INSERT INTO DienThoaiKH (MaKH, SDT)
VALUES 
(1, '0912345678'),
(1, '0987654321'),
(2, '0933333333');

-- 4. Lấy dữ liệu (SELECT)
-- Lấy tất cả khách hàng
SELECT * FROM KhachHang;

-- Lấy tên + email khách ở Hà Nội
SELECT Ten, Email
FROM KhachHang
WHERE DiaChi = N'Hà Nội';

-- Lấy khách hàng kèm số điện thoại (JOIN)
SELECT k.MaKH, k.Ten, k.Email, d.SDT
FROM KhachHang k
LEFT JOIN DienThoaiKH d ON k.MaKH = d.MaKH;

-- 5. Sửa dữ liệu (UPDATE)
-- Đổi địa chỉ của khách có MaKH = 2
UPDATE KhachHang
SET DiaChi = N'Bình Dương'
WHERE MaKH = 2;

-- Đổi số điện thoại của khách 1
UPDATE DienThoaiKH
SET SDT = '0900000000'
WHERE MaKH = 1 AND SDT = '0987654321';

-- 6. Xóa dữ liệu (DELETE)
-- Xóa 1 số điện thoại
DELETE FROM DienThoaiKH
WHERE MaKH = 1 AND SDT = '0912345678';

-- Xóa khách hàng (tự động xóa số điện thoại vì ON DELETE CASCADE)
DELETE FROM KhachHang
WHERE MaKH = 3;

-- 7. Một số truy vấn nâng cao
-- Tìm khách hàng có số điện thoại bắt đầu bằng '09'
SELECT DISTINCT k.Ten, k.Email
FROM KhachHang k
JOIN DienThoaiKH d ON k.MaKH = d.MaKH
WHERE d.SDT LIKE '09%';

-- Đếm số điện thoại của từng khách
SELECT k.Ten, COUNT(d.SDT) AS SoLuongSDT
FROM KhachHang k
LEFT JOIN DienThoaiKH d ON k.MaKH = d.MaKH
GROUP BY k.Ten;
