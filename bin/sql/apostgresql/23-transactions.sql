CREATE TABLE accounts (
	id serial PRIMARY KEY,
	name varchar(20) NOT NULL,
	balance integer NOT NULL
);
INSERT INTO accounts (name, balance) VALUES ('ton',100),('thanh',100);
SELECT * FROM accounts;

BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'ton';

SELECT * FROM accounts;

UPDATE accounts
SET balance = balance + 50
WHERE name = 'thanh';

COMMIT;