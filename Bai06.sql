-- BÀI 06: Tính số dư lũy kế cho từng tài khoản
-- Hệ quản trị: SQL Server

CREATE TABLE GiaoDichBai06 (
    MaGD INT PRIMARY KEY,
    MaTaiKhoan INT NOT NULL,
    NgayGiaoDich DATETIME2 NOT NULL,
    LoaiGiaoDich CHAR(1) NOT NULL CHECK (LoaiGiaoDich IN ('C', 'D')),
    SoTien DECIMAL(18, 2) NOT NULL CHECK (SoTien > 0)
);

INSERT INTO GiaoDichBai06 (MaGD, MaTaiKhoan, NgayGiaoDich, LoaiGiaoDich, SoTien) VALUES
    (1, 1001, '2026-05-01 08:00:00', 'C', 5000000),
    (2, 1001, '2026-05-02 10:30:00', 'D', 1200000),
    (3, 1001, '2026-05-03 09:15:00', 'C', 700000),
    (4, 1002, '2026-05-01 11:00:00', 'C', 3000000),
    (5, 1002, '2026-05-04 14:00:00', 'D', 500000);

-- Yêu cầu: tính số dư sau từng giao dịch của mỗi tài khoản.
SELECT
    MaGD,
    MaTaiKhoan,
    NgayGiaoDich,
    LoaiGiaoDich,
    SoTien,
    SUM(CASE WHEN LoaiGiaoDich = 'C' THEN SoTien ELSE -SoTien END)
        OVER (
            PARTITION BY MaTaiKhoan
            ORDER BY NgayGiaoDich, MaGD
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS SoDuLuyKe
FROM GiaoDichBai06
ORDER BY MaTaiKhoan, NgayGiaoDich, MaGD;
