select * from GIAOVIEN;
select HoTenHS,GioiTinh,HoTenPhuHuynh from HOCSINH;
select * from LOP;
select * from HOCSINH;
--a.	Những học sinh có giới tính là Nam
select * from HOCSINH
where GioiTinh = 'Nam';

--b.	Những học sinh chưa có tên của phụ huynh.
update HOCSINH
set HoTenPhuHuynh = NULL 
where MaHS in ('HS0001','HS0005','HS0010');
select * from HOCSINH
where HoTenPhuHuynh is null;

--c.	Những lớp chưa có giáo viên chủ nhiệm.
update LOP
set MaGVCN = NULL 
where MaLop in ('L31','L52');
select * from LOP;

--d.	Những học sinh chưa được phân lớp.
update HOCSINH
set MaLop = NULL 
where MaHS in ('HS0002','HS0006','HS0011');
select * from HOCSINH
where MaLop is null;

--e.	Những học sinh nữ có địa chỉ ở Thanh Khê.
select * from HOCSINH;
update HOCSINH
set DiaChi = 'Thanh Khe' 
where MaHS in ('HS0003','HS0007');
select * from HOCSINH
where DiaChi = 'Thanh Khe';

--f.	Những học sinh nam có địa chỉ ở Hải Châu hoặc những học sinh nữ có 
-- địa chỉ ở Thanh Khê.
update HOCSINH
set DiaChi = 'Hai Chau' 
where MaHS in ('HS0003');
update HOCSINH
set DiaChi = 'Thanh Khe' 
where MaHS in ('HS0004');
select * from HOCSINH
where (DiaChi = 'Hai Chau' and GioiTinh = 'Nam') or 
(DiaChi = 'Thanh Khe' and GioiTinh = 'Nu');

--g.	Những học sinh nam chưa có tên phụ huynh và những học sinh nữ 
-- chưa được phân lớp.
select * from HOCSINH
where (GioiTinh = 'Nam' and HoTenPhuHuynh is null) or 
(GioiTinh = 'Nu' and MaLop is null);

--h.	Những học sinh nam chưa được phân lớp và những học sinh nam 
--chưa có tên phụ huynh.
select * from HOCSINH
where GioiTinh = 'Nam' and (HoTenPhuHuynh is null or MaLop is null);

--i.	Mã môn học của những môn học được dạy trong học kỳ 2.
select * from MONHOC;
select MaMH from PHUTRACHBOMON
where HocKy = 2;

select * from HOCSINH;
update HOCSINH set HoTenHS = 'Nguyen No' where MaHS = 'HS0002';
update HOCSINH set HoTenHS = 'Nguyen Phu2' where MaHS = 'HS0003';
update HOCSINH set HoTenHS = 'Le Thi No' where MaHS = 'HS0004';
update HOCSINH set HoTenHS = 'To Phu2' where MaHS = 'HS0005';
update HOCSINH set HoTenHS = 'Hoang Thi' where MaHS = 'HS0006';
update HOCSINH set HoTenHS = 'Tran Huynh Kim Tuyen' where MaHS = 'HS0007';
update HOCSINH set HoTenHS = 'Huyen Tran Cong Chua Thien Kim Tieu Thu' where MaHS = 'HS0008';
update HOCSINH set HoTenHS = 'Do Dai Ba Muoi Ky Tu Day Aaa B' where MaHS = 'HS0009';
update HOCSINH set HoTenHS = 'Vu Huynh Nhu Ngoc' where MaHS = 'HS0010';
update HOCSINH set HoTenHS = 'Abcd Phu2' where MaHS = 'HS0011';

--a.	Những học sinh có họ tên bắt đầu bằng từ Nguyễn
select * from HOCSINH
where HoTenHS like 'Nguyen%';

--b.	Những học sinh có họ tên kết thúc bằng từ Nở.
select * from HOCSINH
where HoTenHS like '%No';

--c.	Những học sinh có họ tên chứa từ Thị.
select * from HOCSINH
where ' '+HoTenHS+' ' like '% Thi %';

--d.	Những học sinh chứa từ Thị ở giữa (không được chứa ở đầu và ở cuối).
select * from HOCSINH
where HoTenHS like '% Thi %';

--e.	Những học sinh có họ tên với độ dài là 30 ký tự (kể cả khoảng trắng).
select * from HOCSINH
where len(HoTenHS) = 30;

--f.	Những học sinh có họ tên với độ dài tối đa là 30 ký tự.
select * from HOCSINH
where len(HoTenHS) <= 30;

