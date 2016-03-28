# working version
CREATE DATABASE tech_bags;
\c tech_bags
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), password_hash VARCHAR(255), email VARCHAR(255));
CREATE TABLE products (id SERIAL PRIMARY KEY, product_name VARCHAR(255), manufacturer VARCHAR(255), product_dimension_length DECIMAL, product_dimension_height DECIMAL, product_dimension_width DECIMAL);
