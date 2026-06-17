-- ============================================
-- KREŞ / ANAOKULU TEMASI — Kurulum SQL
-- Tema Master (Kurumsal/Hizmet arketipi) tabanlı.
-- Kullanım: phpMyAdmin > kres_db > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `kres_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `kres_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Kreş Adınız'),
('site_baslik','Kreş Adınız — Mutlu Çocuklar, Güvenli Yarınlar'),
('site_aciklama','Oyun temelli eğitim, uzman öğretmen kadrosu ve güvenli tesisleriyle çocuğunuzun gelişimini destekleyen kreş ve anaokulu. 1-6 yaş gruplarına özel programlar.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@kresadiniz.com'),
('adres','Merkez Mah. Neşe Sok. No:1, İlçe / İl'),
('calisma_saati','Pzt - Cuma: 07:30 - 18:30'),
('hakkimizda_kisa','Çocuklarımızın mutlu, özgüvenli ve meraklı bireyler olarak büyümesi için oyun temelli, sevgi dolu bir eğitim ortamı sunuyoruz. Güvenlik ve gelişim bizim için her şeyden önce gelir.'),
('hakkimizda_uzun','Kreşimiz, okul öncesi eğitimde 14 yılı aşkın deneyimiyle her çocuğun biricik olduğuna inanır. Oyun temelli öğrenme yaklaşımımız, çocukların doğal merakını destekleyerek sosyal, duygusal, bilişsel ve fiziksel gelişimlerini bir bütün olarak ele alır. Uzman okul öncesi öğretmenlerimiz, hijyenik ve güvenli sınıflarımız, bahçe ve oyun alanlarımız, branş derslerimiz (İngilizce, müzik, jimnastik, satranç) ve dengeli beslenme programımızla çocuğunuza ikinci bir yuva sunuyoruz. Kameralı güvenlik sistemi ve düzenli veli bilgilendirmesiyle gönül rahatlığı sağlıyoruz.'),
('misyon','Her çocuğa sevgi dolu, güvenli ve oyun temelli bir ortamda kendi potansiyelini keşfetme fırsatı sunmak; mutlu ve özgüvenli bireyler yetiştirmek.'),
('vizyon','Okul öncesi eğitimde velilerin ilk tercihi olan, çağdaş pedagojik yaklaşımları benimseyen örnek bir kurum olmak.'),
('yil','14'),
('proje_sayi','1200'),
('musteri_sayi','1000'),
('personel_sayi','30'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER (Eğitim Programları) ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-balloon',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Oyun Grubu (1-2 Yaş)','oyun-grubu','Minik bireylerin güvenli ve sevgi dolu ortamda sosyalleşmeye ilk adımlarını attığı grup.','Oyun grubumuzda 1-2 yaş çocuklarımız, duyusal etkinlikler ve güvenli oyun alanlarıyla anneden ayrılma sürecini yumuşak bir geçişle yaşar. Uzman bakıcı ve öğretmenlerimiz eşliğinde temel motor beceriler, paylaşma ve sosyalleşme desteklenir.','bi-emoji-smile','https://images.unsplash.com/photo-1596464716127-f2a82984de30?w=800&q=80',1),
('Anaokulu Programı (3-6 Yaş)','anaokulu-programi','Okula hazırlık odaklı, oyun temelli ve gelişimsel anaokulu eğitim programı.','3-6 yaş grubumuzda çocuklarımız okuma-yazmaya hazırlık, matematik kavramları, doğa ve bilim etkinlikleriyle okula güçlü bir başlangıç yapar. Sosyal-duygusal gelişim ve özbakım becerileri program boyunca desteklenir.','bi-mortarboard','https://images.unsplash.com/photo-1587654780291-39c9404d746b?w=800&q=80',2),
('Montessori Atölyesi','montessori-atolyesi','Çocuğun kendi hızında öğrendiği, bağımsızlığı destekleyen Montessori yaklaşımı.','Özel hazırlanmış Montessori materyalleriyle çocuklarımız dokunarak, deneyerek ve seçerek öğrenir. Konsantrasyon, düzen ve bağımsız çalışma becerileri bu atölyede doğal bir akışla gelişir.','bi-puzzle','https://images.unsplash.com/photo-1545558014-8692077e9b5c?w=800&q=80',3),
('İngilizce & Branş Dersleri','ingilizce-brans-dersleri','Oyunlarla İngilizce, müzik, jimnastik ve satranç gibi gelişim destekleyici branşlar.','Alanında uzman branş öğretmenlerimiz eşliğinde çocuklarımız İngilizceyle oyun yoluyla tanışır; müzik, ritim, jimnastik ve satranç etkinlikleriyle hem eğlenir hem gelişir.','bi-translate','https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800&q=80',4),
('Sanat & Yaratıcılık','sanat-yaraticilik','Boyama, el sanatları ve drama ile çocukların yaratıcılığını ortaya çıkaran atölye.','Resim, kil, kolaj ve drama etkinlikleriyle çocuklarımızın hayal gücünü ve ince motor becerilerini destekliyoruz. Her çocuk kendini özgürce ifade edebileceği güvenli bir ortam bulur.','bi-palette','https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?w=800&q=80',5),
('Tam Gün & Yemek Hizmeti','tam-gun-yemek','Dengeli, diyetisyen onaylı menü ve tam gün bakım ile çalışan veliye tam destek.','Tam gün programımızda çocuklarımıza diyetisyen onaylı, dengeli ve taze hazırlanan öğünler sunulur. Öğle uykusu, dinlenme ve serbest oyun saatleriyle gün, çocuğun ritmine uygun şekilde planlanır.','bi-cup-hot','https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=800&q=80',6);

