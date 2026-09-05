-- BÀI 01: Liệt kê khách hàng có tổng giá trị đơn hàng cao nhất
-- Hệ quản trị: SQL Server

CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL
);

CREATE TABLE DonHang (
    MaDH INT PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayDat DATE NOT NULL,
    TongTien DECIMAL(18, 2) NOT NULL CHECK (TongTien >= 0),
    CONSTRAINT FK_DonHang_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

INSERT INTO KhachHang (MaKH, HoTen) VALUES
    (1, N'Nguyễn An'),
    (2, N'Trần Bình'),
    (3, N'Lê Chi');

INSERT INTO DonHang (MaDH, MaKH, NgayDat, TongTien) VALUES
    (101, 1, '2026-01-05', 1500000),
    (102, 1, '2026-01-20', 2200000),
    (103, 2, '2026-02-01', 4500000),
    (104, 3, '2026-02-10', 3000000);

-- Yêu cầu: tìm khách hàng (kể cả trường hợp đồng hạng)
-- có tổng giá trị đơn hàng lớn nhất.
WITH TongChiTieu AS (
    SELECT
        kh.MaKH,
        kh.HoTen,
        SUM(dh.TongTien) AS TongGiaTriDonHang
    FROM KhachHang AS kh
    INNER JOIN DonHang AS dh ON dh.MaKH = kh.MaKH
    GROUP BY kh.MaKH, kh.HoTen
),
XepHang AS (
    SELECT
        MaKH,
        HoTen,
        TongGiaTriDonHang,
        DENSE_RANK() OVER (ORDER BY TongGiaTriDonHang DESC) AS Hang
    FROM TongChiTieu
)
SELECT MaKH, HoTen, TongGiaTriDonHang
FROM XepHang
WHERE Hang = 1;
