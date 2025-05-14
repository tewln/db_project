-- DROP SCHEMA IF EXISTS db_project ;

DROP TABLE IF EXISTS db_project.order_lists_history CASCADE;
DROP TABLE IF EXISTS db_project.orders_history CASCADE;
DROP TABLE IF EXISTS db_project.order_lists CASCADE;
DROP TABLE IF EXISTS db_project.orders CASCADE;
DROP TYPE IF EXISTS db_project.ORDER_STATUS CASCADE;
DROP TABLE IF EXISTS db_project.users_contacts CASCADE;
DROP TABLE IF EXISTS db_project.users_auth_data CASCADE;
DROP TABLE IF EXISTS db_project.users CASCADE;
DROP TABLE IF EXISTS db_project.deliveries CASCADE;
DROP TABLE IF EXISTS db_project.warehouse_inventory CASCADE;
DROP TABLE IF EXISTS db_project.warehouses CASCADE;
DROP TABLE IF EXISTS db_project.peripherals CASCADE;
DROP TABLE IF EXISTS db_project.software CASCADE;
DROP TABLE IF EXISTS db_project.components CASCADE;
DROP TABLE IF EXISTS db_project.products CASCADE;

CREATE SCHEMA IF NOT EXISTS db_project;

CREATE TABLE IF NOT EXISTS db_project.products
(
    id SERIAL,
    product_type VARCHAR(50) NOT NULL,
    name VARCHAR(300) NOT NULL,
    company VARCHAR(255) NOT NULL,
    price INTEGER,
    description VARCHAR(500),
    
    CONSTRAINT products_pkey PRIMARY KEY (id),
    CONSTRAINT products_product_type_check CHECK
        (product_type IN ('software', 'component', 'peripheral')),
    CONSTRAINT products_name_not_empty CHECK (name != ''),
    CONSTRAINT products_company_not_empty CHECK (company != ''),
    CONSTRAINT products_price_not_zero CHECK (price > 0)
);

CREATE TABLE IF NOT EXISTS db_project.peripherals
(
    product_id INTEGER NOT NULL,
    category VARCHAR(100) NOT NULL,
    connection_type VARCHAR(100) NOT NULL,

    CONSTRAINT peripheral_pkey PRIMARY KEY (product_id),
    CONSTRAINT peripherals_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id),
    CONSTRAINT peripherals_category_not_empty CHECK (category != ''),
    CONSTRAINT peripherals_connection_type_not_empty CHECK (connection_type != '')
);

CREATE TABLE IF NOT EXISTS db_project.components
(
    product_id INTEGER NOT NULL,
    vendor VARCHAR(255),
    category VARCHAR(100) NOT NULL,

    CONSTRAINT components_pkey PRIMARY KEY (product_id),
    CONSTRAINT components_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id),
    CONSTRAINT components_category_not_empty CHECK (category != '')
);

CREATE TABLE IF NOT EXISTS db_project.software
(
    product_id INTEGER NOT NULL,
    license_duration INTERVAL,

    CONSTRAINT software_pkey PRIMARY KEY (product_id),
    CONSTRAINT software_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id)
);


CREATE TABLE IF NOT EXISTS db_project.warehouses
(
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL DEFAULT '5999-12-31',

    CONSTRAINT warehouses_pkey PRIMARY KEY (id),
    CONSTRAINT warehouses_region_not_empty CHECK (region != ''),
    CONSTRAINT warehouses_workdate_isvalid CHECK
        (end_date > start_date)
);


CREATE TABLE IF NOT EXISTS db_project.warehouse_inventory
(
    warehouse_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,

    CONSTRAINT warehouse_inventory_pkey PRIMARY KEY (warehouse_id, product_id),
    CONSTRAINT warehouse_inventory_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id),
    CONSTRAINT warehouse_inventory_warehouse_id_fkey FOREIGN KEY (warehouse_id)
        REFERENCES db_project.warehouses (id),
    CONSTRAINT warehouse_inventory_quantity_check CHECK (quantity > 0)
);

