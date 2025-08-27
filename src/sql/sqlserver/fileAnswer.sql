Dựa vào DB quản lý trường tiểu học, hãy thực hiện các truy vấn SQL sau:
1.	Tạo lược đồ CSDL đã cho trong SQL Server. Học viên tư định nghĩa các kiểu dữ liệu cho từng cột ở các bảng. 
Chú ý: 
-	Cột nào KHÔNG được thiết lập (KHÔNG được chọn) là NOT NULL nghĩa là các cột đó chúng ta có quyền không nhập dữ liệu cho nó mà chỉ để chữ NULL. Để chữ NULL chứ không phải là ‘NULL’, để ‘NULL’ thì nghĩa là chuỗi có giá trị là NULL mất rồi. Các cột là khóa chính, khóa ngoại đương nhiên phải NOT NULL.
-	Các cột dữ liệu có liên quan với nhau ở các bảng thì phải có kiểu dữ liệu giống hệt nhau. Vd: Nếu cột MaGV trong bảng GIAOVIEN có kiểu dữ liệu là char(10) thì cột MaGVCN trong bảng LOP cũng phải có kiểu dữ liệu là char(10) vì cột MaGVCN là khóa ngoại ở trong bảng LOP, nó được nối với MaGV (là khóa chính trong bảng GIAOVIEN).
-	Để nhập được tiếng Việt có dấu thì chúng ta sẽ khai kiểu dữ liệu là nchar hoặc nvarchar (kiểu char và varchar thì chỉ có thể nhập được dữ liệu là tiếng Anh/Mỹ).
-	Phải để ý các cột nào là ngày tháng năm thì phải khai kiểu dữ liệu là Date. Cột nào là giờ mà không có ngày tháng năm thì phải khai là Time. Còn cột nào vừa chứa ngày tháng năm vừa chứa giờ thì khai là Datetime.
-	Nếu tạo diagram bị lỗi (không tạo được như hướng dẫn trong video hoặc tài liệu hướng dẫn) thì tạm thời không cần tạo diagram cũng được. Nhưng phải đảm bảo dữ liệu ở các bảng phải chính xác với nhau.
2.	INSERT dữ liệu (Không cần nhập tiếng Việt có dấu) vào tất cả các bảng theo 5 cách:
a.	Cách 1: INSERT bằng tay. Mỗi bảng cần insert tối thiểu 10 dòng bằng cách này.
b.	Cách 2: INSERT bằng lệnh (không chỉ định rõ tên cột). Mỗi bảng cần insert tối thiểu 10 dòng bằng cách này.
c.	Cách 3: INSERT bằng lệnh (có chỉ định rõ tên cột). Mỗi bảng cần insert tối thiểu 10 dòng bằng cách này.
3.	UPDATE dữ liệu (sửa dữ liệu cho các dòng có sẵn) cho bảng HOCSINH theo 3 cách:
a.	Cách 1: UPDATE bằng tay. Áp dụng tối thiểu 5 dòng bằng cách này.
b.	Cách 2: UPDATE bằng lệnh (không có điều kiện WHERE). Áp dụng tối thiểu 5 dòng bằng cách này.
c.	Cách 3: UPDATE bằng lệnh (có điều kiện WHERE). Áp dụng tối thiểu 5 dòng bằng cách này.
4.	DELETE dữ liệu cho bảng HOCSINH theo 3 cách:
a.	Cách 1: DELETE bằng tay. Áp dụng tối thiểu 2 dòng bằng cách này.
b.	Cách 2: DELETE bằng lệnh (có điều kiện WHERE). Áp dụng tối thiểu 2 dòng bằng cách này.
5.	Hãy liệt kê (sử dụng lệnh SELECT đơn giản không có WHERE):
a.	Toàn bộ thông tin của toàn bộ giáo viên trong trường.
SELECT *
FROM GIAOVIEN
b.	Họ tên học sinh, giới tính, họ tên phụ huynh của toàn bộ sinh viên trong trường.
Select HotenHS, GioiTinh, HotenPH
From HOCSINH
c.	Toàn bộ thông tin của tất cả các lớp trong trường 
Select *
From LOP
6.	Hãy liệt kê:
a.	Những học sinh có giới tính là Nam
SELECT MaHS, HoTenHS
FROM HOCSINH
Where GioiTinh='Nam'
b.	Những học sinh chưa có tên của phụ huynh.

