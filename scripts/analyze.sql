USE BikeStores;
GO

-- SELECT * FROM production.products;

SELECT  brand_id, category_id, COUNT(*) FROM production.products
GROUP BY brand_id, category_id
order by brand_id;

-- SELECT APPROX_COUNT_DISTINCT(staff_id) FROM sales.orders;
-- SELECT * FROM sales.customers; 