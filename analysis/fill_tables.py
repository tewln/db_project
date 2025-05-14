import psycopg2
from faker import Faker
import random
import os
from dotenv import load_dotenv
import argon2
import re
from datetime import datetime

load_dotenv()

fake = Faker(['ru_RU'])
ph = argon2.PasswordHasher()

def connect_to_db():
    return psycopg2.connect(
        dbname=os.getenv('DB_NAME', 'postgres'),
        user=os.getenv('DB_USER', 'postgres'),
        password=os.getenv('DB_PASSWORD', 'postgres'),
        host=os.getenv('DB_HOST', 'localhost'),
        port=os.getenv('DB_PORT', '5434')
    )

def generate_products(num_products):
    """Генерация товаров"""
    product_types = ['software', 'component', 'peripheral']
    companies = ['AMD', 'Intel', 'NVIDIA', 'Apple', 'Microsoft', 'Logitech', 'Samsung']
    products = []
    for _ in range(num_products):
        product = {
            'product_type': random.choice(product_types),
            'name': fake.word() + ' ' + fake.word(),
            'company': random.choice(companies),
            'price': random.randint(1000, 200000),
            'description': fake.text(max_nb_chars=200)
        }
        products.append(product)
    return products

def generate_warehouses(num_warehouses):
    """Генерация складов"""
    warehouses = []
    for _ in range(num_warehouses):
        start_date = fake.date_between(start_date='-5y', end_date='today')
        warehouse = {
            'name': f"Склад {fake.city()}",
            'region': fake.region(),
            'start_date': start_date,
            'end_date': fake.date_between(start_date=start_date, end_date='+5y') if random.random() < 0.3 else '5999-12-31'
        }
        warehouses.append(warehouse)
    return warehouses

def generate_users(num_users):
    """Генерация пользователей"""
    users = []
    for _ in range(num_users):
        user = {
            'surname': fake.last_name(),
            'firstname': fake.first_name(),
            'lastname': fake.middle_name() if random.random() > 0.7 else None,
            'birth_date': fake.date_between(start_date='-70y', end_date='-18y'),
            'region': fake.region()
        }
        users.append(user)
    return users

def generate_warehouse_inventory(num_entries, num_products, warehouses):
    """Генерация данных для списка товаров на складе"""
    inventory = []
    for _ in range(num_entries):
        warehouses_id = random.randint(1, len(warehouses))
        if (warehouses[warehouses_id - 1]['end_date'] != '5999-12-31'):
            continue
        entry = {
            'warehouse_id': warehouses_id,
            'product_id': random.randint(1, num_products),
            'quantity': random.randint(1, 1000)
        }
        inventory.append(entry)
    return inventory

def generate_deliveries(num_entries, num_products, warehouses):
    """Генерация данных для поставок на склад"""
    deliveries = []
    for _ in range(num_entries):
        warehouse_id = random.randint(1, len(warehouses))
        end_date = warehouses[warehouse_id - 1]['end_date']
        end_date = end_date if end_date != '5999-12-31' else '+3y'
        start_date = warehouses[warehouse_id - 1]['start_date']
        delivery = {
            'product_id': random.randint(1, num_products),
            'warehouse_id': warehouse_id,
            'delivery_date': fake.date_between(start_date=start_date, end_date=end_date),
            'quantity': random.randint(1, 100)
        }
        deliveries.append(delivery)
    return deliveries

def generate_orders(num_orders, num_users):
    """Генерация заказов"""
    orders = []
    used_combinations = set()
    
    while len(orders) < num_orders:
        user_id = random.randint(1, num_users)
        create_date = fake.date_time_between(start_date='-1y', end_date='-12h')
        combination = (user_id, create_date)
        if combination not in used_combinations:
            used_combinations.add(combination)
            order = {
                'user_id': user_id,
                'created_at': create_date,
                'valid_until': fake.date_time_between(start_date=create_date, end_date='+3m'),
                'order_status': random.choice(['selected','collecting', 'underway', 'delivered'])
            }
            orders.append(order)
    return orders

