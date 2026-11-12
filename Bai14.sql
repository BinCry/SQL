-- BÀI 14: Tìm các chuỗi đăng nhập liên tiếp của khách hàng
-- Hệ quản trị: SQL Server

CREATE TABLE DangNhapBai14 (
    MaKH INT NOT NULL,
    NgayDangNhap DATE NOT NULL,
    PRIMARY KEY (MaKH, NgayDangNhap)
);

INSERT INTO DangNhapBai14 (MaKH, NgayDangNhap) VALUES
    (1, '2026-10-01'),
    (1, '2026-10-02'),
    (1, '2026-10-03'),
    (1, '2026-10-05'),
    (1, '2026-10-06'),
    (2, '2026-10-02'),
    (2, '2026-10-04'),
    (2, '2026-10-05'),
    (2, '2026-10-06'),
    (2, '2026-10-07'),
    (3, '2026-10-10');

-- Yêu cầu: tìm các chuỗi đăng nhập liên tiếp từ ba ngày trở lên của mỗi khách hàng.
-- Mỗi chuỗi cần hiển thị ngày bắt đầu, ngày kết thúc và số ngày liên tiếp.
WITH DanhDauKhoangTrong AS (
    SELECT
        MaKH,
        NgayDangNhap,
        CASE
            WHEN LAG(NgayDangNhap) OVER (
                PARTITION BY MaKH
                ORDER BY NgayDangNhap
            ) = DATEADD(DAY, -1, NgayDangNhap) THEN 0
            ELSE 1
        END AS BatDauChuoi
    FROM DangNhapBai14
),
GanNhom AS (
    SELECT
        MaKH,
        NgayDangNhap,
        SUM(BatDauChuoi) OVER (
            PARTITION BY MaKH
            ORDER BY NgayDangNhap
            ROWS UNBOUNDED PRECEDING
        ) AS MaChuoi
    FROM DanhDauKhoangTrong
),
ChuoiDangNhap AS (
    SELECT
        MaKH,
        MaChuoi,
        MIN(NgayDangNhap) AS NgayBatDau,
        MAX(NgayDangNhap) AS NgayKetThuc,
        COUNT(*) AS SoNgayLienTiep
    FROM GanNhom
    GROUP BY MaKH, MaChuoi
)
SELECT
    MaKH,
    NgayBatDau,
    NgayKetThuc,
    SoNgayLienTiep
FROM ChuoiDangNhap
WHERE SoNgayLienTiep >= 3
ORDER BY MaKH, NgayBatDau;
