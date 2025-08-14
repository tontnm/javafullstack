/* ORDER BY */
SELECT * FROM products ORDER BY price, weight DESC;

/* LIMIT - get first limit
 * OFFSET - skip first records/rows
 */
SELECT * FROM phones ORDER BY price DESC LIMIT 3 OFFSET 1;