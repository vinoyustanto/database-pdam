CREATE DATABASE pembayaran_PDAM;
CREATE TABLE tagihan (
    id_tagihan INT AUTO_INCREMENT PRIMARY KEY,
    id_penggunaan INT NOT NULL,
    total_penggunaan INT NOT NULL,
    total_bayar DECIMAL(12,2) NOT NULL,
    status_bayar ENUM('Belum Bayar', 'Lunas') DEFAULT 'Belum Bayar',
    tanggal_bayar DATE NULL,
    id_petugas_bayar INT NULL
);