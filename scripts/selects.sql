-- Вывод первых $1 самых дорогих товаров
SELECT 
    p.company,
    p.name, 
    p.product_type, 
    p.price,
    CASE 
       WHEN p.product_type = 'peripheral' THEN per.category || ' (' || per.connection_type || ')'
       WHEN p.product_type = 'component' THEN comp.category || ' (' || COALESCE(comp.vendor, 'no vendor') || ')'
       WHEN p.product_type = 'software' THEN 'License: ' || COALESCE(sw.license_duration::text, 'permanent')
    END as details
FROM db_project.products p
LEFT JOIN db_project.peripherals per ON p.id = per.product_id AND p.product_type = 'peripheral'
LEFT JOIN db_project.components comp ON p.id = comp.product_id AND p.product_type = 'component'
LEFT JOIN db_project.software sw ON p.id = sw.product_id AND p.product_type = 'software'
WHERE p.price IS NOT NULL
ORDER BY p.price DESC, p.product_type
LIMIT $1;

--Самые популярные $1 товаров в $2 регионе
WITH regional_sales AS (
    SELECT 
       u.region,
       p.id as product_id,
       p.company,
       p.name,
       p.product_type,
       SUM(ol.quantity) as total_sold,
       RANK() OVER (PARTITION BY u.region ORDER BY SUM(ol.quantity) DESC) as region_rank
    FROM db_project.products p
    JOIN db_project.order_lists ol ON p.id = ol.product_id
    JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
    JOIN db_project.users u ON o.user_id = u.id
    WHERE o.order_status NOT IN ('selected', 'rejected', 'returned')
    GROUP BY u.region, p.id, p.name, p.product_type
)
SELECT 
    region,
    product_id,
	company,
    name,
    product_type,
    total_sold
FROM regional_sales
WHERE region_rank <= $1 AND region = $2
ORDER BY region, total_sold DESC;

--$1 самых продаваемых товаров
SELECT 
    p.id,
    p.company,
    p.name,
    p.product_type,
    SUM(ol.quantity) as total_sold,
    RANK() OVER (ORDER BY SUM(ol.quantity) DESC) as sales_rank
FROM db_project.products p
JOIN db_project.order_lists ol ON p.id = ol.product_id
JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
WHERE o.order_status NOT IN ('selected', 'rejected', 'returned')
GROUP BY p.id
ORDER BY total_sold DESC
LIMIT $1;

--Пользователи, заказывавшие товар $1
SELECT DISTINCT
    u.id, 
    u.surname, 
    u.firstname,
	u.lastname,
    u.region,
    COUNT(DISTINCT ol.created_at) as order_count
FROM db_project.users u
JOIN db_project.order_lists ol ON u.id = ol.user_id
WHERE ol.product_id = $1
GROUP BY u.id
ORDER BY order_count DESC;

--$1 товаров, которых меньше (больше всего на складе)
SELECT 
    p.id,
    p.company,
    p.name, 
    p.product_type,
    SUM(wi.quantity) as total_inventory,
    COUNT(DISTINCT wi.warehouse_id) as warehouse_count
FROM db_project.products p
JOIN db_project.warehouse_inventory wi ON p.id = wi.product_id
GROUP BY p.id
HAVING SUM(wi.quantity) > 0
ORDER BY total_inventory -- DESC
LIMIT $1;

--Остатки на складе в $1 регионе
SELECT 
    p.id, 
    p.name, 
    p.product_type, 
    w.name as warehouse_name,
    wi.quantity
FROM db_project.products p
JOIN db_project.warehouse_inventory wi ON p.id = wi.product_id
JOIN db_project.warehouses w ON wi.warehouse_id = w.id
WHERE w.region = $1
AND wi.quantity > 0
ORDER BY wi.quantity DESC;


--Динамика продажи товаров в $1 месяце
SELECT 
    p.id,
    p.name,
    p.product_type,
    SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE) THEN ol.quantity ELSE 0 END) as current_month,
    SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE - INTERVAL '1 month') THEN ol.quantity ELSE 0 END) as prev_month,
    CASE 
        WHEN SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE - INTERVAL '1 month') THEN ol.quantity ELSE 0 END) = 0 THEN NULL
        ELSE SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE) THEN ol.quantity ELSE 0 END)::float / 
             SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE - INTERVAL '1 month') THEN ol.quantity ELSE 0 END) * 100 - 100
    END as growth_percent
FROM db_project.products p
JOIN db_project.order_lists ol ON p.id = ol.product_id
JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
WHERE o.order_status NOT IN ('selected', 'rejected', 'returned')
AND DATE_TRUNC('month', o.created_at) IN (DATE_TRUNC('month', $1::DATE), DATE_TRUNC('month', $1::DATE - INTERVAL '1 month'))
GROUP BY p.id
HAVING SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE) THEN ol.quantity ELSE 0 END) > 0
ORDER BY growth_percent DESC NULLS LAST
LIMIT 10;

--$1 самых оборотистых товаров
SELECT 
    p.id,
	p.company,
    p.name,
    p.product_type,
    COALESCE(SUM(ol.quantity), 0) as total_sold,
    COALESCE(SUM(d.quantity), 0) as total_delivered,
    COALESCE(SUM(d.quantity), 0) - COALESCE(SUM(ol.quantity), 0) as net_change
FROM db_project.products p
LEFT JOIN db_project.order_lists ol ON p.id = ol.product_id
LEFT JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
    AND o.order_status NOT IN ('selected', 'rejected', 'returned')
LEFT JOIN db_project.deliveries d ON p.id = d.product_id
WHERE DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', CURRENT_DATE)
OR DATE_TRUNC('month', d.delivery_date) = DATE_TRUNC('month', CURRENT_DATE)
GROUP BY p.id
ORDER BY total_sold DESC
LIMIT $1;

--$1 складов с наименьшим количеством товаров
SELECT 
    w.id,
    w.name,
    w.region,
    COUNT(DISTINCT wi.product_id) as product_variety,
    SUM(wi.quantity) as total_inventory,
    RANK() OVER (ORDER BY SUM(wi.quantity)) as inventory_rank
FROM db_project.warehouses w
JOIN db_project.warehouse_inventory wi ON w.id = wi.warehouse_id
GROUP BY w.id
ORDER BY inventory_rank
LIMIT $1;

--Анализ скорости доставки
SELECT 
    EXTRACT(DAY FROM oh.update_date - o.created_at) as days_to_complete,
    COUNT(*) as order_count,
    ROUND(AVG(EXTRACT(DAY FROM oh.update_date - o.created_at)), 2) as avg_days
FROM db_project.orders o
JOIN db_project.orders_history oh ON o.user_id = oh.user_id AND o.created_at = oh.created_at
WHERE oh.order_status = 'delivered'
AND o.order_status = 'delivered'
GROUP BY EXTRACT(DAY FROM oh.update_date - o.created_at)
ORDER BY days_to_complete;