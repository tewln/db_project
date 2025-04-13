--Вывод всех регионов, в которых работают склады
SELECT DISTINCT region
FROM db_project.warehouses
WHERE end_date = '5999-12-31'
ORDER BY region;

-- Вывод первых $1 самых дорогих товаров
SELECT 
    company,
    name, 
    product_type, 
    price,
    CASE 
       WHEN product_type = 'peripheral' THEN CONCAT(per.category, ' (', per.connection_type, ')')
       WHEN product_type = 'component' THEN CONCAT(comp.category, ' (', COALESCE(comp.vendor, 'no vendor'), ')')
       WHEN product_type = 'software' THEN CONCAT('License: ', COALESCE(sw.license_duration::text, 'permanent'))
    END as details

FROM db_project.products p
LEFT JOIN db_project.peripherals per ON id = per.product_id AND product_type = 'peripheral'
LEFT JOIN db_project.components comp ON id = comp.product_id AND product_type = 'component'
LEFT JOIN db_project.software sw ON id = sw.product_id AND product_type = 'software'
WHERE price IS NOT NULL
ORDER BY price DESC, product_type
LIMIT $1;

--Самые популярные $1 товаров в $2 регионе
WITH regional_sales AS (
    SELECT 
       region,
       p.id as product_id,
       company,
       name,
       product_type,
       SUM(quantity) as total_sold,
       RANK() OVER (PARTITION BY region ORDER BY SUM(quantity) DESC) as region_rank

    FROM db_project.products p
    JOIN db_project.order_lists ol ON p.id = product_id
    JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
    JOIN db_project.users u ON o.user_id = u.id
    WHERE order_status NOT IN ('selected', 'rejected', 'returned')
    GROUP BY region, p.id, name, product_type
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
    id,
    company,
    name,
    product_type,
    SUM(quantity) as total_sold,
    RANK() OVER (ORDER BY SUM(quantity) DESC) as sales_rank

FROM db_project.products p
JOIN db_project.order_lists ol ON id = product_id
JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
WHERE order_status NOT IN ('selected', 'rejected', 'returned')
GROUP BY id
ORDER BY total_sold DESC
LIMIT $1;

--Пользователи, заказывавшие товар $1
SELECT DISTINCT
    id, 
    surname, 
    firstname,
	lastname,
    region,
    COUNT(DISTINCT created_at) as order_count

FROM db_project.users u
JOIN db_project.order_lists ol ON id = user_id
WHERE product_id = $1
GROUP BY id
ORDER BY order_count DESC;

--$1 товаров, которых меньше (больше) всего на складе
SELECT 
    id,
    company,
    name, 
    product_type,
    SUM(quantity) as total_inventory,
    COUNT(DISTINCT warehouse_id) as warehouse_count

FROM db_project.products p
JOIN db_project.warehouse_inventory wi ON id = product_id
GROUP BY id
HAVING SUM(quantity) > 0
ORDER BY total_inventory -- DESC
LIMIT $1;

--Остатки на складе в $1 регионе
SELECT 
    p.id, 
    p.name, 
    product_type, 
    w.name as warehouse_name,
    quantity

FROM db_project.products p
JOIN db_project.warehouse_inventory wi ON p.id = product_id
JOIN db_project.warehouses w ON warehouse_id = w.id
WHERE w.region = $1
AND quantity > 0
ORDER BY quantity DESC;


--Динамика продажи товаров в $1 месяце
SELECT 
    id,
    name,
    product_type,
    SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE) THEN quantity ELSE 0 END) as current_month,
    SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE - INTERVAL '1 month') THEN ol.quantity ELSE 0 END) as prev_month,
    CASE 
        WHEN SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE - INTERVAL '1 month') THEN quantity ELSE 0 END) = 0 THEN NULL
        ELSE SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE) THEN quantity ELSE 0 END)::float / 
             SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE - INTERVAL '1 month') THEN quantity ELSE 0 END) * 100 - 100
    END as growth_percent

