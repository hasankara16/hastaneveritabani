-- Bölümler Tablosu
INSERT INTO Bolumler (bolum_adi)
VALUES 
    ('Kardiyoloji'),
    ('Nöroloji'),
    ('Ortopedi'),
    ('Genel Cerrahi'),
    ('Dahiliye'),
    ('Radyoloji'),
    ('Göz Hastalıkları'),
    ('Kulak Burun Boğaz'),
    ('Pediatri');

-- Hastalar Tablosu
INSERT INTO Hastalar (tckn, ad, soyad, dogum_tarihi, cinsiyet, kan_grubu, telefon, email)
VALUES 
    ('12345678901', 'Ahmet', 'Yılmaz', '1985-03-15', 'Erkek', 'A+', '5551234567', 'ahmet.yilmaz@example.com'),
    ('23456789012', 'Ayşe', 'Kaya', '1990-07-22', 'Kadın', 'B-', '5552345678', 'ayse.kaya@example.com'),
    ('34567890123', 'Mehmet', 'Demir', '1978-11-30', 'Erkek', '0+', '5553456789', 'mehmet.demir@example.com'),
    ('45678901234', 'Zeynep', 'Şahin', '1995-05-10', 'Kadın', 'AB+', '5554567890', 'zeynep.sahin@example.com'),
    ('56789012345', 'Emre', 'Arslan', '1988-04-20', 'Erkek', 'A-', '5556789012', 'emre.arslan@example.com'),
    ('67890123456', 'Selma', 'Koçak', '1992-09-15', 'Kadın', 'B+', '5557890123', 'selma.kocak@example.com'),
    ('78901234567', 'Can', 'Erdoğan', '1980-12-05', 'Erkek', '0-', '5558901234', 'can.erdogan@example.com'),
    ('89012345678', 'Esra', 'Yıldırım', '1987-06-25', 'Kadın', 'AB-', '5559012345', 'esra.yildirim@example.com'),
    ('90123456789', 'Deniz', 'Çetin', '1993-02-14', 'Erkek', 'A+', '5550123456', 'deniz.cetin@example.com'),
    ('01234567890', 'Buse', 'Aksoy', '1989-08-08', 'Kadın', 'B+', '5551234501', 'buse.aksoy@example.com'),
    ('12345098765', 'Kaan', 'Polat', '1982-10-20', 'Erkek', '0+', '5552345612', 'kaan.polat@example.com'),
    ('23456109876', 'Seda', 'Güneş', '1996-03-30', 'Kadın', 'AB+', '5553456723', 'seda.gunes@example.com');

-- Doktorlar Tablosu
INSERT INTO Doktorlar (ad, soyad, uzmanlik_id, telefon, email)
VALUES 
    ('Zeynep', 'Şahin', 1, '5551112233', 'zeynep.sahin@example.com'),
    ('Hasan', 'Çelik', 2, '5552223344', 'hasan.celik@example.com'),
    ('Elif', 'Öztürk', 3, '5553334455', 'elif.ozturk@example.com'),
    ('Ali', 'Kara', 4, '5554446677', 'ali.kara@example.com'),
    ('Merve', 'Bulut', 5, '5555557788', 'merve.bulut@example.com'),
    ('Ömer', 'Aydın', 6, '5556668899', 'omer.aydin@example.com'),
    ('Cem', 'Yalçın', 7, '5557779900', 'cem.yalcin@example.com'),   -- Göz Hastalıkları
    ('Aslı', 'Tekin', 8, '5558880011', 'asli.tekin@example.com'),    -- Kulak Burun Boğaz
    ('Eren', 'Uçar', 9, '5559991122', 'eren.ucar@example.com');      -- Pediatri

