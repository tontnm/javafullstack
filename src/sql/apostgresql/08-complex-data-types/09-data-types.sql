/* Numeric types 
 * smallint +-32k, integer +-2b, bigint +-9bb (no decimal points)
 * smallserial +32k, serial +2b, bigserial +9bb (no decimal points, auto increment)
 * decimal 13k.16k, numeric 13k.16k, real, double precision, float (with decimal points)
 * 
 * Numeric Types Fast Rules
 * - id = serial
 * - number without decimal = integer
 * - bank balance, grams of golds, scientic calculations = numeric
 * - kg of trash, liters of water, air pressure = double precision
 */
SELECT 2+2;
SELECT (2); --integer
SELECT (2.0); --numeric
SELECT 1.0::INTEGER;
SELECT 9.999999::NUMERIC - 9.999998::NUMERIC; --0.000001

/*
 * Character types
 * - CHAR(5) shorter than 5 add more spaces, longer auto cut off
 */
SELECT 'abcdef'::CHAR(5); -- abcde
SELECT 'abc'::CHAR(5); -- abc__

SELECT 'abcdef'::VARCHAR(5); -- abcde
SELECT 'abc'::VARCHAR(5); -- abc

SELECT 'abcdef'::TEXT; -- abcdef

/*
 * Boolean types
 */
SELECT 'yes'::BOOLEAN,'y'::BOOLEAN,'on'::BOOLEAN,'1'::BOOLEAN,'t'::BOOLEAN;
SELECT 'no'::BOOLEAN,'n'::BOOLEAN,'off'::BOOLEAN,'0'::BOOLEAN,'f'::BOOLEAN;

/*
 * Date types
 */
SELECT '1990-08-15'::DATE,'1990 08 Jun'::DATE,'jun 08 1990'::DATE,'1990-08-06'::DATE;

/*
 * Time types
 */
SELECT '01:23:45 PM'::TIME;
SELECT ('01:23:45 AM EST'::TIME WITH TIME ZONE);

SELECT ('01:23:45 AM EST'::TIME WITH TIME ZONE),
'01:23:45 AM z'::TIME WITH TIME ZONE,'01:23:45 AM utc'::TIME WITH TIME ZONE;

SELECT 'Nov-12-2024 1:2 PM Z'::TIMESTAMP WITH TIME ZONE;

/* Interval */
SELECT ('2 D 20 H 15 M 3 S'::INTERVAL) - ('2 D'::INTERVAL);