CREATE TABLE IF NOT EXISTS db_project.deliveries
(
    product_id INTEGER NOT NULL,
    warehouse_id INTEGER NOT NULL,
    delivery_date DATE NOT NULL,
    quantity INTEGER NOT NULL,

    CONSTRAINT deliveries_pkey PRIMARY KEY (product_id, warehouse_id, delivery_date),
    CONSTRAINT deliveries_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id),
    CONSTRAINT deliveries_warehouse_id_fkey FOREIGN KEY (warehouse_id)
        REFERENCES db_project.warehouses (id)
);

CREATE TABLE IF NOT EXISTS db_project.users
(
    id SERIAL,
    surname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255),
    birth_date date NOT NULL,
    region VARCHAR(100) NOT NULL,

    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_name_isvalid CHECK (surname ~ '^[а-яА-ЯёЁa-zA-Z]+$' AND firstname ~ '^[а-яА-ЯёЁa-zA-Z]+$' AND (lastname ~ '^[а-яА-ЯёЁa-zA-Z]+$' OR lastname IS NULL)),
    CONSTRAINT users_region_not_empty CHECK (region != '')
);

CREATE TABLE IF NOT EXISTS db_project.users_contacts
(
    user_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,

    CONSTRAINT users_contacts_pkey PRIMARY KEY (user_id, phone_number),
    CONSTRAINT users_contacts_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES db_project.users (id),
    CONSTRAINT users_phone_is_valid CHECK (phone_number ~ '^\+[0-9]+$')
);

CREATE TABLE IF NOT EXISTS db_project.users_auth_data
(
    user_id INT,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,

    CONSTRAINT users_auth_data_pkey PRIMARY KEY (user_id),
    CONSTRAINT users_auth_data_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES db_project.users (id),
    CONSTRAINT users_auth_data_login_is_valid CHECK (login ~ '^[a-zA-Z@.]+$'),
    CONSTRAINT users_auth_data_password_is_valid CHECK ((password != '') AND
        ((password ~ '^[0-9a-zA-Z!#$%&?]+$') OR (password ~ '^\$argon2')))
);

CREATE TYPE db_project.ORDER_STATUS AS ENUM ('selected','collecting', 'underway', 'delivered', 'recieved', 'rejected', 'returned');

CREATE TABLE IF NOT EXISTS db_project.orders
(
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    valid_until TIMESTAMP DEFAULT '5999-12-31 23:59:59',
    order_status db_project.ORDER_STATUS DEFAULT 'selected' NOT NULL,

    CONSTRAINT orders_pkey PRIMARY KEY (user_id, created_at),
    CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES db_project.users (id),
    CONSTRAINT orders_workdate_is_valid CHECK
        (valid_until > created_at AND created_at <= CURRENT_TIMESTAMP)
);

CREATE TABLE IF NOT EXISTS db_project.orders_history
(
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    valid_until TIMESTAMP DEFAULT '5999-12-31 23:59:59',
    order_status db_project.ORDER_STATUS DEFAULT 'selected' NOT NULL,
    update_date TIMESTAMP NOT NULL,

    CONSTRAINT orders_history_pkey PRIMARY KEY (user_id, created_at, update_date),
    CONSTRAINT orders_history_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES db_project.users (id),
    CONSTRAINT orders_history_workdate_isvalid CHECK
        (valid_until > created_at AND created_at <= CURRENT_TIMESTAMP)
);

CREATE TABLE IF NOT EXISTS db_project.order_lists
(
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,

    CONSTRAINT order_lists_pkey PRIMARY KEY (user_id, created_at, product_id),
    CONSTRAINT order_lists_user_id_created_at_fkey FOREIGN KEY (user_id, created_at)
        REFERENCES db_project.orders (user_id, created_at)
        ON DELETE CASCADE,
    CONSTRAINT order_lists_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id),
    CONSTRAINT order_lists_quantity_is_positive CHECK (quantity > 0)
);

CREATE TABLE IF NOT EXISTS db_project.order_lists_history
(
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    update_date TIMESTAMP NOT NULL,

    CONSTRAINT order_lists_history_pkey PRIMARY KEY (user_id, created_at, product_id, update_date),
    CONSTRAINT order_lists_history_user_id_created_at_fkey FOREIGN KEY (user_id, created_at)
        REFERENCES db_project.orders (user_id, created_at),
    CONSTRAINT order_lists_history_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES db_project.products (id),
    CONSTRAINT order_lists_history_quantity_is_positive CHECK (quantity > 0)
);