SELECT MaHS, HoTenHS
FROM HOCSINH
Where HoTenPH is null
c.	Những lớp chưa có giáo viên chủ nhiệm.
SELECT Malop, TenLop
FROM LOP
WHERE MaGVCN is null
d.	Những học sinh chưa được phân lớp.
Select MaHS, HoTenHS
From HOCSINH
Where MaLop is null
e.	Những học sinh nữ có địa chỉ ở Thanh Khê.
Select MaHS, HoTenHS, HoTenPH
From HOCSINH
Where GioiTinh='Nu' and DiaChi = 'Thanh Khe'
f.	Những học sinh nam có địa chỉ ở Hải Châu hoặc những học sinh nữ có địa chỉ ở Thanh Khê.
Select MaHS, HoTenHS, HoTenPH, DiaChi, GioiTinh
From HOCSINH
Where (Gioitinh='Nam' and DiaChi = 'Hai Chau')
or (GioiTinh='Nu' and DiaChi =  'Thanh Khe')
g.	Những học sinh nam chưa có tên phụ huynh và những học sinh nữ chưa được phân lớp.
Select MaHS, HoTenHS, HoTenPH
From HOCSINH
Where (Gioitinh='Nam' and HoTenPH is null)
or (GioiTinh='Nu' and MaLop is null)
h.	Những học sinh nam chưa được phân lớp và những học sinh nam chưa có tên phụ huynh.
Select MaHS, HoTenHS, HoTenPH
From HOCSINH
Where Gioitinh='Nam' and (MaLop is null or HoTenPH is null)
i.	Mã môn học của những môn học được dạy trong học kỳ 2.
Select MaMH
From PHUTRACHBOMON
Where HocKy=2
Gợi ý: Lệnh SELECT đơn giản có WHERE trên 1 bảng. Các toán tử so sánh, quan hệ. Độ ưu tiên của các toán tử.
7.	Hãy liệt kê:
a.	Những học sinh có họ tên bắt đầu bằng từ Nguyễn.
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
where HoTenHS like 'Nguyen%'
b.	Những học sinh có họ tên kết thúc bằng từ Nở.
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
                        from HOCSINH
                        where HoTenHS like '%No'
c.	Những học sinh có họ tên chứa từ Thị.
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
where HoTenHS like '%Thi%'

d.	Những học sinh chứa từ Thị ở giữa (không được chứa ở đầu và ở cuối).
                        select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
where HoTenHS like '%Thi%' and HoTenHS not like 'Thi%' and HoTenHS not like '%Thi'
e.	Những học sinh có họ tên với độ dài là 30 ký tự (kể cả khoảng trắng).
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
                        where len(HoTenHS)=30
f.	Những học sinh có họ tên với độ dài tối đa là 30 ký tự.
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
where len(HoTenHS) <=30
g.	Những học sinh có họ tên với độ dài tối đa là 30 ký tự và bắt đầu bằng ký tự N.
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
                        from HOCSINH
                        where (HoTenHS like 'N%') and (len(HoTenHS)<=30)
h.	Những học sinh có họ tên bắt đầu bằng các ký tự: N, T, V.
select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
where HoTenHS like '[NTV]%'
i.	Những học sinh có họ tên không được bắt đầu bằng các ký tự: N, T, V.
                         select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
where HoTenHS like '[^NTV]%'
j.	Những học sinh có họ tên với phần họ có đúng 4 ký tự.

select MaHS, HoTenHS, GioiTinh, DiaChi, MaLop
from HOCSINH
                        where HoTenHS like '____ %'
