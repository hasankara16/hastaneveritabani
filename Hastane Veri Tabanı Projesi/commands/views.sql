-- Hastaların reçete ve tahlil özeti görünümü:
CREATE VIEW vw_HastaOzeti
AS
SELECT h.hasta_id, h.ad, h.soyad, h.tckn,
       COUNT(DISTINCT r.recete_id) AS recete_sayisi,
       COUNT(DISTINCT ht.tahlil_turu_id) AS tahlil_sayisi
FROM Hastalar h
LEFT JOIN Receteler r ON h.hasta_id = r.hasta_id
LEFT JOIN HastaTahlilleri ht ON h.hasta_id = ht.hasta_id
GROUP BY h.hasta_id, h.ad, h.soyad, h.tckn;

SELECT * FROM vw_HastaOzeti;

-- Doktorların bölüm ve randevu detayları görünümü:
CREATE VIEW vw_DoktorRandevuDetaylari
AS
SELECT d.doktor_id, d.ad, d.soyad, b.bolum_adi, 
       COUNT(r.randevu_id) AS randevu_sayisi,
       SUM(CASE WHEN r.durum = 'Tamamlandı' THEN 1 ELSE 0 END) AS tamamlanan_randevu
FROM Doktorlar d
JOIN Bolumler b ON d.uzmanlik_id = b.bolum_id
LEFT JOIN Randevular r ON d.doktor_id = r.doktor_id
GROUP BY d.doktor_id, d.ad, d.soyad, b.bolum_adi;

SELECT * FROM vw_DoktorRandevuDetaylari;

-- Hastaların randevu bilgilerini, doktor detaylarını ve bölüm bilgilerini birleştiren kapsamlı bir view:
CREATE VIEW HastaRandevuDetaylari AS
SELECT 
    R.randevu_id,
    H.hasta_id,
    H.tckn AS hasta_tckn,
    H.ad AS hasta_adi,
    H.soyad AS hasta_soyadi,
    H.dogum_tarihi AS hasta_dogum_tarihi,
    H.cinsiyet AS hasta_cinsiyeti,
    H.kan_grubu AS hasta_kan_grubu,
    D.doktor_id,
    D.ad AS doktor_adi,
    D.soyad AS doktor_soyadi,
    B.bolum_id,
    B.bolum_adi AS doktor_uzmanlik,
    R.tarih AS randevu_tarihi,
    R.saat AS randevu_saati,
    R.durum AS randevu_durumu,
    CASE 
        WHEN R.durum = 'Tamamlandı' THEN 'Tamamlandı'
        WHEN R.durum = 'İptal Edildi' THEN 'İptal Edildi'
        WHEN R.tarih < CAST(GETDATE() AS DATE) THEN 'Geçmiş Randevu'
        WHEN R.tarih = CAST(GETDATE() AS DATE) THEN 'Bugünkü Randevu'
        ELSE 'Gelecek Randevu'
    END AS randevu_durum_aciklama,
    DATEDIFF(YEAR, H.dogum_tarihi, GETDATE()) AS hasta_yasi
FROM 
    Randevular R
    INNER JOIN Hastalar H ON R.hasta_id = H.hasta_id
    INNER JOIN Doktorlar D ON R.doktor_id = D.doktor_id
    INNER JOIN Bolumler B ON D.uzmanlik_id = B.bolum_id;

SELECT * FROM HastaRandevuDetaylari 
WHERE doktor_uzmanlik = 'Kardiyoloji';

SELECT * FROM HastaRandevuDetaylari 
WHERE randevu_durumu = 'Tamamlandı';