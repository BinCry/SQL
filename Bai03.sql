-- BÀI 03: Liệt kê sản phẩm chưa từng được bán
-- Hệ quản trị: SQL Server

CREATE TABLE DanhMuc (
    MaDanhMuc INT PRIMARY KEY,
    TenDanhMuc NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    TenSP NVARCHAR(150) NOT NULL,
    MaDanhMuc INT NOT NULL,
    DonGia DECIMAL(18, 2) NOT NULL CHECK (DonGia > 0),
    CONSTRAINT FK_SanPham_DanhMuc
        FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc)
);

CREATE TABLE ChiTietDonHang (
    MaDH INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    PRIMARY KEY (MaDH, MaSP),
    CONSTRAINT FK_ChiTietDonHang_SanPham
        FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

INSERT INTO DanhMuc (MaDanhMuc, TenDanhMuc) VALUES
    (1, N'Điện thoại'),
    (2, N'Phụ kiện');

INSERT INTO SanPham (MaSP, TenSP, MaDanhMuc, DonGia) VALUES
    (1, N'Điện thoại A', 1, 12000000),
    (2, N'Điện thoại B', 1, 15000000),
    (3, N'Tai nghe X', 2, 800000),
    (4, N'Sạc nhanh Y', 2, 500000);

INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong) VALUES
    (101, 1, 2),
    (101, 3, 1),
    (102, 1, 1);

-- Yêu cầu: tìm các sản phẩm không có bản ghi bán hàng nào.
SELECT
    sp.MaSP,
    sp.TenSP,
    dm.TenDanhMuc,
    sp.DonGia
FROM SanPham AS sp
INNER JOIN DanhMuc AS dm ON dm.MaDanhMuc = sp.MaDanhMuc
LEFT JOIN ChiTietDonHang AS ctdh ON ctdh.MaSP = sp.MaSP
WHERE ctdh.MaSP IS NULL
ORDER BY dm.TenDanhMuc, sp.TenSP;
