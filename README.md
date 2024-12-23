# Hospital Management System

Project ini berisi skema database, data sampel, dan prosedur tersimpan untuk mengelola sistem kesehatan, termasuk fitur untuk manajemen janji temu, diagnosa, dokter, dan riwayat medis.

## Deskripsi Proyek

Proyek ini bertujuan untuk membangun database yang dapat mendukung kebutuhan pengelolaan data dalam sistem layanan kesehatan modern. Database ini dirancang untuk memastikan efisiensi, keamanan, dan kemudahan akses data. Fitur-fitur utama meliputi:

- Pengelolaan data janji temu pasien.
- Penyimpanan informasi diagnosa, resep, dan dokter.
- Integrasi data riwayat medis pasien yang dapat diakses oleh dokter.
- Prosedur tersimpan untuk mengambil data secara efisien dan akurat.

## Struktur Database

### 1. Tabel Utama

#### **appointment**
Menyimpan detail janji temu pasien.
- **Kolom:**
  - `idAppointment` (Primary Key)
  - `Date` (Tanggal janji temu)
  - `StartTime` (Waktu mulai)
  - `EndTime` (Waktu selesai)
  - `Status` (Status janji temu: Selesai/Belum Selesai)

#### **diagnose**
Menghubungkan janji temu dengan diagnosa dan resep dokter.
- **Kolom:**
  - `idDiagnose` (Primary Key)
  - `idAppointment` (Foreign Key ke tabel appointment)
  - `DoctorEmail` (Email dokter terkait)
  - `Diagnosis` (Hasil diagnosa)
  - `Prescription` (Resep yang diberikan)

#### **doctor**
Menyimpan informasi mengenai dokter.
- **Kolom:**
  - `Email` (Primary Key)
  - `Name` (Nama dokter)
  - `Gender` (Jenis kelamin dokter)

#### **medicalhistory**
Mencatat informasi riwayat medis pasien.
- **Kolom:**
  - `idHistory` (Primary Key)
  - `PatientEmail` (Email pasien terkait)
  - `Condition` (Kondisi kesehatan)
  - `Surgeries` (Riwayat operasi, jika ada)

### 2. Tabel Relasi

- **doctorhaveschedules**: Menghubungkan dokter dengan jadwal mereka.
- **doctorviewshistory**: Mencatat riwayat medis pasien yang diakses oleh dokter.

### 3. Stored Procedures dan Functions

#### Prosedur Tersimpan

1. **`GetAppointmentDiagnosis`**
   - Mengambil detail janji temu, diagnosa, dan informasi dokter.
   - **Sintaks:**
     ```sql
     CALL GetAppointmentDiagnosis();
     ```

2. **`GetPatient`**
   - Menampilkan daftar pasien berdasarkan email mereka dalam urutan tertentu.
   - **Sintaks:**
     ```sql
     CALL GetPatient();
     ```

#### Fungsi Tersimpan

1. **`GetPatientByPassword`**
   - Mengembalikan nama pasien berdasarkan kata sandi mereka.
   - **Sintaks:**
     ```sql
     SELECT GetPatientByPassword('password_anda');
     ```

## Data Sampel

Berikut adalah beberapa data sampel yang tersedia di database:

### **Tabel appointment**
| idAppointment | Date       | StartTime | EndTime | Status  |
|---------------|------------|-----------|---------|---------|
| 11            | 2023-06-04 | 09:00     | 11:00   | Undone  |
| 12            | 2023-06-04 | 13:00     | 14:30   | Undone  |

### **Tabel diagnose**
| idDiagnose | idAppointment | DoctorEmail        | Diagnosis        | Prescription              |
|------------|---------------|--------------------|------------------|---------------------------|
| 23001      | 1             | leviack@gmail.com  | Kidney failure   | Consume enough water      |

## Instalasi dan Penggunaan

### Persyaratan

- **Database**: MySQL atau MariaDB.
- **Pengetahuan Dasar**: SQL dan manajemen database.

### Contoh Penggunaan

- Mengambil detail janji temu beserta diagnosa:
  ```sql
  CALL GetAppointmentDiagnosis();
  ```
- Mengambil nama pasien berdasarkan kata sandi:
  ```sql
  SELECT GetPatientByPassword('password123');
  ```

## Dokumentasi Tambahan

- **Struktur Database**: Lihat diagram ERD yang tersedia di folder `HOSPITAL_MANAGEMENT_SYSTEM/`.
- **Testing**: File contoh query tersedia di folder `Query Final Project/`.
- **Pengembangan Lebih Lanjut**: Rencana pengembangan mencakup penambahan fitur laporan otomatis untuk manajemen rumah sakit.

## Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE). Anda bebas untuk menggunakan, memodifikasi, dan mendistribusikan kode ini dengan mematuhi ketentuan lisensi.

Terima kasih telah mengunjungi repository ini! Kami berharap proyek ini dapat membantu Anda dalam pengelolaan data kesehatan yang lebih baik.

