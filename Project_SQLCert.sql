--Đề Thi Cuối Khoá:
/*1.Lọc ra các đơn hàng đã được giao thành công của các cửa hàng có tên chứa đúng 1 kí tự  “A” trong quý 2 năm 2021.*/
SELECT 
  o.order_id, o.order_status, o.order_amount, o.order_moment_created, s.store_name, s.store_segment,
FROM project-thaitungoc-2025.K309.orders AS o
JOIN project-thaitungoc-2025.K309.stores AS s ON o.store_id = s.store_id
WHERE o.order_status = 'FINISHED'
  AND s.store_name LIKE '%A%'
  AND s.store_name NOT LIKE '%A%A%'
  AND EXTRACT(QUARTER FROM o.order_moment_created) = 2
  AND EXTRACT(YEAR FROM o.order_moment_created) =2021;


/*2. Liệt kê tất cả các đơn hàng đã hoàn thành của các cửa hàng có giá gói dịch vụ (store plan price) lớn hơn 40, được tạo từ kênh MARKETPLACE, và được vận chuyển bởi shipper thuộc loại FREELANCE.*/
SELECT 
  o.order_id, o.order_amount, o.order_moment_created, s.store_name, s.store_plan_price, o.order_status, 
  c.channel_type, dr.driver_type,
FROM project-thaitungoc-2025.K309.orders AS o
JOIN project-thaitungoc-2025.K309.stores AS s ON o.store_id = s.store_id
JOIN project-thaitungoc-2025.K309.channels AS c ON o.channel_id = c.channel_id
JOIN project-thaitungoc-2025.K309.deliveries AS de ON o.delivery_order_id = de.delivery_order_id
JOIN project-thaitungoc-2025.K309.drivers AS dr ON de.driver_id = dr.driver_id
WHERE o.order_status = 'FINISHED'
  AND s.store_plan_price > 40
  AND c.channel_type = 'MARKETPLACE'
  AND dr.driver_type = 'FREELANCE';


/*3.Liệt kê số đơn hàng hoàn thành và tổng doanh thu của từng kênh bán hàng trong năm 2021.*/
SELECT
  c.channel_id, c.channel_name, c. channel_type,
COUNT(o.order_id) AS total_finished_orders,
SUM(o.order_amount) AS total_revenue,
FROM project-thaitungoc-2025.K309.orders AS o
JOIN project-thaitungoc-2025.K309.channels AS c ON o.channel_id = c.channel_id
WHERE o.order_status = 'FINISHED'
  AND EXTRACT(YEAR FROM o.order_moment_created) = 2021
GROUP BY c.channel_id,c.channel_name,c.channel_type;


/*4.Giả sử tiêu chuẩn đặt ra cho các ngành hàng GOOD là khoảng thời gian từ lúc đơn hàng được tạo cho đến khi đơn hàng được shipper nhận để giao  (hours_diff) như sau:
 Nếu hours_diff < 2 giờ thì được xếp vào loại outperform
 Nếu hours_diff >= 2  giờ và hours_diff < 5 thì được xếp vào loại meet_standard
 Nếu hours_diff >= 5 giờ và hours_diff < 10 thì được xếp vào loại approach_standard
 Nếu hours_diff >= 10 giờ thì được xếp vào loại below_standard
Biết thời gian đơn hàng được tạo ra là order_moment_created và thời gian đơn hàng được shipper nhận để giao là trường thông tin order_moment_collected. 
Hãy lọc ra các đơn hàng thuộc ngành hàng GOOD được tạo ra trong tháng 4 năm 2021, xuất thông tin của các đơn hàng đó cùng xếp loại của từng đơn hàng.*/
SELECT
  o.order_id, s.store_name, s.store_segment, o.order_moment_created, o.order_moment_collected,
  DATE_DIFF(o.order_moment_collected, o.order_moment_created, HOUR) AS hours_diff,
  CASE
    WHEN DATE_DIFF(o.order_moment_collected, o.order_moment_created, HOUR) < 2 THEN 'outperform'
    WHEN DATE_DIFF(o.order_moment_collected, o.order_moment_created, HOUR) < 5 THEN 'meet_standard'
    WHEN DATE_DIFF(o.order_moment_collected, o.order_moment_created, HOUR) < 10 THEN 'approach_standard'
    ELSE 'below_standard'
    END AS classification
FROM project-thaitungoc-2025.K309.orders AS o
JOIN project-thaitungoc-2025.K309.stores AS s ON o.store_id = s.store_id
WHERE s.store_segment = 'GOOOD'
  AND EXTRACT (MONTH FROM o.order_moment_created) = 4
  AND EXTRACT (YEAR FROM o.order_moment_created) = 2021;


