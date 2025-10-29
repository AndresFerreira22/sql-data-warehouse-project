--limpieza de la tabla crm.prd_info para insertar los datos a la capa silver


SELECT 
	prd_id,
	prd_key,
	REPLACE(SUBSTRING(prd_key,1,5),'-','_') AS cat_id,
	SUBSTRING(prd_key,7,LEN(prd_key)) AS prd_key,
	prd_nm,
	ISNULL(prd_cost,0),
	prd_line,
	CASE  UPPER(TRIM(prd_line)) 
		WHEN 'M' THEN 'Mountain'
		WHEN 'R' THEN 'Road'
		WHEN 'S' THEN 'Other sales'
		WHEN 'T' THEN 'Touring'
		ELSE 'n/a'
	END AS prd_line,
	prd_start_dt,
	prd_end_dt
FROM bronze.crm_prd_info;
