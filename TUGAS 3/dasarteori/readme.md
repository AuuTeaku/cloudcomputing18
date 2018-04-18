# Perbedaan Virtual Machine dan Docker Image

![1](gambar/gam.jpeg)

# DOCKER

Docker adalah virtualisasi berbentuk kontainer. Kontainer bekerja lebih efisien daripada virtual mesin, karena yang divirtualisasikan hanya aplikasi dan library yang dibutuhkan saja. Kontainer lebih hemat memory daripada virtual mesin. Untuk memulai menggunakan docker terlebih dahulu mesin docker harus terinstall harus terinstall pada komputer host.

# DOCKER VOLUME

Docker tidak menyimpan state atau data apapun di dalam kontainer. Sehingga jika kontainer mati kemudian dinyalakan lagi maka state akan kembali seperti semula. Semua perubahan tidak tersimpan, berbeda dengan virtual mesin yang menyimpan data dan state. Untuk mengatasi hal tersebut, docker memiliki fungsi volume untuk menyimpan perubahan data pada komputer hostnya. Sehingga ketika kontainer mati atau dihapus, data tetap tersimpan di komputer host dan dapat digunakan kembali oleh kontainer yang sama atau berbeda.

# DOCKERFILE

Dockerfile adalah file yang berisi perintah-perintah yang digunakan untuk membuat image container sendiri.

# DOCKER COMPOSE

Docker Compose adalah file untuk menjalankan container lebih dari satu. Kita membuat docker-compose.yml

