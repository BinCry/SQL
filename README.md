# Bài tập SQL

<p>
  <a href="https://www.microsoft.com/sql-server"><img src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=flat-square&amp;logo=microsoftsqlserver&amp;logoColor=white" alt="Microsoft SQL Server"></a>
  <a href="https://learn.microsoft.com/sql/t-sql/"><img src="https://img.shields.io/badge/T--SQL-0078D4?style=flat-square&amp;logo=microsoftsqlserver&amp;logoColor=white" alt="T-SQL"></a>
  <br>
  <a href="https://git-scm.com/"><img src="https://img.shields.io/badge/Git-F05032?style=flat-square&amp;logo=git&amp;logoColor=white" alt="Git"></a>
  <a href="https://github.com/"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&amp;logo=github&amp;logoColor=white" alt="GitHub"></a>
</p>

Kho bài tập SQL Server bằng tiếng Việt. Mỗi tệp `.sql` gồm dữ liệu minh họa và câu truy vấn giải quyết một bài toán cụ thể.

## Công nghệ sử dụng

- Microsoft SQL Server
- Transact-SQL (T-SQL)
- Git và GitHub

## Danh sách bài tập

| Bài | Nội dung | Kỹ thuật chính |
|---|---|---|
| [Bai01](Bai01.sql) | Khách hàng có tổng giá trị đơn hàng cao nhất | `SUM`, `DENSE_RANK` |
| [Bai02](Bai02.sql) | Nhân viên có lương cao hơn trung bình phòng ban | `AVG OVER`, CTE |
| [Bai03](Bai03.sql) | Sản phẩm chưa từng được bán | `LEFT JOIN`, `IS NULL` |
| [Bai04](Bai04.sql) | Ba đơn hàng có giá trị cao nhất | `TOP ... WITH TIES` |
| [Bai05](Bai05.sql) | Khách đặt hàng trong cả ba tháng | `HAVING`, `COUNT DISTINCT` |
| [Bai06](Bai06.sql) | Số dư lũy kế theo giao dịch | `SUM OVER` |
| [Bai07](Bai07.sql) | Đơn hàng mới nhất của mỗi khách | `ROW_NUMBER` |
| [Bai08](Bai08.sql) | Cây cấp dưới của quản lý | CTE đệ quy |
| [Bai09](Bai09.sql) | Doanh thu theo quý của cửa hàng | `PIVOT` |
| [Bai10](Bai10.sql) | Sinh viên đăng ký đủ môn bắt buộc | `NOT EXISTS` lồng nhau |
| [Bai11](Bai11.sql) | Phát hiện email trùng | `GROUP BY`, `HAVING` |
| [Bai12](Bai12.sql) | Lượt đặt phòng chồng chéo | Self join |
| [Bai13](Bai13.sql) | So sánh giá với lần điều chỉnh trước | `LAG` |
| [Bai14](Bai14.sql) | Chuỗi ngày đăng nhập liên tiếp | `LAG`, `SUM OVER`, gaps and islands |

## Cách chạy

1. Cài Microsoft SQL Server và SQL Server Management Studio (SSMS), hoặc Azure Data Studio.
2. Tạo hoặc chọn một cơ sở dữ liệu dùng để thực hành.
3. Mở một tệp `BaiXX.sql` trong công cụ quản trị SQL Server.
4. Chạy toàn bộ tệp để tạo bảng, chèn dữ liệu mẫu và xem kết quả truy vấn.

> Mỗi bài được thiết kế để chạy độc lập. Nếu chạy lại cùng một bài trong cùng cơ sở dữ liệu, hãy xóa các bảng của bài đó trước.

## Đóng góp

Mọi góp ý về bài toán, dữ liệu mẫu hoặc cách viết truy vấn đều được chào đón.

## Giấy phép

Chưa gắn giấy phép cụ thể.