Gợi ý: Sử dụng từ khóa LIKE trong câu SELECT. Có sử dụng %, _, [] và [^].
8.	Hãy liệt:
a.	Họ tên của toàn bộ học sinh trong trường, nếu họ tên nào trùng nhau thì chỉ hiển thị 1 lần.
SELECT DISTINCT HoTenHS
FROM  HOCSINH
b.	Mã lớp của các lớp đã có học sinh học ở lớp đó. Nếu mã lớp nào trùng nhau thì chỉ hiển thị 1 lần.
SELECT DISTINCT MaLop
FROM  HOCSINH
c.	Mã môn học của những môn học đã có ít nhất 1 giáo viên được phân công phụ trách rồi. (*)
SELECT DISTINCT MaMH
FROM  PHUTRACHBOMON 
d.	Mã môn học của những môn học đã từng được tổ chức thi ít nhất 1 lần.
SELECT DISTINCT MaMH
KETQUAHOCTAP
e.	Mã giáo viên của những giáo viên đã từng làm chủ nhiệm cho ít nhất 1 lớp nào đó.
SELECT DISTINCT MaGVCN
FROM  LOP
Gợi ý: Sử dụng từ khóa DISTINCT
9.	Hãy liệt kê:
a.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh.
SELECT  MaHS, HoTenHS, HoTenPH, GioiTinh, DiaChi, MaLop
FROM HocSinh
ORDER BY HoTenHS ASC
(Có chữ ASC cũng được mà ko có cũng được, vì nó mặc định là tăng dần)
b.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo địa chỉ.
SELECT  MaHS, HoTenHS, HoTenPH, GioiTinh, DiaChi, MaLop
FROM HocSinh
ORDER BY DiaChi DESC
c.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và giảm dần theo địa chỉ.
SELECT  MaHS, HoTenHS, HoTenPH, GioiTinh, DiaChi, MaLop
FROM HocSinh
ORDER BY HoTenHS ASC, DiaChi DESC
(Có chữ ASC cũng được mà ko có cũng được, vì nó mặc định là tăng dần)
d.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và tăng dần theo địa chỉ.
SELECT  MaHS, HoTenHS, HoTenPH, GioiTinh, DiaChi, MaLop
FROM HocSinh
ORDER BY HoTenHS, DiaChi ASC
(Có chữ ASC cũng được mà ko có cũng được, vì nó mặc định là tăng dần)
e.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ.
SELECT  MaHS, HoTenHS, HoTenPH, GioiTinh, DiaChi, MaLop
FROM HocSinh
ORDER BY HoTenHS DESC, DiaChi DESC
f.	Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ và tăng dần theo họ tên phụ huynh.
SELECT  MaHS, HoTenHS, HoTenPH, GioiTinh, DiaChi, MaLop
FROM HocSinh
ORDER BY HoTenHS DESC, DiaChi DESC, HoTenPH ASC
*** Trả lời thêm: Trong 2 từ khóa ASC và DESC, từ nào là không bắt buộc phải ghi rõ trong câu SELECT mà kết quả thực hiện vẫn đảm bảo tính đúng đắn?
                        Nếu không chỉ định là ASC hay DESC thì mặc định là ASC.
