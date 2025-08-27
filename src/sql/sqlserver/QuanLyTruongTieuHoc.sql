select * from HOCSINH
where (DiemToan >= 8 AND GioiTinh = 'Nu') OR (DiemToan <= 5 AND DiaChi = 'Duong X');

select * from GIAOVIEN;
select * from MONHOC;
select * from LOP;
select * from HOCSINH;
select * from PHUTRACHBOMON;
select * from KETQUAHOCTAP;

insert into GIAOVIEN values 
('GV001','Nguyen Van A1'),
('GV002','Nguyen Van A2'),
('GV003','Nguyen Van A3'),
('GV004','Nguyen Van A4'),
('GV005','Nguyen Van A5'),
('GV006','Nguyen Van A6'),
('GV007','Nguyen Van A7'),
('GV008','Nguyen Van A8'),
('GV009','Nguyen Van A9'),
('GV010','Nguyen Van A10');

insert into MONHOC values 
('MH001','Mon Hoc 1'),
('MH002','Mon Hoc 2'),
('MH003','Mon Hoc 3'),
('MH004','Mon Hoc 4'),
('MH005','Mon Hoc 5'),
('MH006','Mon Hoc 6'),
('MH007','Mon Hoc 7'),
('MH008','Mon Hoc 8'),
('MH009','Mon Hoc 9'),
('MH010','Mon Hoc 10');

insert into LOP values 
('L01','Lop 1','GV001',2025),
('L02','Lop 2','GV002',2025),
('L03','Lop 3','GV003',2025),
('L04','Lop 4','GV004',2025),
('L05','Lop 5','GV005',2025),
('L06','Lop 6','GV006',2025),
('L07','Lop 7','GV007',2025),
('L08','Lop 8','GV008',2025),
('L09','Lop 9','GV009',2025),
('L10','Lop 10','GV010',2025);

insert into HOCSINH values 
('HS0001','Hoc Sinh 1','Phu Huynh 1','Nam','Dia Chi 1','L01'),
('HS0002','Hoc Sinh 2','Phu Huynh 2','Nam','Dia Chi 2','L02'),
('HS0003','Hoc Sinh 3','Phu Huynh 3','Nam','Dia Chi 3','L03'),
('HS0004','Hoc Sinh 4','Phu Huynh 4','Nam','Dia Chi 4','L03'),
('HS0005','Hoc Sinh 5','Phu Huynh 5','Nam','Dia Chi 5','L05'),
('HS0006','Hoc Sinh 6','Phu Huynh 6','Nu','Dia Chi 6','L05'),
('HS0007','Hoc Sinh 7','Phu Huynh 7','Nu','Dia Chi 7','L07'),
('HS0008','Hoc Sinh 8','Phu Huynh 8','Nu','Dia Chi 8','L07'),
('HS0009','Hoc Sinh 9','Phu Huynh 9','Nu','Dia Chi 9','L09'),
('HS0010','Hoc Sinh 10','Phu Huynh 10','Nu','Dia Chi 10','L09');

insert into PHUTRACHBOMON values 
('GV001','L01','MH001',1),
('GV002','L02','MH002',1),
('GV003','L03','MH003',1),
('GV004','L04','MH004',1),
('GV005','L05','MH005',1),
('GV006','L06','MH006',2),
('GV007','L07','MH007',2),
('GV008','L08','MH008',2),
('GV009','L09','MH009',2),
('GV010','L10','MH010',2);

insert into KETQUAHOCTAP values 
('HS0001',1,'MH001',1.0,10.0,'02/28/2025'),
('HS0002',1,'MH002',2.0,9.0,'01/01/2025'),
('HS0003',1,'MH003',3.0,8.0,'02/05/2025'),
('HS0004',1,'MH004',4.0,7.0,'03/10/2025'),
('HS0005',1,'MH005',5.0,6.0,'04/15/2025'),
('HS0006',2,'MH006',6.0,5.0,'05/20/2025'),
('HS0007',2,'MH007',7.0,4.0,'06/25/2025'),
('HS0008',2,'MH008',8.0,3.0,'07/30/2025'),
('HS0009',2,'MH009',9.0,2.0,'02/28/2025'),
('HS0010',2,'MH010',10.0,1.0,'02/28/2025');