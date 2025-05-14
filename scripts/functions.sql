-- Функция для подсчета общей стоимости заказа
CREATE OR REPLACE FUNCTION db_project.calculate_order_total(
    p_user_id INTEGER,
    p_created_at TIMESTAMP
) RETURNS DECIMAL AS $$
DECLARE
    total_sum DECIMAL;
BEGIN
    SELECT COALESCE(SUM(p.price * ol.quantity), 0)
    INTO total_sum
    FROM db_project.order_lists ol
    JOIN db_project.products p ON ol.product_id = p.id
    WHERE ol.user_id = p_user_id 
    AND ol.created_at = p_created_at;
    
    RETURN total_sum;
END;
$$ LANGUAGE plpgsql;

-- Процедура для создания нового заказа
CREATE OR REPLACE PROCEDURE db_project.create_new_order(
    p_user_id INTEGER,
    p_product_id INTEGER,
    p_quantity INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_timestamp TIMESTAMP;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM db_project.users WHERE id = p_user_id) THEN
        RAISE EXCEPTION 'Пользователь с ID % не найден', p_user_id;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM db_project.products WHERE id = p_product_id) THEN
        RAISE EXCEPTION 'Товар с ID % не найден', p_product_id;
    END IF;
    v_timestamp := CURRENT_TIMESTAMP;
    INSERT INTO db_project.orders (user_id, created_at, order_status)
         VALUES (p_user_id, v_timestamp, 'selected');
    INSERT INTO db_project.order_lists (user_id, created_at, product_id, quantity)
         VALUES (p_user_id, v_timestamp, p_product_id, p_quantity);

    COMMIT;
END;
$$;

-- Функция для проверки наличия товара на складах в регионе
CREATE OR REPLACE FUNCTION db_project.check_product_availability(
    p_product_id INTEGER,
    p_region VARCHAR,
    p_quantity INTEGER
) RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1
        FROM db_project.warehouse_inventory wi
        JOIN db_project.warehouses w ON wi.warehouse_id = w.id
        WHERE wi.product_id = p_product_id
        AND w.region = p_region
        AND wi.quantity >= p_quantity
        AND w.end_date > CURRENT_DATE
    );
END;
$$ LANGUAGE plpgsql;

-- Процедура для обработки поставок
-- Эта процедура будет вызываться периодически для обновления остатков на складах
CREATE OR REPLACE PROCEDURE db_project.process_pending_deliveries()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE db_project.deliveries 
    SET delivery_date = delivery_date
    WHERE delivery_date = CURRENT_DATE
    AND EXISTS (
        SELECT 1 
        FROM db_project.warehouses w 
        WHERE w.id = warehouse_id
        AND w.start_date <= CURRENT_DATE
        AND w.end_date > CURRENT_DATE
    );
END;
$$;