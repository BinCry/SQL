-- BÀI 05: Tìm khách hàng đặt hàng trong cả ba tháng đầu năm
-- Hệ quản trị: SQL Server

CREATE TABLE KhachHangBai05 (
    MaKH INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL
);

CREATE TABLE DonHangBai05 (
    MaDH INT PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayDat DATE NOT NULL,
    CONSTRAINT FK_DonHangBai05_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHangBai05(MaKH)
);

INSERT INTO KhachHangBai05 (MaKH, HoTen) VALUES
    (1, N'Nguyễn Minh'),
    (2, N'Trần Ngọc'),
    (3, N'Lê Anh');

INSERT INTO DonHangBai05 (MaDH, MaKH, NgayDat) VALUES
    (101, 1, '2026-01-11'),
    (102, 1, '2026-02-09'),
    (103, 1, '2026-03-20'),
    (104, 2, '2026-01-15'),
    (105, 2, '2026-03-02'),
    (106, 3, '2026-02-28');

-- Yêu cầu: chỉ lấy khách hàng có ít nhất một đơn trong từng tháng 01, 02 và 03.
SELECT
    kh.MaKH,
    kh.HoTen,
    COUNT(DISTINCT MONTH(dh.NgayDat)) AS SoThangDaDat
FROM KhachHangBai05 AS kh
INNER JOIN DonHangBai05 AS dh ON dh.MaKH = kh.MaKH
WHERE dh.NgayDat >= '2026-01-01'
  AND dh.NgayDat < '2026-04-01'
GROUP BY kh.MaKH, kh.HoTen
HAVING COUNT(DISTINCT MONTH(dh.NgayDat)) = 3;
