-- BÀI 08: Hiển thị toàn bộ cấp dưới của một quản lý bằng CTE đệ quy
-- Hệ quản trị: SQL Server

CREATE TABLE NhanVienBai08 (
    MaNV INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    MaQuanLy INT NULL,
    CONSTRAINT FK_NhanVienBai08_QuanLy
        FOREIGN KEY (MaQuanLy) REFERENCES NhanVienBai08(MaNV)
);

INSERT INTO NhanVienBai08 (MaNV, HoTen, MaQuanLy) VALUES
    (1, N'Nguyễn Hoàng', NULL),
    (2, N'Trần Mai', 1),
    (3, N'Lê Quân', 1),
    (4, N'Phạm An', 2),
    (5, N'Vũ Bình', 2),
    (6, N'Đỗ Lan', 3);

DECLARE @MaQuanLy INT = 1;

-- Yêu cầu: tìm mọi nhân viên thuộc cây quản lý của nhân viên có mã @MaQuanLy.
WITH CayNhanSu AS (
    SELECT
        MaNV,
        HoTen,
        MaQuanLy,
        1 AS CapBac,
        CAST(HoTen AS NVARCHAR(MAX)) AS DuongDan
    FROM NhanVienBai08
    WHERE MaQuanLy = @MaQuanLy

    UNION ALL

    SELECT
        nv.MaNV,
        nv.HoTen,
        nv.MaQuanLy,
        cns.CapBac + 1,
        CAST(cns.DuongDan + N' > ' + nv.HoTen AS NVARCHAR(MAX))
    FROM NhanVienBai08 AS nv
    INNER JOIN CayNhanSu AS cns ON nv.MaQuanLy = cns.MaNV
)
SELECT MaNV, HoTen, MaQuanLy, CapBac, DuongDan
FROM CayNhanSu
ORDER BY DuongDan;