--g.Những học sinh có họ tên với độ dài tối đa là 30 ký tự và bắt đầu bằng ký tự N.
select * from HOCSINH
where len(HoTenHS) <= 30 and HoTenHS like 'N%';

--h.	Những học sinh có họ tên bắt đầu bằng các ký tự: N, T, V.
select * from HOCSINH
where HoTenHS like 'N%' or HoTenHS like 'T%' or HoTenHS like 'V%';
select * from HOCSINH
where HoTenHS like '[NTV]%';

--i.	Những học sinh có họ tên không được bắt đầu bằng các ký tự: N, T, V.
select * from HOCSINH
where HoTenHS not like '[NTV]%';
select * from HOCSINH
where HoTenHS like '[^NTV]%';

--j.	Những học sinh có họ tên với phần họ có đúng 4 ký tự.
select * from HOCSINH
where HoTenHS like '____ %';

--k.	Những học sinh có họ tên KHÔNG bắt đầu bằng Ng (Ví dụ Nguyen Van A 
--là không được hiển thị ra).
select * from HOCSINH
where HoTenHS not like 'Ng%';

--a.	Họ tên của toàn bộ học sinh trong trường, nếu họ tên nào trùng nhau thì 
--chỉ hiển thị 1 lần.
select * from HOCSINH;
insert into HOCSINH (MaHS,HoTenHS,GioiTinh) 
values ('HS0012','Abcd Phu2','Nu');
select distinct HoTenHS from HOCSINH;

--b.	Mã lớp của các lớp đã có học sinh học ở lớp đó. Nếu mã lớp nào trùng nhau 
--thì chỉ hiển thị 1 lần.
select * from HOCSINH;
insert into HOCSINH (MaHS,HoTenHS,DiaChi,MaLop)
values ('HS0013','Huynh Tran Thanh','Sala Quan 2','L11');
select distinct MaLop from HOCSINH
where MaLop is not null;

--c.	Mã môn học của những môn học đã có ít nhất 1 giáo viên được phân công 
--phụ trách rồi. (*)
select distinct MaMH from PHUTRACHBOMON;

--d.	Mã môn học của những môn học đã từng được tổ chức thi ít nhất 1 lần.
select distinct MaMH from KETQUAHOCTAP;

--e.	Mã giáo viên của những giáo viên đã từng làm chủ nhiệm cho ít nhất 1 lớp nào đó.
select distinct MaGVPT from PHUTRACHBOMON;


--a.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được 
--sắp xếp tăng dần theo họ tên học sinh.
select * from HOCSINH order by HoTenHS asc;
select * from HOCSINH order by HoTenHS;

--b.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp 
--giảm dần theo địa chỉ.
select * from HOCSINH order by DiaChi desc;

--c.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp 
--tăng dần theo họ tên học sinh và giảm dần theo địa chỉ.
select * from HOCSINH order by HoTenHS asc, DiaChi desc;

--d.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp 
--xếp tăng dần theo họ tên học sinh và tăng dần theo địa chỉ.
select * from HOCSINH order by HoTenHS asc, DiaChi asc;

--e.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được 
--sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ.
select * from HOCSINH order by HoTenHS desc, DiaChi desc;

--f.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm 
--dần theo họ tên học sinh, giảm dần theo địa chỉ và tăng dần theo họ tên phụ huynh.
select * from HOCSINH order by HoTenHS desc, DiaChi desc, HoTenPhuHuynh asc;

--a.	MaHS, HoTenHS, GioiTinh, MaLop, TenLop, MaGVCN của học sinh trong trường.
select MaHS,HoTenHS,GioiTinh,LOP.MaLop,TenLop,MaGVCN 
from HOCSINH
join LOP on HOCSINH.MaLop = LOP.MaLop;

--b.	MaHS, HoTenHS, HocKy, MaMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn 
--học đã có kết quả tương ứng với từng học sinh trong trường.
select HOCSINH.MaHS,HoTenHS,HocKy,MaMH,DiemThiGiuaKy,DiemThiCuoiKy
from HOCSINH
join KETQUAHOCTAP on HOCSINH.MaHS = KETQUAHOCTAP.MaHS;

--c.	MaGV, HoTenGV, MaLop, MaMH, HocKy của những giáo viên đã được giao phụ trách 
--ít nhất 1 môn học.
select GIAOVIEN.MaGV,HoTenGV,MaLop,MaMH,HocKy
from GIAOVIEN
join PHUTRACHBOMON on GIAOVIEN.MaGV = PHUTRACHBOMON.MaGVPT;

