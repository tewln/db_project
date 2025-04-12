--Первый запрос
INSERT INTO db_project.products (product_type, name, company, price, description) VALUES
('peripheral', 'MX Master 3', 'Logitech', 9999, 'Беспроводная мышь с эргономичным дизайном'),
('peripheral', 'BlackWidow Elite', 'Razer', 14999, 'Механическая клавиатура с RGB-подсветкой'),
('peripheral', 'Odyssey G7', 'Samsung', 34999, 'Игровой монитор 27" 240Hz'),
('component', 'Core i9-13900K', 'Intel', 49999, 'Процессор 24 ядра, 5.8 GHz'),
('component', 'GeForce RTX 4090 GameRock', 'Palit', 159999, 'Видеокарта 24GB GDDR6X'),
('component', 'Fury 32GB DDR5', 'Kingston', 12999, 'Оперативная память 32GB 5600MHz'),
('software', 'Windows 11 Pro', 'Microsoft', 14999, 'Лицензия ОС Windows 11 Pro'),
('software', 'Photoshop 2024', 'Adobe', 8999, 'Годовая подписка на Photoshop'),
('peripheral', 'Cloud II', 'HyperX', 7999, 'Игровая гарнитура с виртуальным 7.1 звуком'),
('component', '980 Pro 1TB', 'Samsung', 8999, 'NVMe SSD 1TB 7000MB/s'),
('software', 'AutoCAD 2024', 'Autodesk', 19999, 'Лицензия на 1 год'),
('peripheral', 'Magic Keyboard', 'Apple', 10999, 'Беспроводная клавиатура для Mac'),
('component', 'ROG Strix Z790-E', 'ASUS', 29999, 'Материнская плата LGA 1700'),
('software', '360 Deluxe', 'Norton', 4999, 'Антивирус на 1 год'),
('peripheral', 'Rival 600', 'SteelSeries', 8999, 'Игровая мышь с двойным сенсором'),
('peripheral', 'C920 HD Pro', 'Logitech', 6999, 'Веб-камера Full HD'),
('peripheral', 'Blue Yeti Nano', 'Blue Microphones', 8999, 'USB-микрофон для стриминга'),
('peripheral', 'Xbox Wireless Controller', 'Microsoft', 5999, 'Беспроводной геймпад'),
('peripheral', 'Intuos Pro', 'Wacom', 19999, 'Графический планшет'),
('peripheral', 'Flip 6', 'JBL', 8999, 'Портативная Bluetooth-колонка'),
('peripheral', 'WD19TB', 'Dell', 29999, 'Док-станция Thunderbolt'),
('peripheral', 'Oculus Quest 2', 'Meta', 34999, 'VR-гарнитура 128GB'),
('peripheral', 'Magic Trackpad', 'Apple', 12999, 'Беспроводной трекпад'),
('peripheral', 'DS2208', 'Zebra', 14999, 'Сканер штрих-кодов'),
('component', 'Ryzen 9 7950X', 'AMD', 54999, 'Процессор 16 ядер, 5.7GHz'),
('component', 'RM850x', 'Corsair', 12999, 'Блок питания 850W 80+ Gold'),
('component', 'IronWolf 4TB', 'Seagate', 8999, 'Жесткий диск NAS'),
('component', 'RTX 4080', 'Gigabyte', 119999, 'Видеокарта 16GB GDDR6X'),
('component', 'MPG B550', 'MSI', 15999, 'Материнская плата AM4'),
('component', 'NH-D15', 'Noctua', 8999, 'Кулер для процессора'),
('component', 'Core P3', 'Thermaltake', 14999, 'Корпус для ПК'),
('component', 'SuperNOVA 1000', 'EVGA', 17999, 'Блок питания 1000W'),
('component', 'Black SN850X', 'Western Digital', 12999, 'NVMe SSD 1TB'),
('component', 'Trident Z5', 'G.Skill', 15999, 'RAM 32GB DDR5 6000MHz'),
('software', 'Office 2021', 'Microsoft', 14999, 'Офисный пакет'),
('software', 'Premium Security', 'Avast', 3999, 'Антивирус на 6 месяцев'),
('software', 'Final Cut Pro', 'Apple', 29999, 'Видеоредактор для Mac'),
('software', 'MATLAB', 'MathWorks', 59999, 'Лицензия на 1 год'),
('software', 'NOD32', 'ESET', 6999, 'Антивирус на 2 года'),
('software', 'Logic Pro X', 'Apple', 19999, 'Аудиоредактор'),
('software', 'CorelDRAW Graphics', 'Corel', 12999, 'Подписка на 3 месяца'),
('software', '1Password', '1Password', 3599, 'Менеджер паролей'),
('software', 'DaVinci Resolve', 'Blackmagic', 15999, 'Видеоредактор Studio'),
('software', 'Pro Tools', 'Avid', 24999, 'Аудиостудия'),
('software', 'ZBrush', 'Pixologic', 8999, '3D-скульптинг'),
('peripheral', 'Q3 Mechanical Keyboard', 'Keychron', 12999, 'Механическая клавиатура с алюминиевой рамкой'),
('peripheral', 'Stream Deck XL', 'Elgato', 15999, 'Панель макрокнопок для стримеров'),
('peripheral', 'PowerConf S3 Speakerphone', 'Anker', 8999, 'Конференц-динамик с шумоподавлением'),
('peripheral', 'EcoTank ET-2850', 'Epson', 22999, 'Струйный принтер с СНПЧ'),
('peripheral', 'ScanSnap iX1600', 'Fujitsu', 34999, 'Документ-сканер с автоподатчиком'),
('peripheral', 'HERO11 Black', 'GoPro', 37999, 'Экшн-камера 5.3K'),
('peripheral', 'MV7 USB Microphone', 'Shure', 15999, 'Гибридный USB/XLR микрофон'),
('peripheral', 'FP-30X Digital Piano', 'Roland', 59999, 'Цифровое пианино с молоточковой механикой'),
('peripheral', 'UltraFine 5K Display', 'LG', 99999, 'Монитор 5K для Mac'),
('peripheral', 'Expert Mouse', 'Kensington', 7999, 'Трекбол для профессионалов'),
('peripheral', 'Thunderbolt 4 Hub', 'OWC', 17999, 'Хаб с 3 портами Thunderbolt 4'),
('peripheral', 'Agon AG493UCX', 'AOC', 69999, 'Суперширокий игровой монитор 49"'),
('peripheral', 'Kiyo Pro Ultra', 'Razer', 24999, 'Веб-камера 4K с HDR'),
('peripheral', 'WH-1000XM5', 'Sony', 29999, 'Беспроводные наушники с шумоподавлением'),
('peripheral', 'Pen Tablet Medium', 'Xencelabs', 24999, 'Графический планшет для дизайнеров'),
('peripheral', 'XL2566K Monitor', 'BenQ', 49999, '360Hz монитор для киберспорта'),
('component', 'Threadripper PRO 5995WX', 'AMD', 349999, 'Процессор 64 ядра для рабочих станций'),
('component', 'ProArt Z790 Creator', 'ASUS', 34999, 'Материнская плата для творческих профессий'),
('component', 'T700 2TB Gen5 NVMe', 'Crucial', 24999, 'Самый быстрый SSD PCIe 5.0'),
('component', 'PC-O11 Dynamic XL', 'Lian Li', 17999, 'Премиальный корпус для сборок'),
('component', ' Dark Power 13 1000W', 'Be Quiet!', 19999, 'Тихий блок питания 80+ Titanium'),
('component', 'Liquid Freezer II 420', 'Arctic', 8999, 'Система жидкостного охлаждения'),
('component', 'AORUS Gen5 10000', 'Gigabyte', 29999, 'SSD 2TB с радиатором'),
('component', 'Dominator Platinum RGB', 'Corsair', 21999, 'RAM 64GB DDR5 6200MHz'),
('component', 'Rack GPU Server', 'ASRock', 149999, 'Серверная плата для майнинга'),
('component', 'Technology RM51', 'SilverStone', 24999, 'Серверный корпус 5U'),
('component', 'EK-Quantum Reflection PC-O11D', 'EKWB', 15999, 'Водоблок для кастомных СЖО'),
('component', 'Torrent RGB', 'Fractal Design', 15999, 'Корпус с уникальной системой охлаждения'),
('component', 'ToughRAM RGB', 'Thermaltake', 12999, 'Оперативная память с температурным датчиком'),
('component', 'Glacier One 420MP', 'Phanteks', 11999, 'СЖО с LCD-дисплеем'),
('component', 'PRIME TX-1600W', 'Seasonic', 34999, 'Блок питания 1600W 80+ Titanium'),
('component', 'MEG Z790 Ace', 'MSI', 39999, 'Флагманская материнская плата'),
('software', 'Fusion Studio', 'Blackmagic', 29999, 'Программа для композитинга'),
('software', 'Live 11 Suite', 'Ableton', 59999, 'Цифровая звуковая рабочая станция'),
('software', 'Red Giant Trapcode Suite', 'Maxon', 19999, 'Набор плагинов для After Effects'),
('software', 'Substance 3D Painter', 'Adobe', 21999, '3D-текстурирование в реальном времени'),
('software', 'Houdini FX', 'SideFX', 249999, 'Продвинутый 3D-редактор для VFX'),
('software', 'Workstation Pro', 'VMware', 14999, 'Виртуализация рабочих станций'),
('software', 'FL Studio Producer Edition', 'Image-Line', 19999, 'Музыкальная студия'),
('software', 'Cinema 4D Studio', 'Maxon', 349999, 'Профессиональный 3D-редактор'),
('software', 'iClone Pro', 'Reallusion', 99999, 'Редактор для 3D-анимации'),
('software', 'OctaneRender Studio+', 'OTOY', 17999, 'Рендер-движок для 3D'),
('software', 'Complete Bundle', 'Waves', 49999, 'Коллекция аудиоплагинов');

