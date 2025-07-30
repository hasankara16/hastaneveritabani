-- Hastanın yaşını hesaplayan fonksiyon:
CREATE FUNCTION dbo.HastaYasiHesapla (@dogum_tarihi DATE)
RETURNS INT
AS
BEGIN
    DECLARE @yas INT;
    SET @yas = DATEDIFF(YEAR, @dogum_tarihi, GETDATE());
    IF MONTH(@dogum_tarihi) > MONTH(GETDATE()) OR 
       (MONTH(@dogum_tarihi) = MONTH(GETDATE()) AND DAY(@dogum_tarihi) > DAY(GETDATE()))
        SET @yas = @yas - 1;
    RETURN @yas;
END;

SELECT ad, soyad, dbo.HastaYasiHesapla(dogum_tarihi) AS yas
FROM Hastalar;

-- Doktorun toplam randevu sayısını döndüren fonksiyon:
CREATE FUNCTION dbo.DoktorRandevuSayisi (@doktor_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @randevu_sayisi INT;
    SELECT @randevu_sayisi = COUNT(*)
    FROM Randevular
    WHERE doktor_id = @doktor_id;
    RETURN @randevu_sayisi;
END;

SELECT ad, soyad, dbo.DoktorRandevuSayisi(doktor_id) AS randevu_sayisi
FROM Doktorlar;

-- Bir hastanın belirli bir tarihe kadar yaptırdığı tahlillerin toplam sayısını hesaplayan bir fonksiyon:
CREATE FUNCTION dbo.HastaTahlilSayisi (@hasta_id INT, @tarih DATE)
RETURNS INT
AS
BEGIN
    DECLARE @tahlil_sayisi INT;
    SELECT @tahlil_sayisi = COUNT(*)
    FROM HastaTahlilleri
    WHERE hasta_id = @hasta_id AND tarih <= @tarih;
    RETURN @tahlil_sayisi;
END;

SELECT h.ad, h.soyad, dbo.HastaTahlilSayisi(h.hasta_id, '2025-08-07') AS tahlil_sayisi
FROM Hastalar h;