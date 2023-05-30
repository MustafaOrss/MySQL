 -- yorum satiri

/*
Paragraf yorum satiri 
istenildigi kadar yazilabilir
*/
use sys;

/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

create table ogrenciler
(
	id int,
    isim varchar(25),
    not_ortalamasi double,
    adres varchar(50),
    son_degistirme_tarihi date
    
);

select * from ogrenciler;

/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/

CREATE TABLE tedarikciler
(
	tedarikci_id int, 
	tedarikci_ismi varchar(25),	
	tedarikci_adres varchar(50),
    ulasim_tarihi DATE
);

select * from tedarikciler;

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/ 
-- ogrenciler tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

create table ogrenci_derece 
as
select isim, not_ortalamasi
from ogrenciler;

select * from ogrenci_derece;
/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/
create table tedarikciler_son
as 
select tedarikci_ismi, ulasim_tarihi
from tedarikciler;

select * from tedarikciler_son;

/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