--Второй запрос
INSERT INTO db_project.peripherals (product_id, category, connection_type) VALUES
(1, 'mouse', 'wireless (USB)'),
(2, 'keyboard', 'wired (USB)'),
(3, 'monitor', 'DisplayPort'),
(9, 'headset', 'wired (3.5mm)'),
(12, 'keyboard', 'wireless (BT)'),
(15, 'mouse', 'wired (USB)'),
(16, 'webcam', 'USB'),
(17, 'microphone', 'USB'),
(18, 'gamepad', 'wireless (BT)'),
(19, 'drawing tablet', 'USB'),
(20, 'speaker', 'Bluetooth'),
(21, 'docking station', 'USB-C'),
(22, 'VR headset', 'HDMI/USB'),
(23, 'trackpad', 'Bluetooth'),
(24, 'barcode scanner', 'USB'),
(46, 'keyboard', 'wired (USB-C)'),
(47, 'control panel', 'USB'),
(48, 'conference system', 'USB/Bluetooth'),
(49, 'printer', 'USB/Wi-Fi'),
(50, 'scanner', 'USB'),
(51, 'action camera', 'USB-C'),
(52, 'microphone', 'USB/XLR'),
(53, 'digital piano', 'USB/MIDI'),
(54, 'monitor', 'Thunderbolt'),
(55, 'trackball', 'USB'),
(56, 'hub', 'Thunderbolt 4'),
(57, 'monitor', 'DisplayPort/HDMI'),
(58, 'webcam', 'USB'),
(59, 'headphones', 'Bluetooth'),
(60, 'drawing tablet', 'USB'),
(61, 'monitor', 'DisplayPort');

INSERT INTO db_project.components (product_id, vendor, category) VALUES
(4, 'Intel', 'CPU'),
(5, 'NVIDIA', 'GPU'),
(6, 'Kingston', 'RAM'),
(10, 'Samsung', 'SSD'),
(13, 'ASUS', 'Motherboard'),
(25, 'AMD', 'CPU'),
(26, 'Corsair', 'PSU'),
(27, 'Seagate', 'HDD'),
(28, 'NVIDIA', 'GPU'),
(29, 'MSI', 'Motherboard'),
(30, 'Noctua', 'Cooler'),
(31, 'Thermaltake', 'Case'),
(32, 'EVGA', 'PSU'),
(33, 'Western Digital', 'SSD'),
(34, 'G.Skill', 'RAM'),
(62, 'AMD', 'Workstation CPU'),
(63, 'ASUS', 'Motherboard'),
(64, 'Crucial', 'SSD'),
(65, 'Lian Li', 'Case'),
(66, 'Be Quiet!', 'PSU'),
(67, 'Arctic', 'Cooling'),
(68, 'Gigabyte', 'SSD'),
(69, 'Corsair', 'RAM'),
(70, 'ASRock', 'Server Board'),
(71, 'SilverStone', 'Server Case'),
(72, 'EKWB', 'Water Block'),
(73, 'Fractal Design', 'Case'),
(74, 'Thermaltake', 'RAM'),
(75, 'Phanteks', 'Cooling'),
(76, 'Seasonic', 'PSU'),
(77, 'MSI', 'Motherboard');

INSERT INTO db_project.software (product_id, license_duration) VALUES
(7, NULL), -- perpetual
(8, '365 days'),
(11, '365 days'),
(14, '365 days'),
(35, '30 days'),
(36, '180 days'),
(37, NULL), -- perpetual
(38, '365 days'),
(39, '730 days'),
(40, NULL), -- perpetual
(41, '90 days'),
(42, '365 days'),
(43, '180 days'),
(44, NULL), -- perpetual
(45, '30 days'),
(78, NULL), -- perpetual
(79, '365 days'),
(80, '365 days'),
(81, '365 days'),
(82, '365 days'),
(83, '365 days'),
(84, NULL), -- perpetual
(85, '365 days'),
(86, '365 days'),
(87, '365 days'),
(88, '365 days');



