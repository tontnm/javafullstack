---------------------------
-- 1. GIAOVIEN (500 người)
---------------------------
INSERT INTO GIAOVIEN (MaGV, HoTenGV)
SELECT 
    'GV' + RIGHT('000' + CAST(number AS VARCHAR(3)), 3),
    'Giao vien ' + CAST(number AS VARCHAR(3))
FROM master.dbo.spt_values
WHERE type = 'P' AND number BETWEEN 1 AND 500;

select * from GIAOVIEN;
delete from GIAOVIEN;
---------------------------
-- 2. MONHOC (100 môn học)
---------------------------
INSERT INTO MONHOC (MaMH, TenMH)
SELECT 
    'MH' + RIGHT('00' + CAST(number AS VARCHAR(3)), 3),
    'Mon hoc ' + CAST(number AS VARCHAR(3))
FROM master.dbo.spt_values
WHERE type = 'P' AND number BETWEEN 1 AND 100;

select * from MONHOC;
delete  from MONHOC;
---------------------------
-- 3. LOP (1200 lớp)
-- MaLop: Lxxxy (L + số 4 chữ số)
---------------------------
INSERT INTO LOP (MaLop, TenLop, MaGVCN, NamHoc)
SELECT 
    'L' + RIGHT('0000' + CAST(number AS VARCHAR(4)), 4), -- L0001 -> L1200
    'Lop ' + CAST(number AS VARCHAR(4)),
    'GV' + RIGHT('000' + CAST(((number - 1) % 500) + 1 AS VARCHAR(3)), 3),
    '2024-2025'
FROM master.dbo.spt_values
WHERE type = 'P' 
  AND number BETWEEN 1 AND 1200;

select * from LOP;
delete  from LOP;
---------------------------
-- 4. HOCSINH (1 triệu học sinh)
-- MaHS: HS000001 → HS1000000
---------------------------
;WITH Numbers AS (
    SELECT TOP (1000000) 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
    FROM master.dbo.spt_values a
    CROSS JOIN master.dbo.spt_values b
)
INSERT INTO HOCSINH (MaHS, HoTenHS, HoTenPhuHuynh, GioiTinh, DiaChi, MaLop)
SELECT 
    'HS' + RIGHT('0000000' + CAST(num AS VARCHAR(7)), 7), -- HS0000001 → HS1000000
    'Hoc sinh ' + CAST(num AS VARCHAR(7)),                -- đủ chứa số lớn
    'Phu huynh ' + CAST(num AS VARCHAR(7)),
    CASE WHEN num % 2 = 0 THEN 'Nam' ELSE 'Nu' END,
    'Dia chi ' + CAST(num AS VARCHAR(50)),
    'L' + RIGHT('0000' + CAST(((num - 1) % 1200 + 1) AS VARCHAR(4)), 4) -- L0001 → L1200
FROM Numbers;

select count(MaHS) from HOCSINH;
select * from HOCSINH;
delete  from HOCSINH;
---------------------------
-- 5. PHUTRACHBOMON (GV, Lớp, Môn, Học kỳ)
---------------------------
INSERT INTO PHUTRACHBOMON (MaGVPT, MaLop, MaMH, HocKy)
SELECT 
    'GV' + RIGHT('000' + CAST(((ABS(CHECKSUM(NEWID())) % 500) + 1) AS VARCHAR(3)), 3),
    'L' + RIGHT('0000' + CAST(((ABS(CHECKSUM(NEWID())) % 1200) + 1) AS VARCHAR(4)), 4),
    'MH' + RIGHT('00' + CAST(((ABS(CHECKSUM(NEWID())) % 100) + 1) AS VARCHAR(3)), 3),
    (ABS(CHECKSUM(NEWID())) % 2) + 1  -- Học kỳ 1 hoặc 2
FROM master.dbo.spt_values
WHERE type = 'P' AND number BETWEEN 1 AND 5000; -- ví dụ 5000 bản ghi

select * from PHUTRACHBOMON;
delete  from PHUTRACHBOMON;
---------------------------
-- 6. KETQUAHOCTAP (HS, Học kỳ, Môn)
---------------------------
INSERT INTO KETQUAHOCTAP (MaHS, HocKy, MaMH, DiemThiGiuaKy, DiemThiCuoiKy, NgayGioThiCuoiKy)
SELECT 
    'HS' + RIGHT('0000000' + CAST(((ABS(CHECKSUM(NEWID())) % 1000000) + 1) AS VARCHAR(7)), 7),
    (ABS(CHECKSUM(NEWID())) % 2) + 1,
    'MH' + RIGHT('00' + CAST(((ABS(CHECKSUM(NEWID())) % 100) + 1) AS VARCHAR(3)), 3),
    CAST(RAND(CHECKSUM(NEWID())) * 10 AS DECIMAL(3,1)),
    CAST(RAND(CHECKSUM(NEWID()) + 1) * 10 AS DECIMAL(3,1)),
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-01-01')
FROM master.dbo.spt_values
WHERE type = 'P' AND number BETWEEN 1 AND 200000; -- ví dụ 200k bản ghi

select * from KETQUAHOCTAP;
delete  from KETQUAHOCTAP;