Gợi ý: Sử dụng từ khóa ORDER BY
10.	Hãy liệt kê:
a.	MaHS, HoTenHS, GioiTinh, MaLop, TenLop, MaGVCN của học sinh trong trường.
SELECT MaHS, HoTenHS, GioiTinh, LOP.MaLop, TenLop, MaGVCN
FROM HOCSINH
INNER JOIN LOP
ON HOCSINH.MaLop=LOP.MaLop
Hoặc là:
SELECT * FROM HOCSINH
INNER JOIN LOP
ON HOCSINH.MaLop=LOP.MaLop
b.	MaHS, HoTenHS, HocKy, MaMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT * FROM HOCSINH
INNER JOIN KETQUAHOCTAP
ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
c.	MaGV, HoTenGV, MaLop, MaMH, HocKy của những giáo viên đã được giao phụ trách ít nhất 1 môn học.
SELECT * FROM GIAOVIEN
INNER JOIN PHUTRACHBOMON
ON GIAOVIEN.MaGV=PHUTRACHBOMON.MaGVPT
Gợi ý: Sử dụng LỆNH INNER JOIN 2 BẢNG và nhiều bảng.
11.	Hãy liệt kê:
a.	MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) của học sinh trong trường.
SELECT MaHS, HoTenHS, GioiTinh, HOCSINH.MaLop, TenLop, NamHoc, MaGVCN, HoTenGV
FROM HOCSINH
INNER JOIN LOP ON HOCSINH.MaLop=LOP.MaLop
INNER JOIN GIAOVIEN ON LOP.MaGVCN=GIAOVIEN.MaGV
b.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT HOCSINH.MaHS, HoTenHS, HocKy, MONHOC.MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy
FROM HOCSINH
INNER JOIN KETQUAHOCTAP ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
INNER JOIN MONHOC ON KETQUAHOCTAP.MaMH=MONHOC.MaMH
c.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT HS.MaHS, HoTenHS, KQHT.HocKy, MH.MaMH,       
TenMH, DiemThiGiuaKy, DiemThiCuoiKy, HS.MaLop, MaGV, HoTenGV
FROM HOCSINH HS
INNER JOIN KETQUAHOCTAP KQHT ON HS.MaHS=KQHT.MaHS
INNER JOIN MONHOC MH ON KQHT.MaMH=MH.MaMH
INNER JOIN PHUTRACHBOMON PTBM ON MH.MaMH=PTBM.MaMH and KQHT.HocKy = PTBM.HocKy
INNER JOIN GIAOVIEN GV ON PTBM.MaGVPT=GV.MaGV
d.	MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. (***)
SELECT HS.MaHS, HoTenHS, HS.MaLop, LOPCHUNHIEM.MaGVCN, GVCN.HoTenGV, KQHT.HocKy, MH.MaMH, TenMH,  DiemThiGiuaKy, DiemThiCuoiKy, GVPT.MaGV, GVPT.HotenGV
FROM HOCSINH HS
INNER JOIN LOP LOPCHUNHIEM ON HS.MaLop = LOPCHUNHIEM.MaLop
INNER JOIN GIAOVIEN GVCN ON LOPCHUNHIEM.MaGVCN = GVCN.MaGV
INNER JOIN KETQUAHOCTAP KQHT ON HS.MaHS=KQHT.MaHS
INNER JOIN MONHOC MH ON KQHT.MaMH=MH.MaMH
INNER JOIN PHUTRACHBOMON PTBM ON MH.MaMH=PTBM.MaMH and KQHT.HocKy = PTBM.HocKy
INNER JOIN GIAOVIEN GVPT ON PTBM.MaGVPT=GVPT.MaGV
e.	MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của những học sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên. (***)
Học viên tự làm dựa vào các câu ở trên
f.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. Với điều kiện là chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp. (***)
Học viên tự làm dựa vào các câu ở trên

g.	MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2019
SELECT MaLop, MaMH, HocKy
FROM HOCSINH
INNER JOIN KETQUAHOCTAP ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
Where YEAR(NgayGioThiCuoiKy)=2019
h.	MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2019
SELECT MaLop, MaMH, HocKy
FROM HOCSINH
INNER JOIN KETQUAHOCTAP ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
Where YEAR(NgayGioThiCuoiKy)=2019 and MONTH(NgayGioThiCuoiKy)=8
i.	MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2019
SELECT MaLop, MaMH, HocKy
FROM HOCSINH
INNER JOIN KETQUAHOCTAP ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
Where NgayGioThiCuoiKy<'2019/08/20'
j.	MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2019 đúng 1 tuần. (***)
k.	MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2019 đúng 21 ngày. (***)
l.	MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2019.
SELECT MaLop, MaMH, HocKy
FROM HOCSINH
INNER JOIN KETQUAHOCTAP ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
Where NgayGioThiCuoiKy Between '2019/08/10 00:00:00' And '2019/08/20 23:59:59'