INSERT INTO db_project.warehouses (id, name, region, start_date, end_date) VALUES
(1, 'Московский центральный склад', 'Москва', '2020-01-15', '5999-12-31'),
(2, 'Санкт-Петербург Северный', 'Санкт-Петербург', '2021-05-20', '5999-12-31'),
(3, 'Новосибирск Логистик', 'Новосибирская область', '2022-03-10', '2024-03-31'), -- закрыт
(4, 'Екатеринбург Урал', 'Свердловская область', '2021-11-05', '5999-12-31'),
(5, 'Казань Волга', 'Татарстан', '2022-07-18', '2023-07-31'), -- закрыт
(6, 'Нижний Новгород Сортировочный', 'Нижегородская область', '2023-01-22', '5999-12-31'),
(7, 'Челябинск Металлург', 'Челябинская область', '2022-10-14', '2024-01-18'), -- закрыт
(8, 'Самара Космос', 'Самарская область', '2023-02-28', '5999-12-31'),
(9, 'Омск Сибирь', 'Омская область', '2023-04-11', '2024-03-14'), -- закрыт
(10, 'Ростов-на-Дону Южный', 'Ростовская область', '2023-06-25', '5999-12-31'),
(11, 'Уфа Башкортостан', 'Башкортостан', '2023-05-19', '2024-11-07'), -- закрыт
(12, 'Красноярск Восток', 'Красноярский край', '2023-07-05', '5999-12-31'),
(13, 'Пермь Кама', 'Пермский край', '2023-08-15', '2024-09-01'), -- закрыт
(14, 'Воронеж Черноземье', 'Воронежская область', '2023-09-28', '5999-12-31'),
(15, 'Волгоград Сталинград', 'Волгоградская область', '2023-10-12', '2024-08-31'), -- закрыт
(16, 'Краснодар Кубань', 'Краснодарский край', '2024-01-09', '5999-12-31'),
(17, 'Саратов Поволжье', 'Саратовская область', '2024-02-17', '2024-08-19'), -- закрыт
(18, 'Тюмень Нефтегаз', 'Тюменская область', '2024-03-14', '5999-12-31'),
(19, 'Иркутск Байкал', 'Иркутская область', '2024-04-03', '2025-01-28'), -- закрыт
(20, 'Хабаровск Дальний Восток', 'Хабаровский край', '2024-05-30', '5999-12-31'),
(21, 'Ярославль Золотое кольцо', 'Ярославская область', '2024-06-22', '2024-12-01'), -- закрыт
(22, 'Томск Наука', 'Томская область', '2024-07-15', '5999-12-31'),
(23, 'Калининград Балтика', 'Калининградская область', '2024-08-10', '5999-12-31'),
(24, 'Сочи Черноморье', 'Краснодарский край', '2024-09-18', '5999-12-31'),
(25, 'Владивосток Тихий океан', 'Приморский край', '2024-11-25', '5999-12-31');

--Третий запрос
INSERT INTO db_project.warehouse_inventory (warehouse_id, product_id, quantity) VALUES
-- Московский склад (ID 1)
(1, 1, 25), (1, 2, 18), (1, 3, 8), (1, 4, 5), (1, 5, 3),
(1, 6, 42), (1, 7, 120), (1, 8, 65), (1, 9, 30), (1, 10, 28),
(1, 25, 7), (1, 28, 4), (1, 35, 90), (1, 40, 15), (1, 45, 22),
-- Питерский склад (ID 2)
(2, 2, 15), (2, 5, 2), (2, 7, 85), (2, 9, 20), (2, 12, 12),
(2, 15, 18), (2, 18, 10), (2, 22, 5), (2, 26, 8), (2, 30, 6),
(2, 33, 14), (2, 37, 25), (2, 41, 30), (2, 44, 10), (2, 47, 8),
-- Екатеринбург (ID 4)
(4, 4, 4), (4, 8, 40), (4, 11, 18), (4, 14, 25), (4, 17, 8),
(4, 20, 12), (4, 24, 5), (4, 28, 3), (4, 32, 6), (4, 36, 20),
(4, 39, 15), (4, 43, 10), (4, 47, 5), (4, 50, 3), (4, 53, 2),
-- Нижний Новгород (ID 6)
(6, 7, 50), (6, 14, 20), (6, 21, 3), (6, 28, 2), (6, 35, 30),
-- Самара (ID 8)
(8, 13, 4), (8, 20, 6), (8, 27, 5), (8, 34, 7), (8, 41, 10),
-- Ростов-на-Дону (ID 10)
(10, 19, 3), (10, 26, 4), (10, 33, 5), (10, 40, 7), (10, 47, 4),
-- Красноярск (ID 12)
(12, 25, 2), (12, 32, 3), (12, 39, 8), (12, 46, 4), (12, 53, 1),
-- Воронеж (ID 14)
(14, 28, 1), (14, 35, 15), (14, 42, 12), (14, 49, 2), (14, 56, 3),
-- Краснодар (ID 16)
(16, 10, 12), (16, 17, 5), (16, 24, 3), (16, 31, 2), (16, 38, 8),
-- Тюмень (ID 18)
(18, 16, 8), (18, 23, 4), (18, 30, 3), (18, 37, 6), (18, 44, 5),
-- Хабаровск (ID 20)
(20, 22, 2), (20, 29, 3), (20, 36, 10), (20, 43, 6), (20, 50, 2),
-- Томск (ID 22)
(22, 16, 8), (22, 23, 4), (22, 30, 3), (22, 37, 6), (22, 44, 5),
-- Калининград (ID 23)
(23, 19, 3), (23, 26, 4), (23, 33, 5), (23, 40, 7), (23, 47, 4),
-- Сочи (ID 24)
(24, 25, 2), (24, 32, 3), (24, 39, 8), (24, 46, 4), (24, 53, 1),
-- Владивосток (ID 25)
(25, 28, 1), (25, 35, 15), (25, 42, 12), (25, 49, 2), (25, 56, 3);

