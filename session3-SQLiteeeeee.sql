SELECT *
FROM markalar

SELECT *
FROM siparisler

SELECT markalar.marka_id,markalar.marka_adi,siparisler.siparis_adedi,siparisler.siparis_tarihi 
FROM markalar
LEFT  JOIN siparisler ON markalar.marka_id = siparisler.marka_id ;