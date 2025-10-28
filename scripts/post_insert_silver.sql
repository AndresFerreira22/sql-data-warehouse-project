-- tabla para que la primary key sea unica
SELECT 
	*
FROM (
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM silver.crm_cust_info
) t WHERE flag_last != 1;

--check for unwanted spaces
--expectation: no results
SELECT
	cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT 
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL
