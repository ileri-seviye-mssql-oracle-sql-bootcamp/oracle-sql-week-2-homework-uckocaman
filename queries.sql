-- Kotas� limitsiz olan �r�nler hangileridir?
SELECT * FROM TELCO.PRODUCT WHERE QUOTA = 'LIMITLESS';

--Stat�s� 'Initial' olan m��terileri bulunuz
SELECT * FROM TELCO.CUSTOMER WHERE STATUS = 'INITIAL';

-- �ehir bilgisi 'ISTANBUL' olan adresleri bulunuz.
SELECT * FROM TELCO.ADDRESS WHERE  CITY = 'Istanbul';

-- Birim fiyat� 150'den b�y�k olan order_itemlar� bulunuz. 
SELECT * FROM SALES.ORDER_ITEMS WHERE UNIT_PRICE > 150;

-- ��e al�m tarihi May�s 2016 olan �al��anlar� bulunuz. 
SELECT * FROM SALES.EMPLOYEES WHERE EXTRACT(YEAR FROM TO_DATE(HIRE_DATE, 'dd/mm/yyyy')) = 2016 AND EXTRACT(MONTH FROM TO_DATE(HIRE_DATE, 'dd/mm/yyyy')) = 5;

-- Ad� Charlie ya da Charlsie olan contactlar� bulunuz. 
SELECT * FROM SALES.CONTACTS WHERE FIRST_NAME = 'Charlie' OR FIRST_NAME = 'Charlsie';

--Y�l�n 4. aylar�nda en �ok hangi ama�la kredi �ekilmi?tir?
SELECT PURPOSE, COUNT(PURPOSE) FROM BANKING.LOANS WHERE MONTH = 4 GROUP BY PURPOSE ORDER BY COUNT(PURPOSE) DESC FETCH FIRST 1 ROW ONLY;

-- Adet say�s� 10dan b�y�k 50den k���k envanterleri bulunuz. 
SELECT * FROM SALES.INVENTORIES WHERE QUANTITY BETWEEN 10 AND 50;

-- Birincil ileti�im bilgisi olmayan telefon numaralar�n� bulunuz.
SELECT * FROM TELCO.CONTACT WHERE IS_PRIMARY != 1 AND CNT_TYPE = 'PHONE';

-- Bir sipari�te toplam 100.0000'den fazla �cret �deyen emirler nedir? 
SELECT ORDER_ID, ITEM_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE,(QUANTITY * UNIT_PRICE) AS TOTAL_PRICE  
FROM SALES.ORDER_ITEMS WHERE (QUANTITY * UNIT_PRICE) > 100000;

-- Bankan�n 50 ve ya 51 ya��nda kad�n m��terilerinden ayn� isme sahip olan m��terisi/m��terileri var m�? Varsa isimleri neler?
SELECT FIRST FROM BANKING.CLIENTS WHERE SEX = 'Female' AND (AGE = 50 OR AGE = 51) GROUP BY FIRST HAVING COUNT(*) > 1;

-- Hesap �deme �ekli nakit olmayan hesaplar hangileridir?
SELECT * FROM TELCO.ACCOUNT WHERE PAYMENT_TYPE != 'CASH';

-- Stat�s� deaktif olan m��terilerin ba�lant� kesim tarihleri nedir?
SELECT STATUS,DISCONNECTION_DATE FROM TELCO.CUSTOMER WHERE STATUS = 'DEACTIVE';

-- Manager'� olmayan �al��anlar hangileridir?
SELECT * FROM SALES.EMPLOYEES WHERE MANAGER_ID IS NULL;

-- State bilgisi bo� olan lokasyonlar� bulunuz.
SELECT * FROM SALES.LOCATIONS WHERE STATE IS NULL;

-- Hesap kapan�� tarihi dolu olan hesaplar� bulunuz.
SELECT * FROM TELCO.ACCOUNT WHERE ACCOUNT_CLOSING_DATE IS NOT NULL;

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir?
SELECT * FROM TELCO.ACCOUNT WHERE E_BILL_EMAIL IS NOT NULL;

-- Durumu iptal olan ve sat�c�lar� olmayan emirler hangileridir? 
SELECT * FROM SALES.ORDERS WHERE STATUS = 'Canceled' AND SALESMAN_ID IS NULL;

-- S�zle�me biti� tarihi 1 Ocak 2000'den b�y�k , 1 Ocak 2005'ten k���k olan s�zle�meleri bulunuz.
SELECT * FROM TELCO.AGREEMENT WHERE COMMITMENT_END_DATE BETWEEN TO_DATE('2000/01/01', 'yyyy/mm/dd') AND TO_DATE('2005/01/01', 'yyyy/mm/dd');

-- Ocak 2016 ile Haziran 2016 aras�nda verilen sipari�ler hangileridir? 
SELECT * FROM SALES.ORDERS WHERE ORDER_DATE BETWEEN TO_DATE('01/01/2016', 'dd/mm/yyyy') AND TO_DATE('01/06/2016', 'dd/mm/yyyy');

