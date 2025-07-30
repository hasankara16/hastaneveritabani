-- Tüm hastaların isim, soyisim ve kan grubunu listele:
SELECT ad, soyad, kan_grubu
FROM Hastalar;

-- Belirli bir kan grubuna sahip hastaları listele (A+ olanlar):
SELECT ad, soyad, tckn, kan_grubu
FROM Hastalar
WHERE kan_grubu = 'A+';

-- Her bölümdeki doktor ve personel sayısını listele:
SELECT b.bolum_adi, 
       (SELECT COUNT(*) FROM Doktorlar d WHERE d.uzmanlik_id = b.bolum_id) AS doktor_sayisi,
       (SELECT COUNT(*) FROM Personeller p WHERE p.bolum_id = b.bolum_id) AS personel_sayisi
FROM Bolumler b;

-- Kardiyoloji bölümündeki doktorların ve randevularının detaylarını listele:
SELECT d.ad, d.soyad, h.ad AS hasta_ad, h.soyad AS hasta_soyad, r.tarih, r.saat, r.durum
FROM Randevular r
JOIN Doktorlar d ON r.doktor_id = d.doktor_id
JOIN Hastalar h ON r.hasta_id = h.hasta_id
JOIN Bolumler b ON d.uzmanlik_id = b.bolum_id
WHERE b.bolum_adi = 'Kardiyoloji';

-- LIKE ile hasta adına göre arama (soyadında ‘Yıl’ içerenler):
SELECT ad, soyad, tckn
FROM Hastalar
WHERE soyad LIKE '%Yıl%';

-- LIKE ile tahlil adına göre filtreleme (Kan içeren tahliller):
SELECT t.tahlil_adi, ht.sonuc, h.ad, h.soyad
FROM TahlilTurleri t
JOIN HastaTahlilleri ht ON t.tahlil_turu_id = ht.tahlil_turu_id
JOIN Hastalar h ON ht.hasta_id = h.hasta_id
WHERE t.tahlil_adi LIKE '%Kan%';

-- İptal edilmiş randevuları sil:
DELETE FROM Randevular
WHERE durum = 'İptal Edildi';

-- Belirli bir tarihten önceki tamamlanmış randevuları sil:
DELETE FROM Randevular
WHERE durum = 'Tamamlandı' AND tarih < '2025-08-03';

-- Belirli bir ilacı içeren reçeteleri sil:
DELETE FROM ReceteIlaclari
WHERE ilac_id = (SELECT ilac_id FROM Ilaclar WHERE ilac_adi = 'Aspirin');

-- Bir hastanın telefon numarasını güncelle (örneğin, Mehmet Demir):
UPDATE Hastalar
SET telefon = '5559876543'
WHERE tckn = '34567890123';

-- Bir doktorun telefon numarasını ve email adresini güncelle:
UPDATE Doktorlar
SET telefon = '5551239988', email = 'zeynep.sahin2@example.com'
WHERE ad = 'Zeynep' AND soyad = 'Şahin';

-- Bir randevunun durumunu ‘Tamamlandı’ olarak güncelle:
UPDATE Randevular
SET durum = 'Tamamlandı'
WHERE hasta_id = 1 AND tarih = '2025-08-01' AND saat = '09:00:00';

-- Doktorların randevu sayılarını listele:
SELECT d.ad, d.soyad, COUNT(r.randevu_id) AS randevu_sayisi
FROM Doktorlar d
LEFT JOIN Randevular r ON d.doktor_id = r.doktor_id
GROUP BY d.doktor_id, d.ad, d.soyad;

-- Her hastanın reçete sayısını listele:
SELECT h.ad, h.soyad, COUNT(r.recete_id) AS recete_sayisi
FROM Hastalar h
LEFT JOIN Receteler r ON h.hasta_id = r.hasta_id
GROUP BY h.hasta_id, h.ad, h.soyad;

-- Bölümlere göre personel sayısını listele:
SELECT b.bolum_adi, COUNT(p.personel_id) AS personel_sayisi
FROM Bolumler b
LEFT JOIN Personeller p ON b.bolum_id = p.bolum_id
GROUP BY b.bolum_id, b.bolum_adi;

