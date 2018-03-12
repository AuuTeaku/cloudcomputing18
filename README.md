# cloudcomputing18

Untuk menjawab semua soal di bawah, kita harus membuat virtual machine. berikut langkah-langkahnya:
1. membuat folder bernama minion dengan script sebagai berikut:
    mkdir minion
2. masuk ke dalam folder minion, dengan script sebagai berikut:
    cd minion
3. inisialisasi vagrant, dengan script sebagai berikut:
    vagrant init
   akan terdapat file Vagrantfile
4. download virtual box dengan script sebagai berikut:
    vagrant box add hashicorp/precise64
   pilih point ke 2 yaitu virtual box dan tunggu hingga proses selesai.
5. config Vagrantfile sebagai berikut:
    a. ganti
        config.vm.box = "base"
       menjadi
        config.vm.box = "hashicorp/precise64"
    b. ganti bagian Vagrantfile menjadi script dibawah ini untuk menentukan resource memori dan mengatur core cpu:
          config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        # vb.gui = true
        # Customize the amount of memory on the VM:
 	        vb.memory = "1024"
 	        vb.cpus = 2 
          end
 6. buatlah file script bernama bootstrap.sh, isilah script sesuai yang dibutuhkan
 7. tambahkan config pada Vagrantfile sehingga menjadi seperti berikut:
      config.vm.provision "shell", path: "bootstrap.sh"
      end
          
1. Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.
JAWABAN
a. tambahkan script pada bootsrap.sh untuk menambahkan user 'awan' dan password 'buayakecil' seperti berikut:
    useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin)

2. Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework

3. Buat vagrant virtualbox dan lakukan provisioning install:
  a. php
  b. mysql
  c. composer
  d. nginx

setelah melakukan provioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di   komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host

4. Buat vagrant virtualbox dan lakukan provisioning install:
  a. Squid proxy
  b. Bind9
