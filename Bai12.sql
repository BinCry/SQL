-- BÀI 12: Phát hiện các lượt đặt phòng bị trùng thời gian
-- Hệ quản trị: SQL Server

CREATE TABLE DatPhongBai12 (
    MaDat INT PRIMARY KEY,
    MaPhong INT NOT NULL,
    NgayNhan DATETIME2 NOT NULL,
    NgayTra DATETIME2 NOT NULL,
    CONSTRAINT CK_DatPhongBai12_ThoiGian
        CHECK (NgayTra > NgayNhan)
);

INSERT INTO DatPhongBai12 (MaDat, MaPhong, NgayNhan, NgayTra) VALUES
    (1, 101, '2026-08-01 14:00:00', '2026-08-03 12:00:00'),
    (2, 101, '2026-08-02 10:00:00', '2026-08-04 12:00:00'),
    (3, 101, '2026-08-04 14:00:00', '2026-08-05 12:00:00'),
    (4, 102, '2026-08-01 14:00:00', '2026-08-03 12:00:00'),
    (5, 102, '2026-08-03 12:00:00', '2026-08-04 12:00:00');

-- Yêu cầu: tìm từng cặp đặt cùng phòng có thời gian giao nhau.
-- Hai khoảng [bắt đầu, kết thúc) trùng nhau khi mỗi khoảng bắt đầu trước lúc kia kết thúc.
SELECT
    d1.MaPhong,
    d1.MaDat AS MaDat1,
    d2.MaDat AS MaDat2,
    d1.NgayNhan AS Nhan1,
    d1.NgayTra AS Tra1,
    d2.NgayNhan AS Nhan2,
    d2.NgayTra AS Tra2
FROM DatPhongBai12 AS d1
INNER JOIN DatPhongBai12 AS d2
    ON d1.MaPhong = d2.MaPhong
   AND d1.MaDat < d2.MaDat
   AND d1.NgayNhan < d2.NgayTra
   AND d2.NgayNhan < d1.NgayTra
ORDER BY d1.MaPhong, d1.MaDat, d2.MaDat;
