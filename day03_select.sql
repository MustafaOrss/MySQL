-- ************************ Anadolu Lisesi Tablosundan *****************************
-- Q1 : Okul_no'su 1005'ten buyuk olan ogrencilerin tum bilgilerini listeleyin.
-- Q2 : Ismi Anil Fidan olan ogrencinin derecesini listeleyin.
-- Q3 : Derecesi 90'dan buyuk olan ogrencilerin okul_no ve isimlerini listeleyin.
-- Q4 : Okul nosu 1003 ile 1007 arasinda olan ogrencilerin sehrini listeleyin 
-- Q5 : Istanbul'da yasayan ogrencilerin isimlerini listeleyin.
-- *********************************************************************************

use sys;
CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);

INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);

select * from ogretmen_lisesi;

/*-------------------------------------------------------------------------
Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
select * from ogretmen_lisesi where sinav_notu > 80; 
/*-------------------------------------------------------------------------
Q2: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listeleyin.
---------------------------------------------------------------------------*/

select isim, adres from ogretmen_lisesi where adres='Ankara';

/*-------------------------------------------------------------------------
Q3: id'si 114 olan ogrencinin adini listeleyin.
---------------------------------------------------------------------------*/
select isim from ogretmen_lisesi where id=114;

/*-------------------------------------------------------------------------
Q4: id'si 115'ten buyuk olan ogrencilerin sehirlerini listeleyin.
---------------------------------------------------------------------------*/
select adres from ogretmen_lisesi where id>115;

/*-------------------------------------------------------------------------
Q5: Istanbulda yasayan ogrencilerin adini listeleyin.
---------------------------------------------------------------------------*/
select isim from ogretmen_lisesi where adres='Istanbul';

/*-------------------------------------------------------------------------
Q6: id'si 113ten buyuk 116'dan kucuk olan ogrencilerin derecesini listeleyin.
---------------------------------------------------------------------------*/ 
select sinav_notu from ogretmen_lisesi where id>113 and id<116;

/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
=========================================================================================*/
/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50  sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/


/*-------------------------------------------------------------------------
Q7: Sinav notu 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
--                            1. Yol                             
 select * from ogretmen_lisesi where sinav_notu>=70 and sinav_notu<=80;  
 
--                            2. Yol                            
 
select * from ogretmen_lisesi where sinav_notu between 70 and 80;

/*-------------------------------------------------------------------------
Q8: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

select isim from ogretmen_lisesi where isim between 'Muhammet Talha' and 'Murat'; 

-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.
/*-------------------------------------------------------------------------
Q9: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

select isim, adres from ogretmen_lisesi where adres between 'Ankara' and 'Corum'; 

-- **************************************************************
CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);
SELECT * FROM personel;
/*-------------------------------------------------------------------------
Q10: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

select * from personel where isim between 'Mehmet Yilmaz'  AND  'Veli';


-- Between komutu ile belli bir araliktaki kayitlari listelemek istedigimizde;
-- filtrelemeyi verilen araliga gore yapar, yazdirmayida tablodaki kayit sirasina gore yapar. 

/*-------------------------------------------------------------------------
Q11: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

select * from personel where isim between 'Ahmet' and 'Ayse';

/*-------------------------------------------------------------------------
Q13: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/

select id from personel where isim = 'Ayse' or maas =7000 ;

/*-------------------------------------------------------------------------
Q14: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

select isim from personel where id=10001 or id=10005 or id =10008;