m.	MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2019.
SELECT MaLop, MaMH, HocKy
FROM HOCSINH
INNER JOIN KETQUAHOCTAP ON HOCSINH.MaHS=KETQUAHOCTAP.MaHS
Where NgayGioThiCuoiKy Between '2019/08/10 10:00:00' And '2019/08/20 20:30:00'
Gợi ý: Sử dụng INNER JOIN nhiều bảng và có dùng các hàm xử lý Ngày, giờ và có BETWEEN và AND
12.	Hãy liệt kê:
a.	Liệt kê những địa chỉ khác nhau trong bảng HOCSINH (bằng 2 cách khác nhau) (*)
Cách 1:
SELECT DISTINCT DiaChi
FROM  HOCSINH
Cách 2:
SELECT DiaCHi
FROM  HOCSINH
Group by DiaChi
b.	Liệt kê HoTenHS, GioiTinh của các nhóm được phân nhóm theo HoTenHS và GioiTinh trong bảng HOCSINH.
select HoTenHS, GioiTinh
from HOCSINH
group by HoTenHS, GioiTinh
c.	Liệt kê HoTenHS của các nhóm được phân nhóm theo HoTenHS và GioiTinh trong bảng HOCSINH. Chú ý thử giải thích vì sao không liệt kê GioiTinh mà vẫn không bị lỗi. (*)
select HoTenHS
from HOCSINH
group by HoTenHS, GioiTinh
*Không liệt kê GioiTinh mà vẫn không bị lỗi vì lệnh Select chạy sau cùng. Khi chạy Group by thì SQL xử lý chạy theo các dòng, đến khi chạy lệnh Select thì mất cột GioiTinh đi nên không liệt kê cũng không bị lỗi.
d.	Liệt kê MaMH, TenMH, DiemThiCuoiKy của từng môn học chia theo từng mức điểm thi cuối kỳ. (Gợi ý: chỉ liệt kê những môn đã từng có học sinh thi cuối kỳ). (*)
select MONHOC.MaMH, TenMH, DiemThiCuoiKy
from KETQUAHOCTAP
INNER JOIN MONHOC
ON KETQUAHOCTAP.MaMH=MONHOC.MaMH
group by MONHOC.MaMH, TenMH, DiemThiCuoiKy
e.	Liệt kê MaGV, TenGV của những giáo viên đã từng được phân công phụ trách ít nhất 1 môn học. Nếu MaGV, TenGV trùng lặp nhiều lần thì chỉ hiển thị ra 1 lần trong kết quả trả về.
select MaGV, HoTenGV
from GIAOVIEN
INNER JOIN PHUTRACHBOMON ON 
GIAOVIEN.MaGV=PHUTRACHBOMON.MaGVPT
group by MaGV, HoTenGV
Gợi ý: Sử dụng từ khóa GROUP BY
13.	Hãy liệt:
a.	Liệt kê HoTenHS, GioiTinh, DiaChi của các nhóm được phân nhóm theo HoTenHS và GioiTinh trong bảng HOCSINH. Thử suy nghĩ về nguyên nhân lỗi nếu có lỗi xảy ra (*)
select HoTenHS, GioiTinh, DiaChi
from HOCSINH
group by HoTenHS, GioiTinh
                         *Nguyên nhân lỗi ở đây là: mỗi GROUP chỉ được trả về 1 dòng kết quả. Mỗi 
                      học sinh có 1 Địa Chỉ khác nhau, và mỗi group sẽ có nhiều học sinh, tức là mỗi group sẽ có nhiều địa chỉ khác nhau, cho nên không biết chọn địa chỉ nào để trả về kết 
                      quả dẫn đến lỗi.       
b.	Đếm số lượng học sinh là nam.
  select count(MaHS)
  from HOCSINH
  where GioiTinh='Nam'
