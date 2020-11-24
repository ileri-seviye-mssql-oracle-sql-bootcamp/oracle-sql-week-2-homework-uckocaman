-- Kotasý limitsiz olan ürünler hangileridir?
SELECT * FROM TELCO.PRODUCT WHERE QUOTA = 'LIMITLESS';

--Statüsü 'Initial' olan müþterileri bulunuz
SELECT * FROM TELCO.CUSTOMER WHERE STATUS = 'INITIAL';

-- Þehir bilgisi 'ISTANBUL' olan adresleri bulunuz.
SELECT * FROM TELCO.ADDRESS WHERE  CITY = 'Istanbul';

-- Birim fiyatý 150'den büyük olan order_itemlarý bulunuz. 
SELECT * FROM SALES.ORDER_ITEMS WHERE UNIT_PRICE > 150;

-- Ýþe alým tarihi Mayýs 2016 olan çalýþanlarý bulunuz. 
SELECT * FROM SALES.EMPLOYEES WHERE EXTRACT(YEAR FROM TO_DATE(HIRE_DATE, 'dd/mm/yyyy')) = 2016 AND EXTRACT(MONTH FROM TO_DATE(HIRE_DATE, 'dd/mm/yyyy')) = 5;

-- Adý Charlie ya da Charlsie olan contactlarý bulunuz. 
SELECT * FROM SALES.CONTACTS WHERE FIRST_NAME = 'Charlie' OR FIRST_NAME = 'Charlsie';

--Yýlýn 4. aylarýnda en çok hangi amaçla kredi çekilmi?tir?
SELECT PURPOSE, COUNT(PURPOSE) FROM BANKING.LOANS WHERE MONTH = 4 GROUP BY PURPOSE ORDER BY COUNT(PURPOSE) DESC FETCH FIRST 1 ROW ONLY;

-- Adet sayýsý 10dan büyük 50den küçük envanterleri bulunuz. 
SELECT * FROM SALES.INVENTORIES WHERE QUANTITY BETWEEN 10 AND 50;

-- Birincil iletiþim bilgisi olmayan telefon numaralarýný bulunuz.
SELECT * FROM TELCO.CONTACT WHERE IS_PRIMARY != 1 AND CNT_TYPE = 'PHONE';

-- Bir sipariþte toplam 100.0000'den fazla ücret ödeyen emirler nedir? 
SELECT ORDER_ID, ITEM_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE,(QUANTITY * UNIT_PRICE) AS TOTAL_PRICE  
FROM SALES.ORDER_ITEMS WHERE (QUANTITY * UNIT_PRICE) > 100000;

-- Bankanýn 50 ve ya 51 yaþýnda kadýn müþterilerinden ayný isme sahip olan müþterisi/müþterileri var mý? Varsa isimleri neler?
SELECT FIRST FROM BANKING.CLIENTS WHERE SEX = 'Female' AND (AGE = 50 OR AGE = 51) GROUP BY FIRST HAVING COUNT(*) > 1;

-- Hesap ödeme þekli nakit olmayan hesaplar hangileridir?
SELECT * FROM TELCO.ACCOUNT WHERE PAYMENT_TYPE != 'CASH';

-- Statüsü deaktif olan müþterilerin baðlantý kesim tarihleri nedir?
SELECT STATUS,DISCONNECTION_DATE FROM TELCO.CUSTOMER WHERE STATUS = 'DEACTIVE';

-- Manager'ý olmayan çalýþanlar hangileridir?
SELECT * FROM SALES.EMPLOYEES WHERE MANAGER_ID IS NULL;

-- State bilgisi boþ olan lokasyonlarý bulunuz.
SELECT * FROM SALES.LOCATIONS WHERE STATE IS NULL;

-- Hesap kapanýþ tarihi dolu olan hesaplarý bulunuz.
SELECT * FROM TELCO.ACCOUNT WHERE ACCOUNT_CLOSING_DATE IS NOT NULL;

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir?
SELECT * FROM TELCO.ACCOUNT WHERE E_BILL_EMAIL IS NOT NULL;

-- Durumu iptal olan ve satýcýlarý olmayan emirler hangileridir? 
SELECT * FROM SALES.ORDERS WHERE STATUS = 'Canceled' AND SALESMAN_ID IS NULL;

-- Sözleþme bitiþ tarihi 1 Ocak 2000'den büyük , 1 Ocak 2005'ten küçük olan sözleþmeleri bulunuz.
SELECT * FROM TELCO.AGREEMENT WHERE COMMITMENT_END_DATE BETWEEN TO_DATE('2000/01/01', 'yyyy/mm/dd') AND TO_DATE('2005/01/01', 'yyyy/mm/dd');

-- Ocak 2016 ile Haziran 2016 arasýnda verilen sipariþler hangileridir? 
SELECT * FROM SALES.ORDERS WHERE ORDER_DATE BETWEEN TO_DATE('01/01/2016', 'dd/mm/yyyy') AND TO_DATE('01/06/2016', 'dd/mm/yyyy');

