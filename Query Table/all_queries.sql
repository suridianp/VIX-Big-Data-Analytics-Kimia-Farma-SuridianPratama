-- Show the top 10 net sales figures for province branches
SELECT provinsi, SUM(nett_sales) AS nett_sales
FROM `big_data_analytics_kimia_farma.kf_analytics`
GROUP BY provinsi
ORDER BY nett_sales DESC
LIMIT 10;

-- Show top 10 provincial branches by total transactions
SELECT provinsi, COUNT(transaction_id) AS total_transaction
FROM `big_data_analytics_kimia_farma.kf_analytics`
GROUP BY provinsi
ORDER BY total_transaction DESC
LIMIT 10;

-- Show top 5 branches with the highest ratings (but lowest transaction volume)
SELECT branch_name, branch_id, MAX(rating_cabang) AS rating_cabang, MIN(rating_transaksi) AS rating_transaksi
FROM `big_data_analytics_kimia_farma.kf_analytics`
GROUP BY branch_name, branch_id
ORDER BY rating_cabang DESC, rating_transaksi ASC
LIMIT 5;

-- Show total profit per province
SELECT provinsi, ROUND(SUM(nett_profit),0) as total_profit
FROM `big_data_analytics_kimia_farma.kf_analytics`
GROUP BY provinsi;