# Thai Tu Ngoc | Strategic Operations Analysis | Data Analyst Portfolio

✨ Chào mừng bạn đến với Portfolio của tôi. Đây là tập hợp các dự án phân tích dữ liệu tập trung vào kỹ năng kiểm soát dữ liệu, phát hiện bất thường tôi được làm trong quá trình học Data Analyst Certificate tại TTTH - HCMUS và cách tôi áp dụng tư duy Kinh Doanh từ nền tảng học thuật ngành Kinh Doanh Quốc Tế đã được học tại VLU để kết nối dữ liệu với chiến lược kinh doanh hỗ trợ tối ưu hoá vận hành.

# **Skills:** 

## 📑 **Business Domains:**

**Market Research & Site Selection:** Nghiên cứu thị trường và quy hoạch vị trí điểm bán.

**Feasibility Study:** Đánh giá tính khả thi của dự án đầu tư.

**Supply Chain & Inventory Management:** Tư duy tối ưu hóa chuỗi cung ứng và quản trị tồn kho.

**Strategic Planning:** Hoạch định chiến lược và thiết lập mục tiêu (KPIs/OKRs).

**Geospatial Analysis:** Tư duy phân tích vị trí dựa trên mật độ dân cư và khoảng cách địa lý.

## 💻 **Technical Skills:**

**Data Analytics:** SQL (Window Functions, Joins), Python (Pandas).

**Data Visualization:** Taleau, Seaborn.


## 📇 **Audit & Quality:**

**Data Auditing & Integrity:** Kiểm soát tính chính xác và trung thực của dữ liệu từ nhiều nguồn (thủ công/ tự động/ bán tự động).

# 👩🏼‍💻 Các Case Study Data Analyst
## 1. Phân tích Hiệu Suất Chuỗi Cửa Hàng & Hub [SQL]
**Dữ liệu:** Hệ thống giao nhận (Orders, Hubs, Shippers, Stores).

- **Đối soát doanh thu:** Sử dụng `Window Functions` (`LEAD`, `RANK`) để tính chênh lệch doanh số giữa các Hub xếp hạng kế tiếp.
- **Kiểm soát hiệu suất:** Tính toán `hours_diff` để phân loại Shipper (Outperform/Late), giúp xác định các điểm nghẽn vận hành.
- **Tính toán tỷ trọng:** Phân tích cơ cấu doanh thu theo từng Hub/Thành phố.

==> Phát hiện các sai lệch doanh thu giữa các Hub và xác định các điểm nghẽn vận hành dựa trên thời gian thực.
> [🔗 Xem chi tiết mã nguồn SQL tại đây](./Project_SQLCert.sql)

---

##  2. Phân tích Gian lận & Dữ liệu Y tế [Python]
**Dữ liệu:** Giao dịch tài chính (Fraud Detection) và Chỉ số sức khỏe (Diabetes).
- **Data Integrity:** Sử dụng `Pandas` để kiểm tra Null, trùng lặp và định dạng dữ liệu.
- **Anomaly Detection:** Vẽ biểu đồ `Boxplot` để xác định các giao dịch có giá trị ngoại lai bất thường.
- **Phát hiện lỗi logic:** Xác định các bản ghi có chỉ số bằng 0 (vô lý về mặt y tế) và đề xuất hướng xử lý.
- **Analysis:**

💡 Case: Xác định khung giờ cao điểm phát sinh gian lận (Câu 3.6)

<img width="851" height="396" alt="Ảnh màn hình" src="https://github.com/user-attachments/assets/f612bde8-c943-477d-99df-37f2b41d3248" />

**Insight:** Phát hiện khung giờ cao điểm gian lận từ 22h - 4h sáng, đề xuất tăng cường hệ thống cảnh báo tự động trong khung giờ này.

💡 Case: Phân tích số lượt giao dịch gian lận theo thời gian - ngày qua ngày (Câu 3.5)

<img width="895" height="467" alt="Ảnh màn hình" src="https://github.com/user-attachments/assets/f6345d5f-37bf-4934-92e4-fa3c2423d0bd" />

**Insight:** Số lượng giao dịch gian lận có xu hướng biến động mạnh theo chu kỳ ngày. Việc nhận diện các ngày có tần suất cao giúp đội ngũ vận hành dự báo và phân bổ nhân sự kiểm soát rủi ro hiệu quả hơn.

💡 Case: So sánh phân bố Glucose giữa nhóm mắc tiểu đường và không mắc tiểu đường (Câu 4.3)

<img width="623" height="449" alt="Ảnh màn hình" src="https://github.com/user-attachments/assets/e0a71656-5db9-4ffb-b468-f1da7e06fe43" />

**Insight:** Nhóm mắc tiểu đường có nồng độ Glucose trung bình cao hơn rõ rệt và dải phân bố rộng hơn. Đây là chỉ số quan trọng nhất trong việc xây dựng mô hình dự báo rủi ro sức khỏe.

> [🔗 Xem chi tiết Notebook Python tại đây](./Project_Python_Cert.ipynb)

## 3.  Kiểm toán dữ liệu chiến lược và Phân tích hiệu suất [Tableau]
**Dữ liệu:** EU SuperStore
> [🔗 Xem chi tiết Tableau Workbook tại đây](./Demo_EU_SuperStore.twbx)
---

## 📮 Công cụ sử dụng
- **Ngôn ngữ:** SQL (BigQuery/Standard SQL), Python.
- **Thư viện:** Pandas, Matplotlib, Seaborn, Tableau.
- **Tư duy:** Data Auditing, EDA, Statistical Analysis.
- **Nghiệp vụ:** Business Analysis, Supply Chain Planning.
