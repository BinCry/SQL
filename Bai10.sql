-- BÀI 10: Tìm sinh viên đã đăng ký tất cả môn học bắt buộc
-- Hệ quản trị: SQL Server

CREATE TABLE SinhVienBai10 (
    MaSV INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL
);

CREATE TABLE MonHocBai10 (
    MaMH INT PRIMARY KEY,
    TenMH NVARCHAR(100) NOT NULL,
    BatBuoc BIT NOT NULL
);

CREATE TABLE DangKyBai10 (
    MaSV INT NOT NULL,
    MaMH INT NOT NULL,
    PRIMARY KEY (MaSV, MaMH),
    CONSTRAINT FK_DangKyBai10_SinhVien
        FOREIGN KEY (MaSV) REFERENCES SinhVienBai10(MaSV),
    CONSTRAINT FK_DangKyBai10_MonHoc
        FOREIGN KEY (MaMH) REFERENCES MonHocBai10(MaMH)
);

INSERT INTO SinhVienBai10 (MaSV, HoTen) VALUES
    (1, N'Nguyễn An'),
    (2, N'Trần Bình'),
    (3, N'Lê Chi');

INSERT INTO MonHocBai10 (MaMH, TenMH, BatBuoc) VALUES
    (101, N'Cơ sở dữ liệu', 1),
    (102, N'Lập trình SQL', 1),
    (103, N'Python cơ bản', 0);

INSERT INTO DangKyBai10 (MaSV, MaMH) VALUES
    (1, 101), (1, 102),
    (2, 101),
    (3, 101), (3, 102), (3, 103);

-- Yêu cầu: không được thiếu bất kỳ môn bắt buộc nào.
SELECT sv.MaSV, sv.HoTen
FROM SinhVienBai10 AS sv
WHERE NOT EXISTS (
    SELECT 1
    FROM MonHocBai10 AS mh
    WHERE mh.BatBuoc = 1
      AND NOT EXISTS (
          SELECT 1
          FROM DangKyBai10 AS dk
          WHERE dk.MaSV = sv.MaSV
            AND dk.MaMH = mh.MaMH
      )
);
