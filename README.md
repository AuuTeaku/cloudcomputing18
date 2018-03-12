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
       MENJAWAB PERTANYAAN   
1. Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.
JAWABAN
a. tambahkan script pada bootsrap.sh untuk menambahkan user 'awan' dan password 'buayakecil' seperti berikut:
    useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin)
b. jangan lupa untuk menyalakan vagrant dengan perintah sebagai berikut:
	vagrant up
c. reload script bootsrap.sh dengan perintah sebagai berikut:
	vagrant reload –provision
hasilnya sebagai berikut:
![hasil reload](/images/tang.jpg)
 
d. untuk mengecek, masuk vagrant dengan perintah sebagai berikut:
	vagrant ssh
e. untuk login masukkan perintah su awan dan masukkan password: buayakecil, seperti berikut:
 
2. Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework
Untuk menginstall Phoenix Web Framework, kita perlu menginstall beberapa hal terlebih dahulu :
a.	Elixir 1.4 atau setelahnya
Phoenix ditulis di Elixir. Sebelum menginstall elixir, kita perlu menginstall Hex. Hex adalah dependency yang akan dibutuhkan dalam Phoenix.
Command untuk menginstall Hex adalah sebagai berikut :

Mix local.hex

Setelah itu, install Erlang untuk mendapatkan semua paket. Command nya adalah sebagai berikut :

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

b.	Setelah berhasil menginstall elixir, untuk memastikan elixir telah terinstall maka silahkan masuk ke virtual machine (# vagrant ssh) dan ketik command berikut :
Elixir -v
Akan muncul output seperti gambar berikut :
 
c.	akhirnya kita akan menginstall phoenix. Untuk menginstall phoenix, ketikkan command berikut :

mix archive.install https://github.com/phoenixframework/archieves/raw/master/phx_new.ez
 
3. Buat vagrant virtualbox dan lakukan provisioning install:
  a. php
untuk menginstall php, cukup mengetikkan command dibawah ini :
	sudo apt-get install -y php5 php5-fpm php5-cgi
  b. mysql
  c. composer
untuk menginstall php, cukup mengetikkan command dibawah ini :
	sudo apt-get install -y curl php5-cli
	sudo php composer-setup.php –install- dir=/usr/local/bin –filename=composer
	curl -sS https://getcomposer.org/installer | php
  d. nginx
untuk menginstall php, cukup mengetikkan command dibawah ini :
	sudo apt-get install -y nginx
	hasilnya adalah sebagai berikut :
 


setelah melakukan provioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di   komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host

4. Buat vagrant virtualbox dan lakukan provisioning install:
  a. Squid proxy
	untuk install squid proxy, ketik command berikut :
	sudo apt-get install -y squid
  b. Bind9
	unutk menginstall bind9, ketik command berikut :
	sudo apt-get install -y bind9
	hasilnya adalah sebagai berikut :
 
