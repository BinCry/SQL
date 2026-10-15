-- BÀI 13: So sánh giá hiện tại với lần thay đổi giá trước đó
-- Hệ quản trị: SQL Server

CREATE TABLE LichSuGiaBai13 (
    MaLichSu INT PRIMARY KEY,
    MaSP INT NOT NULL,
    NgayApDung DATE NOT NULL,
    DonGia DECIMAL(18, 2) NOT NULL CHECK (DonGia > 0)
);

INSERT INTO LichSuGiaBai13 (MaLichSu, MaSP, NgayApDung, DonGia) VALUES
    (1, 101, '2026-01-01', 1000000),
    (2, 101, '2026-03-01', 1200000),
    (3, 101, '2026-06-01', 1100000),
    (4, 102, '2026-01-01', 800000),
    (5, 102, '2026-04-01', 950000);

-- Yêu cầu: hiển thị giá cũ và mức chênh lệch cho mỗi lần điều chỉnh giá.
WITH GiaGanNhat AS (
    SELECT
        MaSP,
        NgayApDung,
        DonGia,
        LAG(DonGia) OVER (
            PARTITION BY MaSP
            ORDER BY NgayApDung, MaLichSu
        ) AS DonGiaTruoc
    FROM LichSuGiaBai13
)
SELECT
    MaSP,
    NgayApDung,
    DonGiaTruoc,
    DonGia AS DonGiaMoi,
    DonGia - DonGiaTruoc AS ChenhLech
FROM GiaGanNhat
WHERE DonGiaTruoc IS NOT NULL
ORDER BY MaSP, NgayApDung;
