-- Nama : Rizal baihaki nurdin
-- NIM : 22241028
-- MODUL 2

-- Use Database
USE mart_undikma

-- NILAI LITERAL 

-- menggunakan SELECT Statement untuk nilai literal
SELECT 77 AS nomor_punggung;

-- menampilkan nilai literal beberapa tipe data
SELECT 77 AS angka, TRUE AS nilai_logika, 'DQLAB' as teks;

-- NULL

-- Menampilkan NULL
SELECT NULL AS kosong;

-- OPERATOR MATEMATIKA

-- kalkulasi ekspresi Matematika
SELECT  5%2 AS sisa_bagi, 5/2 hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- Latihan Mandiri
SELECT 4*2 AS hasil_kali, (4*8)%7 AS hasil_kali_1,
(4*8) MOD 7 AS hasil_kali_2, (4*8)/7 sisa_bagi;


SELECT * FROM tr_penjualan_dqlab;

-- EKSPRESI MATEMATIKA
-- Menampilkan hasil kali dari kolom qty dan harga
SELECT qty*harga AS tottsl
FROM tr_penjualan_dqlab;

-- OPPERATOR PERBANDINGAN
-- Menampilkan Hasil perbandingan nilai literal
SELECT 
5=5,
5<>5,
5!=5,
5!=4,
5>4;

-- Latihan Mandiri 2
SELECT 
1 = TRUE,
1 = FALSE,
5>=5,
5.2 = 5.20000,
NULL = 1,
NULL = NULL;

SELECT qty<=3 FROM tr_penjualan_dqlab;

-- FUNGSI
SELECT POW(3,2), ROUND(3,2),
ROUND(3,54), ROUND(3.155,1),
ROUND(3.155,2), FLOOR(4.28),
FLOOR(4.72), CEILING(4.39), CEILING(4.55);

-- Fungsi Tanggal
SELECT NOW(),
YEAR (NOW()),
DATEDIFF(NOW(), '2003-03-23'),
DAY('2003-03-23');

-- Latihan Mandiri 3
SELECT DATEDIFF('2022-07-23', NOW()),
YEAR('2022-07-23'),
MONTH('2022-07-23'),
DAY('2022-07-23'),
YEAR(NOW());

-- Menampilkan selisih transaksi terakhir dengan tanggal saat ini
SELECT 
	DATEDIFF(NOW(), tgl_transaksi) AS Selisih_hari
FROM
	tr_penjualan_dqlab;

-- WHERE Statement
-- Mengambil nama produk dan quantity lebih dari 3
SELECT
	nama_produk, qty
FROM
	tr_penjualan_dqlab tpd
WHERE
	qty > 3;

-- Mengambil nama produk, qty yang qty > 3, dan tranksaksi bulan 6
SELECT 
	nama_produk, qty
FROM
	tr_penjualan_dqlab tpd
WHERE
	qty > 3 AND
	MONTH(tgl_transaksi) = 6;

-- Mengambil nama produk dan qty dgn nama tertentu
SELECT 
	nama_produk, qty
FROM
	tr_penjualan_dqlab tpd 
WHERE 
	nama_produk = 'Flashdisk DQLab 32 GB';
	
-- LIKE
-- Mengambil nama produk yg berawalan huruf "f"
SELECT 
	nama_produk
FROM
	tr_penjualan_dqlab tpd 
WHERE 
	nama_produk LIKE 'f%';
	
-- Latihan Mandiri 4
-- 1. nama_produk yang memiliki karakter kedua ‘a’ pada table tr_penjualan_dqlab
-- 2. kategori_produk yang mengandung huruf ‘t’ pada table ms_produk_dqlab
-- 3. kategori_produk yang mengandung karakter ‘un’ pada table ms_produk_dqlab

SELECT 
	nama_produk
FROM
	tr_penjualan_dqlab tpd 
WHERE 
	nama_produk LIKE '_a%';

SELECT 
	kategori_produk
FROM
	ms_produk_dqlab mpd 
WHERE 
	kategori_produk LIKE '%t%';

SELECT 
	kategori_produk
FROM
	ms_produk_dqlab mpd 
WHERE 
	kategori_produk LIKE '%un%';
	
-- mengambil nama produk dari table tr_penjualan_dqlab yang memiliki pola teks berawalan huruf F dan qty penjualan di atas 2
SELECT nama_produk FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'f%' AND qty > 2;