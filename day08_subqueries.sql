
/*================================= SUBQUERY =================================
    Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/

CREATE TABLE calisanlar
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');

CREATE TABLE sirketler

(
sirket_id int,
sirket varchar(20),
calisanlar_sayisi int
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

SELECT * FROM calisanlar;
SELECT * FROM sirketler;

-- ======================== WHERE ile SUBQUERY ===========================
/*----------------------------------------------------------------
 1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/ 

-- 1. Adim

select sirket from sirketler where calisanlar_sayisi >15000;

-- 2. Adim 

select isim from calisanlar where sirket IN ('Ford','Toyota');

-- 3. Adim ilk 2 Adimi birlestir


select isim from calisanlar where sirket IN (select sirket from sirketler where calisanlar_sayisi >15000);

-- Honda sirketinin calisanlar sayisini 16000 olarak guncelleyiniz

update sirketler set calisanlar_sayisi = 16000
where sirket = 'Honda';

-- Ford sirketinin calisanlar sayisini 13000 olarak guncelleyiniz

update sirketler set calisanlar_sayisi = 13000
where sirket = 'Ford';

select  * from sirketler;

/*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/

select sirket from sirketler where sirket_id>101; 

select sehir, maas, sirket from calisanlar where sirket IN ('Hyundai', 'Toyota');



select sehir, maas, sirket from calisanlar where sirket IN (
select sirket from sirketler where sirket_id>101);

/*----------------------------------------------------------------                
  3) Ankara'daki sirketlerin sirket id ve personel 
  sayilarini listeleyiniz.
----------------------------------------------------------------*/

select sirket_id, calisanlar_sayisi, sirket from sirketler where sirket IN (select sirket from calisanlar where sehir = 'Ankara');

/*----------------------------------------------------------------                
  4) Veli Yilmaz isimli personelin calistigi sirketlerin sirket 
  ismini ve personel sayilarini listeleyiniz.
----------------------------------------------------------------*/

select sirket, calisanlar_sayisi from sirketler where sirket In (select sirket from calisanlar where isim = 'Veli Yilmaz');