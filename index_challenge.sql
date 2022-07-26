USE SAMPLEDB

--Challenge 1: Create a non-clustered index on the location_id column
--in the oes.warehouses table. Also, specify warehouse_name
--as a non-key included column.
CREATE NONCLUSTERED INDEX ix_warehouses_location_id_inc_warehouse_name
ON oes.warehouses (location_id) INCLUDE (warehouse_name);

--Challenge 2: Create a UNIQUE index on the product_name column in the
--oes.products table.

CREATE UNIQUE INDEX ux_products_products_name ON oes.products (product_name);

--Challenge 3: Rewrite the following query to make it sargable:
/*SELECT
order_id,
order_date
FROM oes. orders
WHERE YEAR(order_date) = 2019;
*/

SELECT
order_id,
order_date
FROM oes.orders
WHERE order_date>='20190101' AND order_date<'20200101';

--Challenge 4: Most queries against the oes.orders table are for
--unshipped orders i.e. orders where the shipped_date is
--null. Put an appropriate filtered index on the
--shipped_date column.

CREATE NONCLUSTERED INDEX fix_orders_shipped_date_null ON oes.orders (shipped_date)
WHERE shipped_date IS NULL;

--Rewrite the following query to make it sargable and create an
--index which covers the query, once rewritten:
/*
SELECT
customer_id, first_name, last_name, email, street_address
FROM oes. customers
WHERE LEFT(first_name, 2) = 'Vi'
AND last_name = 'Jones' ;
*/
SELECT customer_id, first_name, last_name, email, street_address
FROM oes.customers
WHERE first_name LIKE 'Vi%'
AND last_name = 'Jones';

--Index which covers query above
CREATE NONCLUSTERED INDEX ix_first_name_last_name_inc_email_street_adress
ON oes.customers (first_name, last_name) INCLUDE (email, street_address);