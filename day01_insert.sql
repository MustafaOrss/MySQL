/*
==============================================
		VERI GIRISI
==============================================*/


 

-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL ‘in default tarih formati YYYY-MM-DD seklindedir.

 
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.
use sys;

create table fen_lisesi
(
	okul_no char(3) UNIQUE,
    isim varchar(25) not null,
    derece double,
    adres varchar(50),
    last_update date
);

 

INSERT INTO fen_lisesi VALUES (101, 'Mehmet Dag', 4.5, 'Ankara','2023-01-20');
INSERT INTO fen_lisesi VALUES (102, 'Berrin Hanim', 4.6, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (103, 'Mehmet Erden', 3.9, 'Izmir','2023-01-19');
INSERT INTO fen_lisesi VALUES (104, 'Sinan Bey', 4.7, 'Istanbul','2023-01-20');
INSERT INTO fen_lisesi VALUES (105, 'Esra Turker', 4.9, 'Ankara','2023-01-18');
INSERT INTO fen_lisesi VALUES (106, 'Esra Turker', 4.9, 'Ankara','2023-01-18');
INSERT INTO fen_lisesi VALUES (107, null, 4.9, 'Ankara','2023-01-18'); -- Isim satiri null olamaz, <-- degerleri tanimlarken 'not null' tanimlandi
INSERT INTO fen_lisesi VALUES (107, 'Mehmet Filik', 3.4, 'Ankara', null);
INSERT INTO fen_lisesi VALUES (108, 'Burcu Tembel', 3.5, null,'2023-01-18');
INSERT INTO fen_lisesi VALUES (109, 'Sevgi sever', null, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (null, 'Derya Dursun', 4.6, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (null, 'Erdal Akgun', 4.8, 'Ankara','2023-01-18');

-- drop table fen_lisesi;

/*-------------------------------------------------------------
Q1 : okul_no, isim, adres, derece fieldlari olan 
	 anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE,
     isim NOT NULL olacak
----------------------------------------------------------------*/

create table anadolu_lisesi (
	okul_no char(3) UNIQUE,
    isim varchar(14) not null,
    adres varchar(30),
    derece double
);

   

INSERT INTO anadolu_lisesi values('063', 'Mustafa Örs', 'Adana/Seyhan', 4);
INSERT INTO anadolu_lisesi values('064', 'Anil Fidan', 'Amasya', 4.9);
INSERT INTO anadolu_lisesi values('065', 'Burhan Semiz', 'Ankara/Cankaya', 4.4);
INSERT INTO anadolu_lisesi values('066', 'Sule Serindik', null, 4.4);
INSERT INTO anadolu_lisesi values('067', 'Hakan Unlu', 'Ankara/Cankaya', null);
INSERT INTO anadolu_lisesi values('', 'Duygu Olcay', 'Almanya', 4.4); -- okul no UNIQUE oldugu icin bir seferligine mahsus kaydetti
INSERT INTO anadolu_lisesi values('068', 'Burhan Semiz', 'Ankara/Cankaya', 4.4);
INSERT INTO anadolu_lisesi (okul_no,isim,derece)values('069', 'Mehmet Emre', 4.2); -- Field'lari kendimiz secmek istiyorsak parantez icinde hangi field'lari doldurmak istiyorsak onlari yazdik
INSERT INTO anadolu_lisesi (isim, okul_no,derece)values('Burhan Semiz', '070', 4.7); -- Parantez icerisinde secmek istedigimiz field'lari hangi sira ile 
-- yazdiysak degerler (values) parantezisinin icerisinde ayni sira girememiz gerekiyor



select * from anadolu_lisesi;
drop table anadolu_lisesi;