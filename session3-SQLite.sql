/*customer tablosunda ,isimleri (firstname) üç harfli olan müşterilerin*/
 /*firstname,lastname ve city bilgilerini listeleyin.*/
SELECT FirstName,LastName,City
FROM customers
WHERE FirstName like ("___");   

/* customer tablosunda , soyisimleri Sch veya Go ile başlayan müşterilerin FirstName,*/
/*LastName ve city bilgilerini listeleyin.*/
SELECT FirstName,LastName,City
FROM customers
WHERE LastName LIKE "Sch%" or LastName LIKE "Go%";

/*===================================================*/
	/*AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)*/
/*====================================================*/
	
	/*-- COUNT*/
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu*/

SELECT count(*)
FROM students
WHERE LastName is  NULL;	

SELECT count(*)                   --Cevap 412--
FROM invoices;

SELECT count(BillingState) as num_of_invoice		--Cevap 210 çünkü * koymadıgımız ıcın sadece belırttıgımızı aldı ve null 'ları saymadı.
FROM invoices;
/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
SELECT count(DISTINCT Composer) as besteci_sayisi_tekrar_etmeyen
FROM tracks;

/* ÖDEV : invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız */ 
/* ÖDEV : invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */
 
   /* MIN MAX */
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen*/
	sorguyu yaziniz */

SELECT name as song_name, min(Milliseconds) as Duration
FROM tracks;

-- students tablosundaki en düsük ve en dusuk notu sargula.
SELECT MIN(Grade),MAX(Grade)
FROM students;

/*-- SUM,AVG*/
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
SELECT sum(total) as total_num
FROM invoices;

-- invoices tablosundaki faturalın ortalama degerını lısteleyın.
SELECT round(avg(total),2) as ortalama_gelir    --round fonksiyonu ortalama 4.23232 yuvarlar 4.0 ,2 yazdıgımız ıcın virgülden sonra 2 basamaklı deger oldu.
FROM invoices


	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan sarkı adını lısteleyın. şarkıların adlarını listeleyiniz */
SELECT round(avg(Milliseconds))
FROM tracks

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan */
	/*şarkıların adlarını listeleyiniz */
	SELECT ROUND(AVG(Milliseconds))
	FROM tracks;
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > 393599;
	
/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. */
/*alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki */
/*bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > ( 	SELECT AVG(Milliseconds) FROM tracks);
	
SELECT Composer, count(Composer)
FROM tracks
GROUP BY Composer;
/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) */
	/*göre gruplandırarak listeleyen sorguyu yazınız*/
SELECT country,city , count(FirstName) as musterı_sayısı
FROM customers
GROUP BY country,City;
	
/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını */
	/*Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
SELECT Composer,count(name) as şarkı_sayısı
FROM tracks
WHERE Composer is NOT NULL
GROUP BY Composer;
/* custormers tablosundaki musterılerın sayılarını uklerıne gore (country) göre gruplandırarak */
	/*ve musterı sayısına gore azalan sekılde sıralayın. */
SELECT country,count(FirstName) as number_or_customer
FROM customers
GROUP BY country
ORDER BY number_or_customer DESC ;

-- invoices tablosundakı her bır ulkenın (bıllıngcountry) fatura ortalamalarını

 -- hesaplayan ve ulke bılgılerı ıle lısteleyen soruguyu yazınız.

SELECT BillingCountry, round(AVG(total),4) as ort_fatura
FROM invoices
GROUP BY BillingCountry

SELECT BillingCountry, round(AVG(total),4) as ort_fatura
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23:59:59'
GROUP BY BillingCountry;
