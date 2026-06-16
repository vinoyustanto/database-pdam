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

-- Tabel pelanggan
CREATE TABLE pelanggan (
	id_pelanggan	VARCHAR(10),
	nama_pelanggan	VARCHAR(100) NOT NULL,
	alamat			TEXT NOT NULL,
	no_telepon		VARCHAR(15),
	PRIMARY KEY (id_pelanggan)
);

INSERT INTO pelanggan VALUES
('PEL001', 'Bapak Suryo', 'Jl. Merdeka No. 10', '081234567890'),
('PEL002', 'Ibu Kartini', 'Jl. Sudirman No. 25', '081987654321'),
('PEL003', 'CV. Maju Jaya', 'Jl. Gajah Mada No. 8', '081555666777');


-- Tabel petugas --
CREATE TABLE petugas (
	id_petugas		VARCHAR(10),
	nama_petugas	VARCHAR(50) NOT NULL,
	role			VARCHAR(25) NOT NULL, 
	username		VARCHAR(50) NOT NULL,
	password		VARCHAR(255) NOT NULL,
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
	id_penggunaan		VARCHAR(10),
	id_petugas			VARCHAR(10) NOT NULL,		
	id_pelanggan		VARCHAR(10) NOT NULL,	
	meter_awal			INT NOT NULL,
	meter_akhir			INT NOT NULL,
	bulan				INT NOT NULL,
	tahun				INT NOT NULL,
	tanggal_pencatatan	DATE NOT NULL,
	PRIMARY KEY (id_penggunaan),
	FOREIGN KEY (id_petugas)   REFERENCES petugas(id_petugas),
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

INSERT INTO penggunaan_air VALUES
('PAIR001', 'PTG001', 'PEL001', 120, 145, 6, 2026,  '2026-06-01'), 
('PAIR002', 'PTG002', 'PEL001', 310, 328, 6, 2026,  '2026-06-01'), 
('PAIR003', 'PTG003', 'PEL003', 85,  115, 6, 2026,  '2026-06-02'),
('PAIR004', 'PTG004', 'PEL003', 512, 542, 6, 2026,  '2026-06-02'), 
('PAIR005', 'PTG005', 'PEL001', 201, 216, 6, 2026,  '2026-06-03');


-- Tabel kategori_tarif
CREATE TABLE kategori_tarif (
    id_kategori     VARCHAR(10),
    nama_kategori   VARCHAR(50) NOT NULL,
    tarif_per_m3    DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_kategori)
);

INSERT INTO kategori_tarif VALUES
('KT001', 'Sosial', 2500.00),
('KT002', 'Rumah Tangga', 3500.00),
('KT003', 'Bisnis', 5000.00),
('KT004', 'Industri', 7500.00),
('KT005', 'Pemerintah', 6000.00);
('PAIR004', 'PTG004', 'PEL003', 512, 542, 6, 2026,  '2026-06-02'), 
('PAIR005', 'PTG005', 'PEL001', 201, 216, 6, 2026,  '2026-06-03');
