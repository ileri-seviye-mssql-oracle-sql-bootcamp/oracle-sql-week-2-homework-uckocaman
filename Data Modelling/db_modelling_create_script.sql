--3 adet tablo create scripti oluşturunuz. Her bir tablonun minimum 5 kolonu olması gerekmektedir. OK
--Tabloları birbirine bağlayacak primary key ve foreign key tanımlarının olmasına dikkat edilmelidir. OK 

--alter session set "_ORACLE_SCRIPT"=true;  
--CREATE USER week2 IDENTIFIED BY week123;
--GRANT CREATE SESSION TO week2;
--GRANT CONNECT, RESOURCE, DBA TO week2;

CREATE SEQUENCE customer_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE order_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE status_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE week2.customer(
    customer_id INTEGER DEFAULT customer_id_seq.nextval NOT NULL,
    name VARCHAR2(50) NOT NULL,
    surname VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY(customer_id)
);

CREATE TABLE week2.status(
    id INTEGER DEFAULT status_id_seq.nextval NOT NULL,
    status_type VARCHAR2(25) NOT NULL,
    CONSTRAINT status_pk PRIMARY KEY(id)
);

CREATE TABLE week2.orders(
    order_id INTEGER DEFAULT order_id_seq.nextval NOT NULL ,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    status_id INTEGER NOT NULL,
    total_price NUMBER(8,2) NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY(order_id),
    CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES week2.customer(customer_id),
    CONSTRAINT status_fk FOREIGN KEY (status_id) REFERENCES week2.status(id)
);

CREATE TABLE week2.order_details(
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    price NUMBER(8,2) NOT NULL,
    quantity INTEGER NOT NULL,
    discount NUMBER(4,2) NOT NULL,
    CONSTRAINT order_fk FOREIGN KEY (order_id) REFERENCES week2.orders(order_id)
    --,CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES product(product_id)
);
