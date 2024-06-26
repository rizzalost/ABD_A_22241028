-- Nama : Rizal baihaki nurdin
-- NIM  : 22241028
-- Modul : 5

-- Menggunakan database
USE mart_undikma;

-- JOIN
-- tampilkan nama pelanggan dan qty belanjanya
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp ON tp.kode_pelanggan = mp.kode_pelanggan;

-- join tanpa filtering ON = CROSS JOIN
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp ON true;

-- INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp INNER JOIN ms_pelanggan_dqlab mp ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp LEFT OUTER JOIN ms_pelanggan_dqlab mp ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp RIGHT OUTER JOIN ms_pelanggan_dqlab mp ON tp.kode_pelanggan = mp.kode_pelanggan;

-- JOIN 3 TABLE
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT OUTER JOIN tr_penjualan_dqlab AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd ON mpd.kode_produk = tp.kode_produk;

-- JOIN 3 TABLE tampilkan null
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT OUTER JOIN tr_penjualan_dqlab AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd ON mpd.kode_produk = tp.kode_produk WHERE tp.qty IS NULL;

-- ORDER BY pada join
-- urutkan berdasarkan qty
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT OUTER JOIN tr_penjualan_dqlab AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd ON mpd.kode_produk = tp.kode_produk ORDER BY qty DESC;

-- Grouping dan fungsi agregasi pada JOIN
-- Menampilkan summary dari total produk yang terjual
SELECT mpd.kategori_produk, mpd.nama_produk, SUM(tp.qty) AS jml_produk_terjual
FROM ms_produk_dqlab AS mpd LEFT JOIN tr_penjualan_dqlab AS tp 
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
HAVING SUM(tp.qty) IS NULL 
ORDER BY SUM(tp.qty) DESC;

-- Menggunakan UNION
SELECT kode_produk , nama_produk
FROM ms_produk_dqlab
UNION
SELECT kode_pelanggan, nama_pelanggan 
FROM ms_pelanggan_dqlab;

-- Menggunakan UNION dengan nilai konstan
SELECT 'produkam' AS kategori, nama_produk AS nama
FROM ms_produk_dqlab
UNION
SELECT 'pelanggan', nama_pelanggan
FROM ms_pelanggan_dqlab mpd

-- Union dengan table yang sama
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION
SELECT kode_produk, nama_produk 
FROM ms_produk_dqlab;

-- Union table berbeda dengan hasil unik
SELECT nama_produk
FROM ms_produk_dqlab
UNION
SELECT nama_produk 
FROM tr_penjualan_dqlab;

-- Union ALL dengan table yang sama
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION ALL
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab;

-- Union ALL dengan table berbeda
SELECT nama_produk FROM ms_produk_dqlab mpd 
UNION ALL
SELECT nama_produk 
FROM tr_penjualan_dqlab

-- Latihan mandiri
-- Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan,mpd.kategori_produk, mpd.nama_produk, tp.qty 
FROM ms_pelanggan_dqlab AS mp INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT OUTER JOIN ms_produk_dqlab mpd 
ON mpd.kode_produk = tp.kode_produk;

-- 3 Table dengan LEFT JOIN dan Fiter QTY tidak bernilau NULL dengan operator IS NOT NULL
SELECT tp.kode_pelanggan, mp.nama_pelanggan,mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT JOIN ms_produk_dqlab mpd 
ON mpd.kode_produk = tp.kode_produk
WHERE tp.qty IS NOT NULL;

-- 3 Table dengan Inner Join dan Grouping
SELECT 
mpd.kategori_produk, sum(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab AS mp 
INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
INNER JOIN ms_produk_dqlab AS mpd 
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk
ORDER BY total_qty DESC;

-- lakukan JOIN ms_produk dengan table ms_produk juga dengan kolom relationship kode_produk 
-- (benar, Anda tidak salah baca) - ini kita lakukan join dengan table sendiri yang memang 
-- bisa dilakukan, jangan lupa untuk menggunakan alias.
SELECT 
mp.kategori_produk, 
mpd.nama_produk
FROM 
ms_produk_dqlab AS mp 
INNER JOIN ms_produk_dqlab AS mpd
ON mp.kode_produk = mpd.kode_produk
ORDER BY 
mp.kategori_produk DESC;