create database Inventory_Management_System;
USE DATABASE Inventory_Management_System;

create table inventory_items (item_id int primary key, description varchar(50), unit_price decimal(10,2), quantity int);
insert into inventory_items (item_id, description, unit_price, quantity) VALUES
(1001, 'Widget A', 9.99, 50),
(1002, 'Widget B', 12.50, 25),
(1003, 'Gadget X', 19.99, 100),
(1004, 'Gizmo Y', 7.25, 75),
(1005, 'Doohickey Z', 4.99, 200);

create table suppliers (supplier_id int primary key, name varchar(50), address varchar(100));
insert into suppliers (supplier_id, name, address) VALUES
(101, 'ABC Inc.', '123 Main St, Anytown USA'),
(102, 'XYZ Corp.', '456 Oak Rd, Somewhere City'),
(103, 'Parts Depot', '789 Elm Ave, Elsewhere State');

create table orders (order_id int primary key, order_date date, customer_supplier varchar(50), status varchar(10));
insert INTO orders (order_id, order_date, customer_supplier, status) VALUES
(10001, '2023-04-15', 'ABC Inc.', 'Placed'),
(10002, '2023-05-01', 'Customer A', 'Shipped'),
(10003, '2023-05-20', 'XYZ Corp.', 'Pending'),
(10004, '2023-06-01', 'Customer B',	'Received'),
(10005, '2023-06-10', 'Parts Depot', 'Placed');

create table transactions (transaction_id int primary key, transaction_type varchar(10), quantity int, transaction_date date);
insert into transactions (transaction_id, transaction_type, quantity, transaction_date) VALUES
(1001, 'Purchase', 100,	'2023-04-10'),
(1002, 'Sale', 25, '2023-04-20'),
(1003, 'Purchase', 50, '2023-05-05'),
(1004, 'Sale', 10, '2023-05-15'),
(1005, 'Transfer', 15, '2023-06-01');

-- Current quantity and value of each inventory item
select description, unit_price, quantity from inventory_items;

-- all the inventory items with a quantity less than 50
select description from inventory_items where quantity<50;

-- Total value of inventory items
select description, (unit_price*quantity) as total_value from inventory_items;

-- all the suppliers and the total number of orders placed with each.
select suppliers.name, count(orders.status) from suppliers inner join orders on suppliers.name=orders.customer_supplier where orders.status='Placed';

-- Top 5 sold inventory items
select description from inventory_items order by quantity desc limit 5;

-- Items greater than rs10 unit price
select description from inventory_items where unit_price>10;

-- Suppliers living in anytown USA
select name from suppliers where address LIKE '%anytown%';

-- Purchased transactions
select * from transactions where transaction_type='Purchase';

-- Update the quantity of Widget A to 75
Update inventory_items set quantity=75 where description='Widget A';

-- Update address of XYX Corp.
update suppliers set address='789 Oak Rd, Somewhere City' where name='XYZ Corp.';

-- Update the quantity of transaction
Update transactions set quantity=75 where transaction_id=1003;

-- Delete item with id 1005
delete from inventory_items where item_id=1005;

-- Delete supplier with id 103
delete from suppliers where supplier_id=103;

-- Delete order with id 10005
delete from orders where order_id=10005;

-- Delete transaction with id 1005
delete from transactions where transaction_id=1005;

-- Orders from ABC Inc.
select * from orders where customer_supplier='ABC Inc.';

-- Update the delivery status
update orders set status='Delivered' where order_id=10002;