-- Her ilacın kaç reçetede kullanıldığını listele:
SELECT i.ilac_adi, COUNT(ri.recete_id) AS recete_sayisi
FROM Ilaclar i
LEFT JOIN ReceteIlaclari ri ON i.ilac_id = ri.ilac_id
GROUP BY i.ilac_id, i.ilac_adi;

-- 1’den fazla reçete yazan doktorları listele:
SELECT d.ad, d.soyad, COUNT(r.recete_id) AS recete_sayisi
FROM Doktorlar d
LEFT JOIN Receteler r ON d.doktor_id = r.doktor_id
GROUP BY d.doktor_id, d.ad, d.soyad
HAVING COUNT(r.recete_id) > 1;

-- 1’den fazla randevusu olan doktorları listele:
SELECT d.ad, d.soyad, COUNT(r.randevu_id) AS randevu_sayisi
FROM Doktorlar d
LEFT JOIN Randevular r ON d.doktor_id = r.doktor_id
GROUP BY d.doktor_id, d.ad, d.soyad
HAVING COUNT(r.randevu_id) > 1;

-- En az 2 tahlil yaptıran hastaları listele:
SELECT h.ad, h.soyad, COUNT(ht.tahlil_turu_id) AS tahlil_sayisi
FROM Hastalar h
JOIN HastaTahlilleri ht ON h.hasta_id = ht.hasta_id
GROUP BY h.hasta_id, h.ad, h.soyad
HAVING COUNT(ht.tahlil_turu_id) >= 2;

-- İlaç adına göre reçeteleri listele (Parasetamol içerenler):
SELECT h.ad, h.soyad, i.ilac_adi, ri.kullanim_talimati
FROM ReceteIlaclari ri
JOIN Receteler r ON ri.recete_id = r.recete_id
JOIN Hastalar h ON r.hasta_id = h.hasta_id
JOIN Ilaclar i ON ri.ilac_id = i.ilac_id
WHERE i.ilac_adi LIKE '%Parasetamol%';

-- Görevinde ‘Hemşire’ geçen personelleri listele:
SELECT ad, soyad, gorev, b.bolum_adi
FROM Personeller p
JOIN Bolumler b ON p.bolum_id = b.bolum_id
WHERE gorev LIKE '%Hemşire%';

-- Her doktorun tahlil sayısını ve sadece ‘Normal’ sonuçlu tahlilleri listele:
SELECT d.ad, d.soyad, COUNT(ht.tahlil_turu_id) AS normal_tahlil_sayisi
FROM Doktorlar d
JOIN HastaTahlilleri ht ON d.doktor_id = ht.doktor_id
WHERE ht.sonuc LIKE 'Normal'
GROUP BY d.doktor_id, d.ad, d.soyad
HAVING COUNT(ht.tahlil_turu_id) >= 1;

-- Her bölümdeki tamamlanmış randevu sayısını listele:
SELECT b.bolum_adi, COUNT(r.randevu_id) AS tamamlanmis_randevu_sayisi
FROM Bolumler b
JOIN Doktorlar d ON b.bolum_id = d.uzmanlik_id
JOIN Randevular r ON d.doktor_id = r.doktor_id
WHERE r.durum LIKE 'Tamamlandı'
GROUP BY b.bolum_id, b.bolum_adi
HAVING COUNT(r.randevu_id) > 0;

-- En sık kullanılan ilacı bul:
SELECT i.ilac_adi, COUNT(ri.recete_id) AS kullanim_sayisi
FROM Ilaclar i
JOIN ReceteIlaclari ri ON i.ilac_id = ri.ilac_id
GROUP BY i.ilac_id, i.ilac_adi
HAVING COUNT(ri.recete_id) = (
    SELECT MAX(kullanim_sayisi)
    FROM (
        SELECT COUNT(recete_id) AS kullanim_sayisi
        FROM ReceteIlaclari
        GROUP BY ilac_id
    ) AS max_kullanim
);

-- Belirli bir tarihte tahlil yaptıran hastaları listele:
SELECT h.ad, h.soyad, t.tahlil_adi, ht.sonuc
FROM HastaTahlilleri ht
JOIN Hastalar h ON ht.hasta_id = h.hasta_id
JOIN TahlilTurleri t ON ht.tahlil_turu_id = t.tahlil_turu_id
WHERE ht.tarih = '2025-08-06';