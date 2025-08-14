
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = NULL Values
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT 1;
SELECT 0;
SELECT "";

/*
- Trả về giá trị số 1, 0, và chuỗi rỗng "".
- Chuỗi rỗng không phải là NULL — nó là một chuỗi có độ dài bằng 0.

*/

SELECT 0 = NULL;					
SELECT 0 = NULL AS zero;			
SELECT 1 = NULL AS one;				
SELECT 0 = NULL AS zero, 1 = NULL AS one;	

SELECT 0 = NULL AS z1, 1 = NULL AS o1, 
       0 != NULL AS z2, 1 != NULL AS o2;		

/*
- Kết quả luôn là NULL, vì:
- ❗ Trong SQL, bất kỳ phép so sánh nào với NULL đều trả về NULL, không phải TRUE hay FALSE.
- 0 = NULL → NULL
- 1 = NULL → NULL
- Không thể dùng dấu = để kiểm tra NULL.

*/

SELECT 0 IS NULL AS zero, 1 IS NULL AS one;			
SELECT 0 IS NOT NULL AS zero, 1 IS NOT NULL AS one;		

SELECT "" IS NULL AS empty1;			
SELECT "" IS NOT NULL AS empty1;		

SELECT NULL IS NULL yes;

/*
✅ Kiểm tra NULL đúng cách: dùng IS NULL và IS NOT NULL
- IS NULL: Trả về TRUE nếu giá trị là NULL, ngược lại là FALSE.
- 0 IS NULL → FALSE
- 1 IS NULL → FALSE
- 0 IS NOT NULL → TRUE
- 1 IS NOT NULL → TRUE

*/