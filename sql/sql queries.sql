create table customers (
    platform_user_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    created_at DATE NOT NULL
);

select * from customers

create table products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INTEGER NOT NULL,
    material VARCHAR(50) NOT NULL,
    active_status VARCHAR(20) NOT NULL
);

select * from products

create table product_variants (
    variant_id VARCHAR(10) PRIMARY KEY,
    product_id VARCHAR(10) NOT NULL,
    colour VARCHAR(30) NOT NULL,
    size VARCHAR(10) NOT NULL,
    stock_qty INTEGER NOT NULL,
    
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

select * from product_variants


create table orders (
    order_id VARCHAR(10) PRIMARY KEY,
    platform_user_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    expected_delivery_date DATE NOT NULL,

    FOREIGN KEY (platform_user_id)
    REFERENCES customers(platform_user_id)
);

select * from orders

create table order_items (
    order_item_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    variant_id VARCHAR(10) NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price INTEGER NOT NULL,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (variant_id)
    REFERENCES product_variants(variant_id)
);

select * from order_items

create table messages (
    message_id VARCHAR(10) PRIMARY KEY,
    platform_user_id VARCHAR(20) NOT NULL,
    sender_type VARCHAR(20) NOT NULL,
    message_text TEXT NOT NULL,
    intent VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    current_product_id VARCHAR(10),

    FOREIGN KEY (platform_user_id)
    REFERENCES customers(platform_user_id),

    FOREIGN KEY (current_product_id)
    REFERENCES products(product_id)
);

select * from messages

SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers
UNION ALL
SELECT 'products', COUNT(*)
FROM products
UNION ALL
SELECT 'product_variants', COUNT(*)
FROM product_variants
UNION ALL
SELECT 'orders', COUNT(*)
FROM orders
UNION ALL
SELECT 'order_items', COUNT(*)
FROM order_items
UNION ALL
SELECT 'messages', COUNT(*)
FROM messages;

SELECT COUNT(*)
FROM orders o
LEFT JOIN customers c
ON o.platform_user_id = c.platform_user_id
WHERE c.platform_user_id IS NULL;

SELECT COUNT(*)
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Product Availibily Query

SELECT
    p.product_name,
    pv.colour,
    pv.size,
    pv.stock_qty
FROM products p
JOIN product_variants pv
    ON p.product_id = pv.product_id
WHERE p.product_id = 'P001'
  AND pv.size = 'M';


--Order Tracking Query

SELECT
    order_id,
    order_status,
    expected_delivery_date
FROM orders
WHERE platform_user_id = 'PLAT900003'
  AND order_status IN (
      'Placed',
      'Processing',
      'Shipped',
      'Out for Delivery'
  )
ORDER BY order_date DESC;




