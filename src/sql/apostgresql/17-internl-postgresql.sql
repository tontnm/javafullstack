/*
Heap/Heap File
File that contains all the data (rows) of our tbl

Tuple/Item
Individual row from the tble

Block/Page
The heap file is divided into many different 'blocks' or 'pages'. Each page/block stores
some number of rows

Heap File: 22445
--------------------
| Block/Page: 8kb
| ------------------
| | Tuple/Item
| | ----------------
| | | User#zyz
| | ----------------
| ------------------
--------------------

*/
SHOW data_directory;
SELECT oid, datname FROM pg_database;
SELECT * FROM pg_class;

CREATE INDEX ON users (username);
CREATE INDEX users_username_idx ON users (username);

DROP INDEX users_username_idx;

EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30'; --0.076 ms # 0.400 ms

--table size in hard disk
SELECT pg_size_pretty(pg_relation_size('users')); -- 872 kb 
--index size in hard disk
SELECT pg_size_pretty(pg_relation_size('users_username_idx')); -- 184 kb 

--see all hidden auto indexes
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';