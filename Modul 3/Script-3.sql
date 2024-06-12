-- Nama : Rizal baihaki nurdin
-- NIM  : 22241028
-- Modul 3

-- Menggunakan database
use mart_undikma;

-- ORDER BY
SELECT * FROM tr_penjualan_dqlab ORDER BY qty;

-- mengambil nama produk dan qty urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab tpd ORDER BY qty;

-- mengambil nama produk dan qty urutkan berdasarkan qty diikuti dengan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab tpd ORDER BY qty, nama_produk;

-- Latihan 1
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab mpd ORDER BY nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab mpd ORDER BY alamat;

-- mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab tpd ORDER BY qty DESC;

-- mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil diikuti dengan nama produk kecil ke besar
SELECT nama_produk, qty FROM tr_penjualan_dqlab tpd ORDER BY qty DESC, nama_produk ASC;

-- Latihan 2
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
SELECT * FROM ms_pelanggan_dqlab mpd ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab mpd ORDER BY alamat DESC;

-- menggunakan hasil perhitungan pada ORDER BY
-- mengambil nama produk,qty,harga, dan total bayar urutkan berdasarkan total bayar besar ke kecil
SELECT  nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab tpd ORDER BY total_bayar DESC;

-- Latihan 3
SELECT nama_produk, qty, harga, diskon_persen, qty, (diskon_persen/100)*harga AS diskon, 
(harga - (diskon_persen/100)*harga) AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

-- mengambil nama produk, qty dari produk berawalan F urut berdasarkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab tpd WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Latihan 4
SELECT * FROM tr_penjualan_dqlab tpd WHERE diskon_persen ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab tpd WHERE harga >= 100000 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab tpd WHERE harga >= 100000 OR nama_produk LIKE 'T' ORDER BY diskon_persen DESC;

-- Fungsii AGREGASI
-- hitung jumlah qty dari seluruh row di tabel penjualan
SELECT SUM(qty) AS total_qty FROM tr_penjualan_dqlab tpd;

-- hitung jumlah seluruh row pada tabel penjualan
SELECT COUNT(*) AS jumlah_row FROM tr_penjualan_dqlab tpd;

-- hitung jumlah nilai qty dan jumlah seluruh row pada tabel penjualan
SELECT SUM(qty), COUNT(*) FROM tr_penjualan_dqlab tpd;

-- hitung rata-rata nilai maks dan nilai min dari qty pada tabel penjualan
SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan_dqlab tpd;

-- hitung jumlah nilai unik dari nama produk dari tabel penjualan
SELECT COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab tpd;

SELECT COUNT(nama_produk) FROM tr_penjualan_dqlab tpd;

-- hitung jumlah nilai unik dan seluruh dari tabel penjualan
SELECT COUNT(*), COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab tpd;

-- menampilkan field nama produk dan fungsi max qty dari tabel penjualan
SELECT nama_produk, MAX(qty) FROM tr_penjualan_dqlab tpd; 

-- GROUP BY
-- ambil hasil pengelompokkan nilai kolom nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab tpd GROUP BY nama_produk;

SELECT nama_produk FROM tr_penjualan_dqlab tpd;

-- ambil hasil pengelompokkan dari nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab tpd GROUP BY nama_produk, qty;

-- mengambil hasil penjumlahan qty dari pengelompokkan nam produk terhadap semua row ditabel penjualan
SELECT nama_produk , SUM(qty) FROM tr_penjualan_dqlab tpd GROUP BY nama_produk; 

-- HAVING
-- ambil jumlah qtt dari hasil pengelompokkan nama produk di tabel penjualan
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab tpd GROUP BY nama_produk HAVING  SUM(qty) > 2;

-- Latihan 5
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab tpd GROUP BY nama_produk HAVING  SUM(qty) > 4;
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab tpd GROUP BY nama_produk HAVING  SUM(qty) = 9;
SELECT nama_produk, (harga * qty -(diskon_persen/100)*harga) AS nilai FROM tr_penjualan_dqlab tpd ORDER BY nilai DESC;