c.	Đếm số lượng học sinh trong lớp có tên là Lơp 1/1 và lớp đó nằm trong năm học 2019-2020.
select count(MaHS) as soluonghocsinh
from LOP
inner join HOCSINH on HOCSINH.MaLop = LOP.MaLop
Where TenLop='Lop 1-1' and NamHoc='2019-2020'
d.	Đếm số lớp đã phụ trách (có thể là 1 hoặc nhiều môn nào đó) của từng giáo viên. Gợi ý: Sử dụng từ khóa GROUP BY kết hợp SELECT TOP và truy vấn con (còn gọi là truy vấn lồng nhau – SUB QUERY)
Select TEMP.MaGVPT, count(MaLop)
From
(Select MaGVPT, MaLop
From PHUTRACHBOMON
Group by MaGVPT, MaLop) AS TEMP
Group by TEMP.MaGVPT

Hoặc:
Select TEMP.MaGVPT, count(MaLop)
From
(Select DISTINCT MaGVPT, MaLop
From PHUTRACHBOMON) AS TEMP
Group by TEMP.MaGVPT
14.	Hãy liệt kê:
a.	Học sinh chưa từng thi môn nào.
SELECT HOCSINH.HoTenHS 
FROM HOCSINH WHERE NOT EXISTS 
(SELECT  HOCSINH.HoTenHS
FROM  KETQUAHOCTAP
where KETQUAHOCTAP.MaHS=HOCSINH.MaHS)
Hoặc:
SELECT HOCSINH.HoTenHS
 FROM HOCSINH 
WHERE MaHS NOT IN (SELECT  MaHS
FROM  KETQUAHOCTAP)
1 cái là tìm HS ko có trong tập hợp những HS đã từng thi (NOT IN)
còn 1 cái là phủ định lại của phép NỐI, từng là PHÉP KHÔNG NỐI ĐƯỢC (NOT EXITS)

b.	Giáo viên chưa từng phụ trách môn học nào.
SELECT GIAOVIEN.HoTenGV
 FROM GIAOVIEN
WHERE MaGV NOT IN (SELECT MaGVPT
FROM PHUTRACHBOMON )
c.	Giáo viên chưa từng chủ nhiệm lớp nào.
Cách 1:
SELECT GIAOVIEN.HoTenGV
FROM GIAOVIEN GV WHERE NOT EXISTS
(SELECT MaLop FROM LOP L
WHERE L.MaGVCN=GV.MaGV)
Cách 2:
SELECT GIAOVIEN.HoTenGV
 FROM GIAOVIEN
WHERE MaGV NOT IN (SELECT MaGVCN
FROM LOP)
d.	Môn học chưa từng được tổ chức thi lần nào.
SELECT MONHOC.MAMH
 FROM MONHOC
WHERE MaMH NOT IN (SELECT MaMH
FROM KETQUAHOCTAP)
e.	Đếm xem tương ứng với mỗi địa chỉ (của học sinh), số lượng học sinh đang ở mỗi địa chỉ là bao nhiêu em. Chỉ hiển thị kết quả cho những địa chỉ có ít nhất 5 học sinh đang ở đó.
  select DiaChi, count(MaHS) as 'SLHS'
  from HOCSINH
  group by DiaChi
  having count(MaHS)>=5

Gợi ý: Sử dụng từ khóa HAVING, NOT IN, NOT EXIST
15.	Hãy liệt kê:
a.	Học sinh nam ở Thanh Khê và học sinh nữ ở Hải Châu (theo 2 cách khác nhau).
Cách 1:
Select MaHS, HoTenHS, HoTenPH, DiaChi, GioiTinh
From HOCSINH
Where (Gioitinh='Nam' and DiaChi =  'ThanhKhe')
or (GioiTinh='Nu' and DiaChi = 'HaiChau')
                       Cách 2:
(Select MaHS, HoTenHS, HoTenPH, DiaChi, GioiTinh
From HOCSINH
Where (Gioitinh='Nam' and DiaChi =  'ThanhKhe'))
UNION
(Select MaHS, HoTenHS, HoTenPH, DiaChi, GioiTinh
From HOCSINH
Where (GioiTinh='Nu' and DiaChi = 'HaiChau'))
b.	Họ tên của học sinh và giáo viên trong toàn trường.
Select HoTenHS As Hoten
From HOCSINH
union
Select HoTenGV
From GIAOVIEN
c.	Họ tên, nghề nghiệp của học sinh và giáo viên trong toàn trường. (Nghề nghiệp bao gồm: học sinh hoặc giáo viên).

