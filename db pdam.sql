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
-- Tabel petugas --
CREATE TABLE petugas (
	id_petugas		VARCHAR(10),
	nama_petugas	VARCHAR(50) NOT NULL,
	role				VARCHAR(25) NOT NULL, 
	username			VARCHAR(50) NOT NULL,
	password			VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_petugas)
);

INSERT INTO petugas VALUES
('PTG001', 'Andi Wijaya', 'Pencatat', 'andiw', '$2y$10$xyz123'),
('PTG002', 'Siti Rahma', 'Kasir', 'sitir', '$2y$10$abc456'),
('PTG003', 'Budi Santoso', 'Pencatat', 'budis', '$2y$10$def789'),
('PTG004', 'Dewi Lestari', 'Kasir', 'dewil', '$2y$10$ghi012'),
('PTG005', 'Rian Hidayat', 'Admin', 'rianh', '$2y$10$jkl345');


-- Tabel penggunaan_air
CREATE TABLE penggunaan_air (
	id_penggunaan			VARCHAR(10),
	id_petugas				VARCHAR(10) NOT NULL,		
	id_pelanggan			VARCHAR(10) NOT NULL,	
	meter_awal				INT NOT NULL,
	meter_akhir				INT NOT NULL,
	bulan						INT NOT NULL,
	tahun						INT NOT NULL,
	tanggal_pencatatan	DATE NOT NULL,
	PRIMARY KEY (id_penggunaan),
	FOREIGN KEY (id_petugas) 	REFERENCES petugas(id_petugas)
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

INSERT INTO penggunaan_air VALUES
('PAIR001', 'PTG001', 'PEL001', 120, 145, 6, 2026,  '2026-06-01'), 
('PAIR002', 'PTG002', 'PEL001', 310, 328, 6, 2026,  '2026-06-01'), 
('PAIR003', 'PTG003', 'PEL003', 85,  115, 6, 2026,  '2026-06-02'),
('PAIR004', 'PTG004', 'PEL003', 512, 542, 6, 2026,  '2026-06-02'), 
('PAIR005', 'PTG005', 'PEL001', 201, 216, 6, 2026,  '2026-06-03');
