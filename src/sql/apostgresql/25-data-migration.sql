/*
Perform Schema Migration and Data Migration is dangerous
- Perform data migration within transaction could lead to data lost 

Good way:

posts
id url lat long
1  ... 10  10
2  ... 20  20

add column loc

posts
id url lat long loc
1  ... 10  10   null
2  ... 20  20   null

deploy new version of API that will write value to both lat/lng nd loc

posts
id url lat long loc
1  ... 10  10   null
2  ... 20  20   null
3  ... 30  30   30,30

copy lat/lng to loc

posts
id url lat long loc
1  ... 10  10   10,10
2  ... 20  20   20,20
3  ... 30  30   30,30

update code to only write to loc column

posts
id url lat  long loc
1  ... 10   10   10,10
2  ... 20   20   20,20
3  ... 30   30   30,30
4  ... null null 40,40

drop column lat/lng

posts
id url loc
1  ... 10,10
2  ... 20,20
3  ... 30,30
4  ... 40,40

*/