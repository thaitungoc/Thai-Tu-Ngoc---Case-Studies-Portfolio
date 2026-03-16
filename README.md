# Thai Tu Ngoc | Case Studies & Portfolio

✨ Chào mừng bạn đến với Portfolio của tôi. Đây là tập hợp các dự án phân tích dữ liệu thực tế, tập trung vào kỹ năng kiểm soát dữ liệu, phát hiện bất thường tại HCMUS và cách tôi áp dụng tư duy Kinh Doanh từ nền tảng học thuật ngành Kinh Doanh Quốc Tế đã được học tại VLU để kết nối dữ liệu với chiến lược kinh doanh hỗ trợ tối ưu hoá vận hành.

**Skills:** 

**Business Domains:**

**Market Research & Site Selection:** Nghiên cứu thị trường và quy hoạch vị trí điểm bán.

**Feasibility Study:** Đánh giá tính khả thi của dự án đầu tư.

**Supply Chain & Inventory Management:** Tư duy tối ưu hóa chuỗi cung ứng và quản trị tồn kho (SKU Management).

**Strategic Planning:** Hoạch định chiến lược và thiết lập mục tiêu (KPIs/OKRs).


**Technical Skills:**

**Financial Modeling:** Sử dụng Excel/Google Sheets để xây dựng mô hình P&L, CAPEX/OPEX, và dự báo dòng tiền.

**Geospatial Analysis (Cơ bản):** Tư duy phân tích vị trí dựa trên mật độ dân cư và khoảng cách địa lý.

**Data Analytics:** SQL (Window Functions, Joins), Python (Pandas).

**Data Visualization:** Taleau, Power BI.


**Audit & Quality:**

**Data Auditing & Integrity:** Kiểm soát tính chính xác và trung thực của dữ liệu từ nhiều nguồn (thủ công/ tự động/ bán tự động).

**Anomaly Detection:** Phát hiện các điểm bất thường trong vận hành và báo cáo tài chính.

**SOP Optimization:** Tối ưu hóa quy trình vận hành tiêu chuẩn.

# ☕️ F&B Startup Strategy & Pre-operating (Personal Project)
**Context:** Thiết lập mô hình kinh doanh cho Startup F&B (Cafe & Merch).

**Task:** Xây dựng hệ thống dự báo tài chính và quy trình vận hành từ con số 0.

**Action:**
🧾 Xây dựng mô hình tài chính định lượng (CAPEX/OPEX) chi tiết để quản lý ngân sách.

📈 Xây dựng kịch bản Dự báo điểm hòa vốn dựa trên dữ liệu thị trường.

📊 Phân tích dữ liệu thị trường để thiết kế danh mục sản phẩm tối ưu biên lợi nhuận.

🗂️ Thiết lập hệ thống mã hàng cho Coffee, Bakery và Merchs.

**Impact:** Hoàn thiện bộ hồ sơ Nghiên cứu khả thi, sẵn sàng cho giai đoạn vận hành với hệ thống quản lý dữ liệu chuẩn hóa.

**Tools:** Excel/Google Sheets.


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
<img width="851" height="396" alt="Ảnh màn hình 2026-02-12 lúc 18 10 53" src="https://github.com/user-attachments/assets/f612bde8-c943-477d-99df-37f2b41d3248" />

**Insight:** Phát hiện khung giờ cao điểm gian lận từ 22h - 4h sáng, đề xuất tăng cường hệ thống cảnh báo tự động trong khung giờ này.

💡 Case: Phân tích số lượt giao dịch gian lận theo thời gian (ngày qua ngày - Câu 3.5)
<img width="895" height="467" alt="Ảnh màn hình 2026-02-12 lúc 18 09 44" src="https://github.com/user-attachments/assets/f6345d5f-37bf-4934-92e4-fa3c2423d0bd" />

**Insight:** Số lượng giao dịch gian lận có xu hướng biến động mạnh theo chu kỳ ngày. Việc nhận diện các ngày có tần suất cao giúp đội ngũ vận hành dự báo và phân bổ nhân sự kiểm soát rủi ro hiệu quả hơn.

💡 Case: So sánh phân bố Glucose giữa nhóm mắc tiểu đường và không mắc tiểu đường (Câu 4.3)
<img width="623" height="449" alt="Ảnh màn hình 2026-02-12 lúc 18 12 02" src="https://github.com/user-attachments/assets/e0a71656-5db9-4ffb-b468-f1da7e06fe43" />

**Insight:** Nhóm mắc tiểu đường có nồng độ Glucose trung bình cao hơn rõ rệt và dải phân bố rộng hơn. Đây là chỉ số quan trọng nhất trong việc xây dựng mô hình dự báo rủi ro sức khỏe.

> [🔗 Xem chi tiết Notebook Python tại đây](./Project_Python_Cert.ipynb)

---

## 📮 Công cụ sử dụng
- **Ngôn ngữ:** SQL (BigQuery/Standard SQL), Python.
- **Thư viện:** Pandas, Matplotlib, Seaborn.
- **Tư duy:** Data Auditing, EDA, Statistical Analysis.
- **Nghiệp vụ:** Business Analysis, P&L Modeling, Supply Chain Planning.
