--Товары с полной информацией
CREATE VIEW db_project.full_products_info AS
SELECT  p.id,
        p.name,
        p.company,
        p.price,
        p.product_type,
        CASE 
            WHEN c.product_id IS NOT NULL THEN c.category
            WHEN pr.product_id IS NOT NULL THEN pr.category
            ELSE 'Software'
        END as category,
        COALESCE(c.vendor, p.company) as manufacturer
  FROM  db_project.products p
        LEFT JOIN db_project.components c ON p.id = c.product_id
        LEFT JOIN db_project.peripherals pr ON p.id = pr.product_id;

--Текущие заказы пользователей
CREATE VIEW db_project.current_user_products AS
SELECT  o.id as order_id,
        u.surname,
        u.firstname,
        o.created_at,
        o.delivery_date,
        o.order_status,
        p.name as product_name,
        ol.quantity,
        p.price * ol.quantity as total_price
  FROM  db_project.orders o
        JOIN db_project.users u ON o.user_id = u.id
        JOIN db_project.order_lists ol ON o.id = ol.order_id
        JOIN db_project.products p ON ol.product_id = p.id
 WHERE  o.order_status NOT IN ('delivered', 'rejected', 'returned');

--Корзина заказа пользователя
CREATE VIEW db_project.user_cart AS
SELECT  u.id as user_id,
        u.surname,
        u.firstname,
        o.id as order_id,
        p.name as product_name,
        ol.quantity,
        p.price * ol.quantity as total_price
  FROM  db_project.users u
        JOIN db_project.orders o ON u.id = o.user_id
        JOIN db_project.order_lists ol ON o.id = ol.order_id
        JOIN db_project.products p ON ol.product_id = p.id
 WHERE  o.order_status = 'cart';

 --Активные склады
CREATE VIEW db_project.active_warehouses AS
SELECT id, name, region
FROM db_project.warehouses
WHERE end_date > CURRENT_DATE;

--Складские остатки
CREATE VIEW db_project.warehouse_stock_details AS
SELECT 
    w.name AS warehouse_name,
    w.region,
    p.name AS product_name,
    p.product_type,
    CASE 
        WHEN c.product_id IS NOT NULL THEN c.category
        WHEN pr.product_id IS NOT NULL THEN pr.category
        ELSE 'Software'
    END as product_category,
    wi.quantity AS stock_quantity,
    p.price AS unit_price,
    (p.price * wi.quantity) AS total_value,
    CASE 
        WHEN wi.quantity = 0 THEN 'Out of stock'
        WHEN wi.quantity < 5 THEN 'Low stock'
        WHEN wi.quantity >= 5 THEN 'In stock'
    END AS stock_status
FROM db_project.warehouse_inventories wi
JOIN db_project.warehouses w ON wi.warehouse_id = w.id
JOIN db_project.products p ON wi.product_id = p.id
LEFT JOIN db_project.components c ON p.id = c.product_id
LEFT JOIN db_project.peripherals pr ON p.id = pr.product_id
WHERE w.close_date > CURRENT_DATE;