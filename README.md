# Hastane Yönetim Sistemi Veri Tabanı
SQL Server kullanarak yapmış olduğum bir hastane yönetim veri tabanı projesi.

Bu proje, bir hastane yönetim sistemi için SQL Server üzerinde tasarlanmış bir veritabanını içerir. Veritabanı, hastane işlemlerini (hasta kayıtları, randevular, tahliller, reçeteler, vb.) yönetmek için gerekli tabloları, ilişkileri, veri ekleme komutlarını ve çeşitli SQL sorgularını kapsar.

# Proje Amacı

Bu veritabanı, bir hastanenin temel işlemlerini (hasta yönetimi, randevu takibi, tahlil ve reçete işlemleri) yönetmek için tasarlanmıştır. Aşağıdaki özellikler uygulanmıştır:

Tablolar ve ilişkisel yapı ile veri organizasyonu

Örnek veri ekleme (12 hasta, 9 doktor, 9 bölüm, vb.)

SELECT, DELETE, UPDATE, GROUP BY, HAVING, COUNT, LIKE sorguları

FUNCTION, TRIGGER, VIEW, ve STORED PROCEDURE ile gelişmiş veritabanı işlevselliği

# Tablolar

<img width="1135" height="737" alt="a" src="https://github.com/user-attachments/assets/9a6e6670-2a3c-4bf8-83ad-7205f3a51ba4" />

Veri tabanı, aşağıdaki 10 tablodan oluşur.

1. Bolumler: Hastane bölümlerini saklar (örneğin, Kardiyoloji, Nöroloji).

2. Hastalar: Hasta bilgilerini saklar.

3. Doktorlar: Doktor bilgilerini saklar, her doktor bir bölüme bağlıdır.

4. Personeller: Doktor dışı personeli saklar (örneğin, hemşire, teknisyen).

5. TahlilTurleri: Tahlil türlerini saklar (örneğin, Kan Şekeri Testi).

6. Ilaclar: Kullanılan ilaçları saklar (örneğin, Parasetamol).

7. Randevular: Hasta-doktor randevularını saklar.

8. Receteler: Reçeteleri saklar.

9. HastaTahlilleri: Hastaların yaptırdığı tahlilleri saklar.

10. ReceteIlaclari: Reçetelerdeki ilaçları saklar.