Select HoTenHS, 'Hoc Sinh' As NgheNghiep
From HOCSINH
union
Select HoTenGV, 'Giao Vien As NgheNghiep'
From GIAOVIEN
d.	Những học sinh đang học ở năm học 2019-2020 và những học sinh chưa từng thi môn Toán và môn Tiếng Việt.
(Select MaHS
From HOCSINH
inner join LOP
on LOP.MaLop=HOCSINH.MaLop
where NamHoc='2019-2020')
union
Select MaHS From HOCSINH 
Where MaHS NOT IN 
(select MaHS
From KETQUAHOCTAP
Where (MaMH='T') or (MaMH='TV'))
Gợi ý: Sử dụng từ khóa UNION, ALIAS, phân biệt WHERE và HAVING
16.	Đếm tổng số lượt thi 2 môn Toán và tiếng Việt của tất cả học sinh trong toàn trường. Yêu cầu: (YC1) Đếm Theo từng tháng (đầy đủ 12 tháng, từ tháng 1 đến tháng 12) trong năm 2019. (YC2) Tháng nào có tổng số lượt thi của riêng môn Toán dưới 3 lượt, thì tháng đó không tính (không cộng) số lượt thi môn Toán vào kết quả trả về. (***)
Gợi ý: Sử dụng từ khóa UNION ALL
17.	Hãy liệt:
a.	MaLop, TenLop, MaGVCN, HoTenGV (chủ nhiệm) của tất cả các lớp trong trường. (Gợi ý: tất cả các lớp nghĩa là kể cả những lớp chưa được phân công GVCN).
SELECT MaLop, TenLop, MaGVCN, HoTenGV
FROM LOP
LEFT JOIN GIAOVIEN
ON LOP.MaGVCN = GIAOVIEN.MaGV

b.	MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của tất cả học sinh trong trường.
SELECT HOCSINH.MaHS, HoTenHS, HocKy, MONHOC.MaMH, MONHOC.TenMH, DiemThiGiuaKy, DiemThiCuoiKy 
FROM HOCSINH
LEFT JOIN KETQUAHOCTAP
ON KETQUAHOCTAP.MaHS = HOCSINH.MaHS
LEFT JOIN MONHOC
ON MONHOC.MaMH = KETQUAHOCTAP.MaMH
c.	MaHS, HoTenHS, MaLop, TenLop, MaGVCN, HoTenGV (Chủ nhiệm) của tất cả học sinh trong trường. (Chú ý những trường hợp: học sinh chưa được phân lớp và lớp chưa được phân GVCN).
SELECT MaHS, HoTenHS, HOCSINH.MaLop, TenLop, MaGVCN, HoTenGV 
FROM HOCSINH
LEFT JOIN LOP
ON LOP.MaLop = HOCSINH.MaLop
LEFT JOIN GIAOVIEN
ON GIAOVIEN.MaGV = LOP.MaGVCN

d.	MaGV, HoTenGV, MaLop, TenLop, MaMH, HocKy, TenMH của tất cả giáo viên trong trường.
SELECT MaGV, HoTenGV, LOP.MaLop, TenLop, MONHOC.MaMH, HocKy, TenMH
FROM GIAOVIEN
LEFT JOIN LOP
ON LOP.MaGVCN = GIAOVIEN.MaGV
LEFT JOIN PHUTRACHBOMON
ON PHUTRACHBOMON.MaLop = LOP.MaLop
LEFT JOIN MONHOC
ON MONHOC.MaMH = PHUTRACHBOMON.MaMH
Gợi ý: Sử dụng phép LEFT JOIN
18.	Sử dụng RIGHT JOIN (hoặc LEFT JOIN và RIGHT JOIN kết hợp với nhau) để trả lời các câu hỏi của yêu cầu ngay ở trên.
     		Như câu 17 thay LEFT JOIN -> RIGHT JOIN
