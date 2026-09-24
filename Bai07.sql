-- BÀI 07: Lấy đơn hàng mới nhất của mỗi khách hàng
-- Hệ quản trị: SQL Server

CREATE TABLE DonHangBai07 (
    MaDH INT PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayDat DATETIME2 NOT NULL,
    TongTien DECIMAL(18, 2) NOT NULL CHECK (TongTien > 0)
);

INSERT INTO DonHangBai07 (MaDH, MaKH, NgayDat, TongTien) VALUES
    (101, 1, '2026-06-01 08:00:00', 1200000),
    (102, 1, '2026-06-09 14:30:00', 2500000),
    (103, 2, '2026-06-03 09:15:00', 1800000),
    (104, 2, '2026-06-03 16:00:00', 2100000),
    (105, 3, '2026-06-05 10:00:00', 900000);

-- Yêu cầu: mỗi khách hàng chỉ hiển thị đơn hàng đặt gần nhất.
WITH DonHangXepHang AS (
    SELECT
        MaDH,
        MaKH,
        NgayDat,
        TongTien,
        ROW_NUMBER() OVER (
            PARTITION BY MaKH
            ORDER BY NgayDat DESC, MaDH DESC
        ) AS ThuTu
    FROM DonHangBai07
)
SELECT MaDH, MaKH, NgayDat, TongTien
FROM DonHangXepHang
WHERE ThuTu = 1
ORDER BY MaKH;
