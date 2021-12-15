/* ====================================================
					LOGICAL OPERATORS (AND, OR, NOT)
	======================================================*/
	
	/* invoices tablosunda ülkesi /BillingCountry) USA olmayan kayıtları total değerine göre AZALAN sırada listeleyiniz */
	
	SELECT *
	FROM invoices
	WHERE NOT BillingCountry = 'USA' -- WHERE BillingCountry <> 'USA'
	ORDER BY total DESC;
	
	/* invoices tablosunda ülkesi (BillingCountry) USA veya Germany olan kayıtları, InvoiceId sırasına göre artan sırada listeleyiniz */
	
	SELECT *
	FROM invoices
	WHERE BillingCountry = 'USA' OR BillingCountry = 'Germany'
	ORDER BY InvoiceId;
	
	/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 03-01-2012 
	tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 
	
	SELECT *
	FROM invoices
	WHERE InvoiceDate >= '2012-01-01' and InvoiceDate <= '2012-01-03';
SELECT *
FROM invoices
WHERE InvoiceDate >= "2012-01-01" AND InvoiceDate <="2013-01-02 00:00:00";

SELECT *
FROM invoices 
WHERE  InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31"
ORDER BY InvoiceDate DESC
LIMIT 1 ;

SELECT FirstName,LastName,country
FROM customers
WHERE country IN ("Belgium","Norway","Canada","USA");

/*===================================================
								                    LIKE
====================================================*/
	/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
	listeyen sorguyu yazınız*/
SELECT name,Composer
FROM tracks
WHERE Composer LIKE "%Bach";

SELECT *
FROM albums
WHERE Title LIKE "%Greatest%" ;
/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
	aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/
SELECT *
FROM invoices
WHERE InvoiceDate like '201_-02%';

SELECT AlbumId,min(Milliseconds)
FROM tracks
GROUP BY AlbumId;