FROM db_project.products p
JOIN db_project.order_lists ol ON id = product_id
JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
WHERE o.order_status NOT IN ('selected', 'rejected', 'returned')
AND DATE_TRUNC('month', o.created_at) IN (DATE_TRUNC('month', $1::DATE), DATE_TRUNC('month', $1::DATE - INTERVAL '1 month'))
GROUP BY id
HAVING SUM(CASE WHEN DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', $1::DATE) THEN quantity ELSE 0 END) > 0
ORDER BY growth_percent DESC NULLS LAST
LIMIT 10;

--$1 самых оборотистых товаров (за месяц)
SELECT 
    id,
	company,
    name,
    product_type,
    COALESCE(SUM(ol.quantity), 0) as total_sold,
    COALESCE(SUM(d.quantity), 0) as total_delivered,
    COALESCE(SUM(d.quantity), 0) - COALESCE(SUM(ol.quantity), 0) as net_change

FROM db_project.products p
LEFT JOIN db_project.order_lists ol ON id = ol.product_id
LEFT JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
    AND order_status NOT IN ('selected', 'rejected', 'returned')
LEFT JOIN db_project.deliveries d ON id = d.product_id
WHERE DATE_TRUNC('month', o.created_at) = DATE_TRUNC('month', CURRENT_DATE)
OR DATE_TRUNC('month', delivery_date) = DATE_TRUNC('month', CURRENT_DATE)
GROUP BY id
ORDER BY total_sold DESC
LIMIT $1;

--$1 складов с наименьшим (наибольшим) количеством товаров
SELECT 
    id,
    name,
    region,
    COUNT(DISTINCT product_id) as product_variety,
    SUM(quantity) as total_inventory,
    RANK() OVER (ORDER BY SUM(quantity)) as inventory_rank

FROM db_project.warehouses w
JOIN db_project.warehouse_inventory wi ON id = warehouse_id
GROUP BY id
ORDER BY inventory_rank --DESC
LIMIT $1;

--Анализ скорости доставки
SELECT 
    EXTRACT(DAY FROM update_date - o.created_at) as days_to_complete,
    COUNT(*) as order_count,
    ROUND(AVG(EXTRACT(DAY FROM update_date - o.created_at)), 2) as avg_days

FROM db_project.orders o
JOIN db_project.orders_history oh ON o.user_id = oh.user_id AND o.created_at = oh.created_at
WHERE oh.order_status = 'delivered'
AND o.order_status = 'delivered'
GROUP BY EXTRACT(DAY FROM oh.update_date - o.created_at)
ORDER BY days_to_complete;

--Статистика по $1 самым продаваемым товарам
SELECT 
    id,
    name,
    product_type,
    company,
    price,
    description,
    -- Детали для периферии
    per.category as peripheral_category,
    connection_type,
    -- Детали для компонентов
    vendor as component_vendor,
    comp.category as component_category,
    -- Детали для ПО
    license_duration,
    -- Информация о наличии на складах
    COALESCE(SUM(wi.quantity), 0) as total_inventory,
    COUNT(DISTINCT warehouse_id) as warehouses_count,
    -- Информация о продажах
    COALESCE(SUM(ol.quantity), 0) as total_sold,
    COALESCE(SUM(ol.quantity * price), 0) as total_revenue

FROM db_project.products p
LEFT JOIN db_project.peripherals per ON id = per.product_id AND product_type = 'peripheral'
LEFT JOIN db_project.components comp ON id = comp.product_id AND product_type = 'component'
LEFT JOIN db_project.software sw ON id = sw.product_id AND product_type = 'software'
LEFT JOIN db_project.warehouse_inventory wi ON p.id = wi.product_id
LEFT JOIN db_project.order_lists ol ON id = ol.product_id
LEFT JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
    AND o.order_status NOT IN ('selected', 'rejected', 'returned')
GROUP BY id, per.category, connection_type, vendor, comp.category, license_duration
ORDER BY total_sold DESC
LIMIT $1;

--Статистика по покупателям из $1 региона
SELECT 
    u.id,
    surname,
    firstname,
    lastname,
    birth_date,
    region,
    -- Контактная информация
    ARRAY_AGG(DISTINCT phone_number) as phone_numbers,
    -- Статистика заказов
    COUNT(DISTINCT o.created_at) as total_orders,
    SUM(quantity) as total_items_ordered,
    COALESCE(SUM(quantity * price), 0) as total_spent,
    MIN(o.created_at) as first_order_date,
    MAX(o.created_at) as last_order_date

FROM db_project.users u
LEFT JOIN db_project.users_contacts uc ON u.id = uc.user_id
LEFT JOIN db_project.orders o ON u.id = o.user_id
LEFT JOIN db_project.order_lists ol ON o.user_id = ol.user_id AND o.created_at = ol.created_at
LEFT JOIN db_project.products p ON product_id = p.id
WHERE region  = $1
GROUP BY u.id
ORDER BY u.id;

--Статистика по складам
SELECT 
    w.id,
    w.name,
    w.region,
    start_date,
    end_date,
    -- Статистика по инвентарю
    COUNT(DISTINCT wi.product_id) as unique_products,
    SUM(wi.quantity) as total_items,
    COALESCE(SUM(wi.quantity * price), 0) as inventory_value,
    -- Статистика по поставкам
    COUNT(DISTINCT delivery_date) as delivery_days,
    COALESCE(SUM(d.quantity), 0) as total_delivered,
    -- Статистика по отгрузкам
    (SELECT COUNT(DISTINCT o.created_at) 
     FROM db_project.order_lists ol
     JOIN db_project.orders o ON ol.user_id = o.user_id AND ol.created_at = o.created_at
     JOIN db_project.users u ON o.user_id = u.id
     WHERE u.region = w.region
     AND o.order_status NOT IN ('selected', 'rejected', 'returned')) as regional_orders_count
FROM db_project.warehouses w
LEFT JOIN db_project.warehouse_inventory wi ON w.id = wi.warehouse_id
LEFT JOIN db_project.products p ON wi.product_id = p.id
LEFT JOIN db_project.deliveries d ON w.id = d.warehouse_id AND p.id = d.product_id
GROUP BY w.id
ORDER BY regional_orders_count DESC;