--a.	MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) 
--của học sinh trong trường.
select MaHS,HoTenHS,GioiTinh,TenLop,NamHoc,MaGVCN,HoTenGV 
from HOCSINH
join LOP on HOCSINH.MaLop = LOP.MaLop
join GIAOVIEN on LOP.MaGVCN = GIAOVIEN.MaGV;

--b.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh 
--và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select HOCSINH.MaHS,HoTenHS,HocKy,MONHOC.MaMH,TenMH,DiemThiGiuaKy,DiemThiCuoiKy
from HOCSINH
join KETQUAHOCTAP on HOCSINH.MaHS=KETQUAHOCTAP.MaHS
join MONHOC on KETQUAHOCTAP.MaMH = MONHOC.MaMH;

--c.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV 
--(phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng 
--với từng học sinh trong trường.
select 
	HOCSINH.MaHS,HoTenHS,HocKy,MONHOC.MaMH,TenMH,DiemThiGiuaKy,DiemThiCuoiKy,
	LOP.MaLop,MaGV,HoTenGV
from HOCSINH
join LOP on HOCSINH.MaLop=LOP.MaLop
join GIAOVIEN on LOP.MaGVCN = GIAOVIEN.MaGV
join KETQUAHOCTAP on HOCSINH.MaHS=KETQUAHOCTAP.MaHS
join MONHOC on KETQUAHOCTAP.MaMH = MONHOC.MaMH;

--d.	MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, 
--DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh 
--và các môn học đã có kết quả tương ứng với từng học sinh trong trường. (***)
select 
	distinct HOCSINH.MaHS,HoTenHS,LOP.MaLop,MaGVCN,GV_CN.HoTenGV,PHUTRACHBOMON.HocKy,
	MONHOC.MaMH,TenMH,DiemThiGiuaKy,DiemThiCuoiKy,PHUTRACHBOMON.MaGVPT,GV_PT.HoTenGV
from HOCSINH
join LOP on HOCSINH.MaLop = LOP.MaLop
join GIAOVIEN GV_CN on LOP.MaGVCN = GV_CN.MaGV
join PHUTRACHBOMON on Lop.MaLop = PHUTRACHBOMON.MaLop
join MONHOC on PHUTRACHBOMON.MaMH = MONHOC.MaMH
join KETQUAHOCTAP on HOCSINH.MaHS = KETQUAHOCTAP.MaHS
join GIAOVIEN GV_PT on PHUTRACHBOMON.MaGVPT = GV_PT.MaGV;

--e.	MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, 
--DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của những học 
--sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên. (***)
select 
	distinct HOCSINH.MaHS,HoTenHS,LOP.MaLop,MaGVCN,GV_CN.HoTenGV,PHUTRACHBOMON.HocKy,
	MONHOC.MaMH,TenMH,DiemThiGiuaKy,DiemThiCuoiKy,PHUTRACHBOMON.MaGVPT,GV_PT.HoTenGV
from HOCSINH
join LOP on HOCSINH.MaLop = LOP.MaLop
join GIAOVIEN GV_CN on LOP.MaGVCN = GV_CN.MaGV
join PHUTRACHBOMON on Lop.MaLop = PHUTRACHBOMON.MaLop
join MONHOC on PHUTRACHBOMON.MaMH = MONHOC.MaMH
join KETQUAHOCTAP on HOCSINH.MaHS = KETQUAHOCTAP.MaHS
join GIAOVIEN GV_PT on PHUTRACHBOMON.MaGVPT = GV_PT.MaGV
where GioiTinh = 'Nu' and (DiemThiGiuaKy > 9 or DiemThiCuoiKy > 9);

--f.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, 
--MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương 
--ứng với từng học sinh trong trường. Với điều kiện là chỉ hiển thị những môn học mà 
--giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp. (***)
select 
	hs.MaHS,hs.HoTenHS,kq.HocKy,kq.MaMH,mh.TenMH,kq.DiemThiGiuaKy,kq.DiemThiCuoiKy,
	l.MaLop,bm.MaGVPT
from HOCSINH hs
join KETQUAHOCTAP kq on kq.MaHS = hs.MaHS
join MONHOC mh on mh.MaMH = kq.MaMH
join LOP l on l.MaLop = hs.MaLop
join PHUTRACHBOMON bm on bm.MaLop = l.MaLop and bm.MaGVPT = l.MaGVCN;

--g.	MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2019
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
where YEAR(kq.NgayGioThiCuoiKy) = '2020';

--h.	MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2019
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
where YEAR(kq.NgayGioThiCuoiKy) = '2020' and MONTH(kq.NgayGioThiCuoiKy) = '2';

update KETQUAHOCTAP
set NgayGioThiCuoiKy = '2020-02-01 08:30:00.000'
where MaMH='T' and MaHS = 'HS0001   ';
update KETQUAHOCTAP
set NgayGioThiCuoiKy = '2020-02-05 10:30:00.000'
where MaMH='MT' and MaHS = 'HS0002   ';
update KETQUAHOCTAP
set NgayGioThiCuoiKy = '2020-02-10 12:30:00.000'
where MaMH='MT' and MaHS = 'HS0005   ';
update KETQUAHOCTAP
set NgayGioThiCuoiKy = '2020-02-13 14:30:00.000'
where MaMH='AN' and MaHS = 'HS0009   ';
update KETQUAHOCTAP
set NgayGioThiCuoiKy = '2020-02-20 16:30:00.000'
where MaMH='KHTN' and MaHS = 'HS0010   ';
update KETQUAHOCTAP
set NgayGioThiCuoiKy = '2020-03-12 18:30:00.000'
where MaMH='AN' and MaHS = 'HS0011   ';

--i.	MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2019
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
where YEAR(kq.NgayGioThiCuoiKy) = '2020' and MONTH(kq.NgayGioThiCuoiKy) = '2'
	and DAY(kq.NgayGioThiCuoiKy) < '20';

--j.	MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2019 đúng 1 tuần. (***)
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
WHERE CAST(kq.NgayGioThiCuoiKy AS DATE) = DATEADD(DAY, -7, '2020-02-20');

--k.	MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2019 đúng 21 ngày. (***)
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
WHERE CAST(kq.NgayGioThiCuoiKy AS DATE) = DATEADD(DAY, 21, '2020-02-20');

--l.	MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2019.
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
WHERE kq.NgayGioThiCuoiKy between '2020-02-10' and '2020-02-20';

--m.	MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2019.
select kq.MaMH,hs.MaLop,kq.HocKy,kq.NgayGioThiCuoiKy
from KETQUAHOCTAP kq
join HOCSINH hs on hs.MaHS = kq.MaHS
WHERE kq.NgayGioThiCuoiKy BETWEEN '2020-02-10 10:00:00' AND '2020-02-20 20:30:00';

--a.	Liệt kê những địa chỉ khác nhau trong bảng HOCSINH (bằng 2 cách khác nhau) (*)
SELECT DISTINCT DiaChi
FROM  HOCSINH;

SELECT DiaCHi
FROM  HOCSINH
Group by DiaChi;

--b.	Liệt kê HoTenHS, GioiTinh của các nhóm được phân nhóm theo HoTenHS và GioiTinh trong bảng HOCSINH.
select HoTenHS, GioiTinh, count(*)
from HOCSINH
group by HoTenHS, GioiTinh;

--c.	Liệt kê HoTenHS của các nhóm được phân nhóm theo HoTenHS và GioiTinh trong 
--bảng HOCSINH. Chú ý thử giải thích vì sao không liệt kê GioiTinh mà vẫn không bị lỗi. (*)
select HoTenHS, count(*) -- ko bắt buộc hiện GioiTinh ở đây
from HOCSINH
group by HoTenHS, GioiTinh;

insert into HOCSINH (MaHS,HoTenHS,HoTenPhuHuynh,GioiTinh,DiaChi,MaLop)
values 
('HS0014','Nguyen Ngoc Minh','abc','Nam','abc Tan Phu','L42'),
('HS0015','Nguyen Ngoc Minh','def','Nam','def Tan Binh','L42');

--d.	Liệt kê MaMH, TenMH, DiemThiCuoiKy của từng môn học chia theo từng mức điểm thi 
--cuối kỳ. (Gợi ý: chỉ liệt kê những môn đã từng có học sinh thi cuối kỳ). (*)
select kq.MaMH,mh.TenMH, kq.DiemThiCuoiKy, count(*) SoLuongHS
from KETQUAHOCTAP kq
join MONHOC mh on mh.MaMH = kq.MaMH
group by kq.MaMH,mh.TenMH, kq.DiemThiCuoiKy;

update KETQUAHOCTAP
set DiemThiCuoiKy = 5
where MaHS = 'HS0001   ' and MaMH = 'T';
update KETQUAHOCTAP
set DiemThiCuoiKy = 5
where MaHS = 'HS0002   ' and MaMH = 'AV';
update KETQUAHOCTAP
set DiemThiCuoiKy = 5
where MaHS = 'HS0002   ' and MaMH = 'MT';
update KETQUAHOCTAP
set DiemThiCuoiKy = 6
where MaHS = 'HS0003   ' and MaMH = 'AN';
update KETQUAHOCTAP
set DiemThiCuoiKy = 6
where MaHS = 'HS0003   ' and MaMH = 'KHTN';
update KETQUAHOCTAP
set DiemThiCuoiKy = 7
where MaHS = 'HS0004   ' and MaMH = 'AN';
update KETQUAHOCTAP
set DiemThiCuoiKy = 7
where MaHS = 'HS0004   ' and MaMH = 'KHTN';
update KETQUAHOCTAP
set DiemThiCuoiKy = 8
where MaHS = 'HS0005   ' and MaMH = 'MT';
update KETQUAHOCTAP
set DiemThiCuoiKy = 8
where MaHS = 'HS0006   ' and MaMH = 'T';
update KETQUAHOCTAP
set DiemThiCuoiKy = 9
where MaHS = 'HS0007   ' and MaMH = 'AV';
update KETQUAHOCTAP
set DiemThiCuoiKy = 9
where MaHS = 'HS0007   ' and MaMH = 'MT';

--e.	Liệt kê MaGV, TenGV của những giáo viên đã từng được phân công phụ trách ít 
--nhất 1 môn học. Nếu MaGV, TenGV trùng lặp nhiều lần thì chỉ hiển thị ra 1 lần trong 
--kết quả trả về.
select gv.MaGV,gv.HoTenGV,count(*) SoLanPhuTrachBoMon
from PHUTRACHBOMON bm
join GIAOVIEN gv on gv.MaGV = bm.MaGVPT
group by gv.MaGV,gv.HoTenGV;

insert into PHUTRACHBOMON (MaGVPT,MaLop,MaMH,HocKy)
values ('GV002','L51','MT',2);

--13
--a.	Liệt kê HoTenHS, GioiTinh, DiaChi của các nhóm được phân nhóm theo HoTenHS và 
--GioiTinh trong bảng HOCSINH. Thử suy nghĩ về nguyên nhân lỗi nếu có lỗi xảy ra (*)
select HoTenHS, GioiTinh, DiaChi
from HOCSINH
group by HoTenHS, GioiTinh, DiaChi;

--b.	Đếm số lượng học sinh là nam.
select GioiTinh, COUNT(*) SoLuongHSNam
from HOCSINH
where GioiTinh = 'Nam'
group by GioiTinh;

--c.	Đếm số lượng học sinh trong lớp có tên là Lơp 1/1 và lớp đó nằm trong năm học 
--2019-2020.
select hs.MaLop, count(*) SoLuongHSTrongLop, l.NamHoc
from HOCSINH hs
join LOP l on l.MaLop = hs.MaLop
where l.NamHoc = '2019-2020'
group by hs.MaLop, l.NamHoc;

--d.	Đếm số lớp đã phụ trách (có thể là 1 hoặc nhiều môn nào đó) của từng giáo viên.
select MaGVPT,MaLop, count(*) SoLuongLopPhuTrach 
from PHUTRACHBOMON
group by MaGVPT,MaLop;

--14
--a.	Học sinh chưa từng thi môn nào.
SELECT HOCSINH.HoTenHS 
FROM HOCSINH WHERE NOT EXISTS 
(SELECT  HOCSINH.HoTenHS
FROM  KETQUAHOCTAP
where KETQUAHOCTAP.MaHS=HOCSINH.MaHS);

SELECT HOCSINH.MaHS
FROM HOCSINH 
WHERE MaHS NOT IN (SELECT  MaHS
FROM  KETQUAHOCTAP);

--b.	Giáo viên chưa từng phụ trách môn học nào.
select MaGV 
from GIAOVIEN
where MaGV not in (
	select MaGVPT from PHUTRACHBOMON
);

--c.	Giáo viên chưa từng chủ nhiệm lớp nào.
select MaGV 
from GIAOVIEN
where MaGV not in (
	select distinct MaGVCN from LOP where MaGVCN is not null
);

--d.	Môn học chưa từng được tổ chức thi lần nào.
select MaMH 
from MONHOC
where MaMH not in (
	select distinct MaMH
	from KETQUAHOCTAP
);

select * from HOCSINH;
select * from KETQUAHOCTAP;
select * from MONHOC;
select * from GIAOVIEN;
select * from PHUTRACHBOMON;
select * from LOP;

update LOP
set MaGVCN = 'GV001'
where MaLop='L42';