/*5.Liệt kê thông tin của các cửa hàng có số lượng đơn hàng > 10, sắp xếp theo tên cửa hàng tăng dần.*/
SELECT 
  s.store_id, s.store_name, s.store_segment, s.store_plan_price,
  COUNT(o.order_id) AS total_orders,
  SUM(o.order_amount) AS total_revenue
FROM project-thaitungoc-2025.K309.stores AS s
JOIN project-thaitungoc-2025.K309.orders AS o ON s.store_id = o.store_id
GROUP BY s.store_id, s.store_name, s.store_segment, s.store_plan_price
HAVING COUNT(o.order_id) > 10
ORDER BY s.store_name ASC;


/*6. Liệt kê các cửa hàng có số đơn hàng hoàn thành trong năm 2021 thuộc kênh MARKETPLACE cao hơn mức trung bình của toàn bộ cửa hàng. Hiển thị thông tin cửa hàng, số đơn hoàn thành và thứ hạng theo số đơn, sắp xếp tăng dần.*/
WITH store_stats AS (
  SELECT 
    s.store_id, s.store_name, s.store_segment,
    COUNT(o.order_id) AS total_finished_orders,
    SUM(o.order_amount) AS total_revenue
  FROM project-thaitungoc-2025.K309.stores AS s
  JOIN project-thaitungoc-2025.K309.orders AS o ON s.store_id = o.store_id
  JOIN project-thaitungoc-2025.K309.channels AS c ON o.channel_id = c.channel_id
  WHERE o.order_status = 'FINISHED' 
    AND c.channel_type = 'MARKETPLACE'
    AND EXTRACT(YEAR FROM o.order_moment_created) = 2021
  GROUP BY 1, 2, 3
)
  SELECT *, 
    RANK() OVER (ORDER BY total_finished_orders DESC) AS store_rank
FROM store_stats
WHERE total_finished_orders > (SELECT AVG(total_finished_orders) FROM store_stats)
ORDER BY total_finished_orders ASC;


/*7.Xuất các cửa hàng có doanh thu cao nhất và thấp nhất trong từng tháng của năm 2021. Hiển thị tháng, thông tin cửa hàng và tổng doanh thu.*/
WITH monthly_revenue AS (
  SELECT 
    s.store_id, s.store_name, s.store_segment, h.hub_city,
    EXTRACT(MONTH FROM o.order_moment_created) AS order_month,
    COUNT(o.order_id) AS total_finished_orders,
    SUM(o.order_amount) AS total_revenue
  FROM project-thaitungoc-2025.K309.orders AS o
  JOIN project-thaitungoc-2025.K309.stores AS s ON o.store_id = s.store_id
  JOIN project-thaitungoc-2025.K309.hubs AS h ON s.hub_id = h.hub_id
  WHERE o.order_status = 'FINISHED' AND EXTRACT(YEAR FROM o.order_moment_created) = 2021
  GROUP BY 1, 2, 3, 4, 5
),
ranked_revenue AS (
  SELECT *,
    RANK() OVER (PARTITION BY order_month ORDER BY total_revenue DESC) AS rank_high,
    RANK() OVER (PARTITION BY order_month ORDER BY total_revenue ASC) AS rank_low
    FROM monthly_revenue
)
  SELECT order_month, store_id, store_name, store_segment, hub_city, total_finished_orders, total_revenue,
    CASE WHEN rank_high = 1 THEN 'HIGHEST_REVENUE' ELSE 'LOWEST_REVENUE' END AS revenue_type
FROM ranked_revenue
WHERE rank_high = 1 OR rank_low = 1
ORDER BY order_month, revenue_type DESC;
--??kh hiur

/*8.Thống kê các cửa hàng có đơn hàng ở cả 2 quý 1 và 2 trong năm 2021, cho biết số đơn hàng và tổng revenue của từng cửa hàng trong từng quý.*/
WITH store_revenue AS (
  SELECT 
    s.store_id, s.store_name, s.hub_id,
    SUM(o.order_amount) AS store_total_revenue
  FROM `K309.orders` AS o
  JOIN `K309.stores` AS s ON o.store_id = s.store_id
  WHERE o.order_status = 'FINISHED'
  GROUP BY 1, 2, 3
),
hub_revenue AS (
  SELECT 
    hub_id, 
    SUM(store_total_revenue) AS hub_total_revenue
  FROM store_revenue
  GROUP BY 1
)
SELECT 
  sr.store_id, sr.store_name, sr.hub_id, sr.store_total_revenue, hr.hub_total_revenue,
    ROUND((sr.store_total_revenue / hr.hub_total_revenue) * 100, 2) AS revenue_pct_in_hub