INSERT INTO db_project.deliveries (product_id, warehouse_id, delivery_date, quantity) VALUES
-- Московский склад (ID 1)
(1, 1, '2023-01-15', 30), (2, 1, '2023-01-15', 20), (3, 1, '2023-01-20', 10),
(4, 1, '2023-02-05', 6), (5, 1, '2023-02-10', 4), (6, 1, '2023-02-15', 50),
(7, 1, '2023-03-01', 150), (8, 1, '2023-03-10', 80), (9, 1, '2023-03-15', 40),
(10, 1, '2023-04-05', 35), (25, 1, '2023-04-10', 10), (28, 1, '2023-04-15', 5),
-- Питерский склад (ID 2)
(2, 2, '2024-01-20', 20), (5, 2, '2024-02-01', 3), (7, 2, '2024-02-10', 100),
(9, 2, '2024-02-20', 25), (12, 2, '2024-03-05', 15), (15, 2, '2024-03-15', 20),
(18, 2, '2024-04-01', 12), (22, 2, '2024-04-10', 6), (26, 2, '2024-04-20', 10),
(30, 2, '2024-05-05', 8), (33, 2, '2024-05-15', 20), (37, 2, '2024-06-01', 30),
-- Новосибирск Логистик (ID 3, закрыт 2024-03-31)
(1, 3, '2023-04-10', 2), (15, 3, '2023-07-01', 1), (33, 3, '2023-11-15', 3),
-- Екатеринбург (ID 4)
(4, 4, '2025-01-15', 5), (8, 4, '2025-01-20', 50), (11, 4, '2025-02-01', 20),
(14, 4, '2025-02-10', 30), (17, 4, '2025-02-15', 10), (20, 4, '2025-03-05', 15),
(24, 4, '2025-03-10', 6), (28, 4, '2025-03-15', 4), (32, 4, '2025-04-01', 8),
-- Казань Волга (ID 5, закрыт 2023-07-31)
(2, 5, '2022-08-01', 1), (12, 5, '2022-10-01', 2),
-- Нижний Новгород (ID 6)
(7, 6, '2025-03-10', 60), (14, 6, '2025-03-15', 25), (21, 6, '2025-03-20', 4),
(28, 6, '2025-03-25', 3), (35, 6, '2025-04-01', 40),
-- Челябинск Металлург (ID 7, закрыт 2024-01-18)
(3, 7, '2022-11-05', 1), (21, 7, '2023-01-15', 1),
-- Самара (ID 8)
(31, 8, '2025-03-15', 3), (38, 8, '2025-03-20', 10),
-- Омск Сибирь (ID 9, закрыт 2024-03-14)
(5, 9, '2023-05-01', 1),
-- Ростов-на-Дону (ID 10)
(27, 10, '2025-04-10', 6), (34, 10, '2025-04-12', 9),
-- Уфа Башкортостан (ID 11, закрыт 2024-11-07)
(7, 11, '2023-06-10', 2), (19, 11, '2024-02-01', 1),
-- Красноярск (ID 12)
(3, 12, '2025-01-25', 8), (6, 12, '2025-02-05', 30), (10, 12, '2025-02-15', 20),
(13, 12, '2025-03-01', 10), (16, 12, '2025-03-10', 15), (19, 12, '2025-03-20', 6),
(23, 12, '2025-04-05', 10), (27, 12, '2025-04-15', 12), (31, 12, '2025-05-01', 4),
(34, 12, '2025-05-10', 12), (38, 12, '2025-05-20', 20), (42, 12, '2025-06-05', 25),
-- Пермь Кама (ID 13, закрыт 2024-09-01)
(9, 13, '2023-08-20', 1), (27, 13, '2024-01-15', 1),
-- Воронеж (ID 14)
(10, 14, '2025-04-05', 15), (17, 14, '2025-04-10', 6), (24, 14, '2025-04-12', 4),
-- Волгоград Сталинград (ID 15, закрыт 2024-08-31)
(11, 15, '2023-10-01', 1), (35, 15, '2024-03-01', 1),
-- Краснодар (ID 16)
(13, 16, '2025-04-01', 5), (20, 16, '2025-04-05', 8),
-- Саратов Поволжье (ID 17, закрыт 2024-08-19)
(13, 17, '2024-02-17', 1),
-- Тюмень (ID 18)
(5, 18, '2025-01-05', 3), (9, 18, '2025-01-15', 20), (12, 18, '2025-02-05', 10),
(15, 18, '2025-02-15', 15), (18, 18, '2025-02-20', 8), (21, 18, '2025-03-05', 5),
(25, 18, '2025-03-10', 4), (29, 18, '2025-03-15', 6), (33, 18, '2025-04-01', 10),
-- Иркутск Байкал (ID 19, закрыт 2025-01-28)
(15, 19, '2024-04-03', 1), (37, 19, '2024-10-01', 1),
-- Хабаровск (ID 20)
(22, 20, '2025-03-10', 2), (29, 20, '2025-03-15', 3), (36, 20, '2025-03-20', 10),
(43, 20, '2025-03-25', 6), (50, 20, '2025-04-01', 2),
-- Ярославль Золотое кольцо (ID 21, закрыт 2024-12-01)
(17, 21, '2024-06-22', 1), (39, 21, '2024-09-01', 1),
-- Томск (ID 22)
(13, 22, '2025-03-15', 5), (20, 22, '2025-03-20', 8), (27, 22, '2025-03-25', 6),
(34, 22, '2025-04-01', 9), (41, 22, '2025-04-05', 10),
-- Калининград (ID 23)
(7, 23, '2025-03-10', 50), (14, 23, '2025-03-15', 20), (21, 23, '2025-03-20', 3),
(28, 23, '2025-03-25', 2), (35, 23, '2025-04-01', 30),
-- Сочи (ID 24)
(10, 24, '2025-04-05', 12), (17, 24, '2025-04-10', 5), (24, 24, '2025-04-12', 3),
(31, 24, '2025-04-15', 2), (38, 24, '2025-04-20', 8),
-- Владивосток (ID 25)
(16, 25, '2025-03-15', 8), (23, 25, '2025-03-20', 4), (30, 25, '2025-03-25', 3),
(37, 25, '2025-04-01', 6), (44, 25, '2025-04-05', 5);



