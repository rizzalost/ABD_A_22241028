-- Nama : Rizal baihaki nurdin
-- NIM  : 22241028
-- Tugas refreshment

-- Menggunakan database
use mart_undikma;

-- Case 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab mpd;

-- Case 2
SELECT nama_produk, harga FROM ms_produk_dqlab mpd;

-- Case 3
SELECT * FROM ms_produk_dqlab WHERE harga >= 15000 AND nama_produk = 'Flashdisk DQLab 32 GB';

-- Case 4
SELECT * FROM ms_produk_dqlab WHERE kode_produk IN ('prod-08', 'prod-07', 'Flashdisk DQLab 84 GB');

-- Case 5
SELECT * FROM ms_produk_dqlab WHERE harga <= 50000;

-- Case 6
SELECT kode_pelanggan, nama_produk, qty, harga, qty*harga AS total FROM tr_penjualan_dqlab HAVING total >= 200000 ORDER BY total DESC;

-- Case 7
SELECT kode_pelanggan, SUM(qty) AS total_qty, SUM(harga) AS total_harga, SUM(qty)%3 AS sisa_qty FROM tr_penjualan_dqlab GROUP BY kode_pelanggan;

-- Case 8
SELECT kode_transaksi, tgl_transaksi, no_urut, nama_produk, CONCAT(kode_produk , " ", nama_produk) AS s FROM tr_penjualan_dqlab WHERE qty = 5;

-- Case 9
SELECT nama_pelanggan, TRIM(BOTH ', S.H.' FROM nama_pelanggan) AS nama_tanpa_gelar, substr(nama_pelanggan, 1, 4) AS nama_panggilan FROM ms_pelanggan_dqlab WHERE kode_pelanggan = 'dqlabcust01';

-- Case 10
SELECT nama_pelanggan, SUBSTR(nama_pelanggan, 2,3) AS initial FROM ms_pelanggan_dqlab;

-- Case 11
SELECT nama_pelanggan, SUBSTR(nama_pelanggan, 2,3) AS initial, LENGTH(nama_pelanggan) AS total_char FROM ms_pelanggan_dqlab;

-- Case 12
SELECT nama_pelanggan, REPLACE(nama_pelanggan, 'Pelanggan Non Member', 'Not Member') AS new_revisi_pelanggan, SUBSTR(nama_pelanggan, 2,3) AS initial, LENGTH(nama_pelanggan) AS total_char FROM ms_pelanggan_dqlab;

-- Case 13
SELECT nama_pelanggan, 
UPPER(nama_pelanggan) AS UPPER_NAMA_PELANGGAN, 
LOWER(nama_pelanggan) as lower_nama_pelanggan,  
REPLACE(nama_pelanggan, 'Pelanggan Non Member', 'Not Member') AS new_revisi_pelanggan, 
SUBSTR(nama_pelanggan, 2,3) AS initial, 
LENGTH(nama_pelanggan) AS total_char 
FROM ms_pelanggan_dqlab;

-- Case 14 koreksi
SELECT 
p.kode_pelanggan,
COUNT(DISTINCT t.kode_transaksi) AS total_order,
SUM(t.qty) AS jumlah_kuantitas,
SUM(t.harga * t.qty) AS revenue
FROM ms_pelanggan_dqlab p
JOIN tr_penjualan_dqlab t ON p.kode_pelanggan = t.kode_pelanggan
GROUP BY p.kode_pelanggan, p.nama_pelanggan;
   
-- Case 15
SELECT kode_pelanggan, 
COUNT(kode_transaksi) AS Total_order, 
SUM(qty),
SUM(qty * harga) AS total_revenue,
CASE
WHEN SUM(qty * harga) >= 900000 THEN 'Target Achieved'
WHEN SUM(qty * harga) <= 850000 THEN 'Less performed'
ELSE 'Follow Up'END AS remark FROM tr_penjualan_dqlab GROUP BY kode_pelanggan;

-- Case 16
SELECT kode_transaksi, kode_pelanggan,kode_produk, nama_produk, harga, qty, (qty*harga) AS Total 
FROM tr_penjualan_dqlab 
ORDER BY nama_produk,harga DESC;

-- Case 17
SELECT nama_produk, no_urut FROM tr_penjualan_dqlab;

-- Case 18
SELECT nama_produk,no_urut
FROM tr_penjualan_dqlab
UNION
SELECT nama_produk, no_urut
FROM tr_penjualan_dqlab;
-- Case 19
SELECT c.kode_pelanggan, o.nama_pelanggan, o.alamat, c.nama_produk
FROM ms_pelanggan_dqlab o
JOIN tr_penjualan_dqlab c
ON o.kode_pelanggan = c.kode_pelanggan
Where c.nama_produk = 'Kotak Pensil DQLab' OR c.nama_produk = 'Flashdisk DQLab 32 GB' OR c.nama_produk = 'Sticky Notes DQLab 500 sheets';

-- Case 20
SELECT nama_produk, tgl_transaksi, DATEDIFF(NOW(), tgl_transaksi) AS days_aging FROM tr_penjualan_dqlab;

-- Case 21
SELECT 
nama_produk, 
tgl_transaksi, 
MONTH(tgl_transaksi) AS month_date, 
YEAR(tgl_transaksi) As year_date, 
DAY(tgl_transaksi) AS day_date,
DATEDIFF(NOW(), tgl_transaksi) AS days_aging 
FROM tr_penjualan_dqlab;

-- Case 22
SELECT 
nama_produk, 
tgl_transaksi, 
CASE
WHEN MONTH(tgl_transaksi) = '5' THEN 'May'
WHEN MONTH(tgl_transaksi) = '6' THEN 'June'
ELSE 'MATI'
END AS month_datea,
YEAR(tgl_transaksi) As year_date, 
DAY(tgl_transaksi) AS day_date,
DATEDIFF(NOW(), tgl_transaksi) AS days_aging 
FROM tr_penjualan_dqlab;


