-- TCKN doğrulama triggerı (11 haneli rakam kontrolü):
CREATE TRIGGER tr_hasta_tckn_check
ON Hastalar
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM inserted 
        WHERE LEN(tckn) <> 11 OR tckn NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    )
    BEGIN
        RAISERROR ('TCKN 11 haneli rakam olmalıdır.', 16, 1);
        ROLLBACK;
    END;
END;

-- Randevu eklendiğinde durum kontrol triggerı:
CREATE TRIGGER tr_randevu_durum_check
ON Randevular
AFTER INSERT
AS
BEGIN
    DECLARE @tarih DATE, @saat TIME, @doktor_id INT;
    SELECT @tarih = tarih, @saat = saat, @doktor_id = doktor_id
    FROM inserted;
    
    IF EXISTS (
        SELECT * 
        FROM Randevular 
        WHERE doktor_id = @doktor_id 
        AND tarih = @tarih 
        AND saat = @saat 
        AND durum = 'Planlandı'
    )
    BEGIN
        RAISERROR ('Doktor aynı tarih ve saatte başka bir randevuya sahip!', 16, 1);
        ROLLBACK;
    END;
END;

-- Reçete eklenirken, reçetenin tarihinin randevu tarihiyle uyumlu olduğunu kontrol eden trigger:
CREATE TRIGGER tr_ReceteTarihKontrol
ON Receteler
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT * 
        FROM inserted i
        LEFT JOIN Randevular r ON i.hasta_id = r.hasta_id AND i.doktor_id = r.doktor_id AND i.tarih = r.tarih
        WHERE r.randevu_id IS NULL
    )
    BEGIN
        RAISERROR ('Reçete tarihi, hasta ve doktor için bir randevu tarihiyle eşleşmelidir.', 16, 1);
        ROLLBACK;
    END;
END;

-- Geçerli reçete (randevu mevcut)
INSERT INTO Receteler (hasta_id, doktor_id, tarih)
VALUES (1, 1, '2025-08-01');

-- Geçersiz reçete (randevu yok)
INSERT INTO Receteler (hasta_id, doktor_id, tarih)
VALUES (1, 1, '2025-08-10'); -- Hata: Reçete tarihi randevu ile eşleşmeli