--Olu�turmu� oldu�unuz tablolar� kaynak olarak alan bir adet synonym, bir adet view scripti olu�turunuz.

CREATE VIEW tumSiparisler AS SELECT * FROM week2.orders;
CREATE VIEW birdenFazlaUrun AS SELECT * FROM week2.order_details WHERE quantity > 1;
CREATE VIEW ad�UileBaslayan AS SELECT * FROM week2.customer WHERE name LIKE 'U%';