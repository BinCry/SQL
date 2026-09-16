-- BÀI 02: Tìm nhân viên có lương cao hơn mức lương trung bình phòng ban
-- Hệ quản trị: SQL Server

CREATE TABLE PhongBan (
    MaPhong INT PRIMARY KEY,
    TenPhong NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    MaPhong INT NOT NULL,
    Luong DECIMAL(18, 2) NOT NULL CHECK (Luong > 0),
    CONSTRAINT FK_NhanVien_PhongBan
        FOREIGN KEY (MaPhong) REFERENCES PhongBan(MaPhong)
);

INSERT INTO PhongBan (MaPhong, TenPhong) VALUES
    (1, N'Kinh doanh'),
    (2, N'Kỹ thuật'),
    (3, N'Nhân sự');

INSERT INTO NhanVien (MaNV, HoTen, MaPhong, Luong) VALUES
    (1, N'Nguyễn Minh', 1, 18000000),
    (2, N'Trần Lan', 1, 24000000),
    (3, N'Lê Nam', 1, 30000000),
    (4, N'Phạm Hương', 2, 25000000),
    (5, N'Vũ Long', 2, 35000000),
    (6, N'Đỗ Mai', 3, 20000000),
    (7, N'Bùi An', 3, 28000000);

-- Yêu cầu: liệt kê nhân viên có lương lớn hơn
-- lương trung bình của phòng ban mà họ thuộc về.
WITH LuongTheoPhong AS (
    SELECT
        nv.MaNV,
        nv.HoTen,
        pb.TenPhong,
        nv.Luong,
        AVG(nv.Luong) OVER (PARTITION BY nv.MaPhong) AS LuongTrungBinhPhong
    FROM NhanVien AS nv
    INNER JOIN PhongBan AS pb ON pb.MaPhong = nv.MaPhong
)
SELECT
    MaNV,
    HoTen,
    TenPhong,
    Luong,
    LuongTrungBinhPhong
FROM LuongTheoPhong
WHERE Luong > LuongTrungBinhPhong
ORDER BY TenPhong, Luong DESC;