-- Personeller Tablosu
INSERT INTO Personeller (ad, soyad, gorev, bolum_id, telefon, email)
VALUES 
    ('Fatma', 'Acar', 'Hemşire', 1, '5554445566', 'fatma.acar@example.com'),
    ('Murat', 'Koç', 'Laboratuvar Teknisyeni', 2, '5555556677', 'murat.koc@example.com'),
    ('Selin', 'Yıldız', 'Tıbbi Sekreter', 5, '5556667788', 'selin.yildiz@example.com'),
    ('Hakan', 'Demirci', 'Hemşire', 4, '5557779900', 'hakan.demirci@example.com'),
    ('Ece', 'Sönmez', 'Radyoloji Teknisyeni', 6, '5558880011', 'ece.sonmez@example.com'),
    ('Burak', 'Turan', 'İdari Personel', 5, '5559991122', 'burak.turan@example.com'),
    ('Derya', 'Özkan', 'Hemşire', 7, '5550002233', 'derya.ozkan@example.com'),      -- Göz Hastalıkları
    ('Tolga', 'Kurt', 'Tıbbi Sekreter', 8, '5551113344', 'tolga.kurt@example.com'),  -- Kulak Burun Boğaz
    ('Leyla', 'Arı', 'Hemşire', 9, '5552224455', 'leyla.ari@example.com');         -- Pediatri

-- Tahlil Türleri Tablosu
INSERT INTO TahlilTurleri (tahlil_adi, aciklama)
VALUES 
    ('Kan Şekeri Testi', 'Açlık kan şekeri ölçümü'),
    ('Röntgen', 'Göğüs röntgeni'),
    ('MR Görüntüleme', 'Beyin MR taraması'),
    ('Tam Kan Sayımı', 'Kırmızı ve beyaz kan hücreleri analizi'),
    ('EKG', 'Kalp ritmi ölçümü'),
    ('Tiroid Testi', 'TSH, T3, T4 seviyeleri ölçümü'),
    ('Ultrason', 'Karın bölgesi görüntüleme'),
    ('Göz Muayenesi', 'Göz içi basınç ve retina kontrolü');

-- İlaçlar Tablosu
INSERT INTO Ilaclar (ilac_adi, doz, aciklama)
VALUES 
    ('Parasetamol', '500 mg', 'Ateş düşürücü ve ağrı kesici'),
    ('Amoksisilin', '250 mg', 'Antibiyotik'),
    ('Aspirin', '100 mg', 'Kan sulandırıcı'),
    ('İbuprofen', '400 mg', 'Ağrı kesici ve iltihap önleyici'),
    ('Metformin', '500 mg', 'Diyabet ilacı'),
    ('Levotiroksin', '100 mcg', 'Tiroid hormonu düzenleyici'),
    ('Omeprazol', '20 mg', 'Mide asidi düzenleyici'),
    ('Loratadin', '10 mg', 'Alerji ilacı');

-- Randevular Tablosu
INSERT INTO Randevular (hasta_id, doktor_id, tarih, saat, durum)
VALUES 
    (1, 1, '2025-08-01', '09:00:00', 'Planlandı'),
    (2, 2, '2025-08-01', '10:30:00', 'Planlandı'),
    (3, 3, '2025-08-02', '14:00:00', 'Tamamlandı'),
    (4, 2, '2025-08-03', '11:00:00', 'Planlandı'),
    (5, 4, '2025-08-04', '08:30:00', 'Planlandı'),
    (6, 5, '2025-08-04', '09:45:00', 'Planlandı'),
    (7, 6, '2025-08-05', '13:00:00', 'Planlandı'),
    (8, 4, '2025-08-05', '15:30:00', 'Tamamlandı'),
    (9, 7, '2025-08-06', '10:00:00', 'Planlandı'),   -- Deniz, Cem ile
    (10, 8, '2025-08-06', '11:30:00', 'Planlandı'),   -- Buse, Aslı ile
    (11, 9, '2025-08-07', '14:30:00', 'Tamamlandı'),  -- Kaan, Eren ile
    (12, 7, '2025-08-07', '16:00:00', 'Planlandı');   -- Seda, Cem ile

