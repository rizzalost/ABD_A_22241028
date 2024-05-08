-- Nama : Rizal baihaki nurdin
-- NIM : 22241028
-- MODUL 1

-- SELECT : Mengambil 1 kolom Table
SELECT nama_produk FROM ms_produk_dqlab;

-- SELECT : Mengambil lebih dari 1 kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;
-- SELECT : Mengambil semua kolom
SELECT * FROM ms_produk_dqlab;

-- LATIHAN
-- Ambil kode produk, nama produk, dari table produk
SELECT kode_produk, nama_produk FROM ms_produk_dqlab;
-- Ambil seluruh kolom dari table_tr_penjualan_dqlab
SELECT * FROM tr_penjualan_dqlab;

-- PREFIX dan ALIAS
-- PREFIX

-- Ambil nama produk dengan prefix
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- Ambil nama produk dengan prefix database - table
SELECT mart_undikma.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- ALIAS

-- Alias pada kolom dengan AS
SELECT nama_produk as np FROM ms_produk_dqlab;
-- Alias pada kolom tanpa AS
SELECT nama_produk np FROM ms_produk_dqlab;

-- Alias pada table dengan AS
SELECT nama_produk FROM ms_produk_dqlab AS mpd;
-- Alias pada table tanpa AS
SELECT nama_produk FROM ms_produk_dqlab mpd;

-- Penggunaan Alias dan Prefix
SELECT mpd.nama_produk np FROM ms_produk_dqlab mpd;

-- CASE 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;
-- CASE 2
SELECT nama_produk, harga FROM tr_penjualan_dqlab;