FROM store_revenue sr
JOIN hub_revenue hr ON sr.hub_id = hr.hub_id
ORDER BY sr.hub_id, revenue_pct_in_hub DESC;


/*9.Xuất thông tin phân khúc cửa hàng nào mang lại doanh thu cao nhất tại mỗi thành phố hub trong năm 2021?
Hiển thị số đơn hàng hoàn thành, số cửa hàng tham gia, tổng doanh thu và tỷ trọng (%) doanh thu của phân khúc đó trong tổng doanh thu của hub, sắp xếp theo tên thành phố.*/
WITH segment_stats AS (
  SELECT 
    h.hub_city, s.store_segment,
    COUNT(DISTINCT o.order_id) AS total_finished_orders,
    COUNT(DISTINCT s.store_id) AS total_stores,
    SUM(o.order_amount) AS store_segment_revenue
  FROM `K309.orders` AS o
  JOIN `K309.stores` AS s ON o.store_id = s.store_id
  JOIN `K309.hubs` AS h ON s.hub_id = h.hub_id
  WHERE o.order_status = 'FINISHED' 
    AND EXTRACT(YEAR FROM o.order_moment_created) = 2021
  GROUP BY 1, 2
),
hub_total AS (
  SELECT 
    hub_city, 
    SUM(store_segment_revenue) AS hub_revenue
  FROM segment_stats
  GROUP BY 1
),
ranked_segments AS (
  SELECT 
    ss.*, ht.hub_revenue,
    RANK() OVER (PARTITION BY ss.hub_city ORDER BY ss.store_segment_revenue DESC) AS segment_rank
  FROM segment_stats ss
  JOIN hub_total ht ON ss.hub_city = ht.hub_city
)
SELECT 
  hub_city, store_segment, total_finished_orders, total_stores, store_segment_revenue, hub_revenue,
  ROUND((store_segment_revenue / hub_revenue) * 100, 2) AS revenue_pct_in_hub
FROM ranked_segments
WHERE segment_rank = 1
ORDER BY hub_city;


/*10.So sánh chênh lệch phần trăm doanh số giữa hub xếp hạng hiện tại và hub xếp hạng ngay phía sau đó (next_in_line).Bài toán yêu cầu tính chênh lệch doanh số giữa 2 city_hub có thứ hạng kế tiếp nhau theo chiều doanh thu giảm dần, cụ thể là dựa vào doanh thu thì ta sẽ tính toán được thứ hạng của các hub, sau đó dựa trên thứ hạng này, sẽ tính được hub đạt được nhiều doanh thu nhất lớn hơn doanh thu của hub xếp hạng thứ 2 bao nhiêu, hub  đạt được doanh thu thứ 2 lớn hơn doanh thu của hub xếp hạng thứ 3 bao nhiêu,… tương tự cho các hub  xếp hạng thấp hơn.
Ví dụ : Ta có hub A đạt được doanh số 150tr ~ tương ứng với xếp hạng 1 do mức doanh thu cao nhất
  hub B đạt được doanh số 120tr ~ tương ứng với xếp hạng 2 
  hub C đạt được doanh số 100tr ~ tương ứng với xếp hạng 3,…
Thì out put cần tính sẽ là, ứng với hub A sẽ có total_sales: 150,  doanh thu của hub co thứ hang thấp hơn ngay kế tiếp (B): next_in_line_sales: 120tr, từ đó suy ra được khoảng phần trăm chênh lệch giữa 2 hub là (150tr – 120tr)*100/120tr = 25%. Tương tư , ứng với hub B sẽ có total_sales: 120tr,  doanh thu của hub co thứ hang thấp hơn ngay kế tiếp (C): next_in_line_sales: 100tr, từ đó suy ra được khoảng phần trăm chênh lệch giữa 2 hub là (120tr – 100tr)*100/100tr = 20%.*/
WITH hub_sales AS (
  SELECT h.hub_id, h.hub_city,
    SUM(o.order_amount) AS total_revenue
  FROM `K309.hubs` AS h
  JOIN `K309.stores` AS s ON h.hub_id = s.hub_id
  JOIN `K309.orders` AS o ON s.store_id = o.store_id
  WHERE o.order_status = 'FINISHED'
  GROUP BY 1, 2
),
ranked_hubs AS (
  SELECT *,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
    LEAD(total_revenue) OVER (ORDER BY total_revenue DESC) AS next_in_line_revenue
  FROM hub_sales
)
SELECT *,
  ROUND((total_revenue - next_in_line_revenue) * 100 / next_in_line_revenue, 2) AS revenue_diff_pct
FROM ranked_hubs
WHERE next_in_line_revenue IS NOT NULL;
