-- Reçeteler Tablosu
INSERT INTO Receteler (hasta_id, doktor_id, tarih)
VALUES 
    (1, 1, '2025-08-01'),
    (2, 2, '2025-08-01'),
    (3, 3, '2025-08-02'),
    (4, 2, '2025-08-03'),
    (5, 4, '2025-08-04'),
    (6, 5, '2025-08-04'),
    (7, 6, '2025-08-05'),
    (8, 4, '2025-08-05'),
    (9, 7, '2025-08-06'),  -- Deniz, Cem
    (10, 8, '2025-08-06'), -- Buse, Aslı
    (11, 9, '2025-08-07'), -- Kaan, Eren
    (12, 7, '2025-08-07'); -- Seda, Cem

-- Hasta Tahlilleri Tablosu
INSERT INTO HastaTahlilleri (hasta_id, tahlil_turu_id, sonuc, tarih, doktor_id)
VALUES 
    (1, 1, '90 mg/dL', '2025-08-01', 1),      -- Ahmet, Kan Şekeri, Zeynep
    (2, 1, '110 mg/dL', '2025-08-01', 2),     -- Ayşe, Kan Şekeri, Hasan
    (3, 2, 'Normal', '2025-08-02', 3),        -- Mehmet, Röntgen, Elif
    (4, 3, 'Normal', '2025-08-03', 2),        -- Zeynep, MR, Hasan
    (5, 4, 'Normal', '2025-08-04', 4),        -- Emre, Tam Kan Sayımı, Ali
    (6, 5, 'Normal', '2025-08-04', 5),        -- Selma, EKG, Merve
    (7, 2, 'Anormal gölge', '2025-08-05', 6), -- Can, Röntgen, Ömer
    (8, 3, 'Normal', '2025-08-05', 4),        -- Esra, MR, Ali
    (9, 6, 'TSH: 2.5 mIU/L', '2025-08-06', 7), -- Deniz, Tiroid Testi, Cem
    (10, 7, 'Normal', '2025-08-06', 8),        -- Buse, Ultrason, Aslı
    (11, 8, 'Normal', '2025-08-07', 9),        -- Kaan, Göz Muayenesi, Eren
    (12, 5, 'Normal', '2025-08-07', 7);        -- Seda, EKG, Cem

-- Reçete-İlaçlar Tablosu
INSERT INTO ReceteIlaclari (recete_id, ilac_id, miktar, kullanim_talimati)
VALUES 
    (1, 1, 2, 'Günde 2 kez, yemekten sonra'), -- Reçete 1, Parasetamol
    (1, 2, 1, 'Günde 3 kez, 8 saatte bir'),   -- Reçete 1, Amoksisilin
    (2, 3, 1, 'Günde 1 kez, sabah'),          -- Reçete 2, Aspirin
    (3, 1, 3, 'Günde 3 kez, yemekle birlikte'), -- Reçete 3, Parasetamol
    (5, 4, 2, 'Günde 2 kez, yemekten sonra'), -- Reçete 5, İbuprofen
    (6, 5, 1, 'Günde 2 kez, sabah ve akşam'), -- Reçete 6, Metformin
    (7, 3, 1, 'Günde 1 kez, sabah'),          -- Reçete 7, Aspirin
    (8, 1, 2, 'Günde 2 kez, yemekle birlikte'), -- Reçete 8, Parasetamol
    (9, 6, 1, 'Günde 1 kez, sabah'),          -- Reçete 9, Levotiroksin
    (10, 7, 1, 'Günde 1 kez, yemekten önce'), -- Reçete 10, Omeprazol
    (11, 8, 1, 'Günde 1 kez, akşam'),         -- Reçete 11, Loratadin
    (12, 4, 2, 'Günde 2 kez, yemekle birlikte'); -- Reçete 12, İbuprofen