def generate_order_lists(orders_data, num_products):
    """Генерация списков заказов"""
    order_lists = []
    for order in orders_data:
        order_list = {
            'user_id': order['user_id'],
            'created_at': order['created_at'],
            'product_id': random.randint(1, num_products),
            'quantity': random.randint(1, 10)
        }
        order_lists.append(order_list)
    return order_lists

def generate_order_history(orders_data):
    """Генерация истории заказов"""
    order_types = ['selected','collecting', 'underway','delivered', 'recieved', 'rejected', 'returned']
    for order in orders_data:
        if order['order_status'] in ['recieved', 'rejected', 'returned']:
            continue
        order['order_status'] = order_types[order_types.index(order['order_status']) + random.randint(1,2)]

def insert_data(conn):
    with conn.cursor() as cur:
        # Настраиваемые параметры
        NUM_PRODUCTS = 100
        NUM_WAREHOUSES = 25
        NUM_INVENTORY_ENTRIES = 500 # Учитываем, что для каждого склада, запись о товаре может быть только одна
                                    # NUM_INVENTORY_ENTRIES <= NUM_WAREHOUSES * NUM_PRODUCTS
        NUM_DELIVERY_ENTRIES = 400  
        NUM_USERS = 250
        NUM_ORDERS = 500

        products = generate_products(NUM_PRODUCTS)
        for product in products:
            query = """
                INSERT INTO db_project.products (
                                                product_type,
                                                name,
                                                company,
                                                price,
                                                description
                                                )
                     VALUES (%s, %s, %s, %s, %s) 
                  RETURNING id
                """
            cur.execute(
                query,
                (
                product['product_type'],
                product['name'],
                product['company'],
                product['price'],
                product['description']
                )
            )
            product_id = cur.fetchone()[0]

            if product['product_type'] == 'peripheral':
                category = random.choice(['mouse','keyboard','monitor','headset','webcam','microphone','gamepad','speaker','headphones','monitor'])
                connection_type = random.choice(['USB', 'Bluetooth', 'Wi-Fi'])
                query = """
                    INSERT INTO db_project.peripherals (
                                                        product_id,
                                                        category,
                                                        connection_type
                                                        )
                         VALUES (%s, %s, %s)
                    """
                cur.execute(
                    query,
                    (
                        product_id,
                        category,
                        connection_type
                    )
                )

            elif product['product_type'] == 'component':
                query = """
                    INSERT INTO db_project.components (
                                                       product_id,
                                                       vendor,
                                                       category
                                                       )
                         VALUES (%s, %s, %s)
                    """
                cur.execute(
                    query,
                    (
                        product_id,
                        product['company'],
                        fake.word()
                    )
                )

            elif product['product_type'] == 'software':
                query = """
                    INSERT INTO db_project.software (
                                                     product_id,
                                                     license_duration
                                                     )
                         VALUES (%s, %s::INTERVAL)
                    """
                cur.execute(
                    query,
                    (
                        product_id,
                        f"{random.choice([30, 90, 180, 365])} days" if random.random() > 0.3 else None
                    )
                )

        warehouses = generate_warehouses(NUM_WAREHOUSES)
        query = """
                INSERT INTO db_project.warehouses (
                                                   name,
                                                   region,
                                                   start_date,
                                                   end_date
                                                   )
                     VALUES (%s, %s, %s, %s)
                """
        for warehouse in warehouses:
            cur.execute(
                query,
                (
                warehouse['name'],
                warehouse['region'],
                warehouse['start_date'],
                warehouse['end_date']
                )
            )

        users = generate_users(NUM_USERS)
        for u in users:
            query = """
                INSERT INTO db_project.users (
                                              surname,
                                              firstname,
                                              lastname,
                                              birth_date,
                                              region
                                              )
                     VALUES (%s, %s, %s, %s, %s)
                  RETURNING id
                """
            cur.execute(
                query,
                (
                    u['surname'],
                    u['firstname'],
                    u['lastname'],
                    u['birth_date'],
                    u['region']
                )
            )

            user_id = cur.fetchone()[0]
            query = """
                INSERT INTO db_project.users_auth_data (
                                                        user_id,
                                                        login,
                                                        password
                                                        )
                     VALUES (%s, %s, %s)
                """
            cur.execute(
                query,
                (
                    user_id,
                    re.sub(r'[\d|_]+', '', fake.user_name()),
                    ph.hash(random.choice(['password', 'qwerty', '123456', 'letmein', 'abc123']))
                )
            )

            if random.random() > 0.2:
                query = """
                    INSERT INTO db_project.users_contacts (
                                                           user_id,
                                                           phone_number
                                                           )
                         VALUES (%s, %s)
                    """
                cur.execute(
                    query,
                    (
                        user_id,
                        f"+7{random.randint(int(1e10),int(1e11))}"
                    )
                )
        
        conn.commit()
        
        inventory_data = generate_warehouse_inventory(NUM_INVENTORY_ENTRIES, NUM_PRODUCTS, warehouses)
        query = """
                INSERT INTO db_project.warehouse_inventory (
                                                            warehouse_id,
                                                            product_id,
                                                            quantity)
                     VALUES (%s, %s, %s)
                ON CONFLICT DO NOTHING
            """
        for inventory in inventory_data:
            cur.execute(
                query,
                (
                inventory['warehouse_id'],
                inventory['product_id'],
                inventory['quantity']
                )
            )

        delivery_data = generate_deliveries(NUM_DELIVERY_ENTRIES, NUM_PRODUCTS, warehouses)
        query = """
                INSERT INTO db_project.deliveries (
                                                   product_id,
                                                   warehouse_id,
                                                   delivery_date,
                                                   quantity)
                     VALUES (%s, %s, %s, %s)
                ON CONFLICT DO NOTHING
            """
        for delivery in delivery_data:
            cur.execute(
                query,
                (
                delivery['product_id'],
                delivery['warehouse_id'],
                delivery['delivery_date'],
                delivery['quantity']
                )
            )

        orders_data = generate_orders(NUM_ORDERS, NUM_USERS)
        query = """
                INSERT INTO db_project.orders (
                                               user_id,
                                               created_at,
                                               valid_until,
                                               order_status
                                               )
                     VALUES (%s, %s, %s, %s::db_project.ORDER_STATUS)
                ON CONFLICT DO NOTHING
            """
        for order in orders_data:
            cur.execute(
                query,
                (
                order['user_id'],
                order['created_at'],
                order['valid_until'],
                order['order_status']
                )
            )

        order_lists_data = generate_order_lists(orders_data, NUM_PRODUCTS)
        query = """
                INSERT INTO db_project.order_lists (
                                                    user_id,
                                                    created_at,
                                                    product_id,
                                                    quantity
                                                    )
                     VALUES (%s, %s, %s, %s)
            """
        for order_list in order_lists_data:
            cur.execute(
                query,
                (
                order_list['user_id'],
                order_list['created_at'],
                order_list['product_id'],
                order_list['quantity']
                )
            )

        conn.commit()

        generate_order_history(orders_data)
        query = """
                UPDATE db_project.orders
                   SET valid_until = %s,
                       order_status = %s::db_project.ORDER_STATUS
                WHERE user_id = %s
                AND created_at = %s
            """
        for order in orders_data:
            cur.execute(
                query,
                (
                order['valid_until'],
                order['order_status'],
                order['user_id'],
                order['created_at']
                )
            )


def main():
    conn = connect_to_db()
    try:
        print("Загрузка данных началась...")
        begin = datetime.now()
        insert_data(conn)
        print("Данные успешно загружены в базу данных. Время выполнения:", datetime.now() - begin)
    except Exception as e:
        print(e)
    finally:
        conn.close()

if __name__ == "__main__":
    main()