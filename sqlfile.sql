CREATE TABLE Locations (
  location_id SERIAL PRIMARY KEY,
  location_name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE Inventory (
  inventory_id SERIAL PRIMARY KEY,
  item_name VARCHAR(50) NOT NULL,
  item_description VARCHAR(100) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  location_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE Employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  hourly_pay_rate DECIMAL(8,2) NOT NULL,
  location_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


CREATE SEQUENCE locations_seq START 1;
CREATE SEQUENCE inventory_seq START 1;
CREATE SEQUENCE employees_seq START 1;


INSERT INTO Locations (location_id, location_name, address, phone_number)
VALUES (nextval('locations_seq'), 'Store 1', '123 Main St', '555-555-1212');

INSERT INTO Inventory (inventory_id, item_name, item_description, quantity, price, location_id)
VALUES (nextval('inventory_seq'), 'Widget', 'A small widget', 100, 1.99, 1);

INSERT INTO Employees (employee_id, first_name, last_name, hourly_pay_rate, location_id)
VALUES (nextval('employees_seq'), 'John', 'Doe', 15.00, 1);
