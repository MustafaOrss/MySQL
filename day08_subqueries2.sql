/* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
  => Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
  kullanmaniz gerekir?
  =========================================================================*/

/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

select sirket, calisanlar_sayisi, (select avg(maas) from calisanlar where calisanlar.sirket = sirketler.sirket) as ort_maas from sirketler;

/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

select sirket, (select max(maas) from calisanlar where calisanlar.sirket = sirketler.sirket) max_maas from sirketler;

/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

select sirket_id, sirket, (select count(sehir)from calisanlar where calisanlar.sirket = sirketler.sirket)sehir_sayisi from sirketler;

/*----------------------------------------------------------------
SORU 4- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/    

select sirket, calisanlar_sayisi, (select max(maas) from calisanlar where calisanlar.sirket = sirketler.sirket)max_maas, (select min(maas) from calisanlar
									where calisanlar.sirket = sirketler.sirket)min_maas from sirketler;
                                    
/*----------------------------------------------------------------
SORU 5- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/    


select sirket, calisanlar_sayisi, (select sum(maas) from calisanlar where calisanlar.sirket = sirketler.sirket)top_maas from sirketler;
      
      
      /* ======================== EXISTS CONDITION ===========================
EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanimina
benzer olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen 
degerlerin icerisinde bir degerin olmasi veya olmamasi durumunda islem 
yapilmasini saglar.
======================================================================*/

CREATE TABLE mayis_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislar VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

select*from mayis_satislar;
select*from nisan_satislar;

/*----------------------------------------------------------------
SORU 1 : Her iki ayda da ayni id ile satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------*/ 

select urun_id, musteri_isim from mayis_satislar where urun_id IN ( select urun_id from nisan_satislar
						where nisan_satislar.urun_id = mayis_satislar.urun_id);
                        
SELECT urun_id,musteri_isim
FROM mayis_satislar
WHERE EXISTS (SELECT urun_id
			  FROM nisan_satislar
			  WHERE nisan_satislar.urun_id = mayis_satislar.urun_id);
              
              
/*----------------------------------------------------------------
SORU 2 : Her iki ayda da satilan urun_isimleri ayni urunlerin,
urun_isim'ini ve urunleri nisan ayinda alan musterilerin isimlerini 
getiren bir Query yaziniz.
----------------------------------------------------------------*/ 

select urun_isim, musteri_isim from nisan_satislar where EXISTS(select urun_isim from mayis_satislar where mayis_satislar.urun_isim = nisan_satislar.urun_isim);

/*----------------------------------------------------------------
	SORU 3 : Nisan ayinda satilip mayis ayinda satilmayan urun ismini ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

 select urun_isim, musteri_isim from nisan_satislar where EXISTS(select urun_isim from mayis_satislar where mayis_satislar.urun_isim = nisan_satislar.urun_isim);

