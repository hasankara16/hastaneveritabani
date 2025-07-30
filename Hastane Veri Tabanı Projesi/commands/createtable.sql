-- Bölümler Tablosu
CREATE TABLE Bolumler (
    bolum_id INT PRIMARY KEY IDENTITY(1,1),
    bolum_adi NVARCHAR(50) NOT NULL UNIQUE
);

-- Hastalar Tablosu
CREATE TABLE Hastalar (
    hasta_id INT PRIMARY KEY IDENTITY(1,1),
    tckn CHAR(11) NOT NULL UNIQUE,
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    dogum_tarihi DATE NOT NULL,
    cinsiyet NVARCHAR(5) NOT NULL CHECK (cinsiyet IN ('Erkek', 'Kadın')),
    kan_grubu NVARCHAR(3) NOT NULL CHECK (kan_grubu IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', '0+', '0-')),
    telefon NVARCHAR(15),
    email NVARCHAR(100) UNIQUE
);

-- Doktorlar Tablosu
CREATE TABLE Doktorlar (
    doktor_id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    uzmanlik_id INT NOT NULL,
    telefon NVARCHAR(15),
    email NVARCHAR(100) UNIQUE,
    CONSTRAINT FK_Doktorlar_Bolumler FOREIGN KEY (uzmanlik_id) REFERENCES Bolumler(bolum_id)
);

-- Personeller Tablosu
CREATE TABLE Personeller (
    personel_id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    gorev NVARCHAR(50) NOT NULL,
    bolum_id INT,
    telefon NVARCHAR(15),
    email NVARCHAR(100) UNIQUE,
    CONSTRAINT FK_Personeller_Bolumler FOREIGN KEY (bolum_id) REFERENCES Bolumler(bolum_id)
);

-- Randevular Tablosu
CREATE TABLE Randevular (
    randevu_id INT PRIMARY KEY IDENTITY(1,1),
    hasta_id INT NOT NULL,
    doktor_id INT NOT NULL,
    tarih DATE NOT NULL,
    saat TIME NOT NULL,
    durum NVARCHAR(20) NOT NULL CHECK (durum IN ('Planlandı', 'Tamamlandı', 'İptal Edildi')) DEFAULT 'Planlandı',
    CONSTRAINT FK_Randevular_Hastalar FOREIGN KEY (hasta_id) REFERENCES Hastalar(hasta_id),
    CONSTRAINT FK_Randevular_Doktorlar FOREIGN KEY (doktor_id) REFERENCES Doktorlar(doktor_id)
);

-- Tahlil Türleri Tablosu
CREATE TABLE TahlilTurleri (
    tahlil_turu_id INT PRIMARY KEY IDENTITY(1,1),
    tahlil_adi NVARCHAR(50) NOT NULL UNIQUE,
    aciklama NVARCHAR(MAX)
);

-- Hasta Tahlilleri Tablosu (Çoka Çok İlişki)
CREATE TABLE HastaTahlilleri (
    hasta_id INT NOT NULL,
    tahlil_turu_id INT NOT NULL,
    sonuc NVARCHAR(MAX),
    tarih DATE NOT NULL,
    doktor_id INT,
    CONSTRAINT PK_HastaTahlilleri PRIMARY KEY (hasta_id, tahlil_turu_id, tarih),
    CONSTRAINT FK_HastaTahlilleri_Hastalar FOREIGN KEY (hasta_id) REFERENCES Hastalar(hasta_id),
    CONSTRAINT FK_HastaTahlilleri_TahlilTurleri FOREIGN KEY (tahlil_turu_id) REFERENCES TahlilTurleri(tahlil_turu_id),
    CONSTRAINT FK_HastaTahlilleri_Doktorlar FOREIGN KEY (doktor_id) REFERENCES Doktorlar(doktor_id)
);

-- İlaçlar Tablosu
CREATE TABLE Ilaclar (
    ilac_id INT PRIMARY KEY IDENTITY(1,1),
    ilac_adi NVARCHAR(100) NOT NULL,
    doz NVARCHAR(20),
    aciklama NVARCHAR(MAX)
);

-- Reçeteler Tablosu
CREATE TABLE Receteler (
    recete_id INT PRIMARY KEY IDENTITY(1,1),
    hasta_id INT NOT NULL,
    doktor_id INT NOT NULL,
    tarih DATE NOT NULL,
    CONSTRAINT FK_Receteler_Hastalar FOREIGN KEY (hasta_id) REFERENCES Hastalar(hasta_id),
    CONSTRAINT FK_Receteler_Doktorlar FOREIGN KEY (doktor_id) REFERENCES Doktorlar(doktor_id)
);

-- Reçete-İlaçlar Ara Tablosu (Çoka Çok İlişki)
CREATE TABLE ReceteIlaclari (
    recete_id INT NOT NULL,
    ilac_id INT NOT NULL,
    miktar INT NOT NULL,
    kullanim_talimati NVARCHAR(MAX),
    CONSTRAINT PK_ReceteIlaclari PRIMARY KEY (recete_id, ilac_id),
    CONSTRAINT FK_ReceteIlaclari_Receteler FOREIGN KEY (recete_id) REFERENCES Receteler(recete_id),
    CONSTRAINT FK_ReceteIlaclari_Ilaclar FOREIGN KEY (ilac_id) REFERENCES Ilaclar(ilac_id)
);