-- ============ PROJELER / GALERİ (Etkinlikler & Tesisler) ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('Renkli Sınıflarımız','renkli-siniflarimiz','Tesisler','https://images.unsplash.com/photo-1567057419565-4349c49d8a04?w=800&q=80','Geniş, aydınlık ve çocuk dostu tasarlanmış, yaş gruplarına uygun renkli sınıflarımız.','Tesis',1),
('Açık Hava Oyun Bahçesi','oyun-bahcesi','Tesisler','https://images.unsplash.com/photo-1597392582469-a697322d5c16?w=800&q=80','Güvenli zemin kaplaması ve eğitici oyun gruplarıyla donatılmış bahçemiz.','Tesis',2),
('23 Nisan Şenliği','23-nisan-senligi','Etkinlik','https://images.unsplash.com/photo-1472162072942-cd5147eb3902?w=800&q=80','Çocuklarımızın gösterileriyle coşkuyla kutladığımız 23 Nisan etkinliğimizden kareler.','Etkinlik',3),
('Bilim ve Keşif Günü','bilim-kesif-gunu','Etkinlik','https://images.unsplash.com/photo-1530021232320-687d8e3dba54?w=800&q=80','Basit deneylerle çocuklarımızın merakını besleyen keşif atölyesi etkinliğimiz.','Etkinlik',4),
('Sanat Atölyesi Çalışmaları','sanat-atolyesi-calismalari','Etkinlik','https://images.unsplash.com/photo-1607453998774-d533f65dac99?w=800&q=80','Minik ellerden çıkan büyük eserler; resim ve el sanatları atölyemizden kareler.','Etkinlik',5),
('Yıl Sonu Mezuniyet Töreni','yil-sonu-mezuniyet','Etkinlik','https://images.unsplash.com/photo-1587616211892-f743fcca64f9?w=800&q=80','Anaokulundan ilkokula uğurladığımız miniklerimizin gururlu mezuniyet töreni.','Etkinlik',6);

-- ============ BLOG ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Çocuğunuzu Kreşe Hazırlamanın 6 Yolu','cocugu-krese-hazirlamak','Veli Rehberi','Kreşe başlama sürecini hem çocuğunuz hem de sizin için kolaylaştıracak pratik öneriler.','Kreşe başlamak, bir çocuğun hayatındaki ilk büyük adımlardan biridir. Bu geçişi kolaylaştırmak için kreşten önce kısa ayrılıklara alıştırmak, uyku ve beslenme düzenini okul saatlerine yaklaştırmak, çocuğunuzla kreş hakkında olumlu konuşmak ve veda ritüeli oluşturmak çok faydalıdır. Bu yazıda uyum sürecini kolaylaştıran 6 etkili yöntemi anlattık.','https://images.unsplash.com/photo-1544717297-fa95b6ee9643?w=800&q=80','2026-05-12'),
('Oyun Temelli Öğrenme Neden Önemli?','oyun-temelli-ogrenme','Eğitim','Çocuklar oynayarak öğrenir. Oyunun erken çocukluk gelişimindeki kritik rolünü açıklıyoruz.','Oyun, çocuk için bir eğlence olmanın çok ötesinde temel bir öğrenme yoludur. Çocuklar oyun yoluyla problem çözmeyi, iş birliğini, dil becerilerini ve duygularını yönetmeyi öğrenir. Kreşimizde oyun temelli yaklaşımı benimsememizin nedeni budur. Bu yazıda oyunun bilişsel ve sosyal gelişime katkılarını ele aldık.','https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=800&q=80','2026-04-20'),
('Sağlıklı Beslenme Alışkanlığı Erken Yaşta Başlar','saglikli-beslenme-erken-yas','Sağlık','Çocuğunuzun damak tadını ve sağlıklı beslenme alışkanlıklarını destekleyen ipuçları.','Erken çocukluk, sağlıklı beslenme alışkanlıklarının temellerinin atıldığı dönemdir. Renkli ve çeşitli sebze-meyveleri tabağa dahil etmek, çocuğu mutfakta sürece katmak ve örnek olmak en etkili yöntemlerdir. Kreşimizde diyetisyen onaylı menülerle çocuklarımıza dengeli beslenmeyi sevdiriyoruz.','https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=800&q=80','2026-03-25');

-- ============ REFERANSLAR ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Ayşe Yıldız','Elif''in annesi','Kızım buraya başladığından beri çok daha mutlu ve özgüvenli. Öğretmenleri ilgili, iletişimleri kuvvetli. Gönül rahatlığıyla bırakıyorum.','https://i.pravatar.cc/100?img=49',5),
('Murat Demir','Can''ın babası','Güvenlik ve hijyen konusundaki titizlikleri içimizi rahatlattı. Oğlumuz her sabah severek gidiyor, bu bizim için en büyük gösterge.','https://i.pravatar.cc/100?img=53',5),
('Selin Kaya','Defne''nin annesi','Oyun temelli eğitimleri sayesinde kızımın gelişimini gözle görülür şekilde takip ediyoruz. Etkinlikler ve veli bilgilendirmeleri harika.','https://i.pravatar.cc/100?img=31',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (Ön Kayıt Talepleri) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
