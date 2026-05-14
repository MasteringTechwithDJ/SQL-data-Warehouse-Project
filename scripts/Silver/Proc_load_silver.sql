SELECT
cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname,
TRIM(cst_lastname) AS cst_lastname,
cst_material_status,
cst_gndr,
cst_create_date
FROM(
	SELECT
	*,
	ROW_NUMBER () OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS FLAG
	FROM Bronze.crm_cust_info
	WHERE cst_id is NOT NULL 
	)t 
