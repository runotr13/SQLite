/*===================================================
														LIMIT
====================================================*/
 	/*invoices tablosunda Total değeri 10$'dan büyük olan ilk 4 kayıt'ın InvoiceId, 
	InvoiceDate ve total bilgilerini sorgulayiniz */
	SELECT InvoiceId, InvoiceDate,total
	FROM invoices
	WHERE total >10
	LIMIT 4;
	
	
/*===================================================
													ORDER BY
====================================================*/
	
	/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtları Total değerine göre 
	ARTAN sırada sıralayarak sorgulayiniz */
SELECT * 
FROM invoices
WHERE total > 10
ORDER BY total ASC ; --ORDER BY komutunun default degerı ASC'dir.
/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
	(InvoiceDate) 	en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 
SELECT *
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate DESC 
LIMIT 10;
-- Asignment******************************
SELECT * 
FROM invoices;
---SORU 1 ---
SELECT InvoiceId,CustomerId,total
FROM invoices
ORDER BY CustomerId ASC, total DESC;

--SORU 2 ---
SELECT InvoiceId,CustomerId,total
FROM invoices
ORDER BY total ASC , CustomerId DESC;
--SORU 3 ---
Burada ASC VE descin önemine bahsetmek gerek ilk soruda total degerını En coktan azalana diğerinde azalandan coka gittik.

--SORU 4---
SELECT *
FROM invoices
WHERE total >= 10
LIMIT 10;

--SORU 5----
SELECT *
FROM invoices
WHERE total < 10
LIMIT 5;

--SORU 6 ---
SELECT *
FROM tracks
WHERE name like "B%_%S"

--SORU 7---
SELECT * 
FROM invoices
WHERE BillingCountry IN ("USA","Germany","Norway","Canada") AND InvoiceDate  like "2010%"
ORDER BY InvoiceDate ASC;

