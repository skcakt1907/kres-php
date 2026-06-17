<?php
// ========== Veritabanı Ayarları ==========
// Müşteri buradan kendi DB bilgilerini girer
define('DB_HOST', 'localhost');
define('DB_NAME', 'kres_db');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_CHARSET', 'utf8mb4');

// ========== Site Sabitleri ==========
define('SITE_URL', 'http://localhost/kres-php');
define('UPLOADS', __DIR__ . '/../uploads');
define('UPLOADS_URL', SITE_URL . '/uploads');

// Hata gösterimi (canlıda false yap)
define('DEBUG', true);

if (DEBUG) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}

// Session güvenliği — HttpOnly + SameSite + (https'de) Secure
if (session_status() === PHP_SESSION_NONE) {
    $secure = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off';
    session_set_cookie_params([
        'lifetime' => 0,
        'path'     => '/',
        'domain'   => '',
        'secure'   => $secure,
        'httponly' => true,
        'samesite' => 'Lax',
    ]);
    ini_set('session.use_strict_mode', '1');
    ini_set('session.cookie_httponly', '1');
    session_start();
}
date_default_timezone_set('Europe/Istanbul');
