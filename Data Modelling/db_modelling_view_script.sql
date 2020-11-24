--Oluþturmuþ olduðunuz tablolarý kaynak olarak alan bir adet synonym, bir adet view scripti oluþturunuz.

CREATE VIEW tumSiparisler AS SELECT * FROM week2.orders;
CREATE VIEW birdenFazlaUrun AS SELECT * FROM week2.order_details WHERE quantity > 1;
CREATE VIEW adýUileBaslayan AS SELECT * FROM week2.customer WHERE name LIKE 'U%';