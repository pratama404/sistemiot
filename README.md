# **Sistem IoT - PHP Native dengan Laragon**

## **1. Pendahuluan**
Proyek ini adalah sistem IoT berbasis **PHP Native** yang berjalan menggunakan **Laragon** sebagai server lokal. Data IoT disimpan dalam database **MySQL Laragon**, dan simulasi perangkat dapat diuji melalui **Wokwi**.

**🔗 Simulasi Wokwi:**  
[https://wokwi.com/projects/401686351657025537](https://wokwi.com/projects/401686351657025537)

---

## **2. Persyaratan Sistem**
Sebelum menginstal, pastikan kamu memiliki:
- **Laragon** ([Download](https://laragon.org/download/))
- **PHP 7.x atau 8.x**
- **MySQL/MariaDB** (sudah termasuk dalam Laragon)
- **Browser (Chrome/Firefox)**

---

## **3. Instalasi**

### **A. Clone Repository & Setup Project**
```sh
cd C:\laragon\www
git clone https://github.com/username/sistemiot.git
cd sistemiot
```
1. **Pastikan Laragon sudah berjalan**, lalu aktifkan Apache dan MySQL.

---

### **B. Setup Database**
1. **Buka Laragon**, klik **Menu > MySQL > phpMyAdmin**.
2. **Buat database baru**, misalnya **sistem_iot**.
3. **Import file SQL**:
   - Buka **phpMyAdmin**
   - Pilih database **sistem_iot**
   - Klik **Import**, lalu pilih file **database.sql** dari repository

---

### **C. Konfigurasi Koneksi Database**
Edit file `config.php` atau yang menangani koneksi database:

```php
<?php
$host = "localhost";
$user = "root"; // Default Laragon
$pass = "";     // Kosongkan jika belum diubah
$db   = "sistem_iot";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
```

---

### **D. Menjalankan Proyek**
1. **Buka Laragon**, lalu klik **Menu > www > sistemiot**  
2. Atau buka langsung di browser:  
   ```
   http://localhost/sistemiot
   ```

---

## **4. Simulasi IoT di Wokwi**
1. Buka **[Wokwi Project](https://wokwi.com/projects/401686351657025537)**.
2. Klik **Start Simulation** untuk menjalankan perangkat.
3. Pastikan endpoint API sudah sesuai untuk mengirim data ke sistem PHP-mu.

---

## **5. API Endpoint (Opsional - Jika Menggunakan API)**
Jika sistem menerima data IoT via API, endpoint dapat disiapkan seperti berikut:

**📌 Contoh Endpoint untuk Menyimpan Data:**

```php
<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $sensor = $_POST['sensor'];
    $nilai  = $_POST['nilai'];

    $query = "INSERT INTO data_sensor (sensor, nilai) VALUES ('$sensor', '$nilai')";
    mysqli_query($conn, $query);

    echo json_encode(["status" => "success"]);
}
?>
```
Kirim data menggunakan **POST** ke `http://localhost/sistemiot/api.php`.

---

## **6. Troubleshooting**
**❌ Laragon tidak bisa dijalankan?**
- Pastikan tidak ada aplikasi lain yang memakai port **80** (misal XAMPP).
- Ubah port di **Menu > Preferences > Apache > Port**.

**❌ Database tidak terkoneksi?**
- Cek apakah database **sistem_iot** sudah dibuat dan user/password MySQL benar.

---

## **7. Kontributor**
- Pratama (@pratama404)