INSERT INTO db_project.users (surname, firstname, lastname, birth_date, region) VALUES
('Иванов', 'Алексей', 'Петрович', '1985-05-15', 'Москва'),
('Петрова', 'Мария', 'Ивановна', '1990-07-22', 'Санкт-Петербург'),
('Сидоров', 'Дмитрий', 'Сергеевич', '1982-11-30', 'Новосибирская область'),
('Кузнецова', 'Елена', 'Александровна', '1995-03-18', 'Свердловская область'),
('Смирнов', 'Андрей', 'Владимирович', '1978-09-05', 'Татарстан'),
('Федорова', 'Ольга', 'Дмитриевна', '1989-12-10', 'Нижегородская область'),
('Попов', 'Сергей', 'Алексеевич', '1992-04-25', 'Самарская область'),
('Васильева', 'Анна', 'Сергеевна', '1987-06-14', 'Омская область'),
('Павлов', 'Иван', 'Николаевич', '1980-08-19', 'Ростовская область'),
('Семенова', 'Наталья', 'Викторовна', '1993-01-27', 'Башкортостан'),
('Голубев', 'Максим', 'Олегович', '1984-02-08', 'Красноярский край'),
('Воробьева', 'Татьяна', 'Михайловна', '1991-07-03', 'Пермский край'),
('Белов', 'Артем', 'Анатольевич', '1975-10-12', 'Воронежская область'),
('Козлова', 'Юлия', 'Валерьевна', '1986-11-21', 'Волгоградская область'),
('Лебедев', 'Константин', 'Игоревич', '1994-09-07', 'Краснодарский край'),
('Соколова', 'Виктория', 'Андреевна', '1983-04-16', 'Саратовская область'),
('Морозов', 'Павел', 'Борисович', '1979-12-29', 'Тюменская область'),
('Орлова', 'Екатерина', 'Витальевна', '1996-08-11', 'Иркутская область'),
('Новиков', 'Роман', 'Геннадьевич', '1981-05-24', 'Хабаровский край'),
('Жукова', 'Алина', 'Романовна', '1997-03-09', 'Ярославская область'),
('Абрамов', 'Михаил', NULL, '1990-02-14', 'Томская область'),
('Борисов', 'Александр', NULL, '1988-07-19', 'Калининградская область'),
('Власов', 'Денис', NULL, '1992-11-03', 'Приморский край'),
('Григорьев', 'Евгений', NULL, '1985-09-27', 'Москва'),
('Давыдов', 'Владимир', NULL, '1979-04-08', 'Санкт-Петербург'),
('Егоров', 'Станислав', NULL, '1993-12-15', 'Новосибирская область'),
('Жданов', 'Григорий', NULL, '1987-05-22', 'Свердловская область'),
('Зайцев', 'Игорь', NULL, '1995-08-30', 'Татарстан'),
('Исаев', 'Кирилл', NULL, '1982-01-17', 'Нижегородская область'),
('Крылов', 'Леонид', NULL, '1996-06-11', 'Челябинская область'),
('Ларин', 'Никита', NULL, '1989-03-25', 'Самарская область'),
('Макаров', 'Олег', NULL, '1980-10-09', 'Омская область'),
('Наумов', 'Петр', NULL, '1994-07-04', 'Ростовская область'),
('Осипов', 'Руслан', NULL, '1983-02-28', 'Башкортостан'),
('Поляков', 'Святослав', NULL, '1991-11-13', 'Красноярский край'),
('Романов', 'Тимур', NULL, '1986-04-07', 'Пермский край'),
('Савельев', 'Федор', NULL, '1978-09-20', 'Воронежская область'),
('Тарасов', 'Юрий', NULL, '1997-01-05', 'Волгоградская область'),
('Устинов', 'Ярослав', NULL, '1984-12-18', 'Краснодарский край'),
('Фомин', 'Арсений', NULL, '1990-08-23', 'Саратовская область'),
('Харитонов', 'Богдан', NULL, '1981-06-16', 'Тюменская область'),
('Цветков', 'Вадим', NULL, '1993-04-12', 'Иркутская область'),
('Шестаков', 'Георгий', NULL, '1987-09-27', 'Хабаровский край'),
('Щербаков', 'Даниил', NULL, '1995-11-08', 'Ярославская область'),
('Юдин', 'Евгений', NULL, '1982-07-19', 'Томская область'),
('Яковлев', 'Захар', NULL, '1998-02-25', 'Калининградская область'),
('Антонов', 'Илья', NULL, '1989-05-14', 'Приморский край'),
('Беляев', 'Кирилл', NULL, '1991-12-03', 'Москва'),
('Виноградов', 'Лев', NULL, '1984-08-22', 'Санкт-Петербург'),
('Герасимов', 'Матвей', NULL, '1997-01-17', 'Новосибирская область'),
('Дорофеев', 'Николай', NULL, '1980-06-29', 'Свердловская область'),
('Ермаков', 'Олег', NULL, '1994-03-11', 'Татарстан'),
('Жуков', 'Павел', NULL, '1986-10-05', 'Нижегородская область'),
('Зимин', 'Роман', NULL, '1992-07-28', 'Челябинская область'),
('Ильин', 'Семен', NULL, '1985-04-16', 'Самарская область'),
('Кудрявцев', 'Тимофей', NULL, '1999-09-07', 'Омская область'),
('Логинов', 'Умар', NULL, '1983-02-14', 'Ростовская область'),
('Маслов', 'Филипп', NULL, '1990-11-23', 'Башкортостан'),
('Никитин', 'Харитон', NULL, '1988-05-18', 'Красноярский край'),
('Овчинников', 'Цезарь', NULL, '1996-12-09', 'Пермский край'),
('Прохоров', 'Шамиль', NULL, '1981-08-31', 'Воронежская область'),
('Русаков', 'Эдуард', NULL, '1993-01-26', 'Волгоградская область'),
('Степанов', 'Юлиан', NULL, '1987-07-15', 'Краснодарский край'),
('Тихонов', 'Ян', NULL, '1995-04-03', 'Саратовская область'),
('Уваров', 'Артур', NULL, '1982-10-19', 'Тюменская область'),
('Федосеев', 'Бронислав', NULL, '1998-06-12', 'Иркутская область'),
('Хохлов', 'Глеб', NULL, '1989-03-05', 'Хабаровский край'),
('Чернов', 'Демид', NULL, '1991-12-28', 'Ярославская область'),
('Широков', 'Елисей', NULL, '1984-09-14', 'Томская область'),
('Щукин', 'Ждан', NULL, '1997-02-07', 'Калининградская область'),
('Яшин', 'Зиновий', NULL, '1980-11-30', 'Приморский край'),
('Акимов', 'Борис', NULL, '1992-07-28', 'Челябинская область'),
('Баранов', 'Вениамин', NULL, '1985-04-16', 'Самарская область'),
('Волков', 'Герман', NULL, '1999-09-07', 'Омская область'),
('Гусев', 'Давид', NULL, '1983-02-14', 'Ростовская область'),
('Дмитриев', 'Егор', NULL, '1990-11-23', 'Башкортостан'),
('Ефимов', 'Захар', NULL, '1988-05-18', 'Красноярский край'),
('Жилин', 'Иван', NULL, '1996-12-09', 'Пермский край'),
('Зайцев', 'Константин', NULL, '1981-08-31', 'Воронежская область'),
('Игнатьев', 'Леонид', NULL, '1993-01-26', 'Волгоградская область');

--Четвёртый запрос
INSERT INTO db_project.users_contacts (user_id, phone_number) VALUES
(1, '+79161234567'),
(2, '+79219876543'),
(3, '+79031234567'),
(3, '+79037654321'),
(4, '+79501234567'),
(5, '+79659876543'),
(6, '+79111234567'),
(7, '+79229876543'),
(8, '+79021234567'),
(9, '+79519876543'),
(10, '+79109876543'),
(11, '+79201234567'),
(12, '+79049876543'),
(13, '+79601234567'),
(14, '+79129876543'),
(15, '+79231234567'),
(16, '+79059876543'),
(17, '+79611234567'),
(18, '+79139876543'),
(19, '+79241234567'),
(20, '+79069876543'),
(21, '+79621234567'),
(22, '+79149876543'),
(23, '+79251234567'),
(25, '+79079876543');

