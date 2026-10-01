-- BÀI 11: Phát hiện các địa chỉ email bị trùng
-- Hệ quản trị: SQL Server

CREATE TABLE KhachHangBai11 (
    MaKH INT PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

INSERT INTO KhachHangBai11 (MaKH, HoTen, Email) VALUES
    (1, N'Nguyễn An', 'an@example.com'),
    (2, N'Trần Bình', 'binh@example.com'),
    (3, N'Lê Chi', 'an@example.com'),
    (4, N'Phạm Dũng', 'dung@example.com'),
    (5, N'Vũ An', 'an@example.com');

-- Yêu cầu: liệt kê email có từ hai khách hàng trở lên,
-- đồng thời hiển thị số lần xuất hiện.
SELECT
    Email,
    COUNT(*) AS SoLuongKhachHang
FROM KhachHangBai11
GROUP BY Email
HAVING COUNT(*) > 1
ORDER BY SoLuongKhachHang DESC, Email;
