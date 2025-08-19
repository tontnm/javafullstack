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

select * from HOCSINH;
select * from LOP;
select * from GIAOVIEN;
select * from MONHOC;
select * from KETQUAHOCTAP;
select * from PHUTRACHBOMON;