-- Индексы
CREATE INDEX idx_products_product_type ON db_project.products (product_type);
CREATE INDEX idx_warehouse_inventory_warehouse_product ON db_project.warehouse_inventory (warehouse_id, product_id);
CREATE INDEX idx_warehouses_region ON db_project.warehouses (region);

-- Триггеры
-- Обновление истории заказов
CREATE OR REPLACE FUNCTION db_project.order_status_update_trigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO db_project.orders_history (
        user_id,
        created_at,
        valid_until,
        order_status,
        update_date
    ) VALUES (
        OLD.user_id,
        OLD.created_at,
        OLD.valid_until,
        OLD.order_status,
        CURRENT_TIMESTAMP
    );

    INSERT INTO db_project.order_lists_history (
        user_id,
        created_at,
        product_id,
        quantity,
        update_date
    )
    SELECT 
        ol.user_id,
        ol.created_at,
        ol.product_id,
        ol.quantity,
        CURRENT_TIMESTAMP
    FROM db_project.order_lists ol
    WHERE ol.user_id = OLD.user_id
    AND ol.created_at = OLD.created_at;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Создание триггера
CREATE TRIGGER order_status_update
BEFORE UPDATE OF order_status ON db_project.orders
FOR EACH ROW
EXECUTE FUNCTION db_project.order_status_update_trigger();


-- Списаение товара со склада
CREATE OR REPLACE FUNCTION db_project.update_warehouse_inventory()
RETURNS TRIGGER AS $$
DECLARE
    order_item RECORD;
BEGIN
    IF OLD.order_status = 'selected' AND NEW.order_status = 'collecting' THEN
        FOR order_item IN
            SELECT ol.product_id, ol.quantity
            FROM db_project.order_lists ol
            WHERE ol.user_id = NEW.user_id 
            AND ol.created_at = NEW.created_at
        LOOP
            UPDATE db_project.warehouse_inventory wi
            SET quantity = quantity - order_item.quantity
            WHERE wi.warehouse_id = (
                SELECT w.id 
                FROM db_project.warehouses w
                JOIN db_project.users u ON w.region = u.region
                WHERE u.id = NEW.user_id
                AND EXISTS (
                    SELECT 1 
                    FROM db_project.warehouse_inventory wi2
                    WHERE wi2.warehouse_id = w.id
                    AND wi2.product_id = order_item.product_id
                    AND wi2.quantity >= order_item.quantity
                )
                LIMIT 1
            )
            AND wi.product_id = order_item.product_id;

            IF NOT FOUND THEN
                RETURN OLD;
            END IF;
        END LOOP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Создание триггера
CREATE TRIGGER update_warehouse_inventory
AFTER UPDATE OF order_status ON db_project.orders
FOR EACH ROW
EXECUTE FUNCTION db_project.update_warehouse_inventory();

-- Функция для автоматического обновления warehouse_inventory при поставке
CREATE OR REPLACE FUNCTION db_project.update_inventory_on_delivery()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.delivery_date = CURRENT_DATE THEN
        IF EXISTS (
            SELECT 1 FROM db_project.warehouses w
            WHERE w.id = NEW.warehouse_id
            AND w.start_date <= NEW.delivery_date
            AND w.end_date > NEW.delivery_date
        ) THEN
            INSERT INTO db_project.warehouse_inventory 
                (warehouse_id, product_id, quantity)
            VALUES 
                (NEW.warehouse_id, NEW.product_id, NEW.quantity)
            ON CONFLICT (warehouse_id, product_id) DO UPDATE 
            SET quantity = warehouse_inventory.quantity + EXCLUDED.quantity;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Создание триггера
CREATE TRIGGER trg_update_inventory_on_delivery
AFTER INSERT OR UPDATE ON db_project.deliveries
FOR EACH ROW
EXECUTE FUNCTION db_project.update_inventory_on_delivery();