-- 2005 yýlýndan önce yapýlan ve hala aktif olan subscriptionlar hangileridir?
SELECT * FROM TELCO.SUBSCRIPTION WHERE EXTRACT(YEAR FROM TO_DATE(CREATE_DATE, 'dd/mm/yyyy')) <2005 AND STATUS = 'ACTIVE';

-- Sözleþme baþlangýç tarihi Ocak 2010'dan büyük olan sözleþmeleri bulunuz.
SELECT * FROM TELCO.AGREEMENT WHERE EXTRACT(YEAR FROM TO_DATE(COMMITMENT_START_DATE, 'dd/mm/yyyy')) > 2010;

-- Ýsmi E ile baþlayan müþterileri bulunuz. 
SELECT * FROM TELCO.CUSTOMER WHERE NAME LIKE 'E%';

-- Product tipi 'DSL' ile biten ürünleri bulunuz.
SELECT * FROM TELCO.PRODUCT WHERE PRODUCT_TYPE LIKE '%DSL';

-- Unvaný 'S' ile baþlamayan çalýþanlarý bulunuz. 
SELECT * FROM SALES.EMPLOYEES WHERE JOB_TITLE NOT LIKE 'S%';

-- Herhangi bir çeþit Intel Xeon ürünler hangileridir?
SELECT * FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE '%Intel Xeon%';

-- Ýsminde ya da soyisminde 'ü' harfi geçen müþteriler hangileridir? -
SELECT * FROM TELCO.CUSTOMER WHERE NAME LIKE '%ü%' OR SURNAME LIKE '%ü%';

-- Ýsmi 'C' ile baþlayan kontaklar hangileridir? Soyadýna göre alfabetik sýra ile sýralayalým.
SELECT * FROM SALES.CONTACTS WHERE FIRST_NAME LIKE 'C%' ORDER BY LAST_NAME;

-- Ürün adý 'Asus' ile baþlayan ve liste fiyatý standart ücretinden küçük olan ürünleri bulunuz.
-- Tabloda standart ücret yerine standart maliyet var ve tüm maliyetlet liste fiyatýndan düþük
SELECT * FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE 'Asus%' AND LIST_PRICE < STANDARD_COST;

-- Ülke kodu UK ve AU olan adresleri bulunuz.
SELECT * FROM TELCO.ADDRESS WHERE COUNTRY_CD IN('UK','AU');

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. 
SELECT * FROM SALES.PRODUCT_CATEGORIES WHERE CATEGORY_ID IN('1','2','4','5');

-- Taahhüt süresi 240 ve 120 ay olan bütün sözleþmeleri bulmak istiyoruz.
SELECT * FROM TELCO.AGREEMENT WHERE COMMITMENT_DURATION LIKE '%240%' OR COMMITMENT_DURATION LIKE '%120%';

-- Sipariþ durumu 'Shipped'den farklý olan müþterilerin bilgilerini bulunuz. 
SELECT * FROM SALES.ORDERS WHERE STATUS != 'Shipped';

-- Adet sayýsý 100e eþit olan envanterlerin product bilgisini bulunuz.
SELECT * FROM SALES.INVENTORIES 
INNER JOIN SALES.PRODUCTS 
ON INVENTORIES.PRODUCT_ID = PRODUCTS.PRODUCT_ID 
WHERE INVENTORIES.QUANTITY = 100 ;

-- Sözleþme alt tipi MAIN olan kaç tane sözleþme vardýr?
SELECT COUNT(*) FROM TELCO.AGREEMENT WHERE SUBTYPE = 'MAIN';

-- Deaktif müþterilerin sayýsýný bulunuz.
SELECT COUNT(*) FROM TELCO.CUSTOMER WHERE STATUS = 'DEACTIVE';

-- Beijing (8 numaralý warehouse)'da kaç farklý envanter vardýr? 
SELECT COUNT(DISTINCT(QUANTITY)) FROM SALES.INVENTORIES WHERE WAREHOUSE_ID = 8;

-- Ýletiþim tipi olarak email ve statusu kullanýmda olan kaç müþteri var?
SELECT COUNT(*) FROM TELCO.CONTACT WHERE CNT_TYPE = 'EMAIL' AND STATUS = 'USED';

-- Liste fiyati 1000 ile 3000 arasinda olan kaç product var?
SELECT COUNT(*) FROM SALES.PRODUCTS WHERE LIST_PRICE BETWEEN 1000 AND 3000;

--Hangi yýllarda kaç hesap açýlmýþtýr?
SELECT YEAR, COUNT(*) FROM BANKING.ACCOUNTS GROUP BY YEAR ORDER BY YEAR;

-- Ýþlemlerin tiplerine göre toplam sayýlarýnýn büyükten küçüðe sýralamasý nedir?
SELECT TYPE, COUNT(*) AS TOTAL FROM BANKING.TRANSACTIONS GROUP BY TYPE ORDER BY COUNT(*) DESC;

-- Ýþlemlerin tiplerine göre toplam tutarlarýnýn büyükten küçüðe sýralamasý nedir?
SELECT TYPE, SUM(AMOUNT) AS TOTAL_AMOUNT FROM BANKING.TRANSACTIONS GROUP BY TYPE ORDER BY SUM(AMOUNT)DESC;