INSERT INTO db_project.users_auth_data (user_id, login, password) VALUES
(1, 'ivanov.alexey', '$argon2id$v=19$m=65536,t=3,p=4$NUZISck555xTSqm19l7r/Q$jxDuC/hiKYaIiT9g6438VV5+LiMl7KxzabzetD2Qn4M'),  -- password123
(2, 'petrova.maria', '$argon2id$v=19$m=65536,t=3,p=4$JQSg9H6PMQZAKIXwXsu5Vw$oD19OK58OvUeE3Fq6lGhIWZb5k+cFyNbZJmPn00Oq2g'),  -- qwerty
(3, 'sidorov.dmitry', '$argon2id$v=19$m=65536,t=3,p=4$aW3t3ZsTotTaG+M8B2CM8Q$B3UsrB9lJNtJGU/GZ+0CDA7DMhl0/ktZXz4HlK83cUQ'),  -- 123456
(4, 'kuznetsova.elena', '$argon2id$v=19$m=65536,t=3,p=4$6d27t9b6P4ewVoqxNgYgZA$bLQxRxK8vUo5IrYLbFgyeKUxQKIPXTjtd/YeES0nAoQ'),  -- admin
(5, 'smirnov.andrey', '$argon2id$v=19$m=65536,t=3,p=4$7N2bk7I25lzrnRPivPe+Fw$4Ea1qgRIFMP+0re7wSwoy7FJPKLWCJ/eRnCVBdCaGb44'),  -- letmein
(6, 'fedorova.olga', '$argon2id$v=19$m=65536,t=3,p=4$FML4HwOg1Np7r3WOce49Bw$Gom0oaeWY+iIEZc03f+yWVLaws0htQaTYzAQRpzDET4'),  -- welcome
(7, 'popov.sergey', '$argon2id$v=19$m=65536,t=3,p=4$r1Xq3TtnrNW6V4qxljKGMA$fGpd+1RZiKBTYV5k9SlG3HfSAEN7DruHGPfNFxzHE9w'),  -- monkey
(8, 'vasilieva.anna', '$argon2id$v=19$m=65536,t=3,p=4$+H/POUcoxfgfYyyFEIIQQg$MW1Ot1zKnn9q7B5GRKoG99KVKyGG7hszrBEV83UzG2Y'),  -- sunshine
(9, 'pavlov.ivan', '$argon2id$v=19$m=65536,t=3,p=4$mdMawzhnrLXWGiNEiBGiFA$qiPTmlwHydifB97ZPw/Bc/C4MfoH6YTbGJj+SkvlgdE'),  -- password
(10, 'semenova.natalya', '$argon2id$v=19$m=65536,t=3,p=4$JARASKl1DuH8/3/P2ds75w$aaomtdsqpeBEeGQ8IAgdPfN8LaP9rt2TdHFdzKMxZc4'),  -- abc123
(11, 'golubev.maxim', '$argon2id$v=19$m=65536,t=3,p=4$K2XMuXduLeWck3LO+f/f2w$o5HdBMxEeRSyOaeuzogram4MM9dC+fcwwufw+775U6o'),  -- password123
(12, 'vorobieva.tatiana', '$argon2id$v=19$m=65536,t=3,p=4$Zwzh/D8nJGTs/X8vZSyF8A$Fs8mJYsT6DzbLiyQmQ+rYTJrLnKSTyDuRH5fB32jqKg'),  -- qwerty
(13, 'belov.artem', '$argon2id$v=19$m=65536,t=3,p=4$aI2xNgZACGGsFYLwPmfMOQ$y1yNIs+uzq5eIO/xzur3wpms+96B26pok5+KqV+uqt4'),  -- 123456
(14, 'kozlova.yulia', '$argon2id$v=19$m=65536,t=3,p=4$HeOcEwIghHBuLWXsHcNYiw$4kyJ+RsNtVjDcIJvZEUyRAmonH4PasNaNg0i8V9rkYY'),  -- admin
(15, 'lebedev.konstantin', '$argon2id$v=19$m=65536,t=3,p=4$UCrlXCtFCGGMsba2tlaqNQ$heil4Spydwd+Ndo/MfKZDmdffNURlRwO5k/hFU3PqEc'),  -- letmein
(16, 'sokolova.viktoria', '$argon2id$v=19$m=65536,t=3,p=4$jnGutfZeq7U2RsjZW6tVag$2eXwwPhX5+jv5hjZ7Fn9QBHTXOyTuYFjOXVzv0CWMN0'),  -- welcome
(17, 'morozov.pavel', '$argon2id$v=19$m=65536,t=3,p=4$OgdgzBkj5NxbC4GwNgbg/A$gtfSd4iq0on6Drq9c/WUfZN3iKNzwXAu+gYxOZ02F4A'),  -- monkey
(18, 'orlova.ekaterina', '$argon2id$v=19$m=65536,t=3,p=4$HCOEMOa8t/beOwfAmNO6lw$mf5u047gIgbL90ZyxMV7lDAes2/SNNsyIN02y62ubx4'),  -- sunshine
(19, 'novikov.roman', '$argon2id$v=19$m=65536,t=3,p=4$k9J6L2XMWav1HqPUGkNo7Q$wrVFTFSH4BjYh0lQoExUQOShXR5bDTRwEUHvcXzT5hs'),  -- password
(20, 'zhukova.alina', '$argon2id$v=19$m=65536,t=3,p=4$iNE6R6iVMiaktDZGCIEQ4g$5NodrBNF8mTZtRSIvoCtlR23YuxQhycLqO9fQ63cZBA'),  -- abc123
(21, 'abramov.mikhail', '$argon2id$v=19$m=65536,t=3,p=4$NUZISck555xTSqm19l7r/Q$jxDuC/hiKYaIiT9g6438VV5+LiMl7KxzabzetD2Qn4M'),  -- password123
(22, 'borisov.alexander', '$argon2id$v=19$m=65536,t=3,p=4$JQSg9H6PMQZAKIXwXsu5Vw$oD19OK58OvUeE3Fq6lGhIWZb5k+cFyNbZJmPn00Oq2g'),  -- qwerty
(23, 'vlasov.denis', '$argon2id$v=19$m=65536,t=3,p=4$aW3t3ZsTotTaG+M8B2CM8Q$B3UsrB9lJNtJGU/GZ+0CDA7DMhl0/ktZXz4HlK83cUQ'),  -- 123456
(24, 'grigoriev.evgeny', '$argon2id$v=19$m=65536,t=3,p=4$6d27t9b6P4ewVoqxNgYgZA$bLQxRxK8vUo5IrYLbFgyeKUxQKIPXTjtd/YeES0nAoQ'),  -- admin
(25, 'davydov.vladimir', '$argon2id$v=19$m=65536,t=3,p=4$7N2bk7I25lzrnRPivPe+Fw$4Ea1qgRIFMP+0re7wSwoy7FJPKLWCJ/eRnCVBdCaGb44'),  -- letmein
(26, 'egorov.stanislav', '$argon2id$v=19$m=65536,t=3,p=4$FML4HwOg1Np7r3WOce49Bw$Gom0oaeWY+iIEZc03f+yWVLaws0htQaTYzAQRpzDET4'),  -- welcome
(27, 'zhdanov.grigory', '$argon2id$v=19$m=65536,t=3,p=4$r1Xq3TtnrNW6V4qxljKGMA$fGpd+1RZiKBTYV5k9SlG3HfSAEN7DruHGPfNFxzHE9w'),  -- monkey
(28, 'zaitsev.igor', '$argon2id$v=19$m=65536,t=3,p=4$+H/POUcoxfgfYyyFEIIQQg$MW1Ot1zKnn9q7B5GRKoG99KVKyGG7hszrBEV83UzG2Y'),  -- sunshine
(29, 'isaev.kirill', '$argon2id$v=19$m=65536,t=3,p=4$mdMawzhnrLXWGiNEiBGiFA$qiPTmlwHydifB97ZPw/Bc/C4MfoH6YTbGJj+SkvlgdE'),  -- password
(30, 'krylov.leonid', '$argon2id$v=19$m=65536,t=3,p=4$JARASKl1DuH8/3/P2ds75w$aaomtdsqpeBEeGQ8IAgdPfN8LaP9rt2TdHFdzKMxZc4'),  -- abc123
(31, 'larin.nikita', '$argon2id$v=19$m=65536,t=3,p=4$K2XMuXduLeWck3LO+f/f2w$o5HdBMxEeRSyOaeuzogram4MM9dC+fcwwufw+775U6o'),  -- password123
(32, 'makarov.oleg', '$argon2id$v=19$m=65536,t=3,p=4$Zwzh/D8nJGTs/X8vZSyF8A$Fs8mJYsT6DzbLiyQmQ+rYTJrLnKSTyDuRH5fB32jqKg'),  -- qwerty
(33, 'naumov.petr', '$argon2id$v=19$m=65536,t=3,p=4$aI2xNgZACGGsFYLwPmfMOQ$y1yNIs+uzq5eIO/xzur3wpms+96B26pok5+KqV+uqt4'),  -- 123456
(34, 'osipov.ruslan', '$argon2id$v=19$m=65536,t=3,p=4$HeOcEwIghHBuLWXsHcNYiw$4kyJ+RsNtVjDcIJvZEUyRAmonH4PasNaNg0i8V9rkYY'),  -- admin
(35, 'polyakov.svyatoslav', '$argon2id$v=19$m=65536,t=3,p=4$UCrlXCtFCGGMsba2tlaqNQ$heil4Spydwd+Ndo/MfKZDmdffNURlRwO5k/hFU3PqEc'),  -- letmein
(36, 'romanov.timur', '$argon2id$v=19$m=65536,t=3,p=4$jnGutfZeq7U2RsjZW6tVag$2eXwwPhX5+jv5hjZ7Fn9QBHTXOyTuYFjOXVzv0CWMN0'),  -- welcome
(37, 'saveliev.fedor', '$argon2id$v=19$m=65536,t=3,p=4$OgdgzBkj5NxbC4GwNgbg/A$gtfSd4iq0on6Drq9c/WUfZN3iKNzwXAu+gYxOZ02F4A'),  -- monkey
(38, 'tarasov.yury', '$argon2id$v=19$m=65536,t=3,p=4$HCOEMOa8t/beOwfAmNO6lw$mf5u047gIgbL90ZyxMV7lDAes2/SNNsyIN02y62ubx4'),  -- sunshine
(39, 'ustinov.yaroslav', '$argon2id$v=19$m=65536,t=3,p=4$k9J6L2XMWav1HqPUGkNo7Q$wrVFTFSH4BjYh0lQoExUQOShXR5bDTRwEUHvcXzT5hs'),  -- password
(40, 'fomin.arseny', '$argon2id$v=19$m=65536,t=3,p=4$iNE6R6iVMiaktDZGCIEQ4g$5NodrBNF8mTZtRSIvoCtlR23YuxQhycLqO9fQ63cZBA'),  -- abc123
(41, 'haritonov.bogdan', '$argon2id$v=19$m=65536,t=3,p=4$NUZISck555xTSqm19l7r/Q$jxDuC/hiKYaIiT9g6438VV5+LiMl7KxzabzetD2Qn4M'),  -- password123
(42, 'tsvetkov.vadim', '$argon2id$v=19$m=65536,t=3,p=4$JQSg9H6PMQZAKIXwXsu5Vw$oD19OK58OvUeE3Fq6lGhIWZb5k+cFyNbZJmPn00Oq2g'),  -- qwerty
(43, 'shestakov.georgy', '$argon2id$v=19$m=65536,t=3,p=4$aW3t3ZsTotTaG+M8B2CM8Q$B3UsrB9lJNtJGU/GZ+0CDA7DMhl0/ktZXz4HlK83cUQ'),  -- 123456
(44, 'shcherbakov.daniil', '$argon2id$v=19$m=65536,t=3,p=4$6d27t9b6P4ewVoqxNgYgZA$bLQxRxK8vUo5IrYLbFgyeKUxQKIPXTjtd/YeES0nAoQ'),  -- admin
(45, 'yudin.evgeny', '$argon2id$v=19$m=65536,t=3,p=4$7N2bk7I25lzrnRPivPe+Fw$4Ea1qgRIFMP+0re7wSwoy7FJPKLWCJ/eRnCVBdCaGb44'),  -- letmein
(46, 'yakovlev.zakhar', '$argon2id$v=19$m=65536,t=3,p=4$FML4HwOg1Np7r3WOce49Bw$Gom0oaeWY+iIEZc03f+yWVLaws0htQaTYzAQRpzDET4'),  -- welcome
(47, 'antonov.ilya', '$argon2id$v=19$m=65536,t=3,p=4$r1Xq3TtnrNW6V4qxljKGMA$fGpd+1RZiKBTYV5k9SlG3HfSAEN7DruHGPfNFxzHE9w'),  -- monkey
(48, 'belyaev.kirill', '$argon2id$v=19$m=65536,t=3,p=4$+H/POUcoxfgfYyyFEIIQQg$MW1Ot1zKnn9q7B5GRKoG99KVKyGG7hszrBEV83UzG2Y'),  -- sunshine
(49, 'vinogradov.lev', '$argon2id$v=19$m=65536,t=3,p=4$mdMawzhnrLXWGiNEiBGiFA$qiPTmlwHydifB97ZPw/Bc/C4MfoH6YTbGJj+SkvlgdE'),  -- password
(50, 'gerasimov.matvey', '$argon2id$v=19$m=65536,t=3,p=4$JARASKl1DuH8/3/P2ds75w$aaomtdsqpeBEeGQ8IAgdPfN8LaP9rt2TdHFdzKMxZc4'),  -- abc123
(51, 'dorofeev.nikolay', '$argon2id$v=19$m=65536,t=3,p=4$K2XMuXduLeWck3LO+f/f2w$o5HdBMxEeRSyOaeuzogram4MM9dC+fcwwufw+775U6o'),  -- password123
(52, 'ermakov.oleg', '$argon2id$v=19$m=65536,t=3,p=4$Zwzh/D8nJGTs/X8vZSyF8A$Fs8mJYsT6DzbLiyQmQ+rYTJrLnKSTyDuRH5fB32jqKg'),  -- qwerty
(53, 'zhukov.pavel', '$argon2id$v=19$m=65536,t=3,p=4$aI2xNgZACGGsFYLwPmfMOQ$y1yNIs+uzq5eIO/xzur3wpms+96B26pok5+KqV+uqt4'),  -- 123456
(54, 'zimin.roman', '$argon2id$v=19$m=65536,t=3,p=4$HeOcEwIghHBuLWXsHcNYiw$4kyJ+RsNtVjDcIJvZEUyRAmonH4PasNaNg0i8V9rkYY'),  -- admin
(55, 'ilin.semen', '$argon2id$v=19$m=65536,t=3,p=4$UCrlXCtFCGGMsba2tlaqNQ$heil4Spydwd+Ndo/MfKZDmdffNURlRwO5k/hFU3PqEc'),  -- letmein
(56, 'kudryavtsev.timofey', '$argon2id$v=19$m=65536,t=3,p=4$jnGutfZeq7U2RsjZW6tVag$2eXwwPhX5+jv5hjZ7Fn9QBHTXOyTuYFjOXVzv0CWMN0'),  -- welcome
(57, 'loginov.umar', '$argon2id$v=19$m=65536,t=3,p=4$OgdgzBkj5NxbC4GwNgbg/A$gtfSd4iq0on6Drq9c/WUfZN3iKNzwXAu+gYxOZ02F4A'),  -- monkey
(58, 'maslov.filipp', '$argon2id$v=19$m=65536,t=3,p=4$HCOEMOa8t/beOwfAmNO6lw$mf5u047gIgbL90ZyxMV7lDAes2/SNNsyIN02y62ubx4'),  -- sunshine
(59, 'nikitin.khariton', '$argon2id$v=19$m=65536,t=3,p=4$k9J6L2XMWav1HqPUGkNo7Q$wrVFTFSH4BjYh0lQoExUQOShXR5bDTRwEUHvcXzT5hs'),  -- password
(60, 'ovchinnikov.caesar', '$argon2id$v=19$m=65536,t=3,p=4$iNE6R6iVMiaktDZGCIEQ4g$5NodrBNF8mTZtRSIvoCtlR23YuxQhycLqO9fQ63cZBA'),  -- abc123
(61, 'prokhorov.shamil', '$argon2id$v=19$m=65536,t=3,p=4$NUZISck555xTSqm19l7r/Q$jxDuC/hiKYaIiT9g6438VV5+LiMl7KxzabzetD2Qn4M'),  -- password123
(62, 'rusakov.edward', '$argon2id$v=19$m=65536,t=3,p=4$JQSg9H6PMQZAKIXwXsu5Vw$oD19OK58OvUeE3Fq6lGhIWZb5k+cFyNbZJmPn00Oq2g'),  -- qwerty
(63, 'stepanov.yulian', '$argon2id$v=19$m=65536,t=3,p=4$aW3t3ZsTotTaG+M8B2CM8Q$B3UsrB9lJNtJGU/GZ+0CDA7DMhl0/ktZXz4HlK83cUQ'),  -- 123456
(64, 'tikhonov.yan', '$argon2id$v=19$m=65536,t=3,p=4$6d27t9b6P4ewVoqxNgYgZA$bLQxRxK8vUo5IrYLbFgyeKUxQKIPXTjtd/YeES0nAoQ'),  -- admin
(65, 'uvarov.arthur', '$argon2id$v=19$m=65536,t=3,p=4$7N2bk7I25lzrnRPivPe+Fw$4Ea1qgRIFMP+0re7wSwoy7FJPKLWCJ/eRnCVBdCaGb44'),  -- letmein
(66, 'fedoseev.bronislav', '$argon2id$v=19$m=65536,t=3,p=4$FML4HwOg1Np7r3WOce49Bw$Gom0oaeWY+iIEZc03f+yWVLaws0htQaTYzAQRpzDET4'),  -- welcome
(67, 'khokhlov.gleb', '$argon2id$v=19$m=65536,t=3,p=4$r1Xq3TtnrNW6V4qxljKGMA$fGpd+1RZiKBTYV5k9SlG3HfSAEN7DruHGPfNFxzHE9w'),  -- monkey
(68, 'chernov.demid', '$argon2id$v=19$m=65536,t=3,p=4$+H/POUcoxfgfYyyFEIIQQg$MW1Ot1zKnn9q7B5GRKoG99KVKyGG7hszrBEV83UzG2Y'),  -- sunshine
(69, 'shirokov.elisey', '$argon2id$v=19$m=65536,t=3,p=4$mdMawzhnrLXWGiNEiBGiFA$qiPTmlwHydifB97ZPw/Bc/C4MfoH6YTbGJj+SkvlgdE'),  -- password
(70, 'shchukin.zhdan', '$argon2id$v=19$m=65536,t=3,p=4$JARASKl1DuH8/3/P2ds75w$aaomtdsqpeBEeGQ8IAgdPfN8LaP9rt2TdHFdzKMxZc4'),  -- abc123
(71, 'yashin.zinovy', '$argon2id$v=19$m=65536,t=3,p=4$K2XMuXduLeWck3LO+f/f2w$o5HdBMxEeRSyOaeuzogram4MM9dC+fcwwufw+775U6o'),  -- password123
(72, 'akimov.boris', '$argon2id$v=19$m=65536,t=3,p=4$Zwzh/D8nJGTs/X8vZSyF8A$Fs8mJYsT6DzbLiyQmQ+rYTJrLnKSTyDuRH5fB32jqKg'),  -- qwerty
(73, 'baranov.veniamin', '$argon2id$v=19$m=65536,t=3,p=4$aI2xNgZACGGsFYLwPmfMOQ$y1yNIs+uzq5eIO/xzur3wpms+96B26pok5+KqV+uqt4'),  -- 123456
(74, 'volkov.german', '$argon2id$v=19$m=65536,t=3,p=4$HeOcEwIghHBuLWXsHcNYiw$4kyJ+RsNtVjDcIJvZEUyRAmonH4PasNaNg0i8V9rkYY'),  -- admin
(75, 'gusev.david', '$argon2id$v=19$m=65536,t=3,p=4$UCrlXCtFCGGMsba2tlaqNQ$heil4Spydwd+Ndo/MfKZDmdffNURlRwO5k/hFU3PqEc'),  -- letmein
(76, 'dmitriev.egor', '$argon2id$v=19$m=65536,t=3,p=4$jnGutfZeq7U2RsjZW6tVag$2eXwwPhX5+jv5hjZ7Fn9QBHTXOyTuYFjOXVzv0CWMN0'),  -- welcome
(77, 'efimov.zakhar', '$argon2id$v=19$m=65536,t=3,p=4$OgdgzBkj5NxbC4GwNgbg/A$gtfSd4iq0on6Drq9c/WUfZN3iKNzwXAu+gYxOZ02F4A'),  -- monkey
(78, 'zhilin.ivan', '$argon2id$v=19$m=65536,t=3,p=4$HCOEMOa8t/beOwfAmNO6lw$mf5u047gIgbL90ZyxMV7lDAes2/SNNsyIN02y62ubx4'),  -- sunshine
(79, 'zaitsev.konstantin', '$argon2id$v=19$m=65536,t=3,p=4$k9J6L2XMWav1HqPUGkNo7Q$wrVFTFSH4BjYh0lQoExUQOShXR5bDTRwEUHvcXzT5hs'),  -- password
(80, 'ignatiev.leonid', '$argon2id$v=19$m=65536,t=3,p=4$iNE6R6iVMiaktDZGCIEQ4g$5NodrBNF8mTZtRSIvoCtlR23YuxQhycLqO9fQ63cZBA');  -- abc123;

