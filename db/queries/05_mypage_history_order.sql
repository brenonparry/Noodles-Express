SELECT DISTINCT orders.id as order_id, order_time as date, pick_up_time, order_status, sum(menu_items.price)
FROM customizations
JOIN menu_items ON menu_items.id = menu_item_id
JOIN orders ON orders.id = order_id
JOIN users ON users.id = user_id
WHERE users.id = 7 AND pick_up_time IS NOT NULL
GROUP BY orders.id
ORDER BY order_id DESC;

SELECT orders.id as order_id, menu_items.item_name as item, price, customizations.spiciness, customizations.item_size, customizations.hot
FROM customizations
JOIN menu_items ON menu_items.id = menu_item_id
JOIN orders ON orders.id = order_id
JOIN users ON users.id = user_id
WHERE users.id = 7 AND pick_up_time IS NOT NULL
ORDER BY order_id DESC;
