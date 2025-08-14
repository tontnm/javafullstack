
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = NULL Values
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT 1;
SELECT 0;
SELECT "";

SELECT 0 = NULL;					
SELECT 0 = NULL AS zero;			
SELECT 1 = NULL AS one;				
SELECT 0 = NULL AS zero, 1 = NULL AS one;	

SELECT 0 = NULL AS z1, 1 = NULL AS o1, 
       0 != NULL AS z2, 1 != NULL AS o2;		

SELECT 0 IS NULL AS zero, 1 IS NULL AS one;			
SELECT 0 IS NOT NULL AS zero, 1 IS NOT NULL AS one;		

SELECT "" IS NULL AS empty1;			
SELECT "" IS NOT NULL AS empty1;		

SELECT NULL IS NULL yes;