INSERT INTO db_project.orders (user_id, created_at, valid_until, order_status)
SELECT 
    u.id,
    CURRENT_TIMESTAMP - (30 * 3 * '1 day'::INTERVAL)
		- (random() * 30 * '1 day'::INTERVAL),
    CURRENT_TIMESTAMP - (30 * 3 * '1 day'::INTERVAL)
		+ (random() * 15 * '1 day'::INTERVAL),
    CASE floor(random() * 7)
        WHEN 0 THEN 'selected'
        WHEN 1 THEN 'collecting'
        WHEN 2 THEN 'underway'
        WHEN 3 THEN 'delivered'
        WHEN 4 THEN 'recieved'
        WHEN 5 THEN 'rejected'
        ELSE 'returned'
    END::db_project.order_status
FROM 
    (SELECT id FROM db_project.users ORDER BY random() LIMIT 100) u;

INSERT INTO db_project.order_lists (user_id, created_at, product_id, quantity)
SELECT 
    o.user_id,
    o.created_at,
    p.id,
    (random() * 3 + 1)
FROM 
    (SELECT user_id, created_at FROM db_project.orders ORDER BY random() LIMIT 80) o
CROSS JOIN LATERAL
    (SELECT id FROM db_project.products ORDER BY random() LIMIT (random() * 3 + 1)) p
LIMIT 700;

INSERT INTO db_project.orders_history (user_id, created_at, valid_until, order_status, update_date)
SELECT 
    o.user_id,
    o.created_at,
    o.valid_until,
    CASE 
        WHEN o.order_status = 'selected' THEN 
            CASE floor(random() * 5)
                WHEN 0 THEN 'collecting'
                WHEN 1 THEN 'underway'
                WHEN 2 THEN 'delivered'
                WHEN 3 THEN 'rejected'
                ELSE 'selected'
    		END::db_project.order_status
        ELSE o.order_status
    END,
    o.created_at + (random() * 7 * INTERVAL '1 day')
FROM 
    (SELECT * FROM db_project.orders ORDER BY random() LIMIT 200) o;

INSERT INTO db_project.order_lists_history (user_id, created_at, product_id, quantity, update_date)
SELECT 
    ol.user_id,
    ol.created_at,
    ol.product_id,
    CASE 
        WHEN (random() > 0.7) THEN ol.quantity + 1
        ELSE ol.quantity
    END,
    ol.created_at + (random() * 7 * INTERVAL '1 day')
FROM 
    (SELECT * FROM db_project.order_lists ORDER BY random() LIMIT 350) ol;