Gợi ý: Sử dụng phép RIGHT JOIN
19.	Hãy liệt:
a.	MaHS, HoTenHS, MaLop, TenLop của tất cả học sinh và tất cả các lớp trong trường. (Gợi ý: lớp chưa có học sinh và học sinh chưa được phân lớp đều phải được trả về kết quả).
SELECT MaHS, HoTenHS, HOCSINH.MaLop, TenLop
FROM HOCSINH
FULL JOIN LOP
ON LOP.MaLop = HOCSINH.MaLop

b.	MaMH, TenMH, MaGV (phụ trách), HoTenGV (phụ trách) của tất cả những môn học và tất cả giáo viên trong trường. Kết quả trả về cần loại bỏ bớt những dòng trùng lặp (những dòng nào trùng nhau thì chỉ hiển thị kết quả 1 lần).
SELECT MONHOC.MaMH, TenMH, MaGV, HoTenGV  
FROM GIAOVIEN
inner join PHUTRACHBOMON
ON PHUTRACHBOMON.MaGVPT=GIAOVIEN.MaGV
Full join MONHOC
ON PHUTRACHBOMON.MaMH=MONHOC.MaMH

Gợi ý: Sử dụng phép FULL JOIN
20.	Hãy liệt kê:
a.	MaGV, HoTenGV của những giáo viên đã từng làm chủ nhiệm lớp và từng dạy môn Âm nhạc.
(SELECT MaGV, HoTenGV
FROM GIAOVIEN
inner join LOP
on LOP.MaGVCN=GIAOVIEN.MaGV)
intersect
(SELECT MaGV, HoTenGV 
FROM GIAOVIEN GV
INNER JOIN PHUTRACHBOMON PTBM
On GV.MaGV = PTBM.MaGVPT
Where MaMH='AN')

b.	MaHS, TenHS của những học sinh đã từng thi môn Toán trong học kỳ 1 và đã từng thi môn Âm nhạc trong học kỳ 2.
SELECT HOCSINH.MaHS, HoTenHS
FROM HOCSINH
inner join KETQUAHOCTAP
on KETQUAHOCTAP.MaHS=HOCSINH.MaHS
where HocKy='1' and MaMH='T'
intersect
SELECT HOCSINH.MaHS, HoTenHS
FROM HOCSINH
inner join KETQUAHOCTAP
on KETQUAHOCTAP.MaHS=HOCSINH.MaHS
where HocKy='2' and MaMH='AN'
c.	MaMH, TenMH của những môn học đã từng được ít nhất 5 học sinh thi cuối kỳ và đã từng được ít nhất 2 giáo viên phụ trách giảng dạy.
SELECT MONHOC.MaMH, TenMH
FROM MONHOC
inner join KETQUAHOCTAP
on KETQUAHOCTAP.MaMH=MONHOC.MaMH
group by MONHOC.MaMH, TenMH
having count(MaHS)>=5
intersect
SELECT MONHOC.MaMH, TenMH 
FROM MONHOC
inner join PHUTRACHBOMON
on PHUTRACHBOMON.MaMH=MONHOC.MaMH
group by MONHOC.MaMH, TenMH
having count(MaGVPT)>=2
Gợi ý: Sử dụng từ khóa INTERSECT
21.	Hãy liệt kê:
a.	MaGV, HoTenGV của những giáo viên đã từng làm chủ nhiệm lớp và chưa từng dạy môn Âm nhạc.
b.	MaHS, TenHS của những học sinh đã từng thi môn Toán trong học kỳ 1 và chưa từng thi môn Âm nhạc trong học kỳ 2.
c.	MaMH, TenMH của những môn học đã từng được ít nhất 5 học sinh thi cuối kỳ và chỉ được đúng 2 giáo viên phụ trách giảng dạy.
Tương tự bài 20 chỉ đổi INTERSECT->EXCEPT

Gợi ý: Sử dụng từ khóa EXCEPT

Chú ý: (*)(**)(***) là các bài khó