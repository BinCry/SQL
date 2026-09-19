-- BÀI 04: Tìm ba đơn hàng có giá trị cao nhất, bao gồm các đơn đồng hạng
-- Hệ quản trị: SQL Server

CREATE TABLE DonHangBai04 (
    MaDH INT PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayDat DATE NOT NULL,
    TongTien DECIMAL(18, 2) NOT NULL CHECK (TongTien > 0)
);

INSERT INTO DonHangBai04 (MaDH, MaKH, NgayDat, TongTien) VALUES
    (101, 1, '2026-01-03', 1200000),
    (102, 2, '2026-01-05', 4500000),
    (103, 3, '2026-01-06', 3200000),
    (104, 4, '2026-01-08', 4500000),
    (105, 5, '2026-01-10', 2800000),
    (106, 6, '2026-01-12', 3200000);

-- Yêu cầu: lấy ba mức giá trị đơn hàng cao nhất.
-- WITH TIES giữ lại tất cả đơn hàng có cùng giá trị ở vị trí cuối.
SELECT TOP (3) WITH TIES
    MaDH,
    MaKH,
    NgayDat,
    TongTien
FROM DonHangBai04
ORDER BY TongTien DESC;
