-- Belirli bir tarihteki tahlilleri ve reçeteleri raporlayan stored procedure:
CREATE PROCEDURE sp_TariheGoreRapor
    @tarih DATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Tahliller
    SELECT h.ad, h.soyad, t.tahlil_adi, ht.sonuc, ht.tarih
    FROM HastaTahlilleri ht
    JOIN Hastalar h ON ht.hasta_id = h.hasta_id
    JOIN TahlilTurleri t ON ht.tahlil_turu_id = t.tahlil_turu_id
    WHERE ht.tarih = @tarih;

    -- Reçeteler
    SELECT h.ad, h.soyad, i.ilac_adi, ri.kullanim_talimati, r.tarih
    FROM Receteler r
    JOIN Hastalar h ON r.hasta_id = h.hasta_id
    JOIN ReceteIlaclari ri ON r.recete_id = ri.recete_id
    JOIN Ilaclar i ON ri.ilac_id = i.ilac_id
    WHERE r.tarih = @tarih;
END;

EXEC sp_TariheGoreRapor @tarih = '2025-08-06';

-- Her hastanın randevu, reçete ve tahlil detaylarını birleştiren bir özet görünüm oluşturan stored procedure:
CREATE VIEW vw_HastaTamOzet
AS
SELECT 
    h.hasta_id, h.ad, h.soyad, h.tckn,
    COUNT(DISTINCT r.randevu_id) AS randevu_sayisi,
    COUNT(DISTINCT rc.recete_id) AS recete_sayisi,
    COUNT(DISTINCT ht.tahlil_turu_id) AS tahlil_sayisi,
    STRING_AGG(i.ilac_adi, ', ') AS ilaclar,
    STRING_AGG(t.tahlil_adi, ', ') AS tahliller
FROM Hastalar h
LEFT JOIN Randevular r ON h.hasta_id = r.hasta_id
LEFT JOIN Receteler rc ON h.hasta_id = rc.hasta_id
LEFT JOIN ReceteIlaclari ri ON rc.recete_id = ri.recete_id
LEFT JOIN Ilaclar i ON ri.ilac_id = i.ilac_id
LEFT JOIN HastaTahlilleri ht ON h.hasta_id = ht.hasta_id
LEFT JOIN TahlilTurleri t ON ht.tahlil_turu_id = t.tahlil_turu_id
GROUP BY h.hasta_id, h.ad, h.soyad, h.tckn;

SELECT * FROM vw_HastaTamOzet;