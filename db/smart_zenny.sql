DROP TABLE transactions;
DROP TABLE cargos;

CREATE TABLE cargos (
id SERIAL8 PRIMARY KEY,
description VARCHAR(255)
);

CREATE TABLE transactions (
id SERIAL8 PRIMARY KEY,
vendor_name VARCHAR(255),
planet_name VARCHAR(255),
value INT8,
cargo_id INT8 REFERENCES cargos(id)
);
