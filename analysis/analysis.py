import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os
from dotenv import load_dotenv

load_dotenv()

def get_conn():
    return psycopg2.connect(
        dbname=os.getenv('DB_NAME', 'postgres'),
        user=os.getenv('DB_USER', 'postgres'),
        password=os.getenv('DB_PASSWORD', 'postgres'),
        host=os.getenv('DB_HOST', 'localhost'),
        port=os.getenv('DB_PORT', '5434')
    )

print('Программа запущена.')

# Загрузка данных
with get_conn() as conn:
    print('Идёт считывание из базы данных.')
    # Заказы с регионами и ценой
    orders = pd.read_sql("""
        SELECT o.user_id, o.created_at, o.order_status, u.region, ol.product_id, ol.quantity, p.price
        FROM db_project.orders o
        JOIN db_project.users u ON o.user_id = u.id
        JOIN db_project.order_lists ol ON o.user_id = ol.user_id AND o.created_at = ol.created_at
        JOIN db_project.products p ON ol.product_id = p.id
    """, conn)

print('Считывание завершено.')

# График 1: Количество заказов по регионам
region_counts = orders.groupby('region')['user_id'].count()
plt.figure(figsize=(10,5))
sns.barplot(x=region_counts.index, y=region_counts.values)
plt.title('Число заказов по регионам')
plt.ylabel('Число заказов')
plt.xlabel('Регион')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show(block=False)

# График 2: Динамика количества заказов по времени
orders['date'] = pd.to_datetime(orders['created_at']).dt.date
daily_orders = orders.groupby('date').size()
plt.figure(figsize=(10,5))
sns.lineplot(data=daily_orders, marker='o')
plt.title('Количество заказов по дням')
plt.ylabel('Количество заказов')
plt.xlabel('Дата')
plt.grid(True)
plt.xticks(rotation=45)
plt.tight_layout()
plt.show(block=False)

# График 3: Средняя стоимость заказа по регионам
orders['total'] = orders['price'] * orders['quantity']
region_avg = orders.groupby('region')['total'].mean()
plt.figure(figsize=(10,5))
sns.barplot(x=region_avg.index, y=region_avg.values)
plt.title('Средняя стоимость заказа по регионам')
plt.ylabel('Средняя стоимость заказа')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show(block=False)

# Гипотезы
print('Гипотеза 1: Количество заказов не зависит от региона.')
print('Гипотеза 2: С течением времени число заказов растёт.')
print("""Гипотеза 3: Существуют регионы, средний чек в которых
         сильно больше усреднённого по стране.""")

# Проверка гипотез
# Гипотеза 1: Проверим дисперсию числа заказчиков по регионам
print('\nПроверка гипотезы 1:')
print(region_counts.describe())
print('\nВывод:')
if ((region_counts.describe()['max'] - region_counts.describe()['min']) / region_counts.describe()['std'] > 3):
    print('Есть регионы с заметно большим числом заказов (см. график 1 и describe).')
    print('Следовательно, гипотеза 1 не подтверждается.')
else:
    print('Нет регионов с заметно большим числом заказов (см. график 1 и describe).')
    print('Следовательно, гипотеза 1 подтверждается.')

# Гипотеза 2: Корреляция между датой и числом заказов
print('\nПроверка гипотезы 2:')
daily_orders_df = pd.DataFrame(daily_orders).reset_index()
correlation = daily_orders_df[0].corr(pd.Series(daily_orders_df.index))
print(f"Корреляция между временем и количеством заказов: {correlation:.3f}")
print('\nВывод:')
if correlation > 0.5:
    print('Наблюдается сильная положительная корреляция (r > 0.5).')
    print('Число заказов значительно растет со временем.')
    print('Следовательно, гипотеза 2 подтверждается.')
elif correlation > 0.3:
    print('Наблюдается умеренная положительная корреляция (0.3 < r < 0.5).')
    print('Число заказов умеренно растет со временем.')
    print('Следовательно, гипотеза 2 частично подтверждается.')
elif correlation > -0.3:
    print('Значимой корреляции не наблюдается (-0.3 < r < 0.3).')
    print('Число заказов не показывает устойчивой тенденции роста.')
    print('Следовательно, гипотеза 2 не подтверждается.')
else:
    print('Наблюдается отрицательная корреляция (r < -0.3).')
    print('Число заказов снижается со временем.')
    print('Следовательно, гипотеза 2 не подтверждается.')

# Гипотеза 3: Проверим разброс среднего чека по регионам
print('\nПроверка гипотезы 3:')
print(region_avg.describe())
print('\nВывод:')
if (region_avg.describe()['max'] / region_avg.describe()['mean']) > 2:
    print('Есть регионы с заметно большим средним чеком (см. график 3 и describe).')
    print('Следовательно, гипотеза 3 не подтверждается.')
else:
    print('Нет регионов с заметно большим средним чеком (см. график 3 и describe).')
    print('Следовательно, гипотеза 3 подтверждается.')

plt.show(block=True)