--Tablolara minimum 3 satýr veri insert edecek scriptleri oluþturunuz.

INSERT INTO week2.customer (name,surname,email,phone) VALUES ('Umut Can','Kocaman','umutcan_kocaman@hotmail.com','+905555555555');
INSERT INTO week2.customer (name,surname,email,phone) VALUES ('Ahmet','Aslan','ahmetaslan@hotmail.com','+905536363636');
INSERT INTO week2.customer (name,surname,email,phone) VALUES ('Eda','Yýlmaz','edayilmaz@hotmail.com','+905569996669');

INSERT INTO week2.status (status_type) VALUES ('Siparis Alindi');
INSERT INTO week2.status (status_type) VALUES ('Kargoya Verildi');
INSERT INTO week2.status (status_type) VALUES ('Teslim Edildi');

INSERT INTO week2.orders (customer_id, order_date, status_id, total_price) VALUES (1,TO_DATE('2020/11/21 18:02:44', 'yyyy/mm/dd hh24:mi:ss'),3,265.28);
INSERT INTO week2.orders (customer_id,order_date,status_id,total_price) VALUES (2,TO_DATE('2020/11/22 11:33:52', 'yyyy/mm/dd hh24:mi:ss'),'2',99.98);
INSERT INTO week2.orders (customer_id,order_date,status_id,total_price) VALUES (3,TO_DATE('2020/11/23 23:48:01', 'yyyy/mm/dd hh24:mi:ss'),1 ,159.89);

INSERT INTO week2.order_details (order_id,product_id,price,quantity,discount) VALUES (1,17,120.14,1,20);
INSERT INTO week2.order_details (order_id,product_id,price,quantity,discount) VALUES (1,18,145.14,1,15);
INSERT INTO week2.order_details (order_id,product_id,price,quantity,discount) VALUES (2,3,49.99,2,0);

