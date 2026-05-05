-- RESET
DROP DATABASE IF EXISTS UserSystem;
CREATE DATABASE UserSystem;
USE UserSystem;

-- =========================
-- TABLE
-- =========================
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    total_orders INT
);

-- =========================
-- DATA (có cả NULL)
-- =========================
INSERT INTO Users (customer_name, total_orders) VALUES
('A', 600),
('B', 300),
('C', 50),
('D', NULL),   -- dữ liệu dị biệt
('E', 100),
('F', 500);

-- =========================
-- GIẢI PHÁP KIẾN TRÚC
-- =========================
-- Dùng CASE WHEN trong SQL để rẽ nhánh logic
-- => tạo cột ảo Xep_Hang ngay trong SELECT

-- =========================
-- XỬ LÝ NULL
-- =========================
-- total_orders NULL sẽ không so sánh được (> , <)
-- => dùng COALESCE(total_orders, 0)
-- => ép NULL về 0 để tránh lỗi và đảm bảo logic

-- =========================
-- QUERY HOÀN CHỈNH
-- =========================
SELECT 
    customer_name AS Ten_Khach_Hang,
    CASE
        WHEN COALESCE(total_orders, 0) > 500 THEN 'Kim Cương'
        WHEN COALESCE(total_orders, 0) BETWEEN 100 AND 500 THEN 'Vàng'
        ELSE 'Bạc'
    END AS Xep_Hang
FROM Users;