# Hastane Yönetim Sistemi Veritabanı
SQL Server kullanarak yapmış olduğum bir hastane yönetim veri tabanı projesi.

Bu proje, bir hastane yönetim sistemi için SQL Server üzerinde tasarlanmış bir veritabanını içerir. Veritabanı, hastane işlemlerini (hasta kayıtları, randevular, tahliller, reçeteler, vb.) yönetmek için gerekli tabloları, ilişkileri, veri ekleme komutlarını ve çeşitli SQL sorgularını kapsar.

# Proje Amacı

Bu veritabanı, bir hastanenin temel işlemlerini (hasta yönetimi, randevu takibi, tahlil ve reçete işlemleri) yönetmek için tasarlanmıştır. Aşağıdaki özellikler uygulanmıştır:

Tablolar ve ilişkisel yapı ile veri organizasyonu

Örnek veri ekleme (12 hasta, 9 doktor, 9 bölüm, vb.)

SELECT, DELETE, UPDATE, GROUP BY, HAVING, COUNT, LIKE sorguları

FUNCTION, TRIGGER, VIEW, ve STORED PROCEDURE ile gelişmiş veritabanı işlevselliği

# Tablolar ve İlişkiler

Veri tabanı, aşağıdaki 10 tablodan oluşur.

# Tablolar

1. Bolumler:
Açıklama: Hastane bölümlerini saklar (örneğin, Kardiyoloji, Nöroloji).

2. Hastalar:
Açıklama: Hasta bilgilerini saklar.

3. Doktorlar:
Açıklama: Doktor bilgilerini saklar, her doktor bir bölüme bağlıdır.

4. Personeller:
Açıklama: Doktor dışı personeli saklar (örneğin, hemşire, teknisyen).

5. TahlilTurleri:
Açıklama: Tahlil türlerini saklar (örneğin, Kan Şekeri Testi).

6. Ilaclar:
Açıklama: Kullanılan ilaçları saklar (örneğin, Parasetamol).

7. Randevular:
Açıklama: Hasta-doktor randevularını saklar.

8. Receteler:
Açıklama: Reçeteleri saklar.

9. HastaTahlilleri:
Açıklama: Hastaların yaptırdığı tahlilleri saklar.

10. ReceteIlaclari:
Açıklama: Reçetelerdeki ilaçları saklar.


