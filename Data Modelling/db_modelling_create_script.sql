--3 adet tablo create scripti oluşturunuz. Her bir tablonun minimum 5 kolonu olması gerekmektedir. OK
--Tabloları birbirine bağlayacak primary key ve foreign key tanımlarının olmasına dikkat edilmelidir. OK 

--alter session set "_ORACLE_SCRIPT"=true;  
--CREATE USER week2 IDENTIFIED BY week123;
--GRANT CREATE SESSION TO week2;
--GRANT CONNECT, RESOURCE, DBA TO week2;

CREATE SEQUENCE customer_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE order_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE status_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE category_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE brand_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE employee_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE address_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE country_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE city_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE district_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE week2.customer(
    customer_id INTEGER DEFAULT customer_id_seq.nextval NOT NULL,
    name VARCHAR2(50) NOT NULL,
    surname VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    address_id INTEGER NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY(customer_id)
    CONSTRAINT customer_address_fk FOREIGN KEY (address_id) REFERENCES week2.address(address_id)
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
    CONSTRAINT order_fk FOREIGN KEY (order_id) REFERENCES week2.orders(order_id),
    CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE products(
    product_id INTEGER DEFAULT product_id_seq.nextval NOT NULL,
    product_name VARCHAR2(50) NOT NULL,
    category_id INTEGER NOT NULL,
    unit_price NUMBER(8,2) NOT NULL,
    brand_id INTEGER NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY(product_id),
    CONSTRAINT category_fk FOREIGN KEY (category_id) REFERENCES week2.categoryTbl(category_id),
    CONSTRAINT brand_fk FOREIGN KEY (brand_id) REFERENCES week2.brand(brand_id)
);

CREATE TABLE categoryTbl(
    category_id INTEGER DEFAULT category_id_seq.nextval NOT NULL,
    category_name VARCHAR2(50) NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY(category_id)
);

CREATE TABLE brand(
    brand_id INTEGER DEFAULT brand_id_seq.nextval NOT NULL,
    brand_name VARCHAR2(50) NOT NULL,
    CONSTRAINT brand_pk PRIMARY KEY(brand_id)
);

CREATE TABLE week2.address(
    address_id INTEGER DEFAULT address_id_seq.nextval NOT NULL,
    country_id INTEGER NOT NULL,
    city_id INTEGER NOT NULL,
    district_id INTEGER NOT NULL,
    address_line1 VARCHAR2(100) NOT NULL,
    address_line2 VARCHAR2(100),
    CONSTRAINT addres_pk PRIMARY KEY(addres_id),
    CONSTRAINT country_fk FOREIGN KEY (country_id) REFERENCES week2.country(country_id),
    CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES week2.city(city_id),
    CONSTRAINT district_fk FOREIGN KEY (district_id) REFERENCES week2.district(district_id)
);

CREATE TABLE country(
    country_id INTEGER DEFAULT country_id_seq.nextval NOT NULL,
    country VARCHAR2(50)NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY(country_id)
);

CREATE TABLE city(
    city_id INTEGER DEFAULT city_id_seq.nextval NOT NULL,
    city VARCHAR2(50)NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY(city_id)
);

CREATE TABLE city(
    district_id INTEGER DEFAULT district_id_seq.nextval NOT NULL,
    district VARCHAR2(50)NOT NULL,
    CONSTRAINT district_pk PRIMARY KEY(district_id)
);

CREATE TABLE week2.employees(
    employee_id INTEGER DEFAULT employee_id_seq.nextval NOT NULL,
    name VARCHAR2(50) NOT NULL,
    surname VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    address_id INTEGER NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY(customer_id),
    CONSTRAINT employee_address_fk FOREIGN KEY (address_id) REFERENCES week2.address(address_id)
);
