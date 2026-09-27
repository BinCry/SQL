-- BÀI 09: Tổng hợp doanh thu theo quý cho từng cửa hàng bằng PIVOT
-- Hệ quản trị: SQL Server

CREATE TABLE HoaDonBai09 (
    MaHD INT PRIMARY KEY,
    TenCuaHang NVARCHAR(100) NOT NULL,
    NgayLap DATE NOT NULL,
    TongTien DECIMAL(18, 2) NOT NULL CHECK (TongTien > 0)
);

INSERT INTO HoaDonBai09 (MaHD, TenCuaHang, NgayLap, TongTien) VALUES
    (1, N'Quận 1', '2027-01-15', 15000000),
    (2, N'Quận 1', '2027-02-20', 10000000),
    (3, N'Quận 1', '2027-04-05', 22000000),
    (4, N'Quận 3', '2027-03-18', 18000000),
    (5, N'Quận 3', '2027-07-11', 26000000),
    (6, N'Quận 3', '2027-10-09', 30000000);

-- Yêu cầu: một dòng cho mỗi cửa hàng, các cột là doanh thu quý 1 đến quý 4.
SELECT
    TenCuaHang,
    ISNULL([1], 0) AS DoanhThuQuy1,
    ISNULL([2], 0) AS DoanhThuQuy2,
    ISNULL([3], 0) AS DoanhThuQuy3,
    ISNULL([4], 0) AS DoanhThuQuy4
FROM (
    SELECT
        TenCuaHang,
        DATEPART(QUARTER, NgayLap) AS Quy,
        TongTien
    FROM HoaDonBai09
) AS DuLieuNguon
PIVOT (
    SUM(TongTien)
    FOR Quy IN ([1], [2], [3], [4])
) AS DoanhThuTheoQuy
ORDER BY TenCuaHang;
