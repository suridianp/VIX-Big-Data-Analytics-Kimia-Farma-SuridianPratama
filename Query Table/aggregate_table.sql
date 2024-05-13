CREATE TABLE big_data_analytics_kimia_farma.kf_analytics AS
SELECT 
f.transaction_id,
f.date, 
f.branch_id, 
k.branch_name, 
k.kota,
k.provinsi,
k.rating AS rating_cabang, 
f.customer_name, 
f.product_id, 
p.product_name, 
p.price AS actual_price, 
f.discount_percentage,
CASE
    WHEN f.price <= 50000 THEN 0.1
    WHEN f.price > 50000 AND f.price <= 100000 THEN 0.15
    WHEN f.price > 100000 AND f.price <= 300000 THEN 0.2
    WHEN f.price > 300000 AND f.price <= 500000 THEN 0.25
    WHEN f.price > 500000 THEN 0.3
END AS persentase_gross_laba,
f.price - (f.price * f.discount_percentage) AS nett_sales,
(f.price - (f.price * f.discount_percentage)) * (
  CASE
    WHEN f.price <= 50000 THEN 0.1
    WHEN f.price > 50000 AND f.price <= 100000 THEN 0.15
    WHEN f.price > 100000 AND f.price <= 300000 THEN 0.2
    WHEN f.price > 300000 AND f.price <= 500000 THEN 0.25
    WHEN f.price > 500000 THEN 0.3
  END) AS nett_profit,
f.rating as rating_transaksi,
FROM 
  big_data_analytics_kimia_farma.kf_final_transaction as f
LEFT JOIN big_data_analytics_kimia_farma.kf_kantor_cabang as k
  on f.branch_id = k.branch_id
LEFT JOIN big_data_analytics_kimia_farma.kf_product as p
  on f.product_id = p.product_id
;