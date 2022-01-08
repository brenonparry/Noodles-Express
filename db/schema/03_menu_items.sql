DROP TABLE IF EXISTS menu_items CASCADE;

CREATE TABLE menu_items (
  id SERIAL PRIMARY KEY NOT NULL,
  item_name VARCHAR(255) NOT NULL,
  price MONEY NOT NULL DEFAULT 0,
  description VARCHAR(255) NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  thumbnail_url VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL
);