-- 2005 y�l�ndan �nce yap�lan ve hala aktif olan subscriptionlar hangileridir?
SELECT * FROM TELCO.SUBSCRIPTION WHERE EXTRACT(YEAR FROM TO_DATE(CREATE_DATE, 'dd/mm/yyyy')) <2005 AND STATUS = 'ACTIVE';

-- S�zle�me ba�lang�� tarihi Ocak 2010'dan b�y�k olan s�zle�meleri bulunuz.
SELECT * FROM TELCO.AGREEMENT WHERE EXTRACT(YEAR FROM TO_DATE(COMMITMENT_START_DATE, 'dd/mm/yyyy')) > 2010;

-- �smi E ile ba�layan m��terileri bulunuz. 
SELECT * FROM TELCO.CUSTOMER WHERE NAME LIKE 'E%';

-- Product tipi 'DSL' ile biten �r�nleri bulunuz.
SELECT * FROM TELCO.PRODUCT WHERE PRODUCT_TYPE LIKE '%DSL';

-- Unvan� 'S' ile ba�lamayan �al��anlar� bulunuz. 
SELECT * FROM SALES.EMPLOYEES WHERE JOB_TITLE NOT LIKE 'S%';

-- Herhangi bir �e�it Intel Xeon �r�nler hangileridir?
SELECT * FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE '%Intel Xeon%';

-- �sminde ya da soyisminde '�' harfi ge�en m��teriler hangileridir? -
SELECT * FROM TELCO.CUSTOMER WHERE NAME LIKE '%�%' OR SURNAME LIKE '%�%';

-- �smi 'C' ile ba�layan kontaklar hangileridir? Soyad�na g�re alfabetik s�ra ile s�ralayal�m.
SELECT * FROM SALES.CONTACTS WHERE FIRST_NAME LIKE 'C%' ORDER BY LAST_NAME;

-- �r�n ad� 'Asus' ile ba�layan ve liste fiyat� standart �cretinden k���k olan �r�nleri bulunuz.
-- Tabloda standart �cret yerine standart maliyet var ve t�m maliyetlet liste fiyat�ndan d���k
SELECT * FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE 'Asus%' AND LIST_PRICE < STANDARD_COST;

-- �lke kodu UK ve AU olan adresleri bulunuz.
SELECT * FROM TELCO.ADDRESS WHERE COUNTRY_CD IN('UK','AU');

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. 
SELECT * FROM SALES.PRODUCT_CATEGORIES WHERE CATEGORY_ID IN('1','2','4','5');

-- Taahh�t s�resi 240 ve 120 ay olan b�t�n s�zle�meleri bulmak istiyoruz.
SELECT * FROM TELCO.AGREEMENT WHERE COMMITMENT_DURATION LIKE '%240%' OR COMMITMENT_DURATION LIKE '%120%';

-- Sipari� durumu 'Shipped'den farkl� olan m��terilerin bilgilerini bulunuz. 
SELECT * FROM SALES.ORDERS WHERE STATUS != 'Shipped';

-- Adet say�s� 100e e�it olan envanterlerin product bilgisini bulunuz.
SELECT * FROM SALES.INVENTORIES 
INNER JOIN SALES.PRODUCTS 
ON INVENTORIES.PRODUCT_ID = PRODUCTS.PRODUCT_ID 
WHERE INVENTORIES.QUANTITY = 100 ;

-- S�zle�me alt tipi MAIN olan ka� tane s�zle�me vard�r?
SELECT COUNT(*) FROM TELCO.AGREEMENT WHERE SUBTYPE = 'MAIN';

-- Deaktif m��terilerin say�s�n� bulunuz.
SELECT COUNT(*) FROM TELCO.CUSTOMER WHERE STATUS = 'DEACTIVE';

-- Beijing (8 numaral� warehouse)'da ka� farkl� envanter vard�r? 
SELECT COUNT(DISTINCT(QUANTITY)) FROM SALES.INVENTORIES WHERE WAREHOUSE_ID = 8;

-- �leti�im tipi olarak email ve statusu kullan�mda olan ka� m��teri var?
SELECT COUNT(*) FROM TELCO.CONTACT WHERE CNT_TYPE = 'EMAIL' AND STATUS = 'USED';

-- Liste fiyati 1000 ile 3000 arasinda olan ka� product var?
SELECT COUNT(*) FROM SALES.PRODUCTS WHERE LIST_PRICE BETWEEN 1000 AND 3000;

--Hangi y�llarda ka� hesap a��lm��t�r?
SELECT YEAR, COUNT(*) FROM BANKING.ACCOUNTS GROUP BY YEAR ORDER BY YEAR;

-- ��lemlerin tiplerine g�re toplam say�lar�n�n b�y�kten k����e s�ralamas� nedir?
SELECT TYPE, COUNT(*) AS TOTAL FROM BANKING.TRANSACTIONS GROUP BY TYPE ORDER BY COUNT(*) DESC;

-- ��lemlerin tiplerine g�re toplam tutarlar�n�n b�y�kten k����e s�ralamas� nedir?
SELECT TYPE, SUM(AMOUNT) AS TOTAL_AMOUNT FROM BANKING.TRANSACTIONS GROUP BY TYPE ORDER BY SUM